-- Why Use CTEs?
-- Readability: CTEs break down long and complex queries into smaller, logical, named blocks. This makes the query easier to understand, debug, and maintain. Instead of nesting subqueries deeply, you define steps sequentially.
-- Reusability (within the same query): You can reference the same CTE multiple times within the main query that follows it. This avoids repeating the same subquery logic.
-- Recursion: CTEs allow for recursive queries, which are useful for hierarchical data (like organizational charts or parts explosions), although we won't cover recursion with the candy data.
-- Simplifying Complex Joins or Aggregations: Similar to derived tables, you can perform intermediate calculations, filtering, or aggregations within a CTE before using those results in the final query.


-- WITH CteName AS (
--     SELECT
--         columns
--     FROM
--         your_table
--     WHERE
--         some_condition
-- ),

-- AnotherCteName AS (
--     SELECT
--         columns
--     FROM
--         CteName
--     WHERE
--         another_condition
-- )
-- SELECT
--     main_columns
-- FROM
--     CteName
-- WHERE
--     main_query_condition;










-- Example 1: Find Candies More Popular Than the Average Fruity Candy
WITH FruityAvg AS (
    SELECT AVG(winpercent) AS avg_fruity_winpercent
    FROM candy_data
    WHERE fruity = 1
)
SELECT
    c.competitorname,
    c.winpercent
FROM
    candy_data c, FruityAvg fa
WHERE
    c.winpercent > fa.avg_fruity_winpercent
ORDER BY
    c.winpercent DESC;
    
    
 
 
 
-- Example 2: Calculate Average Sugar Content of High-Performing Candies
WITH HighWinners AS (
    SELECT
        competitorname,
        sugarpercent,
        winpercent
    FROM
        candy_data
    WHERE
        winpercent > 70
)
SELECT
    AVG(sugarpercent) AS avg_sugar_for_high_winners
FROM
    HighWinners;
    
    

-- Example 4: Find Candies Above Average Price AND Above Average Win Percentage (Chaining CTEs)
    
WITH AverageMetrics AS (
    SELECT
        AVG(pricepercent) as avg_price,
        AVG(winpercent) as avg_win
    FROM candy_data --
),
AboveAverageCandies AS (
    SELECT
        c.competitorname,
        c.pricepercent,
        c.winpercent
    FROM
        candy_data c, AverageMetrics am
    WHERE
        c.pricepercent > am.avg_price
        AND c.winpercent > am.avg_win
)
SELECT
    competitorname,
    pricepercent,
    winpercent
FROM
    AboveAverageCandies
ORDER BY
    winpercent DESC;    