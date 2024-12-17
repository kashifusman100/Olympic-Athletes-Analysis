---------------------------------------
--Cleaning & transoforming the dataset

--removing " from columns
UPDATE dbo.athlete_events_1
SET Medal = REPLACE(Medal, '"', '')


--merging columns
UPDATE dbo.athlete_events
SET Games = Year + ' ' + Season;

--checking data types
SELECT name, type_name(system_type_id) AS data_type
FROM sys.columns
WHERE object_id = OBJECT_ID('dbo.athlete_events_1')


--Updating values of NA
UPDATE dbo.athlete_events_1
SET Weight = 70
WHERE ISNUMERIC(Weight) = 0;


UPDATE dbo.athlete_events_1
SET Height = 172
WHERE Height = 29;


--to check if it contains values other than numbers
SELECT *
FROM dbo.athlete_events_1
WHERE Height NOT LIKE '%[0-9]%';


--Changing data types
ALTER TABLE dbo.athlete_events_1
ALTER COLUMN Year INT;


--Filtering on a criteria
SELECT DISTINCT Name
FROM dbo.athlete_events
WHERE Name LIKE '%[0-9]%' OR Name LIKE '%[^a-zA-Z ]%';

SELECT COUNT(*) AS NA_Count
FROM dbo.athlete_events
WHERE Age = 'NA'

--Updating NA values
UPDATE dbo.athlete_events
SET Age = 30
WHERE Age = 'NA';

--Finding & updating un related entries
SELECT Sex, Medal
FROM dbo.athlete_events
WHERE Sex NOT IN ('M', 'F');

UPDATE dbo.athlete_events_1
SET Sex = 'M'
WHERE Sex NOT IN ('M', 'F');


--Updating values
UPDATE dbo.athlete_events
SET Sex = CASE
               WHEN Sex NOT IN ('M', 'F') THEN 'M'
               ELSE Sex
            END
WHERE Sex NOT IN ('M', 'F');


--Updating NA values
UPDATE dbo.athlete_events
SET Height = 162
WHERE TRY_CAST(Height AS INT) IS NULL OR TRY_CAST(Height AS INT) > 120;



SELECT *
FROM dbo.athlete_events_1

--Updating team column with correct team neam from NOC column if it contain other than text values
UPDATE dbo.athlete_events_1
SET Team = NOC
WHERE Team LIKE '%[^a-zA-Z ]%';


--Updating coutries with short names
UPDATE dbo.athlete_events_1
SET NOC = REPLACE(NOC, 'Great Britain', 'GBR')


--Updating Games value with Year value if it is not mixture of text and number. Because I found out the pattern in these 2 columsn that if the first column has a wrong value then the correct value is pushed to the next column
UPDATE dbo.athlete_events_1
SET Games = CAST(Year AS VARCHAR)
WHERE Games NOT LIKE '%[a-zA-Z]%' OR Games NOT LIKE '%[0-9]%';


--Same approach I am using here but condition is for numbers only
UPDATE dbo.athlete_events_1
SET Year = Season
WHERE TRY_CAST(Year AS INT) IS NULL;


-- Same above approach for this
UPDATE dbo.athlete_events_1
SET Season = City
WHERE Season NOT IN ('Winter', 'Summer');


-- Replacing Summer & Winter values with sport values because there is a pattern of pushed values as I described earlier
UPDATE dbo.athlete_events_1
SET City = Sport
WHERE City IN ('Summer', 'Winter');


--Replacing the wrong values
UPDATE dbo.athlete_events_1
SET Sport = Event
WHERE Sport IN (
    'Athens', 'Paris', 'St. Louis', 'London', 'Stockholm', 'Antwerp', 'Los Angeles', 'Berlin', 'Helsinki', 
    'Melbourne', 'Rome', 'Tokyo', 'Mexico City', 'Munich', 'Montreal', 'Moscow', 'Seoul', 'Barcelona', 
    'Atlanta', 'Sydney', 'Beijing', 'Rio de Janeiro', 'Chamonix', 'St. Moritz', 'Lake Placid', 
    'Garmisch-Partenkirchen', 'Oslo', 'Cortinad','Ampezzo', 'Squaw Valley', 'Innsbruck', 'Grenoble', 
    'Sapporo', 'Sarajevo', 'Calgary', 'Albertville', 'Lillehammer', 'Nagano', 'Salt Lake City', 
    'Turin', 'Vancouver', 'Sochi', 'Pyeongchang', 'Beijing'
);


--Removing text from column
UPDATE dbo.athlete_events_1
SET Year = LEFT(Year, PATINDEX('%[^0-9]%', Year + ' ') - 1)
WHERE PATINDEX('%[^0-9]%', Year) > 0;


--Checking for the events which has only one word
SELECT *
FROM dbo.athlete_events_1
WHERE Event NOT LIKE '% %';


-- Replacing NOC values with Team if it contains wrong values
UPDATE dbo.athlete_events_1
SET Team = NOC
WHERE Team LIKE '%NA%' OR Team LIKE '%[0-9]%';


-- Adjusting values on the basis of a specific pattern
UPDATE dbo.athlete_events_1
SET Team = Games
WHERE TRY_CAST(Team AS INT) IS NOT NULL;

--Checking NOC values which are wrong (numbers)
SELECT *
FROM dbo.athlete_events_1
WHERE TRY_CAST(NOC AS INT) IS NOT NULL;


-- Adjusting values
UPDATE dbo.athlete_events_1
SET NOC = Games
WHERE TRY_CAST(NOC AS INT) IS NOT NULL;


--Combining 2 columns
UPDATE dbo.athlete_events_1
SET Games = Season + ' ' + CAST(Year AS VARCHAR)


-- Updating column values based on a pattern
UPDATE dbo.athlete_events_1
SET Event = Medal
WHERE LEN(Event) = LEN(REPLACE(Event, ' ', ''))

--Checking count of medals
SELECT Medal
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze');


--Replacing Na and other non related values as no medal
UPDATE dbo.athlete_events_1
SET Medal = CASE 
                WHEN Medal NOT IN ('Gold', 'Silver', 'Bronze') THEN 'No Medal'
                ELSE Medal
            END;


--Replacing short names with full name for better visualizatoin in charts
UPDATE dbo.athlete_events_1
SET Team = CASE 
                WHEN Team = 'TUR' THEN 'Turkey'
                WHEN Team = 'USA' THEN 'United States'
                WHEN Team = 'GER' THEN 'Germany'
                WHEN Team = 'FRA' THEN 'France'
                WHEN Team = 'ITA' THEN 'Italy'
                WHEN Team = 'ESP' THEN 'Spain'
                WHEN Team = 'ARG' THEN 'Argentina'
                WHEN Team = 'BRA' THEN 'Brazil'
                WHEN Team = 'CAN' THEN 'Canada'
                WHEN Team = 'AUS' THEN 'Australia'
                WHEN Team = 'GBR' THEN 'United Kingdom'
                WHEN Team = 'NED' THEN 'Netherlands'
                WHEN Team = 'BEL' THEN 'Belgium'
                WHEN Team = 'RUS' THEN 'Russia'
                WHEN Team = 'CHN' THEN 'China'
                WHEN Team = 'JPN' THEN 'Japan'
                WHEN Team = 'IND' THEN 'India'
                WHEN Team = 'KOR' THEN 'South Korea'
                WHEN Team = 'MEX' THEN 'Mexico'
                WHEN Team = 'SWE' THEN 'Sweden'
                WHEN Team = 'SUI' THEN 'Switzerland'
                WHEN Team = 'POL' THEN 'Poland'
                WHEN Team = 'DEN' THEN 'Denmark'
                WHEN Team = 'NOR' THEN 'Norway'
                WHEN Team = 'FIN' THEN 'Finland'
                WHEN Team = 'GRE' THEN 'Greece'
                WHEN Team = 'PRT' THEN 'Portugal'
                WHEN Team = 'AUT' THEN 'Austria'
                WHEN Team = 'CZE' THEN 'Czech Republic'
                WHEN Team = 'HUN' THEN 'Hungary'
                WHEN Team = 'SLO' THEN 'Slovakia'
                WHEN Team = 'CRO' THEN 'Croatia'
                WHEN Team = 'UKR' THEN 'Ukraine'
                WHEN Team = 'ROU' THEN 'Romania'
                WHEN Team = 'TUN' THEN 'Tunisia'
                WHEN Team = 'EGY' THEN 'Egypt'
                WHEN Team = 'KEN' THEN 'Kenya'
                WHEN Team = 'ETH' THEN 'Ethiopia'
                WHEN Team = 'UGA' THEN 'Uganda'
                WHEN Team = 'ZAF' THEN 'South Africa'
                WHEN Team = 'MAR' THEN 'Morocco'
                WHEN Team = 'VNM' THEN 'Vietnam'
                WHEN Team = 'PHL' THEN 'Philippines'
                WHEN Team = 'SGP' THEN 'Singapore'
                WHEN Team = 'THA' THEN 'Thailand'
                WHEN Team = 'MYS' THEN 'Malaysia'
                WHEN Team = 'KAZ' THEN 'Kazakhstan'
                WHEN Team = 'UZB' THEN 'Uzbekistan'
                WHEN Team = 'QAT' THEN 'Qatar'
                WHEN Team = 'BHR' THEN 'Bahrain'
                WHEN Team = 'ARE' THEN 'United Arab Emirates'
                WHEN Team = 'OMN' THEN 'Oman'
                WHEN Team = 'KWT' THEN 'Kuwait'
                WHEN Team = 'LBN' THEN 'Lebanon'
                WHEN Team = 'IRQ' THEN 'Iraq'
                WHEN Team = 'SYR' THEN 'Syria'
                WHEN Team = 'YEM' THEN 'Yemen'
                WHEN Team = 'JOR' THEN 'Jordan'
                WHEN Team = 'ISL' THEN 'Iceland'
                WHEN Team = 'LKA' THEN 'Sri Lanka'
                WHEN Team = 'MDV' THEN 'Maldives'
                WHEN Team = 'BLR' THEN 'Belarus'
                WHEN Team = 'BUL' THEN 'Bulgaria'
                WHEN Team = 'ARM' THEN 'Armenia'
                WHEN Team = 'GEO' THEN 'Georgia'
                WHEN Team = 'AZE' THEN 'Azerbaijan'
                ELSE Team
            END;

---------------------------------------------------------------------------------------

--General Analysis

--Count of athletes in each oylympics

SELECT COUNT(DISTINCT CONCAT(Name, '_', Year)) AS Count_of_Athletes, Year AS Olympics_Year, Season
FROM dbo.athlete_events_1
GROUP BY  Season, Year
ORDER BY Olympics_Year

DELETE FROM dbo.athlete_events_1
WHERE Year = 0;

UPDATE dbo.athlete_events_1
SET Season = Sport
WHERE ISNUMERIC(season) = 1;

SELECT AVG(Age) AS AvgAge, CAST(ROUND(AVG(Weight), 1) AS DECIMAL(10, 1)) AS AvgWeight, AVG(Height) AS AvgHeight, Sport, Sex
FROM dbo.athlete_events_1
GROUP BY Sport, Sex
ORDER BY Sport


---------------------------------------------------------------------------------------

--Medal Analysis

--Countries with most medals
SELECT Team As Country, Count(Medal) As Medals
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Team
ORDER BY Medals DESC


--Top 10 athletes with the most medals
SELECT TOP 10 Name, Count(Medal) AS Total_Medals
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Name
ORDER BY Total_Medals DESC


--Medal distribution across different sports and events
SELECT Sport, Year, COUNT(Medal) As Total_Medals
FROM dbo.athlete_events_1
GROUP BY Sport, Year


------------------------------------------------------------

--Trend Analysis

--How has the number of participants changed over the years?
SELECT Year, COUNT(DISTINCT CONCAT(Name, '_', Year)) AS Count_of_Athletes
FROM dbo.athlete_events_1
GROUP BY Year
ORDER BY Year



------------------------------------------------------------

--Gender Analysis


--male to female ratio of participants for each season

SELECT COUNT(*) As Total_Participants, Sex, Year, CAST(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Year), 2) AS DECIMAL(5, 2)) AS Percentage
FROM dbo.athlete_events_1
GROUP BY Sex, Year
ORDER BY Year


--medal-winning ratio compare between male and female athletes

SELECT Sex, COUNT(*) AS Medal_Wins, CAST(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS DECIMAL(5, 2)) AS Percentage
FROM  dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Sex
ORDER BY Medal_Wins DESC


---------------------------------------------------------------------

--Event specific Analysis:

--top 5 most competitive sports based on the number of participants

SELECT TOP 5 COUNT(DISTINCT CONCAT(ID, '_', Year)) AS Count_of_Athletes, Sport
FROM dbo.athlete_events_1
GROUP BY Sport
ORDER BY Count_of_Athletes DESC


--Analyze the average age and physical attributes (height/weight) of atheletes by sport

SELECT Sport, AVG(Age) As Avg_Age, AVG(Height) As Avg_Height, CAST(ROUND(AVG(Weight),1) AS Decimal (5,1)) As Avg_Weight
FROM dbo.athlete_events_1
GROUP BY Sport


----------------------------------------------------------

--Location & Host Analysis:


--Which cities have hosted the Olympics the most, and in which years?

SELECT City, COUNT(DISTINCT Year) AS Hosting_Count
FROM dbo.athlete_events_1
GROUP BY City
ORDER BY Hosting_Count DESC;


--Cities who handed the most medals
SELECT Count(Medal) As Medal_Count, City
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY City
ORDER BY Medal_Count DESC

------------------------------------------------------
--Record Breaking Insights

--Which athletes has participated in the most Olympics?

SELECT TOP 10 COUNT(DISTINCT Year) AS Olympics_Participation, Name
FROM dbo.athlete_events_1
GROUP BY Name
ORDER BY Olympics_Participation DESC


--What is the youngest and oldest age of medal winners?

SELECT MIN(Age) As Youngest_Medal_Winner, MAX(Age) AS Oldest_Medal_Winner
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')


------------------------------------------------------------
--NOC Analysis

--How many athletes represented each National Olympic Committee (NOC)?

SELECT NOC, COUNT(DISTINCT Name) AS No_of_Athletes
FROM dbo.athlete_events_1
GROUP BY NOC
ORDER BY No_of_Athletes DESC;


--Which NOCs have produced the highest number of medalists?
SELECT NOC, COUNT(DISTINCT Name) AS No_of_Athletes
FROM dbo.athlete_events_1
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY NOC
ORDER BY No_of_Athletes DESC



SELECT *
FROM dbo.athlete_events_1




