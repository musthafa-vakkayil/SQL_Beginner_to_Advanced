-- Rollup

-- Give me all combination of sales in DAY, Month and Year

SELECT EXTRACT(YEAR from orderdate) as "year",
       EXTRACT(MONTH from orderdate) as "month",
       EXTRACT(DAY from orderdate) as "day",
       sum(ol.quantity)
FROM orderlines as ol
GROUP BY
    ROLLUP(
       EXTRACT(YEAR from orderdate),
       EXTRACT(MONTH from orderdate),
       EXTRACT(DAY from orderdate)
    )
ORDER BY
    EXTRACT(YEAR from orderdate),
    EXTRACT(MONTH from orderdate),
    EXTRACT(DAY from orderdate)
