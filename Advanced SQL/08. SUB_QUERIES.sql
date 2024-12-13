-- Sub Queries

-- Show me all the employees older than the average age
-- Database: Employees
-- Table: employees
SELECT * FROM employees
WHERE AGE(birth_date) > (
	SELECT AVG(AGE(birth_date)) FROM employees
)
ORDER BY emp_no;

-- Show the title by salary for each employee
select emp_no, salary, from_date, 
    (select title from titles as t 
     where t.emp_no=s.emp_no and 
    (t.from_date = s.from_date + interval '2 days' or t.from_date=s.from_date))
from salaries as s
order by emp_no;

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT * FROM orders
WHERE customerid IN(
	SELECT customerid FROM 	customers
	WHERE state IN ('OH', 'NY', 'OR')
);

-- alternate
SELECT c.firstname, c.lastname, o.orderid 
FROM orders AS o, (
    SELECT customerid, state, firstname, lastname
    FROM customers
) AS c
WHERE  o.customerid = c.customerid AND 
c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM dept_manager
        WHERE emp_no = 110183
    )
)
ORDER BY emp_no

-- alternate
SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS employee_name, dm.emp_no as manager
FROM employees AS e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN dept_manager as dm ON de.dept_no = dm.dept_no
WHERE dm.emp_no = 110183
ORDER BY e.emp_no;