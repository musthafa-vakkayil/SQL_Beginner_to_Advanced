-- DATES AND TIMEZONE
-- SET TIME ZONE 'UTC';

-- TIMESTAMP -> is a date with time and timezone info
CREATE TABLE timezones(
    ts TIMESTAMP WITHOUT TIME ZONE,
    tz TIMESTAMP WITH TIME ZONE
)

-- DATE FUNCTIONS 
-- CURRENT DATE -> SELECT NOW()::date; SELECT CURRENT_DATE;
-- FORMATTING -> TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy);
-- CASTING -> SELECT DATE '1800/01/01'
-- CALCULATE AGE -> AGE(date1, date2)
-- EXTRACT DAY -> SELECT ECTRACT(DAY / MONTH/ YEAR FROM date '1992/11/11') AS DAY
-- ROUND DATE -> SELECT DATE_TRUNC('year'/'month', date '1992/11/12')
-- INTERVAL -> WHERE purchase_date <= now() - interval '30 days' / '1 year 2 months 3 days' / '1 year 3 hours 20 minutes'

/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM AGE(now(), birth_date)) > 60;

-- alternative
SELECT count(birth_date) FROM employees
WHERE birth_date < now() - interval '61 years' -- 61 years before the current date

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/
SELECT COUNT(emp_no) FROM employees
WHERE EXTRACT(MONTH FROM DATE_TRUNC('month',hire_date)) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT count(emp_no) FROM employees
where EXTRACT (MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/
SELECT MAX(AGE(birth_date)) FROM employees;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/
SELECT COUNT(orderid)
FROM orders
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';