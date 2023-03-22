create database if not exists DOBOO_server;

use DOBOO_server;

/*  
syntax for creating table;
create table tablename(
column1 cloumn_1Datatype(size) constrants;
column2 cloumn_1Datatype(size) constrants;
);
*/
/*
Number : INT, BIGINT
Decimal numbers (eg.3.14)  : DOUBLE
strings:
      --if fixed length: CHAR(2)
      --if  variable length: VARCHAR(255)
Date:DATE
Datetime: DATETIME
Boolean: TINYINT


alter table
don't need to add size to the int keyword.

drop is used to delete a column from a table. 
alter table table_name;
add column_name datatypes(size);
moditify column_name datatyes(size);
rename column column_name to new name;





*/

create table  if not exists `user`(
email varchar(50) primary key,
`name` varchar(50) ,
`password` varchar(50),
age varchar(50)
);





-- read the table 

SELECT *
FROM user;
 INSERT INTO user (name, password, date_of_birth, email)
VALUES 
('thamimtommy', 'user_pw','2005-05-22', 'user@gamil.com');

INSERT INTO user (name, password, date_of_birth, email)
VALUES ('dhanush', 'kowmart','2020-05-22', 'kow@gamil.com');

INSERT INTO user (password, date_of_birth, email)
VALUES 
('user_pw','2005-05-22', 'mvniev@gamil.com');


-- update user in data base

UPDATE user 
SET email ='tommy@gmail.com'
WHERE name ='thamimtommy';

-- delete user 

DELETE from user
where name='dhanush';

ALTER TABLE user
add whatsapp_no INT;

ALTER TABLE user
modify whatsapp_no varchar(20);

alter table user 
drop whatsapp_no;

ALTER TABLE user
RENAME column age to date_of_birth;



describe user;


create table if not exists `streaming songs`(
songid varchar(30) primary key,
`name` varchar(50),
`key` varchar(10),
bpm varchar(20),
`camelot` varchar(30),
`Used DAW` varchar(50)
);





















