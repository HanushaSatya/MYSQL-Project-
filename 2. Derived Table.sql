-- What is a Derived Table?
-- A Derived Table is a subquery used inside the FROM clause that acts like a temporary table for your query.

-- Think of it like:

-- “Write a query → give it a name → now treat that result like a table in another query.”



-- SELECT t1.column1, t2.column2
-- FROM (SELECT ... FROM ...) AS t1
-- JOIN other_table AS t2
-- ON t1.id = t2.id;



SELECT competitorname, winpercent
FROM candy_data
WHERE winpercent > (
    SELECT AVG(winpercent) FROM candy_data
);


SELECT c.competitorname, c.winpercent
FROM candy_data AS c
JOIN (SELECT AVG(winpercent) AS avg_win FROM candy_data) AS avg_table
ON c.winpercent > avg_table.avg_win;





SELECT c.competitorname, c.chocolate, avg_table.avg_winpercent
FROM candy_data AS c
JOIN (
    SELECT chocolate, AVG(winpercent) AS avg_winpercent
    FROM candy_data
    GROUP BY chocolate
) AS avg_table
ON c.chocolate = avg_table.chocolate;



SELECT c.competitorname, c.pricepercent
FROM candy_data c
JOIN (
    SELECT AVG(pricepercent) AS avg_price
    FROM candy_data
    WHERE chocolate = 1
) AS avg_choc
ON c.pricepercent > avg_choc.avg_price;



SELECT c1.competitorname, c1.bar, c1.winpercent
FROM candy_data c1
JOIN (
    SELECT bar, MAX(winpercent) AS max_win
    FROM candy_data
    GROUP BY bar
) AS max_table
ON c1.bar = max_table.bar AND c1.winpercent = max_table.max_win;


