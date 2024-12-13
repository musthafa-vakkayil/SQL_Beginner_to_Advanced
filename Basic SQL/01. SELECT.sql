-- Simple SELECT Statements

-- List of Employees in the Company
-- Database: Employees, Table: employees
SELECT * FROM employees;

-- How many Departments are there in the company
-- Database: Employees, Table: departments
SELECT dept_no FROM departments;
-- Answer: 9

-- How many times has employee 10001 had a raise
-- Database: Employees, Table: salaries
SELECT * FROM salaries
WHERE emp_no = 10001;
-- Answer: 16

-- What Title does employee 10006 have?
-- Database: Employees, Table: titles
SELECT title FROM titles
WHERE emp_no = 10006;
-- Answer: Senior Engineer