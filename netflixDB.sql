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

-- 1 count number of tv shows vs movie
SELECT type, COUNT(type) as movie_count
FROM netflix
GROUP BY type;
