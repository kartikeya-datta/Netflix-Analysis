DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix(
	show_id	VARCHAR(8),
	type VARCHAR(10),
	title VARCHAR(150),
	director VARCHAR(208),
	casts  VARCHAR(1000),	
	country	VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,	
	rating VARCHAR(10),	
	duration VARCHAR(15),	
	listed_in VARCHAR(100),	
	description VARCHAR(250)
);

SELECT * FROM 	netflix;
-- total columns
SELECT 
	COUNT(*) AS total_content
FROM netflix;
-- total columns in type
SELECT 
	COUNT(type) AS  total_type
FROM netflix;

--Distinct values of column
SELECT 
	DISTINCT type
FROM netflix;

--NULL VALUES OF A COLUMNS
SELECT casts, title
FROM netflix
WHERE casts IS NULL;

-- Count number of tv shows vs movie
SELECT type, COUNT(type) as movie_count
FROM netflix
GROUP BY type;

-- Common ratings for tvshows and movies
SELECT type, COUNT(type) as rd,rating
FROM netflix
GROUP BY type,rating
ORDER BY rd DESC;

-- List the movies released in 2020
SELECT * FROM netflix
WHERE type='Movie' AND release_year=2020;

-- Top 5 countires which has most content in netflix
SELECT country,COUNT(*) as con_count FROM netflix
GROUP BY country
ORDER BY con_count DESC;

-- since we have mutliple countries clubbed together we will change it to individual using array
SELECT STRING_TO_ARRAY(country,',') as new_country
FROM netflix

-- expands the countries into separate rows for better normalization
SELECT UNNEST(STRING_TO_ARRAY(country,',')) as new_country
FROM netflix;

-- Identify the top 5 most frequent production countries in the netflix dataset
SELECT UNNEST(STRING_TO_ARRAY(country,',')) as new_country , COUNT(*) AS new_count
FROM netflix
GROUP BY new_country
ORDER BY new_count DESC
LIMIT 5;

-- Identify the longest movie in the dataset
SELECT title, duration
FROM netflix
WHERE type = 'Movie'
ORDER BY CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INT) DESC
LIMIT 1;

-- Find content added in the last 5 years
SELECT  CAST(RIGHT(date_added, 4) AS INT)  AS years FROM netflix
WHERE  CAST(RIGHT(date_added, 4) AS INT)  >= 2019;

-- gives years greathan we give
SELECT * FROM netflix
WHERE  TO_DATE(date_added,'Month DD,YYYY') >= CURRENT_DATE - INTERVAL'5 years'

-- ALL movies directed by Yoshiyuki Tomino
SELECT* FROM netflix
WHERE  director LIKE'%Rajiv Chilaka%'
SELECT* FROM netflix
WHERE  director LIKE'%Marcus Raboy%'
SELECT* FROM netflix
WHERE  director ILIKE'%Yoshiyuki Tomino%';

--  list directors and counts how many movies or shows they have directed
SELECT director, COUNT(*) AS SUJ FROM netflix
GROUP BY director
ORDER BY SUJ DESC;

-- all tv showsmore than 5 seasons
SELECT*FROM netflix
WHERE type='TV Show' AND CAST(SPLIT_PART(duration, ' ' ,1) AS INT) >=5;

-- count number of content items in each gerne
SELECT  UNNEST(STRING_TO_ARRAY(listed_in,',')) as gerne, COUNT(show_id)
FROM netflix
GROUP BY gerne;

-- Find each year and average number of content released in India
SELECT
		EXTRACT(YEAR FROM(TO_DATE(date_added,'Month,DD,YYYY'))) AS years,
		COUNT(*),
		ROUND(COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country='India')::numeric*100,2) AS avg_content
FROM netflix
WHERE country ILIKE'%India%'
GROUP BY years
ORDER BY avg_content DESC;

-- List all movies that are documentary
SELECT* FROM netflix
WHERE type='Movie' and listed_in ILIKE'%Documentaries%'

-- List all content with out dierector
SELECT*FROM netflix
WHERE director IS NULL

-- How many movies actor John Cleese appeared in last 10 years
SELECT UNNEST(STRING_TO_ARRAY(casts,',')) AS CRUE,COUNT(*) AS cnt FROM netflix
GROUP BY CRUE
ORDER BY cnt  DESC