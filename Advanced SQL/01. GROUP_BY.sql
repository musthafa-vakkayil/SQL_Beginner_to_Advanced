-- GROUP BY
-- Summarizing or Aggregating Data by Group

/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date, COUNT(emp_no)
FROM employees
GROUP BY hire_date;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/
SELECT t.emp_no, COUNT(t.title)
FROM titles as t
INNER JOIN employees as e USING(emp_no) 
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY (t.emp_no)
ORDER BY t.emp_no;

/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/
SELECT e.emp_no, de.from_date, de.to_date
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no, de.to_date;