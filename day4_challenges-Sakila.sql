USE sakila;
-- List all actors.
SELECT first_name, last_name 
FROM actor;

-- Find the surname of the actor with the forename 'John'.
SELECT last_name 
FROM actor WHERE first_name = "JOHN";

-- Find all actors with surname 'Neeson'.
SELECT first_name, last_name 
FROM actor WHERE last_name = "NEESON";

-- Find all actors with ID numbers divisible by 10.
-- solution uses MODULO
SELECT actor_id, first_name, last_name 
FROM actor WHERE actor_id % 10=0;

-- What is the description of the movie with an ID of 100?
-- select correct table
SELECT * FROM film;
-- solution
SELECT description FROM film WHERE film_id = 100;

-- Find every R-rated movie.
-- select correct table
SELECT * FROM film;
-- select film rating R
SELECT * FROM film WHERE rating = "R";
-- solution
SELECT title FROM film WHERE rating = "R";

-- Find every non-R-rated movie.
-- solution
SELECT title FROM film WHERE rating != "R";

-- Find the ten shortest movies.
-- select correct table
SELECT * FROM film;
-- title ordered by length
-- solution
SELECT title, length FROM film 
ORDER BY length ASC LIMIT 10;

-- Find the movies with the longest runtime, without using LIMIT.
-- select the correct table
SELECT * FROM film;
-- order by length descending
SELECT title, length FROM film ORDER BY length DESC;
-- solution
SELECT title, length FROM film WHERE length > 180 ORDER BY length DESC;

-- Find all movies that have deleted scenes.
-- select the correct table
SELECT * FROM film;
-- seleted scenes in special features
-- solution

SELECT title FROM film WHERE special_features = "Deleted Scenes";

-- Using HAVING, reverse-alphabetically list the last names that are not repeated.
-- select correct table
SELECT * FROM actor;
-- distinct last names
SELECT DISTINCT last_name FROM actor ORDER BY last_name DESC;

-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.

-- Which actor has appeared in the most films?
-- select the correct table
SELECT * FROM actor;
-- select actor and film
SELECT first_name, last_name from actor;
-- join with film via film_actor
-- tbd

-- When is 'Academy Dinosaur' due?
-- join rental.rental_date with what??

-- What is the average runtime of all films?
-- sum * dilm duration / count * film id's

-- List the average runtime for every film category.
-- as previous answer in each category

-- List all movies featuring a robot.
-- How many movies were released in 2010?
-- count by specific release year
-- select cirrect table
SELECT * FROM film;
-- solution
SELECT COUNT(release_year) FROM film WHERE release_year = "2010";
-- answer = 0

-- Find the titles of all the horror movies.
-- join films with film category via film id

-- List the full name of the staff member with the ID of 2.
-- select correct table 
SELECT * FROM staff;
-- select correvt user id
-- solution
SELECT first_name, last_name FROM staff WHERE staff_id = 2;

-- List all the movies that Fred Costner has appeared in.
-- How many distinct countries are there?
-- select correct table
SELECT * FROM country;
-- solution
SELECT COUNT(DISTINCT country) FROM country;

-- List the name of every language in reverse-alphabetical order.
-- select correct table
SELECT * FROM `language`;
-- select name of language
SELECT `name` FROM `language`;
-- reverse order
-- solution
SELECT `name` FROM `language` ORDER BY `name` DESC;

-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
-- select the correct table
SELECT * FROM actor;
-- LIKE -son
SELECT * FROM actor WHERE last_name LIKE "%son";
-- solution
SELECT first_name, last_name FROM actor 
WHERE last_name LIKE "%son"
ORDER BY first_name ASC
;

-- Which category contains the most films?
-- count of each category??
-- select correct table
SELECT * FROM film_category;