use factories;
alter table ts_factories modify column factory_id varchar(20) not null;
alter table ts_factories add primary key(factory_id);
select * from ts_factories;
describe ts_factories;
alter table ts_factories modify column Factory_Name varchar(100) ;
alter table ts_factories modify column industry varchar(100) ;
alter table ts_factories modify column district varchar(50) ;
alter table ts_factories modify column latitude decimal(10,6) ;
alter table ts_factories modify column longitude decimal(10,6) ;
alter table ts_factories modify column established_year year;
alter table ts_factories modify column Operational_Days_Per_Year int ;
alter table ts_factories modify column production_capacity int ;
alter table ts_factories modify column Annual_Revenue decimal(10,2) ;
alter table ts_factories modify column Total_Employees int ;
alter table ts_factories modify column Avg_Salary_Per_Employee decimal(10,2) ;
alter table ts_factories modify column TS_IPASS_Registered char(10);
alter table ts_factories modify column Pollution_Index decimal(10,2) ;
alter table ts_factories modify column Renewable_Energy_Usage decimal(10,2) ;
alter table ts_factories modify column Labor_Cost decimal(10,4) ;
alter table ts_factories modify column Revenue_Per_Employee decimal(10,6) ;

# List all factories with high pollution (index > 0.5)
SELECT Factory_ID, Factory_Name, Pollution_Index
FROM ts_factories
WHERE Pollution_Index > 0.5;

# Find the top 5 factories by Annual Revenue
SELECT Factory_ID, Factory_Name, Annual_Revenue
FROM ts_factories
ORDER BY Annual_Revenue DESC
LIMIT 5;

# Get the average salary per employee by district
SELECT District, AVG(Avg_Salary_Per_Employee) AS Avg_Salary
FROM ts_factories
GROUP BY District;

# count of factories per industry
SELECT Industry, COUNT(*) AS Factory_Count
FROM ts_factories
GROUP BY Industry;

#Total number of employees by industry
SELECT Industry, SUM(Total_Employees) AS Total_Employees
FROM ts_factories
GROUP BY Industry;

#Factories not registered with TS-IPASS
SELECT Factory_ID, Factory_Name
FROM ts_factories
WHERE TS_IPASS_Registered = FALSE;

# Top 5 districts by total annual revenue
SELECT District, SUM(Annual_Revenue) AS Total_Revenue
FROM ts_factories
GROUP BY District
ORDER BY Total_Revenue DESC
LIMIT 5;

select * from ts_factories;

# creating industries_rank table
CREATE TABLE industries_rank (
    industry VARCHAR(100) PRIMARY KEY,
    industry_rank INT
);

# inserting values method-2
INSERT INTO industries_rank (industry, industry_rank)
SELECT industry,
       DENSE_RANK() OVER (ORDER BY industry ASC) AS industry_rank
FROM (
    SELECT DISTINCT industry
    FROM ts_factories
) AS distinct_industries;
SELECT * FROM industries_rank;

#creating districts_rank table
CREATE TABLE districts_rank (
    district VARCHAR(100) PRIMARY KEY,
    districts_rank INT
);

# Inserting values
INSERT INTO districts_rank (district, districts_rank)
SELECT district,
       DENSE_RANK() OVER (ORDER BY district ASC) AS district_rank
FROM (
    SELECT DISTINCT district
    FROM ts_factories
) AS distinct_districts;
SELECT * FROM districts_rank;


#Generating index and foriegn key for industry and district
CREATE INDEX idx_industry ON ts_factories(industry);

ALTER TABLE industries_rank
ADD FOREIGN KEY (industry)
REFERENCES ts_factories (industry);

# creating a index to district
CREATE INDEX idx_district ON ts_factories(district);

# creating a foriegn key contraint
ALTER TABLE districts_rank
ADD FOREIGN KEY (district)
REFERENCES ts_factories (district);

select * from districts_rank;
select * from industries_rank;
# using CTE
WITH ranked_industries AS (
    SELECT
        industry,
        DENSE_RANK() OVER (ORDER BY industry ASC) AS industry_rank
    FROM (
        SELECT DISTINCT industry FROM ts_factories
    ) AS distinct_industries
)
INSERT INTO industries_rank (industry, industry_rank)
SELECT industry, industry_rank
FROM ranked_industries;

describe districts_rank;
describe ts_factories;




