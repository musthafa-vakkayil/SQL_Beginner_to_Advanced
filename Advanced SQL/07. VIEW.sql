-- VIEW
-- if you want to store the result of query and run query on top of it
-- VIEW is of 2 types -> Materialized (store the results) and Non-Materialized(store reference to query)

-- CREATE SYNTAX
CREATE VIEW view_name AS query;

-- UPDATE SYNTAX 
CREATE OR REPLACE <view_name> AS query;

-- RENAME SYNTAX
ALTER VIEW <view_name> RENAME TO <new_name>;

-- DELETE VIEW
DROP VIEW [IF EXISTS] <view_name>

-- GET the Current Salary of all the employees
CREATE OR REPLACE VIEW last_salary_change AS
SELECT e.emp_no,
	MAX(s.from_date)
FROM salaries as s
JOIN employees AS e USING(emp_no)
JOIN dept_emp as de USING(emp_no)
JOIN departments as d USING(dept_no)
GROUP BY e.emp_no
ORDER BY e.emp_no;

-- use the view to get final result
SELECT s.salary,
	   e.first_name
FROM salaries AS s
JOIN employees as e USING(emp_no)
JOIN last_salary_change as l USING(emp_no)
WHERE l.max = s.from_date
ORDER BY e.emp_no;

/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/
CREATE VIEW "90-95" AS
SELECT *
FROM employees as e
WHERE EXTRACT (YEAR FROM e.hire_date) BETWEEN 1990 AND 1995
ORDER BY e.emp_no;

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/
CREATE OR REPLACE VIEW bigbucks AS
SELECT e.emp_no, e.first_name, s.salary
FROM employees as e
JOIN salaries as s USING(emp_no)
WHERE s.salary>80000
ORDER BY emp_no;

SELECT emp_no FROM bigbucks
GROUP BY emp_no;