USE SQL_day4;

-- 4.1 Select the title of all movies
SELECT Title
FROM Movies;

-- 4.2 Show all the distinct ratings in the database
SELECT *
FROM Movies;

SELECT DISTINCT Rating
FROM Movies;

-- 4.3  Show all unrated movies
SELECT Title, Rating
FROM Movies
WHERE Rating IS NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie
SELECT *
FROM MovieTheaters MT
LEFT JOIN Movies M
	ON MT.Movie = M.Code
WHERE Movie IS NULL;
    
-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown)
SELECT *
FROM MovieTheaters;

SELECT *
FROM MovieTheaters MT
LEFT JOIN Movies M
	ON MT.Movie = M.Code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater
-- JOIN (INNER JOIN) 
SELECT *
FROM Movies M
JOIN MovieTheaters MT
	ON M.Code = MT.Movie;

-- LEFT JOIN
SELECT *
FROM Movies M
LEFT JOIN MovieTheaters MT
	ON M.Code = MT.Movie;
-- WHERE MT.Movie IS NOT NULL;

-- RIGHT JOIN
SELECT *
FROM Movies M
RIGHT JOIN MovieTheaters MT
	ON M.Code = MT.Movie;
-- WHERE MT.Movie IS NOT NULL;

-- RIGHT JOIN(2nd option)
SELECT *
FROM MovieTheaters MT 
RIGHT JOIN Movies M
		ON MT.Movie = M.Code;
        
-- 4.7 Show the titles of movies not currently being shown in any theaters
SELECT M.Title
FROM MovieTheaters MT
RIGHT JOIN Movies M
	ON MT.Movie = M.Code
WHERE MT.Movie IS NULL;

-- 4.8 Add the unrated movie "One, Two, Three"
INSERT INTO Movies(Code,Title,Rating) VALUES(9,'One, Two, Three',NULL);

-- 4.9 Set the rating of all unrated movies to "G"
UPDATE Movies SET Rating='G' WHERE Rating IS NULL;

-- 4.10 Remove movie theaters projecting movies rated "NC-17"
SELECT *
FROM MovieTheaters MT
JOIN Movies M
	ON MT.Movie = M.Code
WHERE Rating != 'NC-17' OR Rating IS NULL;