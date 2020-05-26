USE [Relitix]
GO

/****** Object:  StoredProcedure [dbo].[rpt_AgentOnePager_Dataset2]    Script Date: 5/22/2020 2:38:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================================================
-- Author:		Matt Michalowski
-- Create date: 5/22/2020
-- Description:	Agent One Pager - dataset for 1yr Market Share Rankings

--Changes:    

-- ==============================================================================================
CREATE PROCEDURE [dbo].[rpt_AgentOnePager_Dataset2]
--@PropertySubtype VARCHAR(255)
	@eval_date DATE=NULL,
@SSID INT=NULL,
@Company VARCHAR(100)=NULL

AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

DROP TABLE IF EXISTS #cte
DROP TABLE IF EXISTS #cte_muni
DROP TABLE IF EXISTS #cte_county
DROP TABLE IF EXISTS #cte_nb

--;with cte as (  --- Generate list of closings within date range
		select a.MemberFullName
			,a.MemberKey
			,concat(a.MemberFullName,' ',a.SourceSystemID,'-',a.MemberKey) as full_name_ID
			,lc.volume_credit as ClosePrice -- Changed to reflect co-listed/sold properties
			,g.CountyFP
			,g.StateFP
			,g.CensusPlace
			,g.ZNeighborhood
			,lc.SourceSystemID
		INTO #cte
		from Relitix_Dev.dbo.Listings_Combined_For_Volume lc
			join Relitix.dbo.Listings_Combined_Geo g
				on lc.ListingKey = g.ListingKey
					and lc.SourceSystemID = g.SourceSystemID
			join Relitix.dbo.Agents_Combined a
				on lc.agent_key = a.memberkey
					and a.SourceSystemID = lc.SourceSystemID
		where 
		CloseDate >= dateadd(year,-1,@eval_date)
				and 
				CloseDate <= @eval_date
				and a.SourceSystemID=@SSID

				--),
--cte_muni as  (   -- Generate rank by municipality
			SELECT full_name_ID,
					 CensusPlace as GeoName,
					 'CensusPlace' as GeoType,
					 sum(ClosePrice) as total_closed_volume,
					 rank() OVER (PARTITION BY censusplace, sourcesystemid ORDER BY sum(ClosePrice) desc) as Muni_Rank
					 ,SourceSystemID
			into #cte_muni
			from #cte
			where censusplace is not null
			group by full_name_ID, censusplace, SourceSystemID
--			),
--cte_county as (-- Generate rank by county
			SELECT full_name_ID,
						c.County_name as GeoName,
						'County' as GeoType,
						sum(ClosePrice) as total_closed_volume,
						rank() OVER (PARTITION BY c.County_name, sourcesystemid ORDER BY sum(ClosePrice) desc) as Muni_Rank
						,SourceSystemID
			into #cte_county
			from #cte cte
				join relitix.dbo.census_County_Names c
					on cte.CountyFP = c.CountyFP
						and c.State_num = cte.StateFP
			group by full_name_ID,c.County_name, SourceSystemID
--				),
--cte_nb as (-- Generate rank by Zillow Neighborhood

			SELECT full_name_ID,
						concat(ZNeighborhood, ' (Neighborhood in ',CensusPlace,')') as GeoName,
						'Neighborhood' as GeoType,
						sum(ClosePrice) as total_closed_volume,
						rank() OVER (PARTITION BY ZNeighborhood, CensusPlace, sourcesystemid ORDER BY sum(ClosePrice) desc) as Muni_Rank
						,SourceSystemID
			into #cte_nb
			from #cte
			where ZNeighborhood is not null
			group by full_name_ID,ZNeighborhood, CensusPlace, SourceSystemID

			--)


INSERT INTO Relitix_Staging.dbo.rpt_AgentOnePager_Shared
(OfficeAddress,full_name_ID,GeoName,GeoType,total_closed_volume,Muni_Rank,SourceSystemID,Dataset)
select
OfficeAddress1,full_name_id,GeoName,GeoType,total_closed_volume,Muni_Rank,SourceSystemID,
2 As Dataset
from
(
select
OfficeAddress1,full_name_id,GeoName,GeoType,total_closed_volume,Muni_Rank,SourceSystemID,
Rank() over (Partition BY OfficeAddress1,full_name_id
                ORDER BY Muni_Rank ) AS Rank
from
(
select pm.OfficeAddress1,c.* from #cte_county c
join relitix.dbo.monthly_push_master pm
on pm.full_name_id=c.full_name_id
where company=@Company

UNION ALL

select pm.OfficeAddress1,c.* from #cte_muni c
join relitix.dbo.monthly_push_master pm
on pm.full_name_id=c.full_name_id
where company=@Company

UNION ALL

select pm.OfficeAddress1,c.* from #cte_nb c
join relitix.dbo.monthly_push_master pm
on pm.full_name_id=c.full_name_id
where company=@Company
) a
) b
where b.Rank<=10



END













GO

