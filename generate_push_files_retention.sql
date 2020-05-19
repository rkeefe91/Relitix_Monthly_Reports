--Century 21 Affiliated SSID=1
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21a_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

--Century 21 Affiliated SSID=3
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21a_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss
GO

----First Weber
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_fwg_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss
--GO

--Shorewest
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_swr_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss
GO

--Carolina One Real Estate
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_core_5'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


--Century 21 American Homes
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21ah_6'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


--Century 21 Arizona Foothills
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21af_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----CB The Real Estate Group
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_cbrg_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----Daniel Gale Real Estate
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_dg_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----Signature Premier Properties
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_spp_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--Douglas Elliman Real Estate
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_de_6'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----Corcoran
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_corc_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----Compass
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_comp_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--Keefe Real Estate
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_kre_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_kre_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

--Realty Executives
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_re_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----My Home Group
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_mhg_7'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--West USA
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_wusa_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


----CB The Real Estate Group (SSID=9)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_cbrg_9'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----CB The Real Estate Group (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_cbrg_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--C21A (SSID=10)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21a_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----@properties (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_ap_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----Coldwell Banker Residential (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_cbr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--Realty Executives Tucson Elite (SSID=2)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_re_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

--BHHS Starck (SSID=10)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_bhhs_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----Berkshire Hathaway HomeServices KoenigRubloff (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_bhkr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----J Barrett & Company (SSID=11)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_jbc_11'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----William Raveis R.E. & Home Services (SSID=11)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_wr_11'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--Century 21 North East (SSID=11)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21ne_11'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----Long Realty (SSID=2)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_lr_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO


----Century 21 Scheetz (SSID=9)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_c21s_9'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--BHHS Utah Properties (SSID=13)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_bhhsu_13'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

--BHHS Utah Properties (SSID=14)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_bhhsu_14'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


--Century 21 Affiliated SSID=12
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21a_12'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


----RE/MAX Lakeside (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_rmls_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO


----RE/MAX Newport Elite (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_npe_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

--Century 21 Everest (SSID=13)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21e_13'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

--Century 21 Everest (SSID=14)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_c21e_14'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO


--RE/MAX Results (SSID=12)
declare @tname varchar(255),
@cname varchar(255),
@ss INT

SET @tname='push_ret_rmr_12'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Retention]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss

GO

----Stark (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_stark_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO


----Dream Town Realty (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_dtr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO

----Coach Real Estate Assoc Inc (SSID=6)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT

--SET @tname='push_ret_crea_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Retention]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss

--GO