CREATE DATABASE NDS_Group01
GO
USE NDS_Group01
GO

DROP TABLE AIR_QUALITY_NDS
DROP TABLE COUNTY_NDS
DROP TABLE STATE_NDS

-- Tạo table lưu NDS
CREATE TABLE NDS_Group01.dbo.STATE_NDS (
	state_id_sk int PRIMARY KEY identity(1, 1),
	state_id nvarchar(5) null,
	state_code int null,
	state_name nvarchar(50) null,
	created datetime null,
	last_updated datetime null,
	source_id int null
)
GO

CREATE TABLE NDS_Group01.dbo.COUNTY_NDS (
	county_id_sk int PRIMARY KEY identity(1, 1),
	county_code int null,
	county_name nvarchar(50) null,
	county_ascii nvarchar(50) null,
	county_full nvarchar(50) null,
	county_fips nvarchar(10) null,
	state_id_sk int null,
	lat nvarchar(10) null,
	lng nvarchar(15) null,
	population nvarchar(10) null,
	created datetime null,
	last_updated datetime null,
	source_id int null,
	CONSTRAINT fk_state_code_sk FOREIGN KEY (state_id_sk) REFERENCES STATE_NDS (state_id_sk)
)
GO

CREATE TABLE NDS_Group01.dbo.AIR_QUALITY_NDS (
	air_quality_id_sk int PRIMARY KEY identity(1, 1),
	county_id_sk int null,
	date_recorded datetime null,
	aqi int null,
	category varchar(50) null,
	defining_parameter varchar(50) null,
	defining_site varchar(50) null,
	number_of_sites_reporting int null,
	created datetime null,
	last_updated datetime null,
	source_id int null,
	CONSTRAINT fk_county_code_sk FOREIGN KEY (county_id_sk) REFERENCES COUNTY_NDS (county_id_sk)
)

SELECT* FROM STATE_NDS
SELECT* FROM COUNTY_NDS WHERE state_id_sk = 3
SELECT* FROM AIR_QUALITY_NDS A JOIN COUNTY_NDS C ON A.county_id_sk = C.county_id_sk WHERE state_id_sk = 3
GO


SELECT DISTINCT COUNT(*) FROM STATE_NDS
SELECT DISTINCT COUNT(*) FROM COUNTY_NDS
SELECT DISTINCT COUNT(*) FROM AIR_QUALITY_NDS
GO

