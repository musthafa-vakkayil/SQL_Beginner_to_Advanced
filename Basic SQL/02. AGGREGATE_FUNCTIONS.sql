-- AGGREGATE FUNCTIONS: AVG(), COUNT(), MIN(), MAX() and SUM()

-- Question 1: What is the average salary for the company?
-- Database: Employees
-- Table: Salaries
SELECT AVG(salary) FROM salaries;

-- Question 2: What year was the youngest person born in the company?
-- Database: Employees
-- Table: employees
SELECT MAX(birth_date) FROM employees;

-- Question 1: How many towns are there in france?
-- Database: France
-- Table: Towns
SELECT COUNT(id) FROM towns;

-- Question 1: How many official languages are there?
-- Database: World
-- Table: countrylanguage
SELECT COUNT(language) FROM countrylanguage
WHERE isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Database: World
-- Table: country
SELECT AVG(lifeexpectancy) FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Database: World
-- Table: city
SELECT AVG(population) FROM city 
WHERE countrycode = 'NLD';