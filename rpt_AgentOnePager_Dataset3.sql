USE [Relitix]
GO

/****** Object:  StoredProcedure [dbo].[rpt_AgentOnePager_Dataset3]    Script Date: 5/22/2020 2:39:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================================================
-- Author:		Matt Michalowski
-- Create date: 5/22/2020
-- Description:	Agent One Pager - dataset for Closed Transactions Chart

--Changes:    

-- ==============================================================================================
CREATE PROCEDURE [dbo].[rpt_AgentOnePager_Dataset3]
--@PropertySubtype VARCHAR(255)
	@eval_date DATE=NULL,
@SSID INT=NULL,
@Company VARCHAR(100)=NULL

AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

DROP TABLE IF EXISTS #Agents_CY
DROP TABLE IF EXISTS #Agents_PY
DROP TABLE IF EXISTS #listpricebucket_cy
DROP TABLE IF EXISTS #listpricebucket_py
DROP TABLE IF EXISTS #rpt_cy
DROP TABLE IF EXISTS #rpt_py
DROP TABLE IF EXISTS #AgentsToRpt

--Agents CY
select distinct 
lv.full_name_id,
'Dates Analyzed' As CloseYear
INTO #Agents_CY
from Listings_combined_for_volume lv
join monthly_push_master pm on lv.full_name_ID=pm.full_name_ID
where lv.CloseDate >= (DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE())))))
		AND lv.Closedate <= (EOMONTH(DATEADD(month,-1,GETDATE()))) and pm.SourceSystemID=@SSID
--and YEAR(CloseDate)>=YEAR(@eval_date)-1 
--and CloseDate >= dateadd(year,-1,@eval_date)
and pm.Company=@company

--Agents PY
select distinct 
lv.full_name_id,
'Prior 12 Months' As CloseYear
INTO #Agents_PY
from Listings_combined_for_volume lv
join monthly_push_master pm on lv.full_name_ID=pm.full_name_ID
where lv.CloseDate >= DATEADD(year,-1,(DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE()))))))
		AND lv.Closedate <= DATEADD(year,-1,(EOMONTH(DATEADD(month,-1,GETDATE())))) and pm.SourceSystemID=@SSID
--and YEAR(CloseDate)>=YEAR(@eval_date)-1 
--and CloseDate >= dateadd(year,-1,@eval_date)
and pm.Company=@company



--Build price bucket table
select *
into #listpricebucket_cy
from
(
select
full_name_id,CloseYear,'Less than $100K' As ListPriceBucket, 1 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$100k to $150k' As ListPriceBucket, 2 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$150k to $250k' As ListPriceBucket, 3 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select              
full_name_id,CloseYear,'$250k to $350k' As ListPriceBucket, 4 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$350k to $500k' As ListPriceBucket, 5 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select 
full_name_id,CloseYear,'$500k to $750k' As ListPriceBucket, 6 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$750k to $1M' As ListPriceBucket, 7 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$1M to $2M' As ListPriceBucket, 8 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select 
full_name_id,CloseYear,'$2M to $3M' As ListPriceBucket, 9 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
UNION ALL
select
full_name_id,CloseYear,'$3M+' As ListPriceBucket, 10 As SortOrder,NULL As ClosedTransactions
from #Agents_CY
) a

select *
into #listpricebucket_py
from
(
select
full_name_id,CloseYear,'Less than $100K' As ListPriceBucket, 1 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$100k to $150k' As ListPriceBucket, 2 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$150k to $250k' As ListPriceBucket, 3 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select              
full_name_id,CloseYear,'$250k to $350k' As ListPriceBucket, 4 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$350k to $500k' As ListPriceBucket, 5 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select 
full_name_id,CloseYear,'$500k to $750k' As ListPriceBucket, 6 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$750k to $1M' As ListPriceBucket, 7 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$1M to $2M' As ListPriceBucket, 8 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select 
full_name_id,CloseYear,'$2M to $3M' As ListPriceBucket, 9 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
UNION ALL
select
full_name_id,CloseYear,'$3M+' As ListPriceBucket, 10 As SortOrder,NULL As ClosedTransactions
from #Agents_PY
) a

select
full_name_id,CloseYear As YearOfClosing,listpricebucket As ListPriceRange,
listpricesort As SortOrder,
count(*) As ClosedTransactions
INTO #rpt_cy
FROM
(
select full_name_id,
'Dates Analyzed' As CloseYear, 
CASE WHEN ListPrice < 100000 THEN 'Less than $100K'
    WHEN ListPrice < 150000 THEN '$100k to $150k'
    WHEN ListPrice < 250000 THEN '$150k to $250k'                
    WHEN ListPrice < 350000 THEN '$250k to $350k' 
    WHEN ListPrice < 500000 THEN '$350k to $500k' 
    WHEN ListPrice < 750000 THEN '$500k to $750k' 
    WHEN ListPrice < 1000000 THEN '$750k to $1M' 
    WHEN ListPrice < 2000000 THEN '$1M to $2M' 
    WHEN ListPrice < 3000000 THEN '$2M to $3M' 
    WHEN ListPrice >= 3000000 THEN '$3M+'
    ELSE NULL END As ListPriceBucket,
CASE WHEN ListPrice < 100000 THEN 1
    WHEN ListPrice < 150000 THEN 2
    WHEN ListPrice < 250000 THEN 3                
    WHEN ListPrice < 350000 THEN 4 
    WHEN ListPrice < 500000 THEN 5 
    WHEN ListPrice < 750000 THEN 6
    WHEN ListPrice < 1000000 THEN 7
    WHEN ListPrice < 2000000 THEN 8
    WHEN ListPrice < 3000000 THEN 9
    WHEN ListPrice >= 3000000 THEN 10
    ELSE 0 END As ListPriceSort
from Listings_combined_for_volume where CloseDate >= (DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE())))))
		AND Closedate <= (EOMONTH(DATEADD(month,-1,GETDATE()))) and SourceSystemID=@SSID
				--and CloseDate >= dateadd(year,-1,@eval_date)
) a
--where CloseYear>=YEAR(@eval_date)-1
group by full_name_id,CloseYear,listpricebucket,listpricesort

--PY
select
full_name_id,CloseYear As YearOfClosing,listpricebucket As ListPriceRange,
listpricesort As SortOrder,
count(*) As ClosedTransactions
INTO #rpt_py
FROM
(
select full_name_id,
'Prior 12 Months' As CloseYear, 
CASE WHEN ListPrice < 100000 THEN 'Less than $100K'
    WHEN ListPrice < 150000 THEN '$100k to $150k'
    WHEN ListPrice < 250000 THEN '$150k to $250k'                
    WHEN ListPrice < 350000 THEN '$250k to $350k' 
    WHEN ListPrice < 500000 THEN '$350k to $500k' 
    WHEN ListPrice < 750000 THEN '$500k to $750k' 
    WHEN ListPrice < 1000000 THEN '$750k to $1M' 
    WHEN ListPrice < 2000000 THEN '$1M to $2M' 
    WHEN ListPrice < 3000000 THEN '$2M to $3M' 
    WHEN ListPrice >= 3000000 THEN '$3M+'
    ELSE NULL END As ListPriceBucket,
CASE WHEN ListPrice < 100000 THEN 1
    WHEN ListPrice < 150000 THEN 2
    WHEN ListPrice < 250000 THEN 3                
    WHEN ListPrice < 350000 THEN 4 
    WHEN ListPrice < 500000 THEN 5 
    WHEN ListPrice < 750000 THEN 6
    WHEN ListPrice < 1000000 THEN 7
    WHEN ListPrice < 2000000 THEN 8
    WHEN ListPrice < 3000000 THEN 9
    WHEN ListPrice >= 3000000 THEN 10
    ELSE 0 END As ListPriceSort
from Listings_combined_for_volume where CloseDate >= DATEADD(year,-1,(DATEADD(day,1,DATEADD(month,-12,EOMONTH(DATEADD(month,-1,GETDATE()))))))
		AND Closedate <= DATEADD(year,-1,(EOMONTH(DATEADD(month,-1,GETDATE())))) and SourceSystemID=@SSID
				--and CloseDate >= dateadd(year,-1,@eval_date)
) a
--where CloseYear>=YEAR(@eval_date)-1
group by full_name_id,CloseYear,listpricebucket,listpricesort

update lpb
set lpb.ClosedTransactions=rpt.ClosedTransactions
from
#listpricebucket_cy lpb
join
#rpt_cy rpt on lpb.full_name_id=rpt.full_name_id and lpb.closeyear=rpt.YearOfClosing and lpb.ListPriceBucket=rpt.ListPriceRange

update lpb
set lpb.ClosedTransactions=rpt.ClosedTransactions
from
#listpricebucket_py lpb
join
#rpt_py rpt on lpb.full_name_id=rpt.full_name_id and lpb.closeyear=rpt.YearOfClosing and lpb.ListPriceBucket=rpt.ListPriceRange


select distinct full_name_ID INTO #AgentsToRpt from Relitix_Staging.dbo.rpt_AgentOnePager_Shared where dataset=1


INSERT INTO Relitix_Staging.dbo.rpt_AgentOnePager_Shared
(full_name_ID,OfficeName,OfficeAddress,OfficeCity,OfficePostalCode,YearType,ListPriceRange,SortOrder,ClosedTransactions,Dataset,SourceSystemID)
select
lpb.full_name_id,
pm.OfficeName,pm.OfficeAddress1,pm.OfficeCity,pm.OfficePostalCode,
closeyear As YearOfClosing,ListPriceBucket As ListPriceRange,lpb.SortOrder,ISNULL(lpb.ClosedTransactions,0) As ClosedTransactions,
3 As Dataset,pm.SourceSystemID
from #listpricebucket_cy lpb
join relitix.dbo.monthly_push_master pm
on pm.full_name_id=lpb.full_name_id
join #AgentsToRpt s on pm.full_name_ID=s.full_name_ID
where pm.Company=@Company
order by 
OfficeAddress1,
CloseYear,lpb.SortOrder


INSERT INTO Relitix_Staging.dbo.rpt_AgentOnePager_Shared
(full_name_ID,OfficeName,OfficeAddress,OfficeCity,OfficePostalCode,YearType,ListPriceRange,SortOrder,ClosedTransactions,Dataset,SourceSystemID)
select
lpb.full_name_id,
pm.OfficeName,pm.OfficeAddress1,pm.OfficeCity,pm.OfficePostalCode,
closeyear As YearOfClosing,ListPriceBucket As ListPriceRange,lpb.SortOrder,ISNULL(lpb.ClosedTransactions,0) As ClosedTransactions,
3 As Dataset,pm.SourceSystemID
from #listpricebucket_py lpb
join relitix.dbo.monthly_push_master pm
on pm.full_name_id=lpb.full_name_id
join #AgentsToRpt s on pm.full_name_ID=s.full_name_ID
where pm.Company=@Company
order by 
OfficeAddress1,
CloseYear,lpb.SortOrder



END













GO

