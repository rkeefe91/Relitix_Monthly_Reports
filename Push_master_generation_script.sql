use relitix;
go


/* 
Generates the master table for the monthly push emails. 
*/


DROP TABLE IF EXISTS monthly_push_master;


-- Copy the contents of the 1 year mma table into the master

select c.* 
into monthly_push_master
from relitix.dbo.ap_1year_mma_change_2 c;

--Update monthly_push_master to use MRO for SSID=1
update pm
set
pm.Franchise=ISNULL(oc.franchise,'Others'),
pm.officename=oc.officename,
pm.OfficeAddress1=oc.OfficeAddress1,
pm.OfficeCity=oc.OfficeCity,
pm.OfficePostalCode=oc.OfficePostalCode,
pm.officekey=oc.officekey,
pm.company=ISNULL(oc.company,'Others')
from monthly_push_master pm
join temp_work_most_recent_office mro on pm.id=mro.id and pm.SourceSystemID=mro.SourceSystemID
join offices_combined oc on mro.office_key=oc.officekey and mro.SourceSystemID=oc.SourceSystemID
where pm.sourcesystemid=1

--create indexes
CREATE NONCLUSTERED INDEX IX_monthly_push_master_ID  
    ON [dbo].[monthly_push_master] (ID);   
GO 

CREATE NONCLUSTERED INDEX IX_monthly_push_master_SourceSystemID  
    ON [dbo].[monthly_push_master] (SourceSystemID);   
GO 

CREATE NONCLUSTERED INDEX IX_monthly_push_master_year 
    ON [dbo].[monthly_push_master] ([year]);   
GO 

CREATE NONCLUSTERED INDEX IX_monthly_push_master_month 
    ON [dbo].[monthly_push_master] ([month]);   
GO

DROP TABLE IF EXISTS push_agent_coordinates
DROP TABLE IF EXISTS push_agent_medlatlong
DROP TABLE IF EXISTS push_agent_dist
DROP TABLE IF EXISTS push_agent_listing_centroid_tbl

--with cte1 as (  -- All listings within 3 year range with coordinates
			select lv.agent_key as MemberKey
				,lv.SourceSystemID as SourceSystemID 
				,lv.ListingKey
				,lv.CloseDate
				,lv.ClosePrice
				,g.Latitude
				,g.Longitude
INTO push_agent_coordinates
			from Listings_Combined_For_Volume lv
				join Listings_Combined_Geo g
					on lv.ListingKey = g.ListingKey
						and lv.SourceSystemID = g.SourceSystemID
join monthly_push_master pm on lv.agent_key=pm.ID AND lv.SourceSystemID=pm.SourceSystemID
				where lv.closedate >dateadd(YEAR,-3,getdate())    -- 3 years history
					and lv.SourceSystemID = g.SourceSystemID   
--				),
--cte_med as (  -- Median lat and long
				SELECT DISTINCT MemberKey
					,SourceSystemID
					,PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Latitude) OVER (PARTITION BY MemberKey, SourceSystemID) as med_lat
					,PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Longitude) OVER (PARTITION BY MemberKey, SourceSystemID) as med_lng
				INTO push_agent_medlatlong
				from push_agent_coordinates cte1
			--),
--cte_dist as (  -- Distance of each listing from median (used to screen outliers)
			select cte1.MemberKey
				,cte1.SourceSystemID
				,cte1.ListingKey
				,Latitude
				,Longitude
				,geography::STPointFromText('POINT(' + CAST([Longitude] AS VARCHAR(20)) + ' ' + 
								CAST([Latitude] AS VARCHAR(20)) + ')', 4326).STDistance(geography::STPointFromText('POINT(' + CAST([med_lng] AS VARCHAR(20)) + ' ' + 
								CAST([med_lat] AS VARCHAR(20)) + ')', 4326))/1609 as dist_from_med
			INTO push_agent_dist
			from push_agent_coordinates cte1
				join push_agent_medlatlong cte_med
					on cte1.MemberKey = cte_med.MemberKey
						and cte1.SourceSystemID = cte_med.SourceSystemID
				--)

SELECT MemberKey
	,SourceSystemID
	,avg(Latitude) as avg_lat
	,avg(Longitude) as avg_long
	,geography::STPointFromText('POINT(' + CAST(avg(Longitude) AS VARCHAR(20)) + ' ' + 
			                    CAST(avg(Latitude) AS VARCHAR(20)) + ')', 4326) as avg_geo
INTO push_agent_listing_centroid_tbl
from push_agent_dist cte_dist
where dist_from_med < 50   -- Discards any listings over 50 miles from median as outlier
group by MemberKey, SourceSystemID


-- Add the geographical center of each agent's production 
--select * from monthly_push_master
alter table monthly_push_master
add avg_geo geography,
	dist_to_office real;
GO

update monthly_push_master
set avg_geo = c.avg_geo
from monthly_push_master p
	join relitix.dbo.push_agent_listing_centroid_tbl c
		on p.ID = c.MemberKey
			and p.SourceSystemID = c.SourceSystemID;

-- Add distance to current office for each agent

update monthly_push_master
set dist_to_office = m.avg_geo.STDistance(g.geo_loc)/1609 
from monthly_push_master m
	join relitix.dbo.work_most_recent_office mro
		on m.ID = mro.ID
			and m.sourcesystemid = mro.sourcesystemid
	join relitix.dbo.Offices_Combined_Geo g
		on mro.office_key = g.officekey
			and mro.sourcesystemid = g.sourcesystemid




-- Add the switch risk ratings
alter table monthly_push_master
ADD switch_color varchar(50)
	,switch_cat varchar(50);
GO


;with cte as (
		select ID, SourceSystemID, max(pctle) as max_pctle
		from cnn_switch_risk_history
		where run_date >= dateadd(MONTH,-3,getdate())
		group by ID, SourceSystemID
			)

UPDATE monthly_push_master
SET switch_cat = NULL
	,switch_color = case 
		WHEN max_pctle >= .995 THEN 'Red'
		WHEN max_pctle >= .975 THEN 'Yellow'
		ELSE 'Green' END 
from monthly_push_master p
	join cte s
		on p.ID = s.ID
			and p.SourceSystemID = s.SourceSystemID


-- Include listing effectiveness scores


alter table monthly_push_master
ADD list_grade varchar(10),
	list_rating real,
	list_quint int,
	rev_diff real;
GO


UPDATE monthly_push_master
SET list_rating = s.score
	,list_quint = s.quint
	,list_grade = CASE s.quint when 1 then 'F'
								when 2 then 'D'
								when 3 then 'C'
								when 4 then 'B'
								when 5 then 'A'
								else 'Not rated' end 
	,rev_diff = s.rev_diff
from monthly_push_master p
	left join relitix.dbo.work_r_agent_scores s
		on p.ID = s.listagentkey
			and p.sourcesystemid = s.sourcesystemid;


--add additional columns
alter table monthly_push_master
add 
	avg_close_price_last12 float,
	med_close_price_last12 float,
	closed_vol_percentile float,
	yoy_increase_percentile float,
	closed_sides_percentile float,
	yoy_increase_pct_percentile float,
	trend_type varchar(50),
	plateau_level real,
	consistent_level real,
	AvgSidesPerAgentLast12 float;
GO

--update avg close price and median close price
update monthly_push_master
set 
avg_close_price_last12=ISNULL(ap.AvgClosePrice,0),
med_close_price_last12=ISNULL(mp.MedianPrice,0)
from Relitix.dbo.monthly_push_master pm
left join
(
		SELECT distinct lv.full_name_id,lv.agent_key,lv.SourceSystemID As SourceSystemID
			 ,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY lv.agent_key) AS MedianPrice
		FROM Relitix.dbo.Listings_Combined_For_Volume lv
		join Relitix.dbo.monthly_push_master m on lv.full_name_id=m.full_name_ID
		WHERE lv.CloseDate >= (DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE())))))
		AND lv.Closedate <= (EOMONTH(DATEADD(month,-1,GETDATE())))
		AND lv.ClosePrice>0

) mp on pm.full_name_id=mp.full_name_id
left join
(
		SELECT lv.full_name_id,lv.agent_key,lv.SourceSystemID,
		avg(closeprice) As AvgClosePrice
		FROM Relitix.dbo.Listings_Combined_For_Volume lv
		join Relitix.dbo.monthly_push_master m on lv.full_name_id=m.full_name_ID
		WHERE lv.CloseDate >= (DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE())))))
		AND lv.Closedate <= (EOMONTH(DATEADD(month,-1,GETDATE())))
		GROUP BY lv.full_name_id,lv.agent_key,lv.SourceSystemID
		HAVING count(lv.ClosePrice)>0
) ap on pm.full_name_id=ap.full_name_id

--update closed_vol_percentile
update monthly_push_master
set
	closed_vol_percentile=cvp.PctRank
from
	monthly_push_master pm
inner join
(
select ID,SourceSystemID,PERCENT_RANK() OVER (PARTITION BY SourceSystemID ORDER BY Total_Closed_volume) AS PctRank  from monthly_push_master where total_closed_volume!=0
) cvp ON pm.ID=cvp.ID AND pm.SourceSystemID=cvp.SourceSystemID


--update yoy_increase_percentile
update monthly_push_master
set
	yoy_increase_percentile=yoyp.PctRank
from
	monthly_push_master pm
inner join
(
select ID,SourceSystemID,PERCENT_RANK() OVER (PARTITION BY SourceSystemID ORDER BY yrchange) AS PctRank  from monthly_push_master where yrchange!=0 and total_closed_volume!=0 and first_trans_date <= DATEADD(year,-2,getdate())
) yoyp on pm.ID=yoyp.ID AND pm.SourceSystemID=yoyp.SourceSystemID

--update closed_sides_percentile
update monthly_push_master
set
	closed_sides_percentile=csp.PctRank
from
	monthly_push_master pm
inner join
(
select ID,SourceSystemID,PERCENT_RANK() OVER (PARTITION BY SourceSystemID ORDER BY sides_last_12) AS PctRank  from monthly_push_master where sides_last_12!=0
) csp on pm.ID=csp.ID AND pm.SourceSystemID=csp.SourceSystemID

--update yoy_increase_pct_percentile
update monthly_push_master
set
	yoy_increase_pct_percentile=yoypp.PctRank
from
	monthly_push_master pm
inner join
(
select ID,SourceSystemID,PERCENT_RANK() OVER (PARTITION BY SourceSystemID ORDER BY pct_change) AS PctRank  from monthly_push_master where yrchange!=0 and total_closed_volume!=0 and first_trans_date <= DATEADD(year,-2,getdate())
) yoypp on pm.ID=yoypp.ID AND pm.SourceSystemID=yoypp.SourceSystemID

--update curve description values
update pm
set
	trend_type=CASE WHEN cd.trend_type='' THEN NULL ELSE cd.trend_type END,
	plateau_level=CASE WHEN cd.plateau_level='' THEN NULL ELSE CAST(cd.plateau_level As REAL) END,
	consistent_level=CASE WHEN cd.consistent_level='' THEN NULL ELSE CAST(cd.consistent_level As REAL) END
from
	monthly_push_master pm
inner join
	rev_curve_descriptions cd
on
	pm.ID=cd.ID AND pm.SourceSystemID=cd.SourceSystemID

DROP TABLE IF EXISTS work_offices_sides_per_agent

SELECT *
INTO work_offices_sides_per_agent
FROM work_offices_sides_per_agent_12mma

--update office productivity values (AvgSidesPerAgentLast12)
update pm
set
	pm.AvgSidesPerAgentLast12=spa.AvgSidesPerAgent
from
	monthly_push_master pm
inner join
	work_offices_sides_per_agent spa
on
	pm.OfficeKey=spa.OfficeKey AND pm.SourceSystemID=spa.SourceSystemID

DROP TABLE push_agent_coordinates
DROP TABLE push_agent_dist
DROP TABLE push_agent_listing_centroid_tbl
DROP TABLE push_agent_medlatlong


--Add Home Addresses for SSID=11
alter table relitix.dbo.monthly_push_master
add 
	MemberHomeAddress1 varchar(50),
	MemberHomeAddress2 varchar(50),
	MemberHomeCity varchar(50),
	MemberHomeState varchar(50),
	MemberHomeZip varchar(50)
GO

update pm
set pm.MemberHomeAddress1=ha.ADDRESS1,
pm.MemberHomeAddress2=ha.ADDRESS2,
pm.MemberHomeCity=ha.CITY,
pm.MemberHomeState=ha.STATE,
pm.MemberHomeZip=ha.[ZIP CODE]
from relitix_staging.dbo.stg_MLSPIN_HAandLicenseData_MatchOuput ha join
relitix.dbo.monthly_push_master pm on ha.MemberKey=pm.ID and pm.sourcesystemid=11