USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[WRA_Stats_ExcelOutput]    Script Date: 5/19/2020 2:47:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		Matt Michalowski
-- Create date: 7/16/2018
-- Description:	Sproc used to populate monthly WRA Stats Excel file

--Changes:
--8/1/2018: Modifications to Inventory Calculations
--1/16/2019: Added filter on SSID's 1, 4, and 8
--1/17/2019: Changed references of 'Active with offer' to 'Active Under Contract' 
--5/6/2020: updated inventory WHERE clause
-- =============================================
CREATE PROCEDURE [dbo].[WRA_Stats_ExcelOutput] 

	@eval_date DATE,
	@StartDate Date=NULL,
	@EndDate Date=NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--SET @eval_date='6/30/2018'
SET @StartDate = '2015-01-01';
SET @EndDate = EOMONTH(GETDATE(),-1)

-- Insert statements for procedure here
--Generate Date Table (store last day of all months from Jan 2011 through End of Last Month)
IF OBJECT_ID('work_wra_date_table') IS NOT NULL
DROP TABLE work_wra_date_table;


;WITH cte AS (
SELECT CASE WHEN DATEPART(Day,@StartDate) = 1 THEN EOMONTH(@StartDate,-1)
            ELSE EOMONTH(DATEADD(Month,DATEDIFF(Month,0,@StartDate)+1,0),0) END AS myDate
UNION ALL
SELECT EOMONTH(DATEADD(Month,1,myDate),0)
FROM cte
WHERE EOMONTH(DATEADD(Month,1,myDate),0) <=  @EndDate
)

SELECT myDate
	,MONTH(myDate) as month
	,YEAR(myDate) as year
INTO work_wra_date_table
FROM cte
WHERE YEAR(myDate)>2010
OPTION (MAXRECURSION 0);


;with lcc As --Closed Listings
(
SELECT 
--cbr.County,
lc.*
,
(ClosePrice/CASE WHEN OriginalListPrice is NULL THEN ListPrice 
WHEN OriginalListPrice=0 AND ListPrice=0 THEN ClosePrice
WHEN OriginalListPrice=0 AND ListPrice!=0 THEN ListPrice
ELSE OriginalListPrice END)*100 As sale_to_orig_ratio
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
(SELECT DISTINCT COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion) cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where 
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND
cn.State_num=55 --WI Only
and lc.propertytype='residential' and lc.closeprice is not null
and lc.CloseDate<=@eval_date
--and lc.ListPrice IS NOT NULL
--and (isnull(lc.ListPrice,0) + isnull(lc.OriginalListPrice,0)=0)
and datepart(year,lc.CloseDate)>2010
)

,
scy As --r12 sold count
(
select
tt.month As date_part,tt.year As date_year,
Count(Rtx_LC_ID) as r12_sold_count
FROM lcc,work_wra_date_table tt
where lcc.CloseDate between dateadd(d,1,dateadd(year,-1,mydate)) and mydate
group by tt.month,tt.year
)
,
sc As --sold_count by month/year
(
select 
DATEPART(month,closedate) As date_part,
DATEPART(year,closedate) As date_year
				,Count(Rtx_LC_ID) as total_sold
				,Avg(DATEDIFF(d,lc.ListingContractDate,lc.CloseDate)) As avg_DOM
		from lcc lc
GROUP BY DATEPART(month,closedate),DATEPART(year,closedate)
)
,
--sale_to_orig_ratio by month/year
sto As (
select distinct
DATEPART(month,closedate) As date_part,
DATEPART(year,closedate) As date_year,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sale_to_orig_ratio)   
                            OVER (PARTITION BY DATEPART(month,closedate),DATEPART(year,closedate) ) AS sale_to_orig_ratio
from lcc
)
,
--average price by month/year
ap As (
select distinct
DATEPART(month,closedate) As date_part,
DATEPART(year,closedate) As date_year,
AVG(ClosePrice) As Value
from lcc group by DATEPART(month,closedate),DATEPART(year,closedate)
),
--median price by month/year
mp As (
select distinct
DATEPART(month,closedate) As date_part,
DATEPART(year,closedate) As date_year,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ClosePrice)   
                            OVER (PARTITION BY DATEPART(month,closedate),DATEPART(year,closedate) ) AS MedianPrice
from lcc
)
,
--Listings Combined Inventory
lci As 
(
SELECT lc.*
FROM Relitix.dbo.Listings_Combined lc
join
Relitix.dbo.Listings_Combined_Geo lcg 
on lc.ListingKey=lcg.ListingKey and lc.SourceSystemID=lcg.SourceSystemID
join
relitix.dbo.Census_County_Names cn 
on lcg.CountyFP=cn.CountyFP and lcg.StateFP=cn.State_Num
join
(SELECT DISTINCT COUNTY FROM Relitix_Staging.dbo.WRA_CountyByRegion) cbr --Single counties can belong to more than one region, so select distinct instead of straight join on this table
on cbr.County=RTRIM(LTRIM(REPLACE(cn.County_name,'County','')))
where
(lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8) AND 
cn.State_num=55 --WI Only
and lc.propertytype='residential'
)
,
--inventory_month_end
moinv As (
select
tt.month As date_part,tt.year As date_year,
Count(Rtx_LC_ID) as inventory_month_end
FROM lci,work_wra_date_table tt
where 
StandardStatus <> 'Coming Soon'
                    AND (
                        StandardStatus = 'Active' AND (
                                                            ListingContractDate < myDate
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Active Under Contract' AND (
                                                            ListingContractDate < myDate
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Expired' AND (
                                                            ListingContractDate < myDate
                                                            AND (CloseDate IS NULL OR CloseDate > myDate)
                                                            AND StatusChangeTimestamp>myDate
        ​
                                                            )
        ​
                        OR StandardStatus = 'Pending' AND (
                                                            ListingContractDate < myDate
                                            --              AND (CloseDate IS NULL OR CloseDate > @eval_date)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Closed' AND (
                                                            ListingContractDate < myDate
                                                            AND (coalesce(closedate, statuschangetimestamp) > myDate)
                                            --              AND (ExpirationDate IS NULL OR ExpirationDate >@eval_date)
                                            --              AND (WithdrawnDate IS NULL OR WithdrawnDate > @eval_date)
                                            --              AND (CancelationDate IS NULL OR CancelationDate > @eval_date)
                                                            )
                        OR StandardStatus = 'Withdrawn' AND (
                                                            ListingContractDate < myDate
                                                            AND (CloseDate IS NULL OR CloseDate > myDate)
                                                            AND statuschangetimestamp > myDate
                                                            )
                        OR StandardStatus = 'Canceled' AND (
                                                            ListingContractDate < myDate
                                                            AND (CloseDate IS NULL OR CloseDate > myDate)
                                                            AND statuschangetimestamp > myDate
                                                            )
)
group by tt.month,tt.year
)


select
	'WI' As [state],dt.month As date_part,dt.year As date_year,sc.total_sold as sold_count,mp.medianprice As median_price,ap.Value As average_price,
	sto.sale_to_orig_ratio,sc.avg_DOM As average_dom,moinv.inventory_month_end,scy.r12_sold_count,dateadd(d,1,dateadd(year,-1,mydate)) As msi_begin_date,mydate As msi_end_date
from
	work_wra_date_table dt
left join
	mp
on
	dt.month=mp.date_part and
	dt.year=mp.date_year
left join
	sc
on
	dt.month=sc.date_part and
	dt.year=sc.date_year
left join
	ap
on
	dt.month=ap.date_part and
	dt.year=ap.date_year
left join
	sto
on
	dt.month=sto.date_part and
	dt.year=sto.date_year
left join
	moinv
on
	dt.month=moinv.date_part and
	dt.year=moinv.date_year
left join
	scy
on
	dt.month=scy.date_part and
	dt.year=scy.date_year

END










GO

