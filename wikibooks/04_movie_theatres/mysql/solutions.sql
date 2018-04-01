-- 1. Select the title of all movies.
SELECT Title FROM Movies;

-- 2. Show all the distinct ratings in the database.
SELECT DISTINCT Rating FROM Movies;

-- 3. Show all unrated movies.
SELECT * FROM Movies WHERE Rating IS NULL;

-- 4. Select all movie theaters that are not currently showing a movie.
SELECT * FROM MovieTheaters WHERE Movie IS NULL;

-- 5. Select all data from all movie theaters and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * FROM MovieTheaters mt LEFT JOIN Movies m ON mt.Movie = m.Code;

-- 6. Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM Movies m LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie;

-- 7. Show the titles of movies not currently being shown in any theaters.
SELECT Title FROM Movies m LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie WHERE mt.Movie IS NULL;
SELECT Title FROM Movies WHERE Code NOT IN (
    SELECT Movie FROM MovieTheaters
    WHERE Movie IS NOT NULL);

-- 8. Add the unrated movie "One, Two, Three".
INSERT INTO Movies (Title) VALUES ('One, Two, Three');
INSERT INTO Movies (Title, Rating) VALUES ('One, Two, Three', NULL);

-- 9. Set the rating of all unrated movies to "G".
UPDATE Movies SET Rating = 'G' WHERE Rating IS NULL;

-- 10. Remove movie theaters projecting movies rated "NC-17".
DELETE FROM MovieTheaters WHERE Movie IN
  (SELECT Code FROM Movies WHERE Rating = 'NC-17')

