use class;
create table banking (uid char(10),money int,log varchar(50));
insert into banking values(1,4000,"recieved from x");
start transaction;
insert into banking values(1,5000,"recieved from x");
rollback;
select * from banking;
#View : A view is a virtual table it doesn't have a physical storage.
#---> Rather than a physical storage it stores a querry where whenever your a view query it simply  runs the code which is predefined.
#--- view are reusable,simplicity and secure.
#--- Why use view ?
#--- you can encapsulation complex logic into a view.
#--- view reduces the  query complexity in the end user
#--- restricts what the user can see.
#-- view don't have a permanant mermory
use learndb;
select * from myemp;
create view myemp_greater
as 
(select First_name,last_name from myemp where salary > 15000);


insert into myemp (First_name,last_name,salary) values ("hanusha","satya",20000);
select * from myemp_greater;
describe myemp;
insert into myemp (First_name,last_name,salary) values ("jahnavi","devi",3334);
drop view myemp_greater;

create table student_master_db (roll_no int primary key,
                                name_ char(30));
                                
insert into student_master_db value(1,"Hanusha");
select * from student_master_db;
insert into student_master_db value(2,"Satya");
alter table  student_master_db modify column roll_no int auto_increment;
insert into student_master_db (name_) value("Anusha");

create table marks_ (roll_no int,foreign key (roll_no) references student_master_db(roll_no) on update cascade on delete cascade ,
                     subj varchar(30),marks int);
insert into marks_ values(1,"maths",90);
insert into marks_ values(1,"sci",90);
select * from marks_;