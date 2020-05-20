USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_coaching_rpt]    Script Date: 5/19/2020 3:01:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[push_files_coaching_rpt]

		@company varchar(255),
		@ssid INT

AS


with cte as (  -- Find breakpoints for percentage change (discard zero-basis agents)
			select distinct SourceSystemID
				,PERCENTILE_CONT(.2) WITHIN GROUP (ORDER BY pct_change)   
										OVER (PARTITION BY sourcesystemid) AS pct_break_1
				,PERCENTILE_CONT(.8) WITHIN GROUP (ORDER BY pct_change)   
										OVER (PARTITION BY sourcesystemid) AS pct_break_2
			from relitix.dbo.monthly_push_master
			where zero_basis_flag = 0
				and pct_change > -1
			),
cte1 as		(  -- Find breakpoints for listing effectiveness and l.e. impact
			select distinct SourceSystemID

				,PERCENTILE_CONT(.2) WITHIN GROUP (ORDER BY list_rating)   
										OVER (PARTITION BY sourcesystemid) AS list_break_1
				,PERCENTILE_CONT(.8) WITHIN GROUP (ORDER BY list_rating)   
										OVER (PARTITION BY sourcesystemid) AS list_break_2
				,PERCENTILE_CONT(.2) WITHIN GROUP (ORDER BY rev_diff)   
										OVER (PARTITION BY sourcesystemid) AS lei_break_1
				,PERCENTILE_CONT(.8) WITHIN GROUP (ORDER BY rev_diff)   
										OVER (PARTITION BY sourcesystemid) AS lei_break_2
			from relitix.dbo.monthly_push_master
			),
cte2 as		(  -- Labels each agent by where they appear in the matrix
			select m.ID
				,m.SourceSystemID
				,m.full_name_ID
				,m.Company
				,m.OfficeName
				,m.OfficeCity
				,m.first_trans_date
				,m.total_closed_volume
				,m.rev_diff
				,m.switch_color
				,iif(zero_basis_flag = 1, NULL,  CASE WHEN pct_change <= pct_break_1 THEN 1
													WHEN pct_change >= pct_break_2 THEN 3
													ELSE 2 END) as pct_cat
				,iif(list_rating IS NULL, NULL, CASE WHEN list_rating<= list_break_1 THEN 1
													WHEN list_rating >= list_break_2 THEN 3
													ELSE 2 END) as list_cat
				,iif(rev_diff IS NULL, NULL,   CASE WHEN rev_diff<= lei_break_1 THEN 1
													WHEN rev_diff >= lei_break_2 THEN 3
													ELSE 2 END) as lei_cat
				,m.trend_type
				,m.plateau_level
				,m.consistent_level
				,m.ListSidePct_last_12
				,m.AvgSidesPerAgentLast12 As [Current Office Productivity]
				--,ac.MemberFirstName
				--,ac.MemberLastName
				,rp.pred As RookiePotential
				,m.OfficePostalCode
				,m.OfficeAddress1
			from relitix.dbo.monthly_push_master m
							join Relitix.dbo.Offices_Combined o
		on m.OfficeKey = o.OfficeKey
			and m.SourceSystemID = o.sourcesystemid
				join cte
					on cte.sourcesystemid = m.sourcesystemid
				join cte1
					on cte1.SourceSystemID = m.SourceSystemID
					left join
Relitix.dbo.rpt_rookie_potential rp
on m.SourceSystemiD=rp.SourceSystemiD and m.ID=rp.ID
					--join relitix.dbo.Agents_Combined ac on m.ID=ac.MemberKey and m.SourceSystemID=ac.SourceSystemID
				)
select *
	,concat(	'', iif(trend_type = 'broke free from plateau','This agent has entered a period of accelerated production growth. Coach and support ',''),
				iif(trend_type = 'consistent','This agents growth is stalled. ',''),		
				iif(trend_type = 'plateau' and total_closed_volume >1500000,'This agents recent growth has stopped. Investigate. ',''),
				iif(trend_type = 'continued decline','This agents production has been falling for at least 2 years. Review business and motivation. ',''),
				iif(trend_type = 'continued increase','This agents production has been increasing for at least 2 years. ',''),
				iif(trend_type = 'dropping off plateau','This agents production has recently dropped from their historical level. Discuss recent changes in business. ',''),
				iif(pct_cat =1,'This agents business has dropped dramatically in the last year. Investigate cause. ',''),
				iif(pct_cat =3 and total_closed_volume > 1000000,'This agents business has grown dramatically in the last year. ',''),
				iif(pct_cat =1 AND list_cat = 1,'Coach this agent on listing management and/or remove from lead flow. ',''),
				iif(pct_cat = 3 AND list_cat = 1, 'Review how this agent prices listings and provide more listing support. ',''),
				iif(pct_cat = 1 AND list_cat = 3, 'Review this agents prospecting program and overall motivation. ',''),			
				iif(pct_cat = 3 AND list_cat = 3, 'Consider this agent as a listing mentor. ',''),							
				iif(list_cat = 1 AND lei_cat = 1, 'This agent is closing their listings at a rate well below their peers. Dig into this agents listing history as a top priority item starting with higher-priced listings. ',''),
				iif(list_cat = 1 AND lei_cat = 3, 'Examine the mix of business and consider focusing the agent more on high-end properties. ',''),
				iif(list_cat = 3 AND lei_cat = 1, 'Evaluate pricing and service given to higher-end listings. ',''),
				iif(list_cat = 3 AND lei_cat = 3, 'Top-tier listing agent and top retention priority. ',''),
				iif(list_cat > 1 
					AND pct_cat = 3
					AND first_trans_date >= dateadd(YEAR,-2,getdate())
					AND list_cat>1 
					AND sourcesystemid <> 6,'Rising star. Coach and support. ',''),
				iif(list_cat = 1 
					AND lei_cat = 1
					AND ListSidePct_last_12 <.35 ,'They may be a buyer specialist struggling with listings. Encourage referral partner? ',''),
				iif(rev_diff < -2000000,'This agent is showing difficulty closing high-end listings in a timely manner. Review listings taken 6-18 months ago, pricing strategy and marketing. ','')
			) as coaching

from cte2
where company = @company
	and SourceSystemID = @ssid
	and total_closed_volume >0
order by officecity, full_name_ID











GO

