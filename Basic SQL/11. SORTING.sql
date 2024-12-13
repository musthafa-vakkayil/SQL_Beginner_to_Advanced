-- Sorting the data
-- ORDER BY <column> [ASC/DESC]
-- ORDER BY first_name, last_name DESC -> DESC will be applied only to last_name
--first_name will consider as ASC
-- ORDER BY LENGTH(name)

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
SELECT * FROM employees
ORDER BY first_name, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
SELECT * FROM employees
ORDER BY birth_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
SELECT * FROM employees
WHERE first_name LIKE 'K%'
ORDER BY hire_date;