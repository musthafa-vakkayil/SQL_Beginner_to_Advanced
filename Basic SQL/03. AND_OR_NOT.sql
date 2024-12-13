-- Data Filtering using AND, OR and NOT

-- Question 1: How many female customers do we have from the state of OREGON(OR) AND NEW YORK(NY) 
-- Database: Store
-- Table: customers
SELECT COUNT(customerid) FROM customers
WHERE gender='F' AND (state = 'OR' OR state = 'NY');

-- Who over the age of 44 has an income of 100000 or more? (excluding 44)
-- Database: Store
-- Table: customers
SELECT firstname, lastname FROM customers
WHERE age>44 AND income>=100000;

-- Who between the ages of 30 and 50 has an income less than 50000?
-- (include 30 and 50 in the results)
-- Database: Store
-- Table: customers
SELECT firstname, lastname FROM customers
WHERE (age>= 30 AND age<=50) AND  income<50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
-- Database: Store
-- Table: customers
SELECT AVG(income) FROM customers
WHERE age> 20 AND age<50;