USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[WRA_PriceRangeStats]    Script Date: 5/19/2020 2:48:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















-- =============================================
-- Author:		Matt Michalowski
-- Initial Create date: 7/2/2018
-- Description:	WRA Price Range Stats

--Changes:
--8/1/2018: Modifications to Inventory Calculations
--9/11/2018: Changed WHERE clause to include Expired listings
--5/6/2020: updated inventory WHERE clause
-- =============================================
CREATE PROCEDURE [dbo].[WRA_PriceRangeStats] 
	-- Add the parameters for the stored procedure here
	@eval_date DATE,
	--@py_eval_date DATE=NULL,
	--@ReportMonth INT=NULL,
	--@ReportYear INT=NULL,
	@break1 numeric=NULL,
	@break2 numeric=NULL,
	@break3 numeric=NULL,
	@break4 numeric=NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--SET @py_eval_date=DATEADD(YEAR,-1,@eval_date)
--SET @ReportMonth=DATEPART(Month,@eval_date)
--SET @ReportYear=DATEPART(Year,@eval_date)

-- Insert statements for procedure here
-- Find stats for each price bucket
set @break1 = 125000
set @break2 = 200000
set @break3 = 350000
set @break4 = 500000


;with cte as (
			select lc.*
					,case  when closeprice  < @break1 then 1
							when closeprice >= @break1 AND closeprice < @break2 then 2
							when closeprice >= @break2 AND closeprice < @break3 then 3
							when closeprice >= @break3 AND closeprice < @break4 then 4
							when closeprice >- @break4 then 5
							else NULL end as closepricebucket
					,case  when listprice  < @break1 then 1
							when listprice >= @break1 AND listprice < @break2 then 2
							when listprice >= @break2 AND listprice < @break3 then 3
							when listprice >= @break3 AND listprice < @break4 then 4
							else 5 end as listpricebucket
			from Relitix.dbo.listings_combined lc
				join Relitix.dbo.listings_combined_geo g
					on lc.sourcesystemid = g.sourcesystemid
						and lc.listingkey = g.listingkey
			where (lc.sourcesystemid = 1 OR lc.sourcesystemID = 4 OR lc.sourcesystemID=8)
				and PropertyType = 'Residential'
				and g.statefp = 55
				),


inv as (
        select listpricebucket
            ,Count(Rtx_LC_ID) as total_listings
            ,AVG(DATEDIFF(DAY,listingcontractdate,@eval_date)) as avg_DOM
        from cte
        where StandardStatus <> 'Coming Soon'
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
        GROUP BY listpricebucket
            ),
solds as (
        select listpricebucket
                ,Count(Rtx_LC_ID) as total_sold
				,sum(closeprice) as total_volume_sold
        from cte
        where  CloseDate <= @eval_date
            AND CloseDate > DATEADD(YEAR,-1,@eval_date)
            AND ClosePrice > 0
        GROUP BY listpricebucket
        )
select CASE WHEN inv.listpricebucket=1 THEN '$0 - $' + FORMAT(@break1-1,'#,##')
	WHEN inv.listpricebucket=2 THEN '$' + FORMAT(@break1,'#,##') + ' - $' + FORMAT(@break2-1,'#,##')
	WHEN inv.listpricebucket=3 THEN '$' +FORMAT(@break2,'#,##') + ' - $' + FORMAT(@break3-1,'#,##')
	WHEN inv.listpricebucket=4 THEN '$' + FORMAT(@break3,'#,##') + ' - $' + FORMAT(@break4-1,'#,##')
	WHEN inv.listpricebucket=5 THEN '$' + FORMAT(@break4,'#,##') + '+'
	ELSE NULL END As listpricebucket
    ,inv.total_listings
    ,inv.avg_DOM
    ,solds.total_sold
	,solds.total_volume_sold
    ,(cast(inv.total_listings as real))/(cast(solds.total_sold as real)) * 12 as months_inventory
from inv    
    join solds
        on inv.listpricebucket = solds.listpricebucket
order by listpricebucket

END

















GO

