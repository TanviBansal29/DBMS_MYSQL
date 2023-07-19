-- 50 questions from sql 
-- Write an SQL query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>
select first_name as WORKER_NAME from worker;

-- write an aql query to fetch "FIRST NAME" from worker table in upper case
select  UPPER(first_name) from worker;

-- write an sql query to fetch unique values of DEPARTMENT from worker table.
select distinct department from worker;
-- using group by
SELECT department from worker group by department;

-- write an sql query to print the first three characters of first name from workertable
-- Start from index 1 and I want 3 characters after that
select substring(first_name,1,3) from worker;

-- write an sql query to find the position of the alphabet ('b') int the fisrt name column 'Amitabh' from worker table
select INSTR(first_name,'B') from worker where first_name = 'Amitabh';

-- write an sql query to print thr First name from worker table after removing white spaces from the right side
select  RTRIM(first_name) from worker;
 
 -- write an sql query to print the department from worker table after removing white spaces from the left side
select LTRIM(department) from worker;

-- write sql query that fetches the unique values of department from worker table and print its length
select DISTINCT department , LENGTH(department) from worker;

-- write an sql query to print the first name from worker table after replacing 'a' with 'A'.
select REPLACE(first_name,'a','A') from worker;

-- write an sql query tp print the fisrt name and last name from worker table into a single column COMPLETE_NAME
-- a space char should separate them
select CONCAT(first_name,'', last_name) as COMPLETE_NAME from worker;

-- write an sql query to print all worker details from the worker table order by first_name ascending
select * from worker ORDER BY first_name;

-- write an sql query to print all worker details from the worker table order by
-- first name ascending and department descending
select * from worker ORDER BY first_name, department DESC;

-- write an sql query to print details for workers with the first name as "Vipul" and "Satish" from worker table
select * from worker WHERE first_name IN ('Vipul','Satish');

-- write an sql query to print details of workers excluding first names , "Vipul" and "Satish" from worker table
select * from worker Where first_name NOT IN ('VIPUL','SATISH');

-- write an sql query to print details of workers with department name as "ADMIN*"
select * from worker where department LIKE 'ADMIN%';

-- write an sql query to print details of workers whose first_name contains 'a';
select * from worker where first_name like '%a%';

-- write an sql query to print details of workers whose first_name ends with 'a';
select * from worker where first_name like '%a';

-- write an sql query to print details of the workers whose salary lies between 100000 and 500000;
select * from worker Where salary between 100000 and 500000;

-- write an sql query to print details of workers whose first_name end with 'h' and contains six alphabets
select * from worker where first_name like '_____h';

-- write an sql query to print details of workers who have joined in Feb'2014.
select * from worker where joining_date like '%14-02%';
select * from worker where YEAR(joining_date)=2014 and MONTH(joining_date)=02;

-- write an sql query to fetch the count of empolyees working in the department 'ADMIN';
select department, COUNT(*) from worker where department='ADMIN';

-- write an sql query to fetch worker full names with salaries >=50000 and <=100000
select CONCAT(first_name,'',last_name),salary from worker where salary
between 50000 and 100000;

-- write an sql query to fetch the number of worker for each department in the decreasing order
select department,COUNT(worker_id) as no_of_worker from worker group by department order by no_of_worker DESC;

-- write an sql query to print details of the workers who are also managers
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title ='Manager';

-- write an sql query to fetch number (more than 1) of different titles in temp;
select worker_title , COUNT(*) from Title group by worker_title having COUNT(*)>1;

-- write an sql query to show only odd rows from a table
select * from worker where MOD (WORKER_ID,2)!=0;

-- write an sql query to show only even rows from a table
select * from worker where MOD (WORKER_ID,2)=0;

-- write an sql query to clone a new table from another table
create table worker_clone LIKE worker;
INSERT INTO worker_clone select * from worker;
select * from worker_clone;

-- write an sql query to fetch intersecting records of two tables;
select worker.* from worker inner join worker_clone using(worker_id);

-- write an sql query to show records from one table that another table does not have;
select worker.* from worker left join worker_clone using(worker_id) where worker_clone.worker_id is NULL;

-- write an sql query to show current date and time;
-- done with the help of dual tables
select curdate();
select now();

-- write an sql query to show the top n (say 5)records of a table order by descending order
select * from worker order by salary desc LIMIT 5;

-- write an sql query to determine the nth (say n=5) highest salary from a table
select w1.salary from worker as w1 where 5=(select count(w2.salary) from worker as w2 where w2.salary>=w1.salary);
select * from worker order by salary desc LIMIT 4,1;

-- write an sql query to determine the 5th highest salary without using LIMIT keyword
select salary from worker w1
where 5 = (
select COUNT((w2.salary)) 
from worker w2
where w2.salary>=w1.salary
);

-- write an sql query to fetch the list of employees with the same salary;
select * from worker w1 , worker w2 where w1.salary=w2.salary and w1.worker_id !=w2.worker_id;

-- write an sql query to show the second highest salary from table using subquery
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- write an sql query to show one row twice in results from a table
select * from worker
UNION  ALL
select * from worker ORDER BY worker_id;

-- write an sql query to list worker_id who does not get bonus
select worker_id from worker w LEFT JOIN BONUS b 
on worker_id=worker_ref_id
where b.worker_ref_id is null;
-- second way
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);

-- write an sql query to fetch the first 50% records from table
select * from worker where worker_id <= (select count(worker_id)/2 from worker);

-- write an sql query to fetch departments that have less than 4 people in it;
select department, count(worker_id) from worker group by department having count(worker_id)<4;

-- write an sql query to show all departments along with the number of people in it
select department, count(worker_id) as count from worker group by department;

-- write an sql query to show the last record from a table
select * from worker where worker_id = (select count(worker_id) from worker);

-- write an sql query to fetch the fisrt row of a table
select * from worker where worker_id = (select min(worker_id) from worker);

-- write an sql query to fetch the last five records from a table.
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- write an sql query to print the name of employees having the highest salry from each department;
select CONCAT(first_name,' ', last_name) as name , salary, department from worker where salary in (select max(salary) from worker group by department);

-- write an sql query to fetch the three max salaries from a table using corelated subquery
select distinct salary from worker w1 
where 3 >=(select count(distinct salary) from worker w2 where w1.salary<=w2.salary) order by salary desc;


-- write an sql query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker w1 
where 3 >=(select count(distinct salary) from worker w2 where w1.salary>=w2.salary) order by salary desc;

-- write an sql query to fetch nth max salaries from a table;
select distinct salary from worker w1 
where n >=(select count(distinct salary) from worker w2 where w1.salary<=w2.salary) order by salary desc;

-- write an sql query to fetch departments along with the total salaries paid for each of them
select department , sum(salary) as depSal from worker group by department order by depSal;

-- write an sql query to fetch the names of workers who earn the highest salary
select first_name ,salary from worker where salary = (select max(salary) from worker);
