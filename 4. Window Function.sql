-- Example 1: Overall Rank by Win Percentage
-- Goal: Assign a rank to each candy based on its overall winpercent, highest being rank 1.
-- Function: RANK() or DENSE_RANK(). RANK() might skip numbers if there are ties, DENSE_RANK() won't.
-- Window: The entire dataset, ordered by winpercent descending.




SELECT
    competitorname,
    winpercent,
    RANK() OVER (ORDER BY winpercent DESC) AS overall_rank, -- Assigns rank (skips ranks on ties)
    DENSE_RANK() OVER (ORDER BY winpercent DESC) AS overall_dense_rank -- Assigns rank (no gaps for ties)
FROM
    candy_data -- Using the correct table name
ORDER BY
    overall_rank; -- Order the final result by rank
    
    
    
    
    
    
    
-- Example 4: Show Previous Candy's Win Percentage (Lag)
-- Goal: When candies are ordered by winpercent, show the winpercent of the candy ranked just before the current one.
-- Function: LAG().
-- Window: The entire dataset, ordered by winpercent.


SELECT
    competitorname,
    winpercent,
    LAG(winpercent, 1, 0.0) OVER (ORDER BY winpercent ASC) AS previous_candy_winpercent -- Get win% from 1 row before (ascending order)
    -- LAG(column, offset, default_value)
    -- Using 0.0 as default for the very first candy which has no previous one
FROM
    candy_data -- Using the correct table name
ORDER BY
    winpercent ASC; -- Order results to see the lag effect clearly    
    
    
    
    
    
    
-- Example 5: Running Total of Sugar Percentage within Fruity Candies
-- Goal: Calculate a cumulative (running) total of sugarpercent for fruity candies, ordered by their winpercent.
-- Function: SUM().
-- Window: Partitioned by fruity (we only care about the fruity=1 partition here, but partitioning makes it explicit), ordered by winpercent to define the accumulation order. Uses a frame clause (default: RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).    


SELECT
    competitorname,
    fruity,
    winpercent,
    sugarpercent,
    SUM(sugarpercent) OVER (PARTITION BY fruity ORDER BY winpercent ASC) AS running_total_sugar_fruity
FROM
    candy_data -- Using the correct table name
WHERE
    fruity = 1 -- Filter to show only fruity candies, although the partition handles it
ORDER BY
    winpercent ASC;