-- OPERATOR PRECEDENCE
-- Paranthesis -> Multiplication/Division -> Substarction/Addition -> NOT -> AND -> OR
-- if operators have equal priority they evaluated in direction
-- NOT += -> Right to left
-- All other left to right

/*
* DB: Store
* Table: Customers
* Question: 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/
SELECT * FROM customers
WHERE (age < 30 OR age >= 50) AND income > 50000 
AND(country='Japan' OR country = 'Australia');

/*
* DB: Store
* Table: Orders
* Question: 
* What was our total sales in June of 2004 for orders over 100 dollars?
*/
SELECT SUM(totalamount) FROM orders
WHERE orderdate >= '2004-06-1' 
AND orderdate <= '2004-06-30' 
AND totalamount > 100;

