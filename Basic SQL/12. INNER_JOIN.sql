-- INNER JOIN

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT c.customerid, 
CONCAT(c.firstname, ' ', c.lastname) as name, 
c.state,
o.orderid
FROM customers as c
INNER JOIN orders as o ON c.customerid = o.customerid 
AND (c.state IN ('OH', 'NY', 'OR'))
ORDER BY c.customerid;

/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT p.prod_id,
p.title,
i.quan_in_stock,
i.sales
FROM products as p
INNER JOIN inventory as i ON p.prod_id = i.prod_id
ORDER BY p.prod_id;

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
SELECT e.emp_no,
CONCAT(e.first_name, ' ', e.last_name) as employee_name,
dep.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as dep ON de.dept_no = dep.dept_no
ORDER BY e.emp_no;


-- Using Keyword
SELECT e.emp_no,
CONCAT(e.first_name, ' ', e.last_name) as employee_name,
dep.dept_name
FROM employees as e
INNER JOIN dept_emp as de USING(emp_no)
INNER JOIN departments as dep USING(dept_no)
ORDER BY e.emp_no;