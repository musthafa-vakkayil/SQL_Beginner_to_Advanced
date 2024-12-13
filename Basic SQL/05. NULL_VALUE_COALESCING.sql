-- NULL Values
-- Be careful, Be mindful & Be Deliberate while adding NULLS
-- null == null -> null, null <> null -> null
-- IS -> used to filter null, not null, true and false
-- Eg: WHERE <field> IS [NOT] NULL;
-- Eg: WHERE <field> = ' ' IS NOT FALSE;

-- NULL COALESCING
SELECT coalesce(<column>, 'value') AS column-alias FROM <table>;

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Assuming a students minimum age for the class is 15, what is the average age of a student?
*/
SELECT AVG(coalesce(age, 15)) FROM "Student";

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Replace all empty first or last names with a default?
*/
SELECT id, 
coalesce(name, 'EMPTY__FIRST_NAME') AS first_name, 
coalesce(lastname, 'EMPTY_LAST_NAME') AS last_name, 
coalesce(age, 0) as age 
FROM "Student";

-- The Result of logical operation can also unknown = NULL

/*
* DB: Store
* Table: customers
* Question: Display the null values of address2 as "No Address"
*/
SELECT firstname, coalesce(address2, 'No Address') as address2
FROM customers;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
* SELECT *
* FROM customers
* WHERE address2 IS NOT null;
*/
SELECT *
FROM customers
WHERE address2 IS NOT null;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
* SELECT coalesce(lastName, 'Empty'), * from customers
* where (age IS NULL);
*/
SELECT coalesce(lastName, 'Empty'), * from customers
where age IS NOT NULL;
