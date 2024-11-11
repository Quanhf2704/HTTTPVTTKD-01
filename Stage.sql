CREATE DATABASE Stage_Group01
GO
USE Stage_Group01
GO

--DROP TABLE STATE_AQI_STAGE
--DROP TABLE USCOUNTIES_STAGE

-- Tạo table lưu Stage
CREATE TABLE STATE_AQI_STAGE (
	ID int not null identity(1, 1),
	state_name varchar(50) null,
	county_name varchar(50) null,
	state_code int null,
	county_code int null,
	date_recorded datetime null,
	AQI int null,
	category varchar(50) null,
	defining_parameter varchar(50) null,
	defining_site varchar(50) null,
	number_of_sites_reporting int null,
	created datetime null,
	last_updated datetime null
)
GO

CREATE TABLE USCOUNTIES_STAGE (
	ID int not null identity(1, 1),
	county nvarchar(50) null,
	county_ascii nvarchar(50) null,
	county_full nvarchar(50) null,
	county_fips nvarchar(10) null,
	state_id nvarchar(5) null,
	state_name nvarchar(50) null,
	lat nvarchar(10) null,
	lng nvarchar(15) null,
	population nvarchar(10) null
)
GO

SELECT* FROM STATE_AQI_STAGE order by county_code, state_code WHERE state_name = 'Alaska' ORDER BY county_name
SELECT DISTINCT state_name, county_name FROM STATE_AQI_STAGE WHERE county_name = 'Juneau' ORDER BY county_name

SELECT* FROM USCOUNTIES_STAGE -- 3144
GO
SELECT COUNT (DISTINCT state_code) FROM STATE_AQI_STAGE --21
SELECT* FROM STATE_AQI_STAGE SAS, USCOUNTIES_STAGE US WHERE SAS.county_name = US.county AND SAS.state_name = US.state_name

SELECT COUNT(DISTINCT state_name) FROM STATE_AQI_STAGE --21
SELECT COUNT(DISTINCT state_name), COUNT(DISTINCT state_id) FROM USCOUNTIES_STAGE --51
GO

SELECT DISTINCT state_name FROM STATE_AQI_STAGE ORDER BY state_name
SELECT DISTINCT state_name, county FROM USCOUNTIES_STAGE ORDER BY state_name

SELECT DISTINCT US.state_name FROM USCOUNTIES_STAGE US
SELECT DISTINCT SAS.state_name FROM STATE_AQI_STAGE SAS

GO
SELECT DISTINCT US.state_id, US.state_name, SAS.state_code FROM STATE_AQI_STAGE SAS, USCOUNTIES_STAGE US WHERE SAS.state_name = US.state_name

SELECT DISTINCT SAS.county_code, SAS.county_name FROM STATE_AQI_STAGE SAS
GO

SELECT DISTINCT SAS.county_code, US.county FROM STATE_AQI_STAGE SAS, USCOUNTIES_STAGE US WHERE SAS.county_name = US.county
GO

SELECT DISTINCT county, state_id FROM USCOUNTIES_STAGE -- 3138
SELECT DISTINCT county, state_id, county_fips
	FROM USCOUNTIES_STAGE
	ORDER BY county, state_id -- 3144

SELECT DISTINCT county_code, state_code FROM STATE_AQI_STAGE
SELECT DISTINCT county FROM USCOUNTIES_STAGE
GO