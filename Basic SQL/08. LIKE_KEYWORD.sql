-- LIKE KEYWORD
-- Used for Partial Lookups
-- Examples
-- WHERE first_name LIKE 'M%' -> starts with M
-- % -> any number of characters
-- _ -> one character
-- '%2' -> ends with 2
-- '%2%' -> contains 2
-- '_00%' -> 2 zeros in 2nd and third position
-- '2_%_% -> starts with 2 and atleast 3 character length
-- '2___5' -> starts with 2 and ends with 5, total 5 digits

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date))
*/
SELECT *, EXTRACT (YEAR FROM AGE(birth_date)) as "age" FROM employees
WHERE first_name LIKE 'M%';

/*
* DB: Employees
* Table: employees
* Question: How many people's first_name start with A and end with R?
* Expected output: 1846
*/
SELECT count(emp_no) FROM employees
WHERE first_name ILIKE 'A%R';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
SELECT COUNT(customerid) FROM customers
WHERE CAST(zip as text) LIKE '%2%';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
SELECT COUNT(customerid) FROM customers
WHERE CAST(zip as text) LIKE '2_1%';

/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
SELECT coalesce(phone, 'NO_PHONE') as phone, * FROM customers
WHERE phone LIKE '302%';

-- Case insensitive matching 
WHERE name ILIKE 'MO%'

