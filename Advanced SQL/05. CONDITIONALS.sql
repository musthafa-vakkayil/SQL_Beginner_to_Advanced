-- Conditionals
-- Select When a certain criteria is matched

/**
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/
SELECT
	p.title,
	CASE
		WHEN p.price > 20 THEN 'Expensive' 
		WHEN p.price > 10 AND p.price <= 20 THEN 'Average'
		ELSE 'Cheap'
	END AS price_class
FROM products AS p;