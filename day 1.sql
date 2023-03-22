
/* 
we will follow
uppercase for keywords
lowercase for non keywords 
in store table 






*/
-- SHOW TABLES; 

-- use store;

-- select *
-- from customers
-- order by last_name desc;

-- use exercise_hr;

-- select * 
-- from employees
-- order by FIRST_NAME desc;


-- select employee_id,FIRST_NAME,LAST_NAME,SALARY 
-- from employees 
-- order by salary asc;

-- use store;

-- select *
-- FROM customers
-- ORDER BY last_name DESC, birth_date DESC;

-- SELECT 1,2;
-- SELECT 18/9;
-- SELECT 10%2;

-- SELECT first_name, last_name, points, points * 1.1 AS 'discount_factor'
-- FROM customers;

-- SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birth_date)), '%Y')/1 AS age
-- FROM customers;


/* select keyword is use for select the tables name
syntax 
SELECT<column name 1>,<column name 2>
FROM TABLE name

DATA types

strings, numbers,dates, 

how to select a unique column use /"distant"/

where keyword is used to search a element if it is true. 

compariosn operator;

> 

>=

<

<=

=

! = or <> or not 

logical operator

AND both conditions wiil run if it is true 

OR means any one conditions wiil run if it is true 

order of logical operator 

1. AND 
2. OR 
3. NOT
4. IN used as a array in mysql. 
5. between is the keyword is used for to constrain a particularly from the starting value and the ending value.
6. like keyword is used to find a thing in ('text')
7. % is the keyword which is used as to find last letter or first letter %b , b% , %b% ,
8. _ this keyword is used to identify a element as a character.
9. regexp is find the element init. 
10. ^ used to write this as to find the captial letter.  name of keyword is caret.
11. $ used to find a element in the last.
12. | or condition. 
13. count KEy words 
14. Group by is used to to group the data and the conut. 
15. when ever we use group by the colunm that present in that table.

<cons
16. default
17.creating index
18. foreign key how to declare.
19. check.
 












 */
 
 -- use store;
--  select * 
--  from customers
--  where state like'_A'
 

 
 select * 
 from customers
 where last_name like'b%y';
 
 select * 
 from customers 
 where last_name regexp 'field$|^mac|rose';
 
 select * 
 from customers 
 where first_name regexp 'elka|ambur'; 
 
 select * 
 from customers 
 where last_name regexp 'ey$|on&';
 
 
 select * 
 from customers 
 where last_name regexp '^my|se';
 
select * 
from customers 
where last_name regexp 'ae|be|ce|de|ee|fe|ge|he';

select * 
from customers 
where last_name regexp '[abcdefgh]e';

select * 
from customers 
where last_name regexp '[a-h]e';

select * 
from customers 
where last_name regexp '[gim]e';

select * 
from customers 
where last_name regexp '______';

use exercise_hr;

select DEPARTMENT_ID
from departments
where DEPARTMENT_NAME= 'IT'; 

select* 
from employees
where DEPARTMENT_ID=60;


select FIRST_NAME,LAST_NAME, d.DEPARTMENT_ID,department_name
FROM employees as e inner join departments as d
on e.department_id = d.department_id;
-- where employees.department_id=60;

select*
FROM employees as e inner join employees as m
on e.EMPLOYEE_ID= m.MANAGER_ID;

select concat(e.first_name,e.last_name)as "employee_name", m.MANAGER;


-- select FIRST_NAME,LAST_NAME, d.DEPARTMENT_ID,department_name

-- Write a query to get the total salaries payable to employees.
SELECT SUM(salary) AS total_salary
FROM employees;

-- Write a query to get the maximum and minimum salary from employees table.
SELECT MAX(salary) AS maximum_salary
FROM employees;
SELECT MIN(salary) AS minimum_salary
FROM employees;


-- Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(salary) AS minimum_salary
FROM employees;
SELECT COUNT(employee_id)
FROM employees;


-- Write a query to get the number of employees working with the company.
 -- I AM NOT CLEAR ABOUT THIS QUESTION SIR
 
 
 -- Write a query to get the number of distinct jobs available in the employees table.
  SELECT COUNT(DISTINCT job_id) AS num_jobs
FROM employees;


-- Write a query get all first name from employees table in upper case.
select upper(first_name) As 'Uppercase Names' from employees;


​
-- Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTRING(first_name, 1, 3) AS first_three_chars
FROM employees;
​
-- Write a query to get the names ('<first name> <last name>') (for example Ellen Abel, Sundar Ande etc.) as a single column of all the employees from employees table.
SELECT CONCAT(employees.first_name, employees.last_name) AS 'Employee name'
FROM employees;
-- Write a query to get the length of the employee names ('<first name> <last name>') from employees table.
​
SELECT LENGTH(first_name) AS first_name_length, LENGTH(last_name) AS last_name_length
FROM employees;
SELECT length(CONCAT(employees.first_name, employees.last_name)) AS 'Employee name length'
FROM employees;
​
-- Write a query to get monthly salary (round 2 decimal places) of each and every employee
​
SELECT  ROUND(salary/12, 2) AS monthly_salary
FROM employees;
​
-- \\\\\\\\\\\\ Today Excrise\\\\\\\\\\\\\\\\\\\
​
-- Write a query to find the name (first_name, last name), department ID and name of all the employees.
 
select first_name,last_name,e.department_id
from employees as e inner join departments as d
 on e.department_id = d.department_id;
 
 -- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
 
 select first_name,last_name,e.department_id,city,job_title
from employees as e inner join departments as d inner join locations as n inner join jobs as j
 on e.department_id = d.department_id
 where  city = 'london';
 
 -- Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
 select employee_id,last_name,manager_id from employees;
 	-- \\\\\\\\\\\\\ I don't know where is manager name
 
 -- Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
 
 SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (
    SELECT hire_date
    FROM employees
    WHERE last_name = 'Jones'
)
ORDER BY hire_date;
​
-- Write a query to get the department name and number of employees in the department. (Requires GROUP BY)
​
SELECT departments.department_name, COUNT(employees.employee_id) as num_employees
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;
​
​
-- Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
​
​
SELECT e.employee_id, n.job_title, DATEDIFF(j.end_date, j.start_date)  as days_worked,e.department_id
from employees as e inner join job_history as j inner join jobs as n
ON e.job_id = n.job_id
INNER JOIN departments as d
ON e.department_id = d.department_id
WHERE e.department_id = 90;
​
​
-- Find the CEO from the employee table.
select * from employees
where MANAGER_ID=0;
-- I dont know this is correct or not









 
 
 

 
 
 
 
 
 
 
 
 
--  SELECT * 
--  FROM customers
--  WHERE (points <'4000'AND birth_date >= "1990-01-01") OR state ='VA';
--  
--  
--  use store;
--   SELECT * 
--  FROM customers
--  WHERE state in ('fl','va','ga');
--  
--  use inventory;
--  select * 
--  from products
--  where quantity_in_stock in ('49', '38', '72');
--  
--  use store;
--  select* 
--  from customers
--  where birth_date between '1990-01-01' and '2000-01-01';
--  
--  select * 
--  from customers
--  where points>=3000 and points<=10000;
--  
--  select *
--  from customers
--  where points between 3000 and 10000;
--  
--  
--  
--  select * 
--  from customers
--  where last_name like'_____y'
use store;
explain
select *
from customers;







 
 

 
 
 
 
 
 
 




