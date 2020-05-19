USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_NewAgents_rpt]    Script Date: 5/19/2020 3:01:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [dbo].[push_files_NewAgents_rpt]
		@table_name_new varchar(50)=NULL,
		@company varchar(255),
		@ssid int

AS


SET @table_name_new=(select distinct reportname As TableName from ReportParameters where tabtypeid=2 and company=@company and sourcesystemid=@ssid)


EXEC('SELECT * FROM ' + @table_name_new)
















GO

