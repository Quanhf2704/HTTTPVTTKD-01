CREATE DATABASE DDS_Group01
GO
USE DDS_Group01
GO

DROP TABLE FACT_AQI
DROP TABLE DIM_LOCATION
DROP TABLE DIM_CATEGORY
DROP TABLE DIM_DEFINING_PARAMETER
DROP TABLE DIM_DATE
GO

CREATE TABLE DDS_Group01.dbo.DIM_LOCATION (
	location_id_sk int PRIMARY KEY identity(1, 1),
	county_id_sk int,
	county_code int null,
	county_name nvarchar(50) null,
	county_ascii nvarchar(50) null,
	county_full nvarchar(50) null,
	county_fips nvarchar(10) null,
	lat nvarchar(10) null,
	lng nvarchar(15) null,
	population nvarchar(10) null,
	state_id nvarchar(5) null,
	state_code int null,
	state_name nvarchar(50) null,
	number_of_sites_reporting int null,
	created datetime null,
	last_updated datetime null,
	source_id int null
)
GO

CREATE TABLE DDS_Group01.dbo.DIM_CATEGORY (
	category_id_sk int PRIMARY KEY identity(1, 1),
	category_name nvarchar(50) null,
	created datetime null,
	last_updated datetime null,
	source_id int null,
)
GO

CREATE TABLE DDS_Group01.dbo.DIM_DEFINING_PARAMETER (
	defining_parameter_id_sk int PRIMARY KEY identity(1, 1),
	defining_parameter nvarchar(50) null,
	created datetime null,
	last_updated datetime null,
	source_id int null,
)
GO

CREATE TABLE DDS_Group01.dbo.DIM_DATE (
	date_id int PRIMARY KEY identity(1, 1),
	day int null,
	month int null,
	quarter int null,
	year int null,
	day_light_saving bit null,
	created datetime null,
	last_updated datetime null,
)
GO

CREATE TABLE DDS_Group01.dbo.FACT_AQI (
	location_id_sk int,
	defining_parameter_id_sk int,
	category_id_sk int,
	date_id int,
	defining_site nvarchar(50) null,
	aqi int null,
	min_aqi int null,
	max_aqi int null,
	mean_aqi float null,
	std_aqi float null,
	created datetime null,
	last_updated datetime null,

	CONSTRAINT fk_date_id FOREIGN KEY (date_id) REFERENCES DIM_DATE (date_id),
	CONSTRAINT fk_location_id_sk FOREIGN KEY (location_id_sk) REFERENCES DIM_LOCATION (location_id_sk),
	CONSTRAINT fk_defining_parameter_id_sk FOREIGN KEY (defining_parameter_id_sk) REFERENCES DIM_DEFINING_PARAMETER (defining_parameter_id_sk),
	CONSTRAINT fk_category_id_sk FOREIGN KEY (category_id_sk) REFERENCES DIM_CATEGORY (category_id_sk),

)
GO

SELECT * FROM DIM_DATE
SELECT * FROM DIM_LOCATION 
SELECT * FROM DIM_CATEGORY
SELECT * FROM DIM_DEFINING_PARAMETER
SELECT * FROM FACT_AQI 

GO 

SELECT COUNT(*) FROM DIM_DATE 
SELECT COUNT(*) FROM DIM_LOCATION
SELECT COUNT(*) FROM DIM_CATEGORY
SELECT COUNT(*) FROM DIM_DEFINING_PARAMETER
SELECT COUNT(*) FROM FACT_AQI 