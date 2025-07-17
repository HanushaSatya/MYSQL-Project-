create database my_project;
use my_project;
create table adult_table(Age_ tinyint, 
                         Workclass varchar(30), 
                         fnwgt mediumint, 
                         Education varchar(50) ,
                         Education_num tinyint ,
                         marital_status varchar(30) ,
                         occupation varchar(40) , 
                         relationship varchar(30) ,
                         race varchar(20) , 
                         gender char(10),
                         capital_gain smallint ,
                         capital_loss smallint ,
                         hours_per_week tinyint ,
                         native_country char(20),
                         salary varchar(30));
select * from adult_table;
insert into adult_table values (25,"Private",226802,"11th",7,"Never-married","Machine-op-inspct","Own-child","Black","Male",0,0,40,"United-States","<=50K");
select * from adult_table;
insert into adult_table values (38,"Private",89814,"HS-grad",9,"Married-civ-spouse","Farming-fishing","Husband","White","Male",0,0,50,"United-States","<=50K"),
							   (28,"Local-gov",336951,"Assoc-acdm",12,"Married-civ-spouse","Protective-serv","Husband","White","Male",0,0,40,"United-States",">50K"),
                               (44,"Private",160323,"Some-college",10,"Married-civ-spouse","Machine-op-inspct","Husband","Black","Male",7688,0,40,"United-States",">50K"),
                               (18,"NA",103497,"Some-college",10,"Never-married",0,"Own-child","White","Female",0,0,30,"United-States","<=50K");
select * from adult_table;
create table consumer_complaints(ID bigint unique,
                                 Company varchar(50) not null,
                                 Product varchar(30),
                                 Issue text ,
                                 State char(5) not null,
                                 Submitted_via char(10),
                                 Date_received date not null,
                                 Date_resolved date not null,
                                 Timely_response char(3),
                                 Consumer_disputed char(3),
                                 state_name varchar(30),
                                 Date_received_1 date not null check((Date_received_1) > "2012-01-01" and  (Date_received_1) < "2016-01-01") ,
                                 Date_resolved_1 date not null,
                                 Resolution_time_in_days tinyint default 0,
                                 Year_ year check (Year_ > 2012), 
                                 QTR_US_FLY char(5) check ( (QTR_US_FLY) >= 'Q1' and (QTR_US_FLY) < 'Q5'));
select * from consumer_complaints;
insert into consumer_complaints values(16157,"PHH Mortgage","Mortgage","Loan servicing, payments, escrow account","FL","Web","2015-10-20","2015-10-20","Yes","No","Florida","2015-10-20","2015-10-20",0	,'2015',"Q4"),
									  (6542,"Ocwen"," Mortgage","Loan servicing, payments, escrow account","NC","Web","2014-01-03","2014-01-03","Yes","No","North Carolina","2014-01-03","2014-01-03",0,'2014',"Q1"),
									  (1303,"Continental Finance Company ,LLC ",'Credit card', 'Billing statement', 'WA', 'Web', '2015-03-26', '2015-03-26', 'Yes', 'No', 'Washington', '2015-03-26', '2015-03-26', 0,'2015', 'Q1');
insert into consumer_complaints values(1390231, 'Encore Capital Group', 'Debt collection', 'False statements or representation', 'IL', 'Web', '2015-05-23', '2015-05-23', 'Yes', 'No', 'Illinois', '2015-05-23', '2015-05-23', 0, 2015, 'Q2');
select * from consumer_complaints;
create table ele_popul_data(VIN char(10) unique, 
                            Country varchar(20) not null,
                            City varchar(20) not null,
                            State char(5) , 
                            Postal_Code float(20,1) , 
                            Model_Year year, 
                            Make varchar(20), 
                            Model varchar(20),
                            Electric_Vehicle_Type varchar(50),
                            Clean_Alternative_Fuel_Vehicle_Eligibility text, 
                            Electric_Range float(20,1),
                            Base_MSRP float(2,1),
                            Legislative_District float(5,1),
                            DOL_Vehicle_ID bigint, 
                            Vehicle_Location varchar(40) , 
                            Electric_Utility text,
                            2020_Census_Tract bigint);
