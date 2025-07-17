Create database Factories;
use Factories;
create table ts_factories (Factory_ID char(9),	
                           Factory_Name varchar(100), 
                           Industry varchar(100), 
                           District varchar(50),	
                           Latitude decimal(10,6),	
                           Longitude decimal(10,6), 
                           Established_Year year,	
                           Operational_Days_Per_Year int, 
                           Production_Capacity int,	
                           Annual_Revenue decimal(10,2),
                           Total_Employees int, 
                           Avg_Salary_Per_Employee decimal(10,2), 
                           TS_IPASS_Registered	bool, 
                           Pollution_Index decimal(10,2), 
                           Renewable_Energy_Usage decimal(10,2), 
                           Labor_Cost decimal(10,4), 
                           Revenue_Per_Employee decimal(10,6));
select * from ts_factories;



					



                           
                           