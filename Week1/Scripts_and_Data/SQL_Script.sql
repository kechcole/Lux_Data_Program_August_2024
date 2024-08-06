-- Part 2. Using SQL.  

--------------------------------------------------------
-- Create table in databses and import data 
---------------------------------------------------------
-- Create table in database
CREATE TABLE IF NOT EXISTS "public".weather
(
    "date" character varying(30),
    "temprature" float,
    dew_temp float,
    rel_hum integer,
    wind_speed integer,
    visibility float,
    pressure float,
    weather character varying(50)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "public".weather
    OWNER to postgres;

COMMENT ON TABLE "public".weather
    IS 'contains sample weather data';
	
	
	
-- Import data 
COPY "public".weather FROM 
'F:\Programs\Dev_Program July-August 2024\Week 1\Project\1. Weather Data.csv'
with csv header;



---------------------------------------------------------
----Questions
---------------------------------------------------------

-- 1. Find all records where the weather was exactly clear.
SELECT * FROM "public".weather
WHERE weather = 'Clear';   


-- 2. Find the number of times the wind speed was exactly 4 km/hr.
SELECT COUNT(*) FROM "public".weather
WHERE wind_speed = 4;


-- 3. Check if there are any NULL values present in the dataset. 
SELECT * FROM "public".weather
WHERE date IS NULL OR temprature IS NULL OR dew_temp IS NULL OR
rel_hum IS NULL OR wind_speed IS NULL OR visibility IS NULL;


-- 4. Rename the column "Weather" to "Weather_Condition."
ALTER TABLE "public".weather 
RENAME COLUMN weather_conditions TO weather;


-- 5. What is the mean visibility of the dataset?
SELECT AVG(visibility) FROM "public".weather ;


-- 6. Find the number of records where the wind speed is greater than 24 km/hr 
-- and visibility is equal to 25 km.
SELECT COUNT(*) FROM "public".weather 
WHERE wind_speed > 24 AND visibility = 25;


-- 7. What is the mean value of each column for each weather condition?
SELECT 
    AVG(temprature) AS mean_temp,
    AVG(dew_temp) AS mean_dewtemp,
    AVG(rel_hum) AS mean_humidity,
	AVG(wind_speed) AS mean_windspeed,
	AVG(visibility) AS mean_visibility,
	AVG(pressure) AS mean_pressure
FROM "public".weather;


-- 8. Find all instances where the weather is clear and the 
-- relative humidity is greater than 50, or visibility is above 40.
SELECT COUNT(*) FROM "public".weather 
WHERE weather = 'Clear' AND rel_hum > 50;


-- 9. Find the number of weather conditions that include snow.
SELECT COUNT(*) FROM "public".weather 
WHERE weather = 'Snow';






