USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[spCreatePushTable]    Script Date: 5/19/2020 2:55:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE PROCEDURE [dbo].[spCreatePushTable]

/*
	Returns a new, nicely formatted table of agent data based on the monthly push master table (must be updated first).
*/
		@table_name varchar(50),  -- Name for newly created table
		@company varchar(50),		--Company requesting data
		@ssid int,					--SourceSystemID for offices and agents
		@min_vol real,				-- Minimum annual Volume
		@max_vol real,				-- Maximum annual volume
		@max_lic_date real,			-- Latest date for the first MLS transaction (Month offset)
		@min_lic_date real,			-- Earliest date for the first MLS transaction (Month offset)
		@min_doll_change real,		-- Minimum year over year dollar change
		@max_doll_change real,		-- Maximum year over year dollar change
		@min_pct_chng real,			-- Minimum year over year dollar change as a pct (decimal format)
		@max_pct_chng real,			-- Maximum year over year dollar change as a pct (decimal format)
		@remove_own_company int,	-- Set to 1 if we are removing agents of own company
		@include_brand_new int,		-- Set to 1 if we are including agents with no prior year production
		@max_distance real,			-- Maximum distance in miles from nearest office to include in report
		@startdate date=NULL,			-- Report Start Date (12 months prior to reporting month)
		@enddate date=NULL,				-- Report End Date (Last Day of Reporting Month
		@min_avg_sale_price real,		-- min Avg sale price
		@max_avg_sale_price real,		-- max Avg sale price
		@min_sides real,				-- min Closed sides
		@max_sides real,					-- max Closed sides
		@franchise varchar(100),
		@min_list_side_pct real,
		@max_list_side_pct real
AS


EXEC ('DROP TABLE IF EXISTS  ' + @table_name);
DROP TABLE IF EXISTS push_temp;
DROP TABLE IF EXISTS push_temp1;
DROP TABLE IF EXISTS work_cbl;
DROP TABLE IF EXISTS work_tl;
DROP TABLE IF EXISTS work_amp;
DROP TABLE IF EXISTS work_ap;
DROP TABLE IF EXISTS work_inventory
DROP TABLE IF EXISTS work_pending

SET @startdate=DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE()))))
SET @enddate=EOMONTH(DATEADD(month,-1,GETDATE()))

;with cte as ( -- All agents meeting filter criteria (excl geography)
		select p.*,rp.pred
		,o.OfficeAddress1 as CurrentOfficeAddress
		from relitix.dbo.monthly_push_master p
				join Relitix.dbo.Offices_Combined o
		on p.OfficeKey = o.OfficeKey
			and p.SourceSystemID = o.sourcesystemid
				left join
--POC for adding rookie potential pred to push master columns
Relitix.dbo.rpt_rookie_potential rp
on p.SourceSystemiD=rp.SourceSystemiD and p.ID=rp.ID
		where p.SourceSystemID = @ssid
			and p.total_closed_volume >= @min_vol
			and p.total_closed_volume < @max_vol
			and p.first_trans_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -@min_lic_date, current_timestamp)), 0)
			and p.first_trans_date < Dateadd(Month, Datediff(Month, 0, DATEADD(m, -@max_lic_date, current_timestamp)), 0)
			and p.yrchange >= @min_doll_change
			and p.yrchange < @max_doll_change
			and p.ListSidePct_last_12 >= @min_list_side_pct and p.ListSidePct_last_12 < @max_list_side_pct
			and ((p.pct_change >= @min_pct_chng and p.pct_change < @max_pct_chng) or (@include_brand_new = 1 and p.zero_basis_flag = 1))
			and (@remove_own_company = 0 or p.company != @company)
			)
			,
cte1 as		 (  -- All active office locations (note that the Office Geo table needs to be updated)
			select og.geo_loc
				,o.OfficeKey
			from relitix.dbo.Offices_Combined_Geo og 
				join relitix.dbo.Offices_Combined o
					on og.OfficeKey = o.OfficeKey
						and o.SourceSystemID = og.sourcesystemid
			left join Relitix.dbo.RecruitingOfficesToExclude ex on o.OfficeKey=ex.OfficeKey and o.SourceSystemId=ex.SourceSystemID
			where o.company = @company
				and o.OfficeStatus = 'Active'
				and o.SourceSystemID=@ssid --Added on 11/19/2018 to resolve issue with C21A Beloit office belonging to SSID=1 and SSID=3
				and ex.OfficeKey is null --Added on 12/6/2018 to remove offices companies want excluded from report
			)
			,
cte_d as  (  -- Distance to each office for each candidate
			select p.ID
				,p.SourceSystemID
				,cte1.OfficeKey
				,cte1.geo_loc.STDistance(p.avg_geo)/1641 as Distance
				,RANK() OVER (PARTITION BY p.ID, p.SourceSystemID ORDER BY cte1.geo_loc.STDistance(p.avg_geo) ASC, cte1.OfficeKey) as dist_rank
			from cte p
				cross join cte1
				where cte1.geo_loc is not null
			),
cte_close as (  -- Closest office and distance
			SELECT *
			from cte_d
			where dist_rank =1 
				and Distance < @max_distance
				)
select cte.* 
	,o.OfficeName as ClosestOfficeName
	,o.OfficeAddress1 as ClosestOfficeAddress
	,o.OfficeCity as ClosestOfficeCity
	,cte_close.Distance
	,cte_close.dist_rank
INTO push_temp
from cte
	join cte_close
		on cte.id = cte_close.id
			and cte.SourceSystemID = cte_close.SourceSystemID
	join Relitix.dbo.Offices_Combined o
		on cte_close.OfficeKey = o.OfficeKey
			and cte_close.SourceSystemID = o.sourcesystemid;

		
SELECT full_name_ID as [Agent Name]
	,FORMAT(total_closed_volume,'N0') as [Total Closed Volume]
	,FORMAT(yrchange,'N0') as [Year Over Year Increase($)]
	,iif(pct_change = 0,'',FORMAT(pct_change,'P2')) as [Year Over Year Increase (%)]
	,OfficeName as [Current Office]
	,OfficeCity as [Current Office City]
	,OfficePostalCode as [Current Office Zip]
	,Company
	,FORMAT(first_trans_date,'d','en-US') as [First MLS Transaction Date]
	,primary_county as [Primary County]
	,MemberEmail as Email
	,iif(ISNULL(MemberPreferredPhone,'None')='None','',MemberPreferredPhone) as Phone
	,iif(ISNULL(SocialMediaTypeUrlOrId,'None')='None','',SocialMediaTypeUrlOrId) as Website
	,ClosestOfficeName as [Closest Office Name]
	,ClosestOfficeAddress as [Closest Office Address]
	,ClosestOfficeCity as [Closest Office City]
	,switch_color as [Switch Pattern Match]
	,list_grade as [Listing Effectiveness Grade]
	,Distance As [Distance to Closest Office]
	,dist_to_office As [Distance to Current Office],
	rev_diff As [Listing Effectiveness Impact],
	CAST(0 As float) As CoBrokePct,
	ISNULL(med_close_price_last12,0) As MedianClosePrice,
	ISNULL(avg_close_price_last12,0) As AvgClosePrice,
	ISNULL(sides_last_12,0) As ClosedSides,
	ISNULL(actives,0) As CurrentListings,
	CAST(0 As float) As PendingListings,
	ISNULL(transactions_last_12,0) As TotalTransactions,
	ListSidePct,
	SellSidePct,
	ListSidePct_last_12,
	SellSidePct_last_12,
	closed_vol_percentile,
	yoy_increase_percentile,
	closed_sides_percentile,
	yoy_increase_pct_percentile,
	franchise,
	AvgSidesPerAgentLast12 As [Current Office Productivity],
	MemberFirstName,
	MemberLastName,
	MemberDirectPhone,
	MemberFax,
	MemberHomePhone,
	MemberMobilePhone,
	MemberOfficePhone,
	List_last_12,
	pred As RookiePotential,
	CurrentOfficeAddress,
	MemberHomeAddress1,
	MemberHomeAddress2,
	MemberHomeCity,
	MemberHomeState,
	MemberHomeZip
INTO push_temp1
FROM push_temp;


--CoBroke Lisings last 12 months - Total Sides
select
MemberKey,
SourceSystemID,
full_name_ID,
SUM(ListCount) As TotalCoBrokeListings
into work_cbl
from
(
--CoBroke Lisings last 12 months - List Side
select 
		al.MemberKey
		,l.SourcesystemID
		,concat(al.MemberFullName,' ',l.sourcesystemid,'-',al.MemberKey) as full_name_ID
		,count(*) As ListCount
from Relitix.dbo.Listings_Combined l
	join Relitix.dbo.Agents_Combined al
		on l.ListAgentKey = al.MemberKey
			and l.SourceSystemID = al.SourceSystemID
	join Relitix.dbo.Agents_Combined ab   -- Full join because we only want two-sided transactions
		on l.BuyerAgentKey = ab.MemberKey
			and l.SourceSystemID = ab.SourceSystemID
	join Relitix.dbo.Offices_Combined ol
		on l.ListAgentOfficeKey = ol.OfficeKey
			and l.sourcesystemid = ol.sourcesystemid
	join Relitix.dbo.Offices_Combined ob
		on l.BuyerOfficeKey = ob.OfficeKey
			and l.sourcesystemid = ob.sourcesystemid
join push_temp1 m on
	concat(al.MemberFullName,' ',l.sourcesystemid,'-',al.MemberKey)=m.[Agent Name]
WHERE 
CloseDate >= @StartDate
		AND Closedate <= @EndDate
		and ob.Company=@Company
		and closeprice is not null
		and l.Sourcesystemid=@ssid
group by al.MemberKey,l.SourceSystemID,concat(al.MemberFullName,' ',l.sourcesystemid,'-',al.MemberKey)

union all

--CoBroke Lisings last 12 months - Sell Side
select 
		ab.MemberKey,
		l.SourcesystemID,
		concat(ab.MemberFullName,' ',l.sourcesystemid,'-',ab.MemberKey) as full_name_ID
		,count(*) As ListCount
from Relitix.dbo.Listings_Combined l
	join Relitix.dbo.Agents_Combined al
		on l.ListAgentKey = al.MemberKey
			and l.SourceSystemID = al.SourceSystemID
	join Relitix.dbo.Agents_Combined ab   -- Full join because we only want two-sided transactions
		on l.BuyerAgentKey = ab.MemberKey
			and l.SourceSystemID = ab.SourceSystemID
	join Relitix.dbo.Offices_Combined ol
		on l.ListAgentOfficeKey = ol.OfficeKey
			and l.sourcesystemid = ol.sourcesystemid
	join Relitix.dbo.Offices_Combined ob
		on l.BuyerOfficeKey = ob.OfficeKey
			and l.sourcesystemid = ob.sourcesystemid
	join push_temp1 m on
	concat(ab.MemberFullName,' ',l.sourcesystemid,'-',ab.MemberKey)=m.[Agent Name]
WHERE 
CloseDate >= @StartDate
		AND Closedate <= @EndDate
		and ol.Company=@Company
		and closeprice is not null
		and l.Sourcesystemid=@ssid
group by ab.MemberKey,l.SourceSystemID,concat(ab.MemberFullName,' ',l.sourcesystemid,'-',ab.MemberKey)
) a
group by MemberKey,SourceSystemID,full_name_ID

--Total Lisings last 12 months - Total Sides
SELECT lv.[full_name_ID],right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1) As MemberKey, lv.SourceSystemID,count(*) As TotalListings
into work_tl
FROM [Relitix].[dbo].[Listings_Combined_For_Volume] lv
join push_temp1 m on lv.full_name_id=m.[Agent Name]
  where sourcesystemid=@ssid
    and CloseDate >= @StartDate
		AND Closedate <= @EndDate
  group by lv.[full_name_ID],lv.SourceSystemID,right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1)


----Median Price
--		SELECT distinct lv.agent_key,CAST(lv.SourceSystemID As INT) As SourceSystemID
--			 ,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
--                            OVER (PARTITION BY lv.agent_key) AS MedianPrice
--		INTO work_amp
--		FROM Relitix.dbo.Listings_Combined_For_Volume lv
--		join push_temp1 m on lv.full_name_id=m.[Agent Name]
--		WHERE lv.CloseDate >= @StartDate
--		AND lv.Closedate <= @EndDate 
--		AND CAST(lv.SourceSystemID As INT)=@ssid
--		GROUP BY lv.agent_key,CAST(lv.SourceSystemID As INT)
--		,lv.ClosePrice
--		HAVING count(lv.ClosePrice)>0

----AvgClosePrice
--		SELECT lv.agent_key,CAST(lv.SourceSystemID As INT) As SourceSystemID,
--		avg(closeprice) As AvgClosePrice
--INTO work_ap
--		FROM Relitix.dbo.Listings_Combined_For_Volume lv
--		join push_temp1 m on lv.full_name_id=m.[Agent Name]
--		WHERE lv.CloseDate >= @StartDate
--		AND lv.Closedate <= @EndDate
--		AND CAST(lv.SourceSystemID As INT)=@ssid
--		GROUP BY lv.agent_key,CAST(lv.SourceSystemID As INT)
--		HAVING count(lv.ClosePrice)>0

----Active Inventory
--SELECT lv.[full_name_ID],right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1) As MemberKey, lv.SourceSystemID,count(*) As CurrentListings
--into work_inventory
--FROM [Relitix].[dbo].[Listings_Combined_For_Volume] lv
--join push_temp1 m on lv.full_name_id=m.[Agent Name]
--  where
--  CAST(lv.SourceSystemID As INT)=@ssid  AND
-- StandardStatus in ('Active','Active Under Contract')
--  group by lv.[full_name_ID],lv.SourceSystemID,right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1)

--Pending Inventory
SELECT lv.[full_name_ID],right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1) As MemberKey, lv.SourceSystemID,count(*) As PendingListings
into work_pending
FROM [Relitix].[dbo].[Listings_Combined_For_Volume] lv
join push_temp1 m on lv.full_name_id=m.[Agent Name]
  where
  lv.SourceSystemID=@ssid  AND
StandardStatus = 'Pending'
group by lv.[full_name_ID],lv.SourceSystemID,right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1)

update m
set m.CoBrokePct=a.CoBrokePct,
--m.MedianClosePrice=amp.MedianPrice,
--m.AvgClosePrice=ap.AvgClosePrice,
m.PendingListings=ISNULL(a.PendingListings,0)
from push_temp1 m inner join 
(
select tl.full_name_ID,tl.MemberKey,tl.SourceSystemID,tl.TotalListings,cbl.TotalCoBrokeListings,
wp.PendingListings,
CAST(ISNULL(cbl.TotalCoBrokeListings,0) As float)/CAST(tl.TotalListings As Float)  As CoBrokePct
from work_tl tl left join work_cbl cbl on tl.MemberKey=cbl.MemberKey and tl.SourceSystemID=cbl.SourceSystemID
--left join work_inventory wi on tl.MemberKey=wi.MemberKey AND tl.SourceSystemID=wi.SourceSystemID
left join work_pending wp on tl.MemberKey=wp.MemberKey AND tl.SourceSystemID=wp.SourceSystemID
) a on m.[Agent Name]=a.full_name_ID




EXEC('SELECT * INTO ' +@table_name + ' FROM push_temp1 WHERE AvgClosePrice >=' + @min_avg_sale_price + 'AND AvgClosePrice <=' + @max_avg_sale_price + 'AND ClosedSides >=' + @min_sides + 'AND ClosedSides <=' + @max_sides + 'AND (Franchise=''' + @franchise + ''' OR ISNULL(''' + @franchise + ''','''')='''')')
















GO

