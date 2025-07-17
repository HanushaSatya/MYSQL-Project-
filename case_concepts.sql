create database case_;
use case_;
#case concept
select competitorname as candyname,
chocolate,
fruity,
case
when chocolate =1  then 'chocolate-based'
when fruity = 1 then 'fruity-based'
else 'other'
end as candy_category
from
candy_data;


select competitorname as candyname,
chocolate,
fruity,
case
when chocolate =1 AND fruity =1 then 'chocolate-fruity-based'
when chocolate =1 then 'chocolate-based'
when fruity = 1 then 'fruity-based'
else 'other'
end as candy_category
from
candy_data;
select * from candy_data;






select c.competitorname,c.winpercent
from candy_data as c
join (select avg(winpercent) as avg_win from candy_data) as avg_table 
on c.winpercent > avg_table.avg_win;
select avg(winpercent) as avg_win from candy_data;

# derived table
select * from candy_data as c
join(select chocolate,avg(winpercent) as avg_winpercent 
from candy_data
group by chocolate)
as avg_table
on c.chocolate=avg_table.chocolate;


select c1.competitorname, c1.bar, c1.winpercent
from candy_data c1
join (
     select bar, MAX(winpercent) as max_win
     from candy_data
     group by bar
) as max_table
on c1.bar = max_table.bar and c1.winpercent = max_table.max_win;



with FruityAvg as (
     select avg(winpercent) as avg_fruity_winpercent
     from candy_data
     where fruity = 1
     )
select
   c.competitorname,
   c.winpercent
from
   candy_data c,FruityAvg fa
where 
   c.winpercent > fa.avg_fruity_winpercent
order by 
  c.winpercent DESC;
  

SELECT * FROM candy_data;