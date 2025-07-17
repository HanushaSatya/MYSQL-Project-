-- What is CASE in SQL?
-- CASE is SQL’s way to do IF…ELSE logic inside a query.

-- ✅ It checks conditions
-- ✅ Returns a value depending on the condition
-- ✅ Works inside SELECT, WHERE, ORDER BY, etc.

-- Think of it like:

-- “If X is true → give me A,
-- Else if Y is true → give me B,
-- Else → give me C”


use candy;



SELECT
    competitorname AS candy_name,
    chocolate,
    fruity,
    CASE
        WHEN chocolate = 1 THEN 'Chocolate-based'
        WHEN fruity = 1 THEN 'Fruity-based'
        ELSE 'Other'
    END AS candy_category
FROM
    candy_data;


SELECT
    competitorname AS candy_name,
    chocolate,
    fruity,
    CASE
        WHEN chocolate = 1 AND fruity = 1 THEN 'Chocolate & Fruity'
        WHEN chocolate = 1 THEN 'Chocolate-based'
        WHEN fruity = 1 THEN 'Fruity-based'
        ELSE 'Other'
    END AS candy_category
FROM
    candy_data;
