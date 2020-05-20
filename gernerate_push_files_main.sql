USE Relitix_Dev

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_5'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_6'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_9'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_fwg1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_fwg2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_swr1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_swr2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_swr3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_swr_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_7'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_8'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_core_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_core_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName='temp_push_core_2'
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_core_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName='temp_push_core_2'
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21ah_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21ah_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21ah_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21af_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21af_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_dg_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_dg_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
	--	@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_spp_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
	--	@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_spp_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
	--	@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_de_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_de_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_de_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_corc_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_corc_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_comp_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_comp_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_10_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_10_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_kre_10_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_mhg_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_mhg_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_wusa_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_wusa_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_wusa_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_wusa_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_9_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_9_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_9_3'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_9_4'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_10_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbrg_10_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_10_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_10_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_10_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


--@properties ssid=10
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_ap_10_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_ap_10_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

----Coldwell Banker Residential (ssid=10)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbr_10_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_cbr_10_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--Realty Executives Tucson Elite
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_2_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--Realty Executives Tucson Elite
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_2_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_re_2_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


--BHHS Starck (SSID=10)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhs_10_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhs_10_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhs_10_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhs_10_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_bhkr_10_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_bhkr_10_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
		--@min_list_side_pct = @minlsp,
		--@max_list_side_pct = @maxlsp

--GO


----J Barrett & Company (SSID=11)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_jbc_11_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_jbc_11_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_jbc_11_3'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_jbc_11_4'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

----William Raveis R.E. & Home Services (SSID=11)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_wr_11_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_wr_11_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--Century 21 North East (SSID=11)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21ne_11_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21ne_11_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

----Long Realty (SSID=2)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_lr_2_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_lr_2_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


----Century 21 Scheetz (SSID=9)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_c21s_9_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_c21s_9_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_c21s_9_3'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_c21s_9_4'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


--BHHS Utah Properties (SSID=13)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_13_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_13_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_13_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_13_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--BHHS Utah Properties (SSID=14)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_14_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_14_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_bhhsu_14_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--C21A (SSID=12)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_12_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_12_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_12_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_12_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21a_12_5'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

----RE/MAX Lakeside (SSID=1)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_rmls_1_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_rmls_1_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO


----RE/MAX Newport Elite (SSID=1)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_npe_1_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_npe_1_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_npe_1_3'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--Century 21 Everest (SSID=14)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_14_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_14_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_14_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_14_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


--Century 21 Everest (SSID=13)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_13_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_13_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_13_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_13_4'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_c21e_13_5'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--RE/MAX Results (SSID=12)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_rmr_12_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_rmr_12_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_rmr_12_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

--Stark (SSID=1)
declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_stark_1_1'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_stark_1_2'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO

declare @minv numeric(20,0),
@maxv numeric(20,0),
@minld real,
@maxld real,
@mindc numeric(20,0),
@maxdc numeric(20,0),
@minpc decimal(11,2),
@maxpc decimal(11,2),
@tname varchar(255),
@cname varchar(255),
@ss INT,
@roc bit,
@ibn bit,
@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

SET @tname='temp_push_stark_1_3'

SELECT @cname=MAX(Company)
FROM ReportParameters WHERE ReportName=@tname
SELECT @ss = MAX(SourceSystemID)
FROM ReportParameters WHERE ReportName=@tname
SELECT @minv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
SELECT @maxv = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
SELECT @minld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
SELECT @maxld = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
SELECT @mindc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
SELECT @maxdc = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
SELECT @minpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
SELECT @maxpc = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
SELECT @roc = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
SELECT @ibn = BitValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
SELECT @md = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
SELECT @minasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
SELECT @maxasp = NumericValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
SELECT @mins = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
SELECT @maxs = RealValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
SELECT @fr = TextValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
SELECT @minlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
SELECT @maxlsp = DecimalValue
FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

EXEC spCreatePushTable
		@table_name = @tname,
		@company = @cname,
		@ssid = @ss,
		@min_vol =@minv,
		@max_vol = @maxv,
		@max_lic_date = @maxld,
		@min_lic_date = @minld,
		@min_doll_change = @mindc,
		@max_doll_change = @maxdc,
		@min_pct_chng = @minpc,
		@max_pct_chng = @maxpc,
		@remove_own_company = @roc,
		@include_brand_new = @ibn,
		@max_distance = @md,
		@min_avg_sale_price = @minasp,
		@max_avg_sale_price = @maxasp,
		@min_sides = @mins,
		@max_sides = @maxs,
		@franchise = @fr,
		@min_list_side_pct = @minlsp,
		@max_list_side_pct = @maxlsp

GO


----Dream Town Realty (SSID=10)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_dtr_10_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_dtr_10_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

----Coach Real Estate Assoc Inc (SSID=6)
--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_crea_6_1'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO

--declare @minv numeric(20,0),
--@maxv numeric(20,0),
--@minld real,
--@maxld real,
--@mindc numeric(20,0),
--@maxdc numeric(20,0),
--@minpc decimal(11,2),
--@maxpc decimal(11,2),
--@tname varchar(255),
--@cname varchar(255),
--@ss INT,
--@roc bit,
--@ibn bit,
--@md real,@minasp numeric(20,0),@maxasp numeric(20,0),@mins real,@maxs real,@fr varchar(100),@minlsp decimal(11,2),@maxlsp decimal(11,2)

--SET @tname='temp_push_crea_6_2'

--SELECT @cname=MAX(Company)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @ss = MAX(SourceSystemID)
--FROM ReportParameters WHERE ReportName=@tname
--SELECT @minv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_vol'
--SELECT @maxv = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_vol'
--SELECT @minld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_lic_date'
--SELECT @maxld = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_lic_date'
--SELECT @mindc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_doll_change'
--SELECT @maxdc = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_doll_change'
--SELECT @minpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_pct_chng'
--SELECT @maxpc = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_pct_chng'
--SELECT @roc = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='remove_own_company'
--SELECT @ibn = BitValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='include_brand_new'
--SELECT @md = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_distance'
--SELECT @minasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_avg_sale_price'
--SELECT @maxasp = NumericValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_avg_sale_price'
--SELECT @mins = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_sides'
--SELECT @maxs = RealValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_sides'
--SELECT @fr = TextValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='franchise'
--SELECT @minlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='min_list_side_pct'
--SELECT @maxlsp = DecimalValue
--FROM ReportParameters WHERE ReportName=@tname AND ParamName='max_list_side_pct'

--EXEC spCreatePushTable
--		@table_name = @tname,
--		@company = @cname,
--		@ssid = @ss,
--		@min_vol =@minv,
--		@max_vol = @maxv,
--		@max_lic_date = @maxld,
--		@min_lic_date = @minld,
--		@min_doll_change = @mindc,
--		@max_doll_change = @maxdc,
--		@min_pct_chng = @minpc,
--		@max_pct_chng = @maxpc,
--		@remove_own_company = @roc,
--		@include_brand_new = @ibn,
--		@max_distance = @md,
--		@min_avg_sale_price = @minasp,
--		@max_avg_sale_price = @maxasp,
--		@min_sides = @mins,
--		@max_sides = @maxs,
--		@franchise = @fr,
--		@min_list_side_pct = @minlsp,
--		@max_list_side_pct = @maxlsp

--GO