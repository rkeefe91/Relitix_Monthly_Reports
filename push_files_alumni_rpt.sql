USE [Relitix_Dev]
GO

/****** Object:  StoredProcedure [dbo].[push_files_alumni_rpt]    Script Date: 5/19/2020 3:01:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






















CREATE PROCEDURE [dbo].[push_files_alumni_rpt]
		@table_name_alum varchar(50)=NULL,
		@company varchar(255),
		@ssid INT

AS


SET @table_name_alum=(select distinct reportname As TableName from ReportParameters where tabtypeid=10 and company=@company and sourcesystemid=@ssid)


EXEC('SELECT * FROM ' + @table_name_alum)












GO

