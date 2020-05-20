USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_alternate_rpt]    Script Date: 5/19/2020 3:00:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















--select * from ReportParameters where company like '%keefe%'



CREATE PROCEDURE [dbo].[push_files_alternate_rpt]
		@table_name_alt varchar(50)=NULL,
		@company varchar(255),
		@ssid INT

AS


IF EXISTS (
select distinct CASE WHEN reportname IS NULL THEN NULL ELSE reportname END As TableName from ReportParameters where tabtypeid=4 and company=@company and sourcesystemid=@ssid
)
SET @table_name_alt=(select distinct reportname As TableName from ReportParameters where tabtypeid=4 and company=@company and sourcesystemid=@ssid)
ELSE 
SET @table_name_alt=(SELECT 'temp_push_empty' AS TableName)
EXEC('SELECT * FROM ' + @table_name_alt)









GO

