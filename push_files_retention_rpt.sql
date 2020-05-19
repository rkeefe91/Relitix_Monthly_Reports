USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_retention_rpt]    Script Date: 5/19/2020 3:01:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





















CREATE PROCEDURE [dbo].[push_files_retention_rpt]
		@table_name_ret varchar(50)=NULL,
		@company varchar(255),
		@ssid INT

AS


SET @table_name_ret=(select distinct reportname As TableName from ReportParameters where tabtypeid=3 and company=@company and sourcesystemid=@ssid)


EXEC('SELECT * FROM ' + @table_name_ret)











GO

