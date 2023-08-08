-- ***************************************************
-- *******| MOVIES DATA ANALYSIS WITH MYSQL |*********
-- ***************************************************


-- 1: Select all Hollywood movies

SELECT * FROM movies
WHERE industry = "Hollywood";


-- 2: Select 3 Bollywood movies with highest IMDB Rating

SELECT * FROM movies
WHERE industry = "Bollywood"
ORDER BY imdb_rating DESC
LIMIT 3;


-- 3: Select 3 Hollywood movies with lowest IMDB Rating

SELECT * FROM movies
WHERE industry = "Hollywood"
ORDER BY imdb_rating
LIMIT 3;


-- 4: Select all Thor movies

SELECT * FROM movies
WHERE title LIKE "%Thor%";


-- 5: List movies released in year 2021 & 2022

SELECT * FROM movies
WHERE release_year >= 2020 AND release_year <= 2022
ORDER BY release_year;


-- 6: List total number of movies in Hollywood & Bollywood induatry

SELECT industry, COUNT(*) AS number_of_movies FROM movies
GROUP BY industry;


-- 7: List number of movies released in specific year

SELECT release_year, count(release_year) AS total_movies FROM movies
GROUP BY release_year
ORDER BY total_movies;


-- 8: List all movies having IMDB rating between 7 & 9

SELECT * FROM movies
WHERE imdb_rating BETWEEN "7" AND "9";


-- 9: List of all Bollywood movies with an imdb rating of at least 7 that were released between 2019 & 2022

SELECT * FROM movies
WHERE industry = "Bollywood" AND 
imdb_rating >= 7 AND
release_year BETWEEN "2019" AND "2022"
ORDER BY  imdb_rating DESC


-- 10: List studios with average IMDB rating (highest to lowest)

SELECT studio, ROUND(AVG(imdb_rating),2) AS average_imdb_rating FROM movies
GROUP BY studio
ORDER BY average_imdb_rating DESC;


-- 11: List Movies with Industry and their Budget, Revenue, Unit & Currency

SELECT m.movie_id, title, industry, budget, revenue, unit, currency
FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id;


-- 12: List all movies with highest to lowest profit in millions

SELECT m.movie_id, title, industry, budget, revenue, unit, currency,

CASE
	WHEN unit = "Billion" THEN (revenue-budget)*1000
    WHEN unit = "Thousands" THEN (revenue-budget)/1000
    ELSE (revenue-budget)
END AS profit_in_millions    

FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id
ORDER BY profit_in_millions DESC;


-- 13: List number of movies in specific language

SELECT l.name, COUNT(*) AS number_of_movies
FROM languages l
JOIN movies m
ON l.language_id = m.language_id
GROUP BY m.language_id
ORDER BY number_of_movies;


-- 14: Calculate the age of movie actors

SELECT name, YEAR(CURDATE())-birth_year AS age
FROM actors
ORDER BY age;


-- 15: List all movie actors with number of movies they act in

SELECT a.name, COUNT(*) AS number_of_movies
FROM actors a
JOIN movie_actor m
ON a.actor_id = m.actor_id
GROUP BY m.actor_id
ORDER BY number_of_movies DESC;