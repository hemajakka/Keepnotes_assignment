create database KeepNote
use KeepNote
create table users
(
userid int primary key,
username varchar(20),
user_added_date date,
user_password varchar(20),
user_mobile bigint
)
create table note
(
note_id int primary key,
note_title varchar(30),
note_content varchar(50),
note_status varchar(20),
note_creation_date date,
userid int references users(userid)
)
create table category
(
category_id int primary key,
category_name varchar(20),
category_descr varchar(30),
category_creation_date date,
category_creator int
)
create table remainder
(
remainder_id int primary key,
remainder_name varchar(20),
remainder_descr varchar(40),
remainder_type varchar(20),
remainder_creation_date date,
remainder_creator int
)
create table NoteCategory
(
notecategory_id int primary key,
note_id int references Note(note_id),
category_id int references category(category_id)
)
create table NoteRemainder
(
note_remainder_id int primary key,
note_id int references Note(note_id),
remainder_id int references remainder(remainder_id)
)
insert into users values(112233,'Maya','2019-01-02','Maya1214',8012345679),(112244,'Nair','2019-01-11','Welcome',9023778467)
select * from users
insert into note values(1,'Today Tasks','1.Check Emails and reply to them 2.Startthe pro','Inprogress','2019-01-21',112233),
(2,'Training to plan','1.Application related 2.Technical related','yet to start','2019-01-31',112244),
(3,'Things to have today','1.fruits 2.more water','inprogress','2019-01-25',112244)
select * from note
insert into category values(1,'Official','Office realted notes','2019-01-21',112233),
(2,'Diet','Health realted notes','2019-01-24',112244)
select * from category



insert into remainder values(1,'KT reminder','Session on technical queries','Office Reminders','2019-02-12',112233),
(2,'Personal reminder','Pick children','Personal reminders','2019-02-14',112244)
 select * from remainder

 insert into notecategory values(1,1,1),(2,2,1),(3,3,2)
 insert into NoteRemainder values(1,3,2),(2,2,1)
 Alter table category add constraint fk1 foreign key(category_creator) references users(userid)
 Alter table remainder add constraint fk2 foreign key(remainder_creator) references users(userid)

 --querry1

 select * from users where userid=112233 and user_password='Maya1214'

 --querry2

 select * from note where note_creation_date='01/31/2019'

 --querry3

 select * from category where category_creation_date>'01/22/2019'

 --querry4

--Fetch all category details which belongs to note with note_id=1
select * from category where category_creator = (select userid from note where note_id = 1)

 

 --querry5

 select * from note where userid=112244

 --querry6

 select * from note where userid = (select category_creator from category where category_id = 1)

 

 --querry7

 select * from remainder where remainder_creator = (select userid from note where note_id = 2)

 


 --querry 8

 update note set note_status='completed' where note_id=1

 --querry 9
 update remainder set remainder_type='personal reminders' where remainder_creator=(select userid from note where note_id=1)
select * from remainder

 --querry 10
 delete from NoteRemainder where note_id=1







