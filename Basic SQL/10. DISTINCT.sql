-- DISTINCT KEYWORD
-- Used to Remove Duplicates
-- Eg: SELECT DISTINCT <column 1> <column 2> FROM <table>;

/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/
SELECT DISTINCT(title) FROM titles;

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
SELECT COUNT(DISTINCT birth_date) FROM employees;

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/
SELECT DISTINCT lifeexpectancy FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy;