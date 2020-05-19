USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[WRA_Stats_Monthly_Alt_No_CTEs]    Script Date: 5/19/2020 2:46:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Matt Michalowski
-- Initial Create date: 5/4/2018
-- Description:	WRA Stats Monthly CY to PY Comparison

--Changes:
--7/2/2018: Add Avg DOM Calculations
--7/17/2018: Added MedianPrice by County and Region Calculations
--8/1/2018: Modifications to Inventory Calculations
--8/2/2018: Added New Listings totals
--8/21/2018: Added Statewide Total Listings
--1/16/2018: Added filter on SSID's 1, 4, and 8 
--5/6/2020: updated inventory WHERE clause
-- =============================================
CREATE PROCEDURE [dbo].[WRA_Stats_Monthly_Alt_No_CTEs] 
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

--Create tables
DROP TABLE IF EXISTS Relitix.dbo.work_lci
DROP TABLE IF EXISTS wra_rpt_lcc
DROP TABLE IF EXISTS wra_rpt_lcp
DROP TABLE IF EXISTS wra_rpt_cyrd
DROP TABLE IF EXISTS wra_rpt_cysd
DROP TABLE IF EXISTS wra_rpt_pyrd
DROP TABLE IF EXISTS wra_rpt_pysd
DROP TABLE IF EXISTS wra_rpt_cyp
DROP TABLE IF EXISTS wra_rpt_rmpc
DROP TABLE IF EXISTS wra_rpt_smpc
DROP TABLE IF EXISTS wra_rpt_cys
DROP TABLE IF EXISTS wra_rpt_pyp
DROP TABLE IF EXISTS wra_rpt_rmpp
DROP TABLE IF EXISTS wra_rpt_smpp
DROP TABLE IF EXISTS wra_rpt_pys
DROP TABLE IF EXISTS wra_rpt_cyinv
DROP TABLE IF EXISTS wra_rpt_cysolds
DROP TABLE IF EXISTS wra_rpt_pyinv
DROP TABLE IF EXISTS wra_rpt_pysolds
DROP TABLE IF EXISTS wra_rpt_cyinvSt
DROP TABLE IF EXISTS wra_rpt_cysoldsSt
DROP TABLE IF EXISTS wra_rpt_cyinvR
DROP TABLE IF EXISTS wra_rpt_cysoldsR
DROP TABLE IF EXISTS wra_rpt_invR
DROP TABLE IF EXISTS wra_rpt_invS
DROP TABLE IF EXISTS wra_rpt_pyinvSt
DROP TABLE IF EXISTS wra_rpt_pysoldsSt
DROP TABLE IF EXISTS wra_rpt_pyinvR
DROP TABLE IF EXISTS wra_rpt_pysoldsR
DROP TABLE IF EXISTS wra_rpt_PinvR
DROP TABLE IF EXISTS wra_rpt_PinvS
DROP TABLE IF EXISTS wra_rpt_cynl
DROP TABLE IF EXISTS wra_rpt_pynl

--Pull Listings_Combined data for inventory cte's into work_lci table
SELECT 
cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.StandardStatus,lc.ListingContractDate,lc.CloseDate,lc.ExpirationDate,lc.WithdrawnDate,lc.CancelationDate,lc.ClosePrice,'WI' As CensusState,lc.StatusChangeTimestamp
INTO Relitix.dbo.work_lci
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
(SELECT DISTINCT REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion WHERE Region!='Milwaukee') cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential'

-- Insert statements for procedure here
--;with lcc As --Listings Combined Current Year
--(
SELECT cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.ListingContractDate,lc.CloseDate,lc.ClosePrice,'WI' As CensusState
INTO wra_rpt_lcc
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
and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear
--)
--,
--lcp As --Listings Combined Prior Year
--(
SELECT cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.ListingContractDate,lc.CloseDate,lc.ClosePrice,'WI' As CensusState
INTO wra_rpt_lcp
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
and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear-1
--)
--,
--cyrd As (
--CY avg_DOM by Region
select Region,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_cyrd
from wra_rpt_lcc lc
group by region
--)
--,cysd As (
--CY statewide avg_DOM
select lc.CensusState As State,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_cysd
from wra_rpt_lcc lc
group by CensusState
--) 
--,
--pyrd As
--(
--PY avg_DOM by Region
select Region,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_pyrd
from wra_rpt_lcp lc
group by region
--)
--,
--pysd As
--(
--PY statewide avg_DOM
select lc.CensusState As State,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_pysd
from wra_rpt_lcp lc
group by CensusState
--)
--,
--cyp As --Current Year Price
--(
select distinct
County,MedianPrice
INTO wra_rpt_cyp
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from wra_rpt_lcc
) a
--)
--,
--rmpc As --Current Year Price by Region
--(
select distinct
Region,MedianPrice
INTO wra_rpt_rmpc
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from wra_rpt_lcc
) a
--)
--,
--smpc As --Current Year Price by State
--(
select distinct
State,MedianPrice
INTO wra_rpt_smpc
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from wra_rpt_lcc
) a
--)
--,
--cys As --Current Year Sales
--(
select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_cys
from wra_rpt_lcc lc
GROUP BY lc.County
--),
--pyp As --Prior Year Price
--(
select distinct
County,MedianPrice
INTO wra_rpt_pyp
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from wra_rpt_lcp
) a
--),
--rmpp As --Prior Year Price By Region
--(
select distinct
Region,MedianPrice
INTO wra_rpt_rmpp
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from wra_rpt_lcp
) a
--),
--smpp As --Current Year Price by State
--(
select distinct
State,MedianPrice
INTO wra_rpt_smpp
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from wra_rpt_lcp
) a
--),
--pys As --Prior Year Sales
--(

select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO wra_rpt_pys
from wra_rpt_lcp lc
GROUP BY lc.County
--),
--lci As 
--(
--SELECT 
--cbr.Region,cbr.County,lc.Rtx_LC_ID,lc.StandardStatus,lc.ListingContractDate,lc.CloseDate,lc.ExpirationDate,lc.WithdrawnDate,lc.CancelationDate,lc.ClosePrice,'WI' As CensusState
--FROM Relitix.dbo.Listings_Combined lc
--join
--Relitix.dbo.Listings_Combined_Geo lcg 
--on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
--join
--relitix.dbo.Census_County_Names cn 
--on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
--join
--(SELECT DISTINCT REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion WHERE Region!='Milwaukee') cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
--on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
--where 
--cn.State_num=55 --WI Only
--and lc.propertytype='residential'
--)
--,
--cyinv As (
select 
	County
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_cyinv
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND StatusChangeTimestamp>@eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
)
GROUP BY lci.County
--),
--cysolds as (
		select County
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_cysolds
FROM Relitix.dbo.work_lci lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY County
--		)
--,pyinv As (
select 
	County
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_pyinv
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND StatusChangeTimestamp>@py_eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @py_eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
)
GROUP BY lci.County
--),
--pysolds as (
		select County
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_pysolds
FROM Relitix.dbo.work_lci lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY County
--		)

--,cyinvSt As (
select 
	CensusState As State
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_cyinvSt
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND StatusChangeTimestamp>@eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
)
GROUP BY lci.CensusState
--),
--cysoldsSt as (
		select CensusState As State
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_cysoldsSt
FROM Relitix.dbo.work_lci lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY CensusState
--		)

--,cyinvR As (
select 
	Region
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_cyinvR
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND StatusChangeTimestamp>@eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                            AND statuschangetimestamp > @eval_date
                                                            )
)
GROUP BY lci.Region
--),
--cysoldsR as (
		select Region
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_cysoldsR
FROM Relitix.dbo.work_lci lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY Region
--		)
--,invR As (
select distinct
	wra_rpt_cyinvR.Region,
	cast(round(((cast(wra_rpt_cyinvR.total_listings as real))/(cast(wra_rpt_cysoldsR.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO wra_rpt_invR
from
	wra_rpt_cyinvR
join
	wra_rpt_cysoldsR
on
	wra_rpt_cyinvR.Region=wra_rpt_cysoldsR.Region
--)
--,
--invS As (
select distinct
	wra_rpt_cyinvSt.State,
	cast(round(((cast(wra_rpt_cyinvSt.total_listings as real))/(cast(wra_rpt_cysoldsSt.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO wra_rpt_invS
from
	wra_rpt_cyinvSt
join
	wra_rpt_cysoldsSt
on
	wra_rpt_cyinvSt.State=wra_rpt_cysoldsSt.State
--)

--,pyinvSt As (
select 
	CensusState As State
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_pyinvSt
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND StatusChangeTimestamp>@py_eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @py_eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
)
GROUP BY lci.CensusState
--),
--pysoldsSt as (
		select CensusState As State
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_pysoldsSt
FROM Relitix.dbo.work_lci lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY CensusState
--		)
--,pyinvR As (
select 
	Region
	,Count(Rtx_LC_ID) as total_listings
INTO wra_rpt_pyinvR
FROM Relitix.dbo.work_lci lci
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND StatusChangeTimestamp>@py_eval_date
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < @py_eval_date
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (coalesce(closedate, statuschangetimestamp) > @py_eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < @py_eval_date
                                                            AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                            AND statuschangetimestamp > @py_eval_date
                                                            )
)
GROUP BY lci.Region
--),
--pysoldsR as (
		select Region
				,Count(lci.Rtx_LC_ID) as total_sold
INTO wra_rpt_pysoldsR
FROM Relitix.dbo.work_lci lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY Region
--		)
--,PinvR As (
select distinct
	wra_rpt_pyinvR.Region,
	cast(round(((cast(wra_rpt_pyinvR.total_listings as real))/(cast(wra_rpt_pysoldsR.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO wra_rpt_PinvR
from
	wra_rpt_pyinvR
join
	wra_rpt_pysoldsR
on
	wra_rpt_pyinvR.Region=wra_rpt_pysoldsR.Region
--)
--,
--PinvS As (
select distinct
	wra_rpt_pyinvSt.State,
	cast(round(((cast(wra_rpt_pyinvSt.total_listings as real))/(cast(wra_rpt_pysoldsSt.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO wra_rpt_PinvS
from
	wra_rpt_pyinvSt
join
	wra_rpt_pysoldsSt
on
	wra_rpt_pyinvSt.State=wra_rpt_pysoldsSt.State
--)
--,
--cynl As
--(
--Current Month/Year New Listings
SELECT 
'WI' As [State],
Count(Rtx_LC_ID) as total_listed 
INTO wra_rpt_cynl
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
where 
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND
cn.State_num=55 --WI Only
and lc.propertytype='residential'
and DATEPART(month,lc.ListingContractDate)=@ReportMonth and  DATEPART(year,lc.ListingContractDate)=@ReportYear
--),
--pynl as
--(
--Prior Month/Year New Listings
SELECT
'WI' As [State], 
Count(Rtx_LC_ID) as total_listed
INTO wra_rpt_pynl
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
where 
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND
cn.State_num=55 --WI Only
and lc.propertytype='residential'
and DATEPART(month,lc.ListingContractDate)=@ReportMonth and  DATEPART(year,lc.ListingContractDate)=@ReportYear-1
--)

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
	c.County,wra_rpt_cyp.MedianPrice As CurrentYearMedian,wra_rpt_pyp.MedianPrice As PriorYearMedian,wra_rpt_cys.total_sold As CurrentYearSales,wra_rpt_pys.total_sold As PriorYearSales
	,cast(round(((cast(wra_rpt_cyinv.total_listings as real))/(cast(wra_rpt_cysolds.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
	,cast(round(((cast(wra_rpt_pyinv.total_listings as real))/(cast(wra_rpt_pysolds.total_sold as real)) * 12),1) As DECIMAL(11,1)) as py_months_inventory
	,wra_rpt_cys.avg_DOM As CurrentYearDOM_Avg
	,wra_rpt_pys.avg_DOM As PriorYearDOM_Avg
	,wra_rpt_rmpc.MedianPrice As CYMedianPriceByRegion
	,wra_rpt_rmpp.MedianPrice As PYMedianPriceByRegion
	,wra_rpt_smpc.MedianPrice As CYMedianPriceByState
	,wra_rpt_smpp.MedianPrice As PYMedianPriceByState
	,wra_rpt_cyrd.avg_DOM As CYAvgDOMByRegion
	,wra_rpt_cysd.avg_DOM As CYAvgDOMByState
	,wra_rpt_pyrd.avg_DOM As PYAvgDOMByRegion
	,wra_rpt_pysd.avg_DOM As PYAvgDOMByState
	,wra_rpt_invR.cy_months_inventory As cy_months_inventoryByRegion
	,wra_rpt_invS.cy_months_inventory As cy_months_inventoryByState
	,wra_rpt_PinvR.cy_months_inventory As py_months_inventoryByRegion
	,wra_rpt_PinvS.cy_months_inventory As py_months_inventoryByState
	,wra_rpt_cynl.total_listed As CYNewListingsByState
	,wra_rpt_pynl.total_listed As PYNewListingsByState
	,wra_rpt_cyinvSt.total_listings  As CYTotalListingsState
	,wra_rpt_pyinvSt.total_listings  As PYTotalListingsState
from
(SELECT DISTINCT 'WI' As State,REGION,COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion where Region!='Milwaukee') c
left join
	wra_rpt_cyp
on
	c.County=wra_rpt_cyp.County
left join	
	wra_rpt_cys
on
	c.County=wra_rpt_cys.County
left join
	wra_rpt_pyp
on
	c.County=wra_rpt_pyp.County
left join
	wra_rpt_pys
on
	c.County=wra_rpt_pys.County
left join
	wra_rpt_cyinv
on
	c.County=wra_rpt_cyinv.County
left join
	wra_rpt_cysolds
on
	c.County=wra_rpt_cysolds.County
left join
	wra_rpt_pyinv
on
	c.County=wra_rpt_pyinv.County
left join
	wra_rpt_pysolds
on
	c.County=wra_rpt_pysolds.County
left join
	wra_rpt_rmpc
on
	wra_rpt_rmpc.Region=c.Region
left join
	wra_rpt_rmpp
on
	wra_rpt_rmpp.Region=c.Region
left join
	wra_rpt_smpc
on
	wra_rpt_smpc.State=c.State
left join
	wra_rpt_smpp
on
	wra_rpt_smpp.State=c.State
left join
	wra_rpt_cyrd
on
	wra_rpt_cyrd.Region=c.Region
left join
	wra_rpt_cysd
on
	wra_rpt_cysd.State=c.State
left join
	wra_rpt_pyrd
on
	wra_rpt_pyrd.Region=c.Region
left join
	wra_rpt_pysd
on
	wra_rpt_pysd.State=c.State
left join
	wra_rpt_invR
on
	wra_rpt_invR.Region=c.Region
left join
	wra_rpt_invS
on
	wra_rpt_invS.State=c.State
left join
	wra_rpt_PinvR
on
	wra_rpt_PinvR.Region=c.Region
left join
	wra_rpt_PinvS
on
	wra_rpt_PinvS.State=c.State
join
	wra_rpt_cynl
on
	wra_rpt_cynl.State=c.State
join
	wra_rpt_pynl
on
	wra_rpt_pynl.State=c.State
left join
	wra_rpt_cyinvSt
on
	wra_rpt_cyinvSt.State=c.State
left join
	wra_rpt_pyinvSt
on
	wra_rpt_pyinvSt.State=c.State
) rpt on cbr.County=rpt.County
where cbr.Region!='Milwaukee'

DROP TABLE IF EXISTS Relitix.dbo.work_lci
DROP TABLE IF EXISTS wra_rpt_lcc
DROP TABLE IF EXISTS wra_rpt_lcp
DROP TABLE IF EXISTS wra_rpt_cyrd
DROP TABLE IF EXISTS wra_rpt_cysd
DROP TABLE IF EXISTS wra_rpt_pyrd
DROP TABLE IF EXISTS wra_rpt_pysd
DROP TABLE IF EXISTS wra_rpt_cyp
DROP TABLE IF EXISTS wra_rpt_rmpc
DROP TABLE IF EXISTS wra_rpt_smpc
DROP TABLE IF EXISTS wra_rpt_cys
DROP TABLE IF EXISTS wra_rpt_pyp
DROP TABLE IF EXISTS wra_rpt_rmpp
DROP TABLE IF EXISTS wra_rpt_smpp
DROP TABLE IF EXISTS wra_rpt_pys
DROP TABLE IF EXISTS wra_rpt_cyinv
DROP TABLE IF EXISTS wra_rpt_cysolds
DROP TABLE IF EXISTS wra_rpt_pyinv
DROP TABLE IF EXISTS wra_rpt_pysolds
DROP TABLE IF EXISTS wra_rpt_cyinvSt
DROP TABLE IF EXISTS wra_rpt_cysoldsSt
DROP TABLE IF EXISTS wra_rpt_cyinvR
DROP TABLE IF EXISTS wra_rpt_cysoldsR
DROP TABLE IF EXISTS wra_rpt_invR
DROP TABLE IF EXISTS wra_rpt_invS
DROP TABLE IF EXISTS wra_rpt_pyinvSt
DROP TABLE IF EXISTS wra_rpt_pysoldsSt
DROP TABLE IF EXISTS wra_rpt_pyinvR
DROP TABLE IF EXISTS wra_rpt_pysoldsR
DROP TABLE IF EXISTS wra_rpt_PinvR
DROP TABLE IF EXISTS wra_rpt_PinvS
DROP TABLE IF EXISTS wra_rpt_cynl
DROP TABLE IF EXISTS wra_rpt_pynl

END






GO

