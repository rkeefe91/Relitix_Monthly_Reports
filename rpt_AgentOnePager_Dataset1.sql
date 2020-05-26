USE [Relitix]
GO

/****** Object:  StoredProcedure [dbo].[rpt_AgentOnePager_Dataset1]    Script Date: 5/22/2020 2:38:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================================================
-- Author:		Matt Michalowski
-- Create date: 5/22/2020
-- Description:	Agent One Pager - dataset for Volume/Listing History and Active/Expireds History

--Changes:    

-- ==============================================================================================
CREATE PROCEDURE [dbo].[rpt_AgentOnePager_Dataset1]
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

--All possible agents
select distinct 
full_name_id
--,
--YEAR(CloseDate) As CloseYear
INTO #Agents
from Listings_combined_for_volume where (CloseDate >= dateadd(year,-2,@eval_date)
				and CloseDate <= @eval_date and SourceSystemID=@SSID) 
--and YEAR(CloseDate)>=YEAR(@eval_date)-1 
and CloseDate >= dateadd(year,-1,@eval_date)

INSERT INTO Relitix_Staging.dbo.rpt_AgentOnePager_Shared
(ID,SourceSystemID,full_name_ID,year,month,total_closed_volume,OfficeName,OfficeAddress,OfficeCity,OfficePostalCode,transactions_last_12,Rev_last_12,Actives,expireds_last_12,
withdrawn_last_12,canceled_last_12,Dataset)
select t.ID,t.SourceSystemID,t.full_name_ID,t.[year],t.[month],t.total_closed_volume,
pm.OfficeName,pm.OfficeAddress1,pm.OfficeCity,pm.OfficePostalCode,t.transactions_last_12,t.Rev_last_12,t.Actives,
t.expireds_last_12,t.withdrawn_last_12,t.canceled_last_12,
1 As Dataset
from Relitix.dbo.tab_ap_rev_list_12mma t
join Relitix.dbo.monthly_push_master pm on t.ID=pm.ID and t.SourceSystemID=pm.SourceSystemID
join #Agents a on pm.full_name_id=a.full_name_ID
where pm.SourceSystemID=@SSID AND pm.Company=@Company



END













GO

