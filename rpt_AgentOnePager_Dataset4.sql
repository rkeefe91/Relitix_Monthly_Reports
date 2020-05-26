USE [Relitix]
GO

/****** Object:  StoredProcedure [dbo].[rpt_AgentOnePager_Dataset4]    Script Date: 5/22/2020 2:39:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================================================
-- Author:		Matt Michalowski
-- Create date: 5/22/2020
-- Description:	Agent One Pager - dataset for Agent vs Office Production metrics

--Changes:    

-- ==============================================================================================
CREATE PROCEDURE [dbo].[rpt_AgentOnePager_Dataset4]
--@PropertySubtype VARCHAR(255)
	@eval_date DATE=NULL,
@SSID INT=NULL,
@Company VARCHAR(100)=NULL

AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

DROP TABLE IF EXISTS #Agents
DROP TABLE IF EXISTS #Offices
DROP TABLE IF EXISTS #AvgSidesPerAgent

;with ts As (
--Total Sides by OfficeKey,SSID Last 12 months
SELECT oc.OfficeAddress1,lv.SourceSystemID
			,sum(lv.sides) as total_sides
		FROM Relitix.dbo.Listings_Combined_For_Volume lv
		join offices_combined oc on lv.office_key=oc.officekey and lv.Sourcesystemid=oc.SourceSystemID
		WHERE DateDiff(m,lv.CloseDate,(DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1))) Between 1 and 12
		and lv.office_key is not null
		and lv.SourceSystemID=@SSID
		and oc.Company=@Company
		GROUP BY oc.OfficeAddress1,lv.SourceSystemID
		HAVING count(lv.ClosePrice)>0
),
aac As (
--Active Agent Count by OfficeKey,SSID Last 12 Months
select
	x.OfficeAddress1 As OfficeAddress1,x.SourceSystemID,COUNT(x.agent_key) As ActiveAgentCount
from
(
--distinct office/agent combos by SSID
select distinct
	a.OfficeAddress1,a.SourceSystemID,a.agent_key
from
(
--sale
SELECT oc.OfficeAddress1,lv.SourceSystemID
			,agent_key
		FROM Relitix.dbo.Listings_Combined_For_Volume lv
		join offices_combined oc on lv.office_key=oc.officekey and lv.Sourcesystemid=oc.SourceSystemID
		WHERE DateDiff(m,lv.CloseDate,(DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1) )) Between 1 and 12
		GROUP BY oc.OfficeAddress1,lv.SourceSystemID,lv.agent_key
		HAVING count(lv.ClosePrice)>0

UNION ALL

--listing
SELECT oc.OfficeAddress1,
			lv.SourceSystemID,
			lv.agent_key
		FROM Relitix.dbo.Listings_Combined_For_Volume lv
		join offices_combined oc on lv.office_key=oc.officekey and lv.Sourcesystemid=oc.SourceSystemID
		WHERE DateDiff(m,lv.ListingContractDate,(DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1) )) Between 1 and 12 AND lv.list_side = 1
		GROUP BY oc.OfficeAddress1,lv.SourceSystemID,lv.agent_key
		HAVING count(lv.ListPrice)>0
) a 
) x
group by x.OfficeAddress1,x.SourceSystemID
)
--Calculate Avg Sides Per Agent by OfficeKey,SSID
select t.OfficeAddress1,t.SourceSystemID,t.total_sides,a.ActiveAgentCount,t.total_sides/a.ActiveAgentCount As AvgSidesPerAgent 
INTO #AvgSidesPerAgent
from ts t join aac a on t.OfficeAddress1=a.OfficeAddress1 and t.SourceSystemID=a.SourceSystemID

--All possible agents
select distinct 
lv.full_name_id,
YEAR(CloseDate) As CloseYear
INTO #Agents
from Listings_combined_for_volume lv join Relitix.dbo.monthly_push_master pm on lv.full_name_id=pm.full_name_id where (CloseDate >= dateadd(year,-2,@eval_date)
				and CloseDate <= @eval_date and lv.SourceSystemID=@SSID) 
--and YEAR(CloseDate)>=YEAR(@eval_date)-1 
and CloseDate >= dateadd(year,-1,@eval_date)
and pm.SourceSystemID=@SSID and pm.Company=@Company


select distinct pm.OfficeAddress1 INTO #Offices from relitix.dbo.monthly_push_master pm join #Agents a on pm.full_name_id=a.full_name_id and pm.SourceSystemID=@SSID
and pm.Company=@Company

;WITH first_trans AS (
			SELECT oc.OfficeAddress1
					,lv.SourceSystemID
					,min(   coalesce( iif(list_side = 1, listingcontractdate, NULL) ,closedate,  statuschangetimestamp)
						) as first_trans_date
			FROM Relitix.dbo.Listings_Combined_For_Volume lv
			join Relitix.dbo.Offices_Combined oc on lv.office_key=oc.OfficeKey and lv.SourceSystemiD=oc.SourceSystemID
			join #Offices o
			on lv.SourceSystemID=@SSID and oc.OfficeAddress1=o.OfficeAddress1
			GROUP BY oc.OfficeAddress1, lv.SourceSystemID
				)

INSERT INTO Relitix_Staging.dbo.rpt_AgentOnePager_Shared
(
ID,SourceSystemID,full_name_ID,year,month,total_closed_volume,pct_change,OfficeName,OfficeAddress,OfficeCity,OfficePostalCode,
closed_vol_percentile,closed_sides_percentile,yoy_increase_pct_percentile,AvgSidesPerAgentLast12,sides_last_12,OfficeAvgTotalClosedVol,OfficeAvgPctChng,Dataset
)
select 
pm.ID,pm.SourceSystemID,pm.full_name_ID,pm.[year],pm.[month],pm.total_closed_volume,pm.pct_change,
pm.OfficeName,pm.OfficeAddress1,pm.OfficeCity,pm.OfficePostalCode,pm.closed_vol_percentile,pm.closed_sides_percentile,pm.yoy_increase_pct_percentile
,spa.AvgSidesPerAgent as AvgSidesPerAgentLast12 --pm.AvgSidesPerAgentLast12
,pm.sides_last_12
,oatcv.OfficeAvgTotalClosedVol
,oapct.OfficeAvgPctChng
,4 As Dataset
from relitix.dbo.monthly_push_master pm
join (select distinct full_name_id from #Agents) ag on pm.full_name_id=ag.full_name_id
left join
(
--select sourcesystemid,officekey,avg(total_closed_volume) As OfficeAvgTotalClosedVol from relitix.dbo.monthly_push_master 
--where total_closed_volume!=0 and SourceSystemID=@SSID
--group by sourcesystemid,officekey
select sourcesystemid,company,OfficeAddress1,avg(total_closed_volume) As OfficeAvgTotalClosedVol from relitix.dbo.monthly_push_master 
where total_closed_volume!=0 and SourceSystemID=@SSID
--and OfficeAddress1=@OfficeAddress
group by sourcesystemid,company,OfficeAddress1
) oatcv
on pm.SourceSystemID=oatcv.SourceSystemID and pm.OfficeAddress1=oatcv.OfficeAddress1 and pm.Company=oatcv.Company
left join
(
select 
o.OfficeAddress1
	,CASE WHEN SUM(a.Rev_last_12) = 0 then 0
		ELSE (SUM(b.Rev_last_12) - SUM(a.Rev_last_12))/SUM(a.Rev_last_12) end as OfficeAvgPctChng
FROM relitix.dbo.work_office_history a
	JOIN relitix.dbo.work_office_history b
		ON a.officekey = b.officekey 
			AND a.SourceSystemID = b.SourceSystemID
			AND a.[month] = b.[month] 
			AND a.[year] = (b.[year]-1)
	JOIN Relitix.dbo.Offices_Combined o
		ON o.OfficeKey = b.officekey
			and o.SourceSystemID = b.SourceSystemID
	LEFT JOIN first_trans f
		ON o.OfficeAddress1 = f.OfficeAddress1
			and b.sourcesystemid = f.SourceSystemID
			join #Offices d on o.OfficeAddress1=d.OfficeAddress1 AND o.SourceSystemID=@SSID
WHERE a.[month] = DATEPART(MONTH,DATEADD(MONTH,-1, DATEADD(DAY,-7,  GetDate()))) 
	and a.[year] = DATEPART(YEAR,DATEADD(MONTH,-1, DATEADD(DAY,-7,  GetDate())))-1
	and b.active_agents >0
	AND f.first_trans_date IS NOT NULL
	and a.sourcesystemid=@SSID
	and o.Company=@Company
GROUP BY o.OfficeAddress1
) oapct
on pm.OfficeAddress1=oapct.OfficeAddress1
LEFT JOIN
#AvgSidesPerAgent spa
on pm.OfficeAddress1=spa.OfficeAddress1
where pm.sourcesystemid=@SSID and pm.Company=@Company


----update CompanyAvgPctChng
--update rpt
--set rpt.CompanyAvgPctChng=capct.CompanyAvgPctChng
-- from Relitix_Staging.dbo.rpt_AgentOnePager_Shared rpt
--left join
--(
--SELECT a.company
--	,a.SourceSystemID
--	,CASE WHEN a.Rev_last_12 = 0 then 0
--		ELSE (b.Rev_last_12 - a.Rev_last_12)/a.Rev_last_12 end as CompanyAvgPctChng
--FROM relitix.dbo.work_company_history a
--	JOIN relitix.dbo.work_company_history b
--		ON a.company = b.company 
--			AND a.SourceSystemID = b.SourceSystemID
--			AND a.[month] = b.[month] 
--			AND a.[year] = (b.[year]-1)
--WHERE a.[month] = DATEPART(MONTH,DATEADD(MONTH,-1, DATEADD(DAY,-7,  GetDate()))) 
--	and a.[year] = DATEPART(YEAR,DATEADD(MONTH,-1, DATEADD(DAY,-7,  GetDate())))-1
--	and a.sourcesystemid=@SSID
--	and a.Company=@Company
--) capct
--on rpt.Company=capct.Company and rpt.SourceSystemID=capct.SourceSystemID
--where rpt.SourceSystemID=@SSID and rpt.Company=@Company and rpt.Dataset=4


----CompanyAvgTotalClosedVol
--update rpt
--set rpt.CompanyAvgTotalClosedVol=catcv.CompanyAvgTotalClosedVol
-- from Relitix_Staging.dbo.rpt_AgentOnePager_Shared rpt
--left join
--(
--select sourcesystemid,company,avg(total_closed_volume) As CompanyAvgTotalClosedVol from relitix.dbo.monthly_push_master 
--where total_closed_volume!=0 and SourceSystemID=@SSID
--group by sourcesystemid,company

--) catcv
--on rpt.SourceSystemID=catcv.SourceSystemID and rpt.Company=catcv.Company
--where rpt.SourceSystemID=@SSID and rpt.Company=@Company and rpt.Dataset=4

----Update CompanyAvgSidePerAgentLast12
--update rpt
--set rpt.CompanyAvgSidePerAgentLast12=cspa.AvgSidesPerAgent from Relitix_Staging.dbo.rpt_AgentOnePager_Shared rpt
--join work_company_sides_per_agent_12mma cspa on rpt.Company=cspa.Company and rpt.SourceSystemID=cspa.SourceSystemID
-- where rpt.sourcesystemid=@SSID and dataset=4 and rpt.company=@Company



 update rpt
set rpt.Company=@Company
from Relitix_Staging.dbo.rpt_AgentOnePager_Shared rpt join 
monthly_push_master ac on rpt.full_name_ID=ac.full_name_ID and rpt.SourceSystemID=ac.SourceSystemID 
where rpt.Sourcesystemid=@SSID and ac.Company=@Company



END













GO

