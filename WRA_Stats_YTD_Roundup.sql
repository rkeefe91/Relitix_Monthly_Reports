USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[WRA_Stats_YTD_Roundup]    Script Date: 5/19/2020 2:46:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		Matt Michalowski
-- Initial Create date: 7/18/2018
-- Description:	WRA Stats YTD Roundup

--Changes:
--1/16/2018: Added filter on SSID's 1, 4, and 8 
-- =============================================
CREATE PROCEDURE [dbo].[WRA_Stats_YTD_Roundup] 
	-- Add the parameters for the stored procedure here
	@eval_date DATE,
	@py_eval_date DATE=NULL,
	@ReportMonth INT=NULL,
	@ReportYear INT=NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SET @py_eval_date=DATEADD(YEAR,-1,@eval_date)
SET @ReportMonth=DATEPART(Month,@eval_date)
SET @ReportYear=DATEPART(Year,@eval_date)

DROP TABLE IF EXISTS Relitix.dbo.work_ytd_lcc
DROP TABLE IF EXISTS Relitix.dbo.work_ytd_lcp

--cy lc records into Relitix.dbo.work_ytd_lcc
SELECT 
cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.StandardStatus,lc.ListingContractDate,lc.CloseDate,lc.ExpirationDate,lc.WithdrawnDate,lc.CancelationDate,lc.ClosePrice,'WI' As CensusState
INTO Relitix.dbo.work_ytd_lcc
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
(SELECT DISTINCT REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion where region!='Milwaukee') cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND
cn.State_num=55 --WI Only
and lc.propertytype='residential' and lc.closeprice is not null
--and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear
and lc.CloseDate<=@eval_date 


--py lc records into Relitix.dbo.work_ytd_lcp
SELECT 
cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.StandardStatus,lc.ListingContractDate,lc.CloseDate,lc.ExpirationDate,lc.WithdrawnDate,lc.CancelationDate,lc.ClosePrice,'WI' As CensusState
INTO Relitix.dbo.work_ytd_lcp
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
(SELECT DISTINCT REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion where region!='Milwaukee') cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential' and lc.closeprice is not null
--and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear-1
and lc.CloseDate<=@py_eval_date

-- Insert statements for procedure here
;with 
cyp As --Current Year Price
(
select distinct
County,MedianPrice
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from Relitix.dbo.work_ytd_lcc lcc
) a
)
,
rmpc As --Current Year Price by Region
(
select distinct
Region,MedianPrice
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from Relitix.dbo.work_ytd_lcc lcc
) a
)
,
smpc As --Current Year Price by State
(
select distinct
State,MedianPrice
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from Relitix.dbo.work_ytd_lcc lcc
) a
)
,
cys As --Current Year Sales
(
select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
		from Relitix.dbo.work_ytd_lcc lc
GROUP BY lc.County
),
pyp As --Prior Year Price
(
select distinct
County,MedianPrice
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from Relitix.dbo.work_ytd_lcp lcp
) a
),
rmpp As --Prior Year Price By Region
(
select distinct
Region,MedianPrice
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from Relitix.dbo.work_ytd_lcp lcp
) a
),
smpp As --Current Year Price by State
(
select distinct
State,MedianPrice
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from Relitix.dbo.work_ytd_lcp lcp
) a
),
pys As --Prior Year Sales
(

select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
		from Relitix.dbo.work_ytd_lcp lc
GROUP BY lc.County
)


select distinct
cbr.Region,rpt.*,
((rpt.CurrentYearMedian-rpt.PriorYearMedian)/rpt.PriorYearMedian)*100 As MedianPctChange,
((rpt.CYMedianPriceByRegion-rpt.PYMedianPriceByRegion)/rpt.PYMedianPriceByRegion)*100 As RegionMedianPctChange,
((rpt.CYMedianPriceByState-rpt.PYMedianPriceByState)/rpt.PYMedianPriceByState)*100 As StateMedianPctChange
from
Relitix_Staging.dbo.WRA_CountyByRegion cbr
join
(
select distinct
	c.County,cyp.MedianPrice As CurrentYearMedian,pyp.MedianPrice As PriorYearMedian,cys.total_sold As CurrentYearSales,pys.total_sold As PriorYearSales
	,rmpc.MedianPrice As CYMedianPriceByRegion
	,rmpp.MedianPrice As PYMedianPriceByRegion
	,smpc.MedianPrice As CYMedianPriceByState
	,smpp.MedianPrice As PYMedianPriceByState
from
(SELECT DISTINCT 'WI' As State,REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion where Region!='Milwaukee') c
left join
	cyp
on
	c.County=cyp.County
left join	
	cys
on
	c.County=cys.County
left join
	pyp
on
	c.County=pyp.County
left join
	pys
on
	c.County=pys.County
left join
	rmpc
on
	rmpc.Region=c.Region
left join
	rmpp
on
	rmpp.Region=c.Region
left join
	smpc
on
	smpc.State=c.State
left join
	smpp
on
	smpp.State=c.State
) rpt on cbr.County=rpt.County
where cbr.Region!='Milwaukee'

DROP TABLE IF EXISTS Relitix.dbo.work_ytd_lcc
DROP TABLE IF EXISTS Relitix.dbo.work_ytd_lcp

END














GO

