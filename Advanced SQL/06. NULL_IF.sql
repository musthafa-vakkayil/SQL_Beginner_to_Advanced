-- NULL IF
-- If you want to return a null value if a condition is matched

/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/
SELECT p.title,
	NULLIF(p.special, 0) AS special
FROM products AS p;