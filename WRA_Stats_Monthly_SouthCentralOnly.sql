USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[WRA_Stats_Monthly_SouthCentralOnly]    Script Date: 5/19/2020 2:49:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












-- =============================================
-- Author:		Matt Michalowski
-- Initial Create date: 9/11/2018
-- Description:	WRA Stats Monthly CY to PY Comparison

--Changes:
--1/16/2018: Added filter on SSID's 1, 4, and 8 
--2/19/2018: Added PendingTimestamp to months inventory WHERE clause
-- =============================================
CREATE PROCEDURE [dbo].[WRA_Stats_Monthly_SouthCentralOnly] 
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
DROP TABLE IF EXISTS Relitix.dbo.work_lci_scwmls
DROP TABLE IF EXISTS scw_rpt_lcc
DROP TABLE IF EXISTS scw_rpt_lcp
DROP TABLE IF EXISTS scw_rpt_cyrd
DROP TABLE IF EXISTS scw_rpt_cysd
DROP TABLE IF EXISTS scw_rpt_pyrd
DROP TABLE IF EXISTS scw_rpt_pysd
DROP TABLE IF EXISTS scw_rpt_cyp
DROP TABLE IF EXISTS scw_rpt_rmpc
DROP TABLE IF EXISTS scw_rpt_smpc
DROP TABLE IF EXISTS scw_rpt_cys
DROP TABLE IF EXISTS scw_rpt_pyp
DROP TABLE IF EXISTS scw_rpt_rmpp
DROP TABLE IF EXISTS scw_rpt_smpp
DROP TABLE IF EXISTS scw_rpt_pys
DROP TABLE IF EXISTS scw_rpt_cyinv
DROP TABLE IF EXISTS scw_rpt_cysolds
DROP TABLE IF EXISTS scw_rpt_pyinv
DROP TABLE IF EXISTS scw_rpt_pysolds
DROP TABLE IF EXISTS scw_rpt_cyinvSt
DROP TABLE IF EXISTS scw_rpt_cysoldsSt
DROP TABLE IF EXISTS scw_rpt_cyinvR
DROP TABLE IF EXISTS scw_rpt_cysoldsR
DROP TABLE IF EXISTS scw_rpt_invR
DROP TABLE IF EXISTS scw_rpt_invS
DROP TABLE IF EXISTS scw_rpt_pyinvSt
DROP TABLE IF EXISTS scw_rpt_pysoldsSt
DROP TABLE IF EXISTS scw_rpt_pyinvR
DROP TABLE IF EXISTS scw_rpt_pysoldsR
DROP TABLE IF EXISTS scw_rpt_PinvR
DROP TABLE IF EXISTS scw_rpt_PinvS
DROP TABLE IF EXISTS scw_rpt_cynl
DROP TABLE IF EXISTS scw_rpt_pynl


--select * from Relitix_staging.dbo.WRA_CountyByRegion where region='south central' and county in (
--select county from Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS
--Pull Listings_Combined data for inventory cte's into work_lci_scwmls table
SELECT 
'South Central' As Region,cbr.County,lc.Rtx_LC_ID,lc.StandardStatus,lc.ListingContractDate,lc.CloseDate,lc.ExpirationDate,lc.WithdrawnDate,lc.CancelationDate,lc.ClosePrice,lw.PendingTimestamp,'WI' As CensusState
INTO Relitix.dbo.work_lci_scwmls
FROM Relitix.dbo.Listings_Combined lc
join
	Relitix.dbo.Listings_WIREX lw
on	lc.Rtx_L_ID=lw.Rtx_LW_ID
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential'
and lw.propertytype in ('Single-Family','condo')
--and lw.Subsystemlocale='WIREX_SCW'

-- Insert statements for procedure here
--;with lcc As --Listings Combined Current Year
--(
SELECT 'South Central' As Region,cbr.County,lc.Rtx_LC_ID,lc.ListingContractDate,lc.CloseDate,lc.ClosePrice,'WI' As CensusState
INTO scw_rpt_lcc
FROM Relitix.dbo.Listings_Combined lc
join
	Relitix.dbo.Listings_WIREX lw
on	lc.Rtx_L_ID=lw.Rtx_LW_ID
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential' and lc.closeprice is not null
and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear
--and lw.Subsystemlocale='WIREX_SCW'
and lw.propertytype in ('Single-Family','condo')
--)
--,
--lcp As --Listings Combined Prior Year
--(
SELECT 'South Central' As Region,cbr.County,lc.Rtx_LC_ID,lc.ListingContractDate,lc.CloseDate,lc.ClosePrice,'WI' As CensusState
INTO scw_rpt_lcp
FROM Relitix.dbo.Listings_Combined lc
join
	Relitix.dbo.Listings_WIREX lw
on	lc.Rtx_L_ID=lw.Rtx_LW_ID
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential' and lc.closeprice is not null
and DATEPART(month,lc.CloseDate)=@ReportMonth
and DATEPART(year,lc.CloseDate)=@ReportYear-1
--and lw.Subsystemlocale='WIREX_SCW'
and lw.propertytype in ('Single-Family','condo')
--)
--,
--cyrd As (
--CY avg_DOM by Region
select Region,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_cyrd
from scw_rpt_lcc lc
group by region
--)
--,cysd As (
--CY statewide avg_DOM
select lc.CensusState As State,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_cysd
from scw_rpt_lcc lc
group by CensusState
--) 
--,
--pyrd As
--(
--PY avg_DOM by Region
select Region,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_pyrd
from scw_rpt_lcp lc
group by region
--)
--,
--pysd As
--(
--PY statewide avg_DOM
select lc.CensusState As State,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_pysd
from scw_rpt_lcp lc
group by CensusState
--)
--,
--cyp As --Current Year Price
--(
select distinct
County,MedianPrice
INTO scw_rpt_cyp
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from scw_rpt_lcc
) a
--)
--,
--rmpc As --Current Year Price by Region
--(
select distinct
Region,MedianPrice
INTO scw_rpt_rmpc
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from scw_rpt_lcc
) a
--)
--,
--smpc As --Current Year Price by State
--(
select distinct
State,MedianPrice
INTO scw_rpt_smpc
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from scw_rpt_lcc
) a
--)
--,
--cys As --Current Year Sales
--(
select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_cys
from scw_rpt_lcc lc
GROUP BY lc.County
--),
--pyp As --Prior Year Price
--(
select distinct
County,MedianPrice
INTO scw_rpt_pyp
from
(
select
County,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY County) AS MedianPrice
from scw_rpt_lcp
) a
--),
--rmpp As --Prior Year Price By Region
--(
select distinct
Region,MedianPrice
INTO scw_rpt_rmpp
from
(
select
Region,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY Region) AS MedianPrice
from scw_rpt_lcp
) a
--),
--smpp As --Current Year Price by State
--(
select distinct
State,MedianPrice
INTO scw_rpt_smpp
from
(
select
CensusState As State,
ClosePrice,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY CensusState) AS MedianPrice
from scw_rpt_lcp
) a
--),
--pys As --Prior Year Sales
--(

select lc.County
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
INTO scw_rpt_pys
from scw_rpt_lcp lc
GROUP BY lc.County
--),
--cyinv As (
select 
	County
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_cyinv
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                StandardStatus = 'Active' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Active Under Contract' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Pending' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND WithdrawnDate > @eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND CancelationDate > @eval_date
                                                    )
					)
GROUP BY lci.County
--),
--cysolds as (
		select County
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_cysolds
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY County
--		)
--,pyinv As (
select 
	County
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_pyinv
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                StandardStatus = 'Active' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
                                                    )
             --   OR StandardStatus = 'Active Under Contract' AND (
             --                                       ListingContractDate < @py_eval_date
             --                                       AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
             --                                       AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
             --                                       AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													--AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
             --                                       )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)

                                                    )

             --   OR StandardStatus = 'Pending' AND (
             --                                       ListingContractDate < @py_eval_date
             --                                       AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
             --                                       AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
             --                                       AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													--AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
             --                                       )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND WithdrawnDate > @py_eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND CancelationDate > @py_eval_date
                                                    )
					)
GROUP BY lci.County
--),
--pysolds as (
		select County
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_pysolds
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY County
--		)

--,cyinvSt As (
select 
	CensusState As State
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_cyinvSt
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                 StandardStatus = 'Active' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Active Under Contract' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Pending' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND WithdrawnDate > @eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND CancelationDate > @eval_date
                                                    )
					)
GROUP BY lci.CensusState
--),
--cysoldsSt as (
		select CensusState As State
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_cysoldsSt
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY CensusState
--		)

--,cyinvR As (
select 
	Region
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_cyinvR
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                StandardStatus = 'Active' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Active Under Contract' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
				OR StandardStatus = 'Pending' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND WithdrawnDate > @eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                                    AND CancelationDate > @eval_date
                                                    )
					)
GROUP BY lci.Region
--),
--cysoldsR as (
		select Region
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_cysoldsR
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@eval_date)
			AND ClosePrice > 0
		GROUP BY Region
--		)
--,invR As (
select distinct
	scw_rpt_cyinvR.Region,
	cast(round(((cast(scw_rpt_cyinvR.total_listings as real))/(cast(scw_rpt_cysoldsR.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO scw_rpt_invR
from
	scw_rpt_cyinvR
join
	scw_rpt_cysoldsR
on
	scw_rpt_cyinvR.Region=scw_rpt_cysoldsR.Region
--)
--,
--invS As (
select distinct
	scw_rpt_cyinvSt.State,
	cast(round(((cast(scw_rpt_cyinvSt.total_listings as real))/(cast(scw_rpt_cysoldsSt.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO scw_rpt_invS
from
	scw_rpt_cyinvSt
join
	scw_rpt_cysoldsSt
on
	scw_rpt_cyinvSt.State=scw_rpt_cysoldsSt.State
--)

--,pyinvSt As (
select 
	CensusState As State
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_pyinvSt
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                StandardStatus = 'Active' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
				OR StandardStatus = 'Active Under Contract' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
				OR StandardStatus = 'Pending' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND WithdrawnDate > @py_eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND CancelationDate > @py_eval_date
                                                    )
					)
GROUP BY lci.CensusState
--),
--pysoldsSt as (
		select CensusState As State
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_pysoldsSt
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY CensusState
--		)
--,pyinvR As (
select 
	Region
	,Count(Rtx_LC_ID) as total_listings
INTO scw_rpt_pyinvR
FROM Relitix.dbo.work_lci_scwmls lci
where 
StandardStatus <> 'Coming Soon'
			AND (
                StandardStatus = 'Active' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
				OR StandardStatus = 'Active Under Contract' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
				OR StandardStatus = 'Pending' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Expired' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Closed' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND (ExpirationDate IS NULL OR ExpirationDate >@py_eval_date)
                                                    AND (WithdrawnDate IS NULL OR WithdrawnDate > @py_eval_date)
													AND (CancelationDate IS NULL OR CancelationDate > @py_eval_date)
													AND (PendingTimestamp IS NULL OR PendingTimestamp > @py_eval_date)
                                                    )
                OR StandardStatus = 'Withdrawn' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND WithdrawnDate > @py_eval_date
                                                    )
                OR StandardStatus = 'Canceled' AND (
                                                    ListingContractDate < @py_eval_date
                                                    AND (CloseDate IS NULL OR CloseDate > @py_eval_date)
                                                    AND CancelationDate > @py_eval_date
                                                    )
					)
GROUP BY lci.Region
--),
--pysoldsR as (
		select Region
				,Count(lci.Rtx_LC_ID) as total_sold
INTO scw_rpt_pysoldsR
FROM Relitix.dbo.work_lci_scwmls lci
		where CloseDate < @py_eval_date
			AND CloseDate >= DATEADD(YEAR,-1,@py_eval_date)
			AND ClosePrice > 0
		GROUP BY Region
--		)
--,PinvR As (
select distinct
	scw_rpt_pyinvR.Region,
	cast(round(((cast(scw_rpt_pyinvR.total_listings as real))/(cast(scw_rpt_pysoldsR.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO scw_rpt_PinvR
from
	scw_rpt_pyinvR
join
	scw_rpt_pysoldsR
on
	scw_rpt_pyinvR.Region=scw_rpt_pysoldsR.Region
--)
--,
--PinvS As (
select distinct
	scw_rpt_pyinvSt.State,
	cast(round(((cast(scw_rpt_pyinvSt.total_listings as real))/(cast(scw_rpt_pysoldsSt.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
INTO scw_rpt_PinvS
from
	scw_rpt_pyinvSt
join
	scw_rpt_pysoldsSt
on
	scw_rpt_pyinvSt.State=scw_rpt_pysoldsSt.State
--)
--,
--cynl As
--(
--Current Month/Year New Listings
SELECT 
'WI' As [State],
Count(Rtx_LC_ID) as total_listed 
INTO scw_rpt_cynl
FROM Relitix.dbo.Listings_Combined lc
join
	Relitix.dbo.Listings_WIREX lw
on	lc.Rtx_L_ID=lw.Rtx_LW_ID
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential'
--and lw.Subsystemlocale='WIREX_SCW'
and lw.propertytype in ('Single-Family','condo')
and DATEPART(month,lc.ListingContractDate)=@ReportMonth and  DATEPART(year,lc.ListingContractDate)=@ReportYear
--),
--pynl as
--(
--Prior Month/Year New Listings
SELECT
'WI' As [State], 
Count(Rtx_LC_ID) as total_listed 
INTO scw_rpt_pynl
FROM Relitix.dbo.Listings_Combined lc
join
	Relitix.dbo.Listings_WIREX lw
on	lc.Rtx_L_ID=lw.Rtx_LW_ID
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential'
--and lw.Subsystemlocale='WIREX_SCW'
and lw.propertytype in ('Single-Family','condo')
and DATEPART(month,lc.ListingContractDate)=@ReportMonth and  DATEPART(year,lc.ListingContractDate)=@ReportYear-1
--)

select distinct
'South Central' As Region,rpt.*,
((rpt.CurrentYearMedian-rpt.PriorYearMedian)/rpt.PriorYearMedian)*100 As MedianPctChange,
((rpt.CYMedianPriceByRegion-rpt.PYMedianPriceByRegion)/rpt.PYMedianPriceByRegion)*100 As RegionMedianPctChange,
((rpt.CYMedianPriceByState-rpt.PYMedianPriceByState)/rpt.PYMedianPriceByState)*100 As StateMedianPctChange
from
Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS cbr
join
(
select distinct
	c.County,cyp.MedianPrice As CurrentYearMedian,pyp.MedianPrice As PriorYearMedian,cys.total_sold As CurrentYearSales,pys.total_sold As PriorYearSales
	,cast(round(((cast(cyinv.total_listings as real))/(cast(cysolds.total_sold as real)) * 12),1) As DECIMAL(11,1)) as cy_months_inventory
	,cast(round(((cast(pyinv.total_listings as real))/(cast(pysolds.total_sold as real)) * 12),1) As DECIMAL(11,1)) as py_months_inventory
	,cys.avg_DOM As CurrentYearDOM_Avg
	,pys.avg_DOM As PriorYearDOM_Avg
	,rmpc.MedianPrice As CYMedianPriceByRegion
	,rmpp.MedianPrice As PYMedianPriceByRegion
	,smpc.MedianPrice As CYMedianPriceByState
	,smpp.MedianPrice As PYMedianPriceByState
	,cyrd.avg_DOM As CYAvgDOMByRegion
	,cysd.avg_DOM As CYAvgDOMByState
	,pyrd.avg_DOM As PYAvgDOMByRegion
	,pysd.avg_DOM As PYAvgDOMByState
	,invR.cy_months_inventory As cy_months_inventoryByRegion
	,invS.cy_months_inventory As cy_months_inventoryByState
	,PinvR.cy_months_inventory As py_months_inventoryByRegion
	,PinvS.cy_months_inventory As py_months_inventoryByState
	,cynl.total_listed As CYNewListingsByState
	,pynl.total_listed As PYNewListingsByState
	,cyinvSt.total_listings  As CYTotalListingsState
	,pyinvSt.total_listings  As PYTotalListingsState
from
(SELECT DISTINCT 'WI' As State,'South Central' As Region,COUNTY FROM Relitix_staging.dbo.WRA_CountyByRegion_SCWMLS) c
left join
	scw_rpt_cyp cyp
on
	c.County=cyp.County
left join	
	scw_rpt_cys cys
on
	c.County=cys.County
left join
	scw_rpt_pyp pyp
on
	c.County=pyp.County
left join
	scw_rpt_pys pys
on
	c.County=pys.County
left join
	scw_rpt_cyinv cyinv
on
	c.County=cyinv.County
left join
	scw_rpt_cysolds cysolds
on
	c.County=cysolds.County
left join
	scw_rpt_pyinv pyinv
on
	c.County=pyinv.County
left join
	scw_rpt_pysolds pysolds
on
	c.County=pysolds.County
left join
	scw_rpt_rmpc rmpc
on
	rmpc.Region=c.Region
left join
	scw_rpt_rmpp rmpp
on
	rmpp.Region=c.Region
left join
	scw_rpt_smpc smpc
on
	smpc.State=c.State
left join
	scw_rpt_smpp smpp
on
	smpp.State=c.State
left join
	scw_rpt_cyrd cyrd
on
	cyrd.Region=c.Region
left join
	scw_rpt_cysd cysd
on
	cysd.State=c.State
left join
	scw_rpt_pyrd pyrd
on
	pyrd.Region=c.Region
left join
	scw_rpt_pysd pysd
on
	pysd.State=c.State
left join
	scw_rpt_invR invR
on
	invR.Region=c.Region
left join
	scw_rpt_invS invS
on
	invS.State=c.State
left join
	scw_rpt_PinvR PinvR
on
	PinvR.Region=c.Region
left join
	scw_rpt_PinvS PinvS
on
	PinvS.State=c.State
join
	scw_rpt_cynl cynl
on
	cynl.State=c.State
join
	scw_rpt_pynl pynl
on
	pynl.State=c.State
left join
	scw_rpt_cyinvSt cyinvSt
on
	cyinvSt.State=c.State
left join
	scw_rpt_pyinvSt pyinvSt
on
	pyinvSt.State=c.State
) rpt on cbr.County=rpt.County
where cbr.Region!='Milwaukee'


DROP TABLE IF EXISTS scw_rpt_lcc
DROP TABLE IF EXISTS scw_rpt_lcp
DROP TABLE IF EXISTS scw_rpt_cyrd
DROP TABLE IF EXISTS scw_rpt_cysd
DROP TABLE IF EXISTS scw_rpt_pyrd
DROP TABLE IF EXISTS scw_rpt_lcp
DROP TABLE IF EXISTS scw_rpt_cyp
DROP TABLE IF EXISTS scw_rpt_rmpc
DROP TABLE IF EXISTS scw_rpt_smpc
DROP TABLE IF EXISTS scw_rpt_cys
DROP TABLE IF EXISTS scw_rpt_pyp
DROP TABLE IF EXISTS scw_rpt_rmpp
DROP TABLE IF EXISTS scw_rpt_smpp
DROP TABLE IF EXISTS scw_rpt_pys
DROP TABLE IF EXISTS scw_rpt_cyinv
DROP TABLE IF EXISTS scw_rpt_cysolds
DROP TABLE IF EXISTS scw_rpt_pyinv
DROP TABLE IF EXISTS scw_rpt_pysolds
DROP TABLE IF EXISTS scw_rpt_cyinvSt
DROP TABLE IF EXISTS scw_rpt_cysoldsSt
DROP TABLE IF EXISTS scw_rpt_cyinvR
DROP TABLE IF EXISTS scw_rpt_cysoldsR
DROP TABLE IF EXISTS scw_rpt_invR
DROP TABLE IF EXISTS scw_rpt_invS
DROP TABLE IF EXISTS scw_rpt_pyinvSt
DROP TABLE IF EXISTS scw_rpt_pysoldsSt
DROP TABLE IF EXISTS scw_rpt_pyinvR
DROP TABLE IF EXISTS scw_rpt_pysoldsR
DROP TABLE IF EXISTS scw_rpt_PinvR
DROP TABLE IF EXISTS scw_rpt_PinvS
DROP TABLE IF EXISTS scw_rpt_cynl
DROP TABLE IF EXISTS scw_rpt_pynl

END











GO

