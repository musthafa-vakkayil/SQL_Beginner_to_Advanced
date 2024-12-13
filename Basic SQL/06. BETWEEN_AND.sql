-- BETWEEN AND
-- Apply Filter to a range of values
-- Eg: WHERE <column> BETWEEN X AND Y

-- BB: Store
-- Table: customers
-- Who between the ages of 30 and 50 has an income less than 50000?
-- (include 30 and 50 in the results)
SELECT * FROM customers
WHERE age BETWEEN 30 AND 50 AND income < 50000;

-- BB: Store
-- Table: customers
-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
SELECT AVG(income) FROM customers
WHERE age BETWEEN 20 AND 50;
