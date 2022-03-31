USE world;

-- Using COUNT, get the number of cities in the USA.
-- test the correct table
SELECT * FROM city;
-- test the correct column
SELECT COUNT(ID) FROM city;
-- solution
SELECT COUNT(ID) FROM city WHERE CountryCode = "USA";
-- COMPLETE

-- Find out the population and life expectancy for people in Argentina.
-- test the correct table
SELECT * FROM country;
-- test the partial solution (in this case country total population)
-- solution
SELECT Population, LifeExpectancy FROM country WHERE Code = "ARG";
-- COMPLETE

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
-- is not null
SELECT * FROM customers WHERE email IS NULL;
-- order by and limit
SELECT * FROM products ORDER BY price DESC LIMIT 5;
-- select table
SELECT * FROM country;
-- test is not null
SELECT * FROM country WHERE LifeExpectancy IS NOT NULL;
-- solution
SELECT * FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;
-- ANDORRA
-- COMPLETE

-- Using JOIN ... ON, find the capital city of Spain.
-- join country with city ON CountryCode and display country.capital(Capital)  
-- test tables
SELECT * FROM country;
SELECT * FROM city;
-- draft code
-- TBD so far it pulls ALL names and capital as a number
-- solution
SELECT ci.Name, co.Name
FROM city ci
JOIN country co ON ci.ID = co.Capital
WHERE co.Name = "Spain";
-- COMPLETE

-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
-- join 
SELECT DISTINCT cl.`Language`, co.Region
FROM countrylanguage cl
JOIN country co ON cl.CountryCode = co.Code
WHERE co.Region = "Southeast Asia";
-- COMPLETE

-- Using a single query, list 25 cities around the world that start with the letter F.
-- test the correct table
SELECT * FROM city;
-- test the 25 limit
SELECT * FROM city LIMIT 25;
-- test the starts with letter f
SELECT * FROM city WHERE Name LIKE 'F%';
-- solution
SELECT * FROM city WHERE Name LIKE 'F%' LIMIT 25;

-- Using COUNT and JOIN ... ON, get the number of cities in China.
-- test correct tables
SELECT * FROM city;
SELECT * FROM country;
-- test count of cities
SELECT COUNT(ID) FROM city;
-- tbd join city with country on countrycode - what follows is draft code pasted in
SELECT *
FROM table1 t1
JOIN table2 t2 ON t1.field1=t2.field2;
-- and LEFT (or right of course is basically the same)
SELECT o.order_id, c.customer_id, c.forename, c.address, o.total
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id=o.fk_customer_id;

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
-- is not null
SELECT * FROM customers WHERE email IS NOT NULL;
-- order by
SELECT field_name1, field_name2 FROM table_name ORDER BY field_name2 DESC;
-- limit
SELECT * FROM products ORDER BY price DESC LIMIT 5;
-- draft code via previous working code world challenge question 3
-- tbd limit to above 0
SELECT * FROM country
WHERE Population IS NOT NULL HAVING Population > 0
ORDER BY Population ASC LIMIT 1;

-- Using aggregate functions, return the number of countries the database contains.
-- solution
SELECT COUNT(Code) FROM country;
-- answer = 239

-- What are the top ten largest countries by area?
-- test using correct table
SELECT * FROM country;
-- solution
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10;

-- List the five largest cities by population in Japan.
-- similar to previous question
-- solution
SELECT Name, Population FROM city WHERE CountryCode = "JPN" ORDER BY Population DESC LIMIT 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

-- List every unique world language.
-- test correct table
SELECT * FROM countrylanguage;
-- solution
SELECT DISTINCT Language FROM countrylanguage;

-- List the names and GNP of the world's top 10 richest countries.
-- test correct table
SELECT * FROM country;
-- solution
SELECT Name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

-- List the names of, and number of languages spoken by, the top ten most multilingual countries.
-- join country and countrylanguage on countrycode

-- List every country where over 50% of its population can speak German.
-- extension of previous answe

-- Which country has the worst life expectancy? Discard zero or null values.
-- select correct table
SELECT * FROM country;
-- solution
SELECT * FROM country 
WHERE LifeExpectancy IS NOT NULL 
HAVING LifeExpectancy > 0 
ORDER BY LifeExpectancy ASC 
LIMIT 1;

-- List the top three most common government forms.
-- How many countries have gained independence since records began?
-- select correct table
SELECT * FROM country;
-- indepedency is not null
SELECT * FROM country WHERE IndepYear IS NOT NULL;
-- solution
SELECT COUNT(IndepYear) FROM country 
WHERE IndepYear IS NOT NULL;