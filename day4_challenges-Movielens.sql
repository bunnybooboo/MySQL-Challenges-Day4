USE movielens;
-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
-- select the correct table
SELECT * FROM movies;
-- titles and release dates
SELECT title, release_date FROM movies 
WHERE release_date BETWEEN "1983-01-01" and "1993-12-31" 
ORDER BY release_date DESC;

-- Without using LIMIT, list the titles of the movies with the lowest average rating.
-- join movies with rating on movie_id
SELECT title, rating FROM movies
JOIN ratings ON movies.id = ratings.movie_id
-- this next line breaks to group order - not yet sure how to resolve
WHERE rating < AVG(rating)
ORDER BY title ASC;


-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.



-- List the unique titles of each of the movies released on the most popular release day.



-- Find the total number of movies in each genre; list the results in ascending numeric order.


