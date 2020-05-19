--Keefe Real Estate (SSID=1)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_kre_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Keefe Real Estate (SSID=10)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_kre_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Realty Executives Tucson Elite
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_re_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Shorewest
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_sw_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

----First Weber
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_fw_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

--Century 21 Affiliated (SSID=1)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21a_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 Affiliated (SSID=3)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21a_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 Affiliated (SSID=10)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21a_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 Arizona Foothills
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21af_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Realty Executives
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_re_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Carolina One Real Estate
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_core_5'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Douglas Elliman Real Estate
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_de_6'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 American Homes
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_ah_6'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

----@properties
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_ap_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----CB The Real Estate Group (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_cbrg_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----CB The Real Estate Group (SSID=9)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_cbrg_9'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----CB The Real Estate Group (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_cbrg_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----Coldwell Banker Residential (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_cbr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

--BHHS Starck (SSID=10)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_bhhs_10'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

----Berkshire Hathaway HomeServices KoenigRubloff (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_bhkr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

----J Barrett & Company (SSID=11)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_jbc_11'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

----William Raveis R.E. & Home Services (SSID=11)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_wr_11'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

--Century 21 North East (SSID=11)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21ne_11'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

----Long Realty (SSID=2)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_lr_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----Century 21 Scheetz (SSID=9)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_c21s_9'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

--BHHS Utah Properties (SSID=13)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_bhhsu_13'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--BHHS Utah Properties (SSID=14)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_bhhsu_14'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 Affiliated (SSID=12)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21a_12'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

----RE/MAX Lakeside (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_rmls_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO


----RE/MAX Newport Elite (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_npe_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

--Century 21 Everest (SSID=13)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21e_13'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--Century 21 Everest (SSID=14)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_c21e_14'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO

--RE/MAX Results (SSID=12)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_rmr_12'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO


--West USA Realty (SSID=7)
declare @tname varchar(255),
@cname varchar(255),
@ss INT,
@jw REAL

SET @tname='push_alum_wusa_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @jw = MAX(RealValue)
FROM ReportParameters WHERE ReportName=@tname

exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
		@table_name=@tname,
		@company=@cname,
		@ssid=@ss,
		@jw_max=@jw

GO


----Stark (SSID=1)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_stark_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

----Dream Town Realty (SSID=10)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_dtr_10'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO

----Coach Real Estate Assoc Inc (SSID=6)
--declare @tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@jw REAL

--SET @tname='push_alum_crea_6'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @jw = MAX(RealValue)
--FROM ReportParameters WHERE ReportName=@tname

--exec relitix_dev.[dbo].[spCreatePushTable_Alumni]
--		@table_name=@tname,
--		@company=@cname,
--		@ssid=@ss,
--		@jw_max=@jw

--GO