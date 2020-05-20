USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[spCreatePushTable_Alumni]    Script Date: 5/19/2020 2:55:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[spCreatePushTable_Alumni]

/*
	Returns a new, nicely formatted table of agent data based on the monthly push master table (must be updated first).
*/
		@table_name varchar(50),  -- Name for newly created table
		@company varchar(50),		--Company requesting data
		@ssid int,					--SourceSystemID for offices and agents
		@jw_max real,
		@startdate date=NULL,			-- Report Start Date (12 months prior to reporting month)
		@enddate date=NULL				-- Report End Date (Last Day of Reporting Month

AS


EXEC ('DROP TABLE IF EXISTS  ' + @table_name);
DROP TABLE IF EXISTS push_temp_alum;
DROP TABLE IF EXISTS push_temp1_alum;
DROP TABLE IF EXISTS work_cbl;
DROP TABLE IF EXISTS work_tl;
DROP TABLE IF EXISTS work_amp;
DROP TABLE IF EXISTS work_ap;
DROP TABLE IF EXISTS work_inventory
DROP TABLE IF EXISTS work_pending

SET @startdate=DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE()))))
SET @enddate=EOMONTH(DATEADD(month,-1,GETDATE()))

;with cte as ( -- All agents meeting filter criteria (excl geography)
		select p.*
		from relitix.dbo.monthly_push_master p
		join relitix.dbo.udf_Alumni(@ssid, @company, @jw_max) alum on p.ID=alum.ID and p.SourceSystemID=alum.SourceSystemID
		where p.SourceSystemID = @ssid and p.company!=@company
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
				--and Distance < @max_distance
				)
select cte.* 
	,o.OfficeName as ClosestOfficeName
	,o.OfficeAddress1 as ClosestOfficeAddress
	,o.OfficeCity as ClosestOfficeCity
	,cte_close.Distance
	,cte_close.dist_rank
INTO push_temp_alum
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
	List_last_12
INTO push_temp1_alum
FROM push_temp_alum;


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
join push_temp1_alum m on
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
	join push_temp1_alum m on
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
join push_temp1_alum m on lv.full_name_id=m.[Agent Name]
  where sourcesystemid=@ssid
    and CloseDate >= @StartDate
		AND Closedate <= @EndDate
  group by lv.[full_name_ID],lv.SourceSystemID,right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1)



--Pending Inventory
SELECT lv.[full_name_ID],right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1) As MemberKey, lv.SourceSystemID,count(*) As PendingListings
into work_pending
FROM [Relitix].[dbo].[Listings_Combined_For_Volume] lv
join push_temp1_alum m on lv.full_name_id=m.[Agent Name]
  where
  lv.SourceSystemID=@ssid  AND
StandardStatus = 'Pending'
group by lv.[full_name_ID],lv.SourceSystemID,right(lv.[full_name_ID], charindex('-', reverse(lv.[full_name_ID])) - 1)

update m
set m.CoBrokePct=a.CoBrokePct,
m.PendingListings=ISNULL(a.PendingListings,0)
from push_temp1_alum m inner join 
(
select tl.full_name_ID,tl.MemberKey,tl.SourceSystemID,tl.TotalListings,cbl.TotalCoBrokeListings,
wp.PendingListings,
CAST(ISNULL(cbl.TotalCoBrokeListings,0) As float)/CAST(tl.TotalListings As Float)  As CoBrokePct
from work_tl tl left join work_cbl cbl on tl.MemberKey=cbl.MemberKey and tl.SourceSystemID=cbl.SourceSystemID
left join work_pending wp on tl.MemberKey=wp.MemberKey AND tl.SourceSystemID=wp.SourceSystemID
) a on m.[Agent Name]=a.full_name_ID




EXEC('SELECT * INTO ' +@table_name + ' FROM push_temp1_alum')













GO

