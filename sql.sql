create database class;
use class;
create table STUDENT_TABLE(name_ char(30) , age_ int , gender_ char(10) , phno_ int  );
select * from STUDENT_TABLE;
use class;
create table register(roll_no char(5), 
					  name_ varchar(30), 
                      gender char(5), 
					  dob date, 
                      age tinyint, 
                      phone_no char(10), 
                      atten_percent tinyint, 
                      address text, 
                      year_of_join year, 
                      marks_perct float(3,2));
                      
select * from register;

# method-1 #insert into table_name values (column_value1, column_value2,.....);
# method-2 #insert into table_name (column_name , column_name ) values (column_value , column_value) ;
# method-3 insert into table_name <using method -1 > values (column_value1,column_value2,....); #inserting all records at a time we use this method.
# method-4 insert into table_name <using method -2 > (column_name1 ,column_name2) values (column_value1,column_value2); #inserting multiple records specific column wise
#method-1
insert into student_table values ("Hanusha",23,"Female",123456678);
select * from student_table;
#method-2
insert into student_table (age_,name_) values (23,"Hanusha");
select * from student_table;
#method-3
insert into student_table values ("Hanu",22,"Female",123456678),
                                 ("satya",12,"male",3656679);
select * from student_table;
#method-4
insert into student_table (name_,age_,phno_) values ("hanusha",34,221334),
                                                    ("sai",45,9023383),
                                                    ("teja",67,536590);
select * from student_table;

#drop-it drops entire table it is performed on structure data
# drop database <databasename>;
# drop table <tablename>;
drop database batch363;

create table STUDENT_TABLE1(name_ char(30) not null , 
                            age_ int check (age_ > 15 and age_ < 50) , 
                            gender_ char(10) , 
                            phno_ char(10) default "24787898");
insert into student_table1 values ("Hanu",22,"Female",123456678);
select * from student_table1;
insert into student_table1 values ("Hanu",22,"Female",123456678); # here it got an error because we have given phno as unique(it is a constrain)
insert into student_table1 values ("satya",99,"Female",44535655);
insert into student_table1 values ("Hanu",30,"Female",123456673);
select * from student_table1;
insert into student_table1 (name_,age_,gender_) values ("sai",45,"Male");
insert into student_table1 (name_,age_,phno_) values ("hanusha",34);
											
#describe <table_name>;
describe STUDENT_TABLE1;
select * from student_table1;
#alter
alter table student_table1 change column phno_ phno_ char(20); #changing only the datatype of specific column

alter table student_table1 change column phno_ phone_num int ; #here changing both type and name of the column

alter table student_table1 modify column phone_num char(30); #here modifying column datatype

alter table student_table1 add column address char(30) default "no add";#adding a column with default value
alter table student_table1 add column city char(20);

insert into student_table1 (age_,name_,address) values (23,"devi","efdffffds");
select * from student_table1;

alter table student_table1 add column addresssss char(30) ; #adding a column
select * from student_table1;

alter table student_table1 drop column addresssss ;  #droping a column
select * from student_table1;

select * from student_table1 where age_=45 ;