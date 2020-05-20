USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[spCreatePushTable_Retention]    Script Date: 5/19/2020 2:59:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



























CREATE PROCEDURE [dbo].[spCreatePushTable_Retention]
		@table_name varchar(50),
		@company varchar(50),
		@ssid int,
		@startdate date=NULL,			-- Report Start Date (12 months prior to reporting month)
		@enddate date=NULL				-- Report End Date (Last Day of Reporting Month


AS


/*
		Generates a table of all active agents within a given company. Requires a current run of the monthly_push_master. Creates new, pretty table.

		7/3/2018		RK		Rewritten to use monthly_push_master
		11/7/2018		MM		Rewritten to use updated columns from monthly_push_master
*/

EXEC('drop table if exists ' +  @table_name);
DROP TABLE IF EXISTS temp_push_temp;
DROP TABLE IF EXISTS temp_push_temp1;
DROP TABLE IF EXISTS work_amp
DROP TABLE IF EXISTS work_ap
DROP TABLE IF EXISTS work_pending

SET @startdate=DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE()))))
SET @enddate=EOMONTH(DATEADD(month,-1,GETDATE()))

SELECT full_name_ID as [Agent Name]
	,FORMAT(total_closed_volume,'N0') as [Total Closed Volume]
	,FORMAT(yrchange,'N0') as [Year Over Year Increase($)]
	,iif(pct_change = 0,'',FORMAT(pct_change,'P2')) as [Year Over Year Increase (%)]
	,c.OfficeName as [Current Office]
	,c.OfficeCity as [Current Office City]
	,c.OfficePostalCode as [Current Office Zip]
	,FORMAT(first_trans_date,'d','en-US') as [First MLS Transaction Date]
	,primary_county as [Primary County]
	,MemberEmail as Email
	,iif(ISNULL(MemberPreferredPhone,'None')='None','',MemberPreferredPhone) as Phone
	,iif(ISNULL(SocialMediaTypeUrlOrId,'None')='None','',SocialMediaTypeUrlOrId) as Website
	,coalesce(switch_color,'') as [Switch Pattern Match]
	,list_grade as [Listing Effectiveness Grade] 
	,rev_diff as [Listing Effectiveness Impact] --coalesce(FORMAT(rev_diff,'N0'),null) as [Listing Effectiveness Impact]
	,ISNULL(c.sides_last_12,0) As ClosedSides,
	ISNULL(c.actives,0) As CurrentListings,
	CAST(0 As float) As PendingListings
	,ISNULL(c.transactions_last_12,0) As TotalTransactions
	,ISNULL(med_close_price_last12,0) As MedianClosePrice
	,ISNULL(avg_close_price_last12,0) As AvgClosePrice
	,ListSidePct_last_12
	,closed_vol_percentile,
	yoy_increase_percentile,
	closed_sides_percentile,
	yoy_increase_pct_percentile,
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
	c.OfficeAddress1 As CurrentOfficeAddress
INTO temp_push_temp1
from relitix.dbo.monthly_push_master c
				join Relitix.dbo.Offices_Combined o
		on c.OfficeKey = o.OfficeKey
			and c.SourceSystemID = o.sourcesystemid
left join
Relitix.dbo.rpt_rookie_potential rp
on c.SourceSystemiD=rp.SourceSystemiD and c.ID=rp.ID
where c.company = @company
	and c.SourceSystemID  = @ssid
	and c.total_closed_volume > 0


--Pending Inventory
SELECT lv.[full_name_ID],lv.agent_key As MemberKey, lv.SourceSystemID,count(*) As PendingListings
into work_pending
FROM [Relitix].[dbo].[Listings_Combined_For_Volume] lv
join temp_push_temp1 m on lv.full_name_id=m.[Agent Name]
  where
  lv.SourceSystemID=@ssid  AND
StandardStatus = 'Pending'
group by lv.[full_name_ID],lv.SourceSystemID,lv.agent_key


--Update Sides, Listings and Pendings
update m
set 
m.PendingListings=ISNULL(wp.PendingListings,0)
from temp_push_temp1 m
left join work_pending wp on right([Agent Name], charindex('-', reverse([Agent Name])) - 1)=wp.MemberKey

EXEC('Select * INTO ' + @table_name + ' FROM temp_push_temp1;')
















GO

