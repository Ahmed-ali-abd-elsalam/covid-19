select *
from country_wise_latest
limit 10;

-- checking for nulls
-- no nulls
select *
from country_wise_latest
where "CountryRegion"IS NULL or
"Confirmed"IS NULL or
"Deaths"IS NULL or 
"Recovered"IS NULL or 
"Active"IS NULL or 
"New_cases"IS NULL or 
"New_deaths"IS NULL or 
"New_recovered"IS NULL or 
"Deaths__100_Cases"IS NULL or 
"Recovered__100_Cases"IS NULL or 
"Deaths__100_Recovered"IS NULL or 
"Confirmed_last_week"IS NULL or 
"one_week_change"IS NULL or 
"one_week__increase"IS NULL or 
"WHO_Region" IS NULL;

select "CountryRegion" ,"Active" , "Recovered" ,"Confirmed","Deaths"  from country_wise_latest
WHERE "CountryRegion" IN  ('United Kingdom','Netherlands','Spain','Sweden','France');
-----------------------------------------
select *
from covid_19_clean_complete
limit 10;

--  only province col has nulls
select *
from covid_19_clean_complete
where "ProvinceState" is null or 
"CountryRegion" is null or 
"Lat" is null or 
"Long" is null or 
"Date" is null or 
"Confirmed" is null or 
"Deaths" is null or 
"Recovered" is null or 
"Active" is null or 
"WHO_Region" is null;

alter TABLE covid_19_clean_complete
drop COLUMN "ProvinceState"

select 
from covid_19_clean_complete

-----------------------------------------
select *
from day_wise
limit 10;

-- no nulls
select *
from day_wise
where "Date"is null or
"Confirmed"is null or
"Deaths"is null or
"Recovered"is null or
"Active"is null or
"New_cases"is null or
"New_deaths"is null or
"New_recovered"is null or
"Deaths__100_Cases"is null or
"Recovered__100_Cases"is null or
"Deaths__100_Recovered"is null or
"No_of_countries" is null;



-----------------------------------------
select *
from full_grouped
limit 10;

select *
from full_grouped
where "Date"is null or
"CountryRegion"is null or
"Confirmed"is null or
"Deaths"is null or
"Recovered"is null or
"Active"is null or
"New_cases"is null or
"New_deaths"is null or
"New_recovered"is null or
"WHO_Region" is null;



-----------------------------------------
select *
from usa_county_wise
limit 10

-- only fips or admin 2 column for these states
select *
from usa_county_wise
where"UID"is null or
-- "iso2"is null or
-- "iso3"is null or
-- "code3"is null or
"FIPS"is null or
-- "Admin2"is null or
"Province_State"is null or
"Country_Region"is null or
"Lat"is null or
"Long_"is null or
-- "Combined_Key"is null or
"Date"is null or
"Confirmed"is null or
"Deaths" is null;

alter table usa_county_wise
drop column "Admin2",
drop column "iso2",
drop column"iso3",
drop column "code3",
drop COLUMN "Combined_Key";


UPDATE usa_county_wise
SET "FIPS" = ''
WHERE "FIPS" IS NULL

-----------------------------------------
select *
from worldometer_data
limit 10;


-- new cases ,new deaths , new recovered ,total death
-- they can be subed with zeros
select *
from worldometer_data
where "CountryRegion"is null or 
"Continent"is null or
"Population"is null or 
"TotalCases"is null or 
"NewCases"is null or 
"TotalDeaths"is null or 
"NewDeaths"is null or 
"TotalRecovered"is null or 
"NewRecovered"is null or 
"ActiveCases"is null or 
"SeriousCritical"is null or 
"Tot_Cases1M_pop"is null or 
"Deaths1M_pop"is null or 
"TotalTests"is null or 
"Tests1M_pop"is null or 
"WHO_Region" is null;



select "CountryRegion" ,"ActiveCases" , "TotalRecovered" ,"TotalCases","TotalDeaths"  from worldometer_data
WHERE "CountryRegion" IN  ('UK','Netherlands','Spain','Sweden','France');

select "CountryRegion" ,"ActiveCases" , "TotalRecovered" ,"TotalCases","TotalDeaths"
FROM worldometer_data
where "ActiveCases" is not null or "TotalRecovered" is not null ;
--  can't find the data of diamond princess
select * 
from full_grouped
where "CountryRegion" = 'Diamond Princess';

--  there is a total of 25 countries with an UNKNOWN who region and can't be figured out
update worldometer_data
set "WHO_Region" = coalesce(worldometer_data."WHO_Region",country_wise_latest."WHO_Region")
from country_wise_latest
where country_wise_latest."CountryRegion" = worldometer_data."CountryRegion";
-- fill null values in columns new cases , new recovered,new deaths, total deaths with zero as the covid 19 pandemic died out due to quarantines applied worldwide
update worldometer_data
set "NewCases" = coalesce("NewCases",0) ,"NewDeaths" = COALESCE("NewDeaths",0) , "NewRecovered"= coalesce("NewRecovered",0) , "TotalDeaths" = coalesce("TotalDeaths",0)
where "NewCases" is null or "NewDeaths" is null or "NewRecovered" is null or "TotalDeaths" is null;