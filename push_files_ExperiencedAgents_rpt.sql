USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_ExperiencedAgents_rpt]    Script Date: 5/19/2020 3:01:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO























CREATE PROCEDURE [dbo].[push_files_ExperiencedAgents_rpt]
		@table_name_exp varchar(50)=NULL,
		@company varchar(255),
		@ssid INT

AS


SET @table_name_exp=(select distinct reportname As TableName from ReportParameters where tabtypeid=1 and company=@company and sourcesystemid=@ssid)


EXEC('SELECT * FROM ' + @table_name_exp)


















GO

