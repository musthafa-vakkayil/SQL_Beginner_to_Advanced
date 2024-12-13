-- HAVING

/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
SELECT t.emp_no, COUNT(t.title)
FROM titles as t
INNER JOIN employees as e USING(emp_no) 
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY (t.emp_no)
HAVING COUNT(t.title) > 2
ORDER BY t.emp_no;

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
SELECT e.emp_no, COUNT(s.salary) FROM employees as e
INNER JOIN salaries as s ON e.emp_no = s.emp_no
INNER JOIN dept_emp as dep ON e.emp_no = dep.emp_no
INNER JOIN departments as d ON dep.dept_no = d.dept_no
WHERE d.dept_name = 'Development'
GROUP BY e.emp_no
HAVING COUNT(s.salary)>15
ORDER BY e.emp_no;

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
SELECT e.emp_no, COUNT(d.dept_no)
FROM employees as e
JOIN dept_emp as d ON e.emp_no = d.emp_no
GROUP BY(e.emp_no)
HAVING COUNT(d.dept_no) > 1
ORDER BY e.emp_no;

