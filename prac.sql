SHOW TABLES;
DESC Departments;
DESC Students;
DESC Courses;

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;

SELECT course_name
FROM courses;

SELECT course_name, credits
FROM courses;

select * from departments;

select department_name from departments;

select department_name , hod_name from departments;

select course_name , credits from courses;

select * from courses;

SELECT *
FROM courses
WHERE credits = 4;

SELECT *
FROM courses
WHERE course_name = 'Database Systems';

SELECT *
FROM courses
WHERE credits > 3;

SELECT *
FROM departments
WHERE department_id = 2;

SELECT *
FROM courses
WHERE credits = 3;

SELECT course_name
FROM courses
WHERE credits = 4;

-- SELECT what_you_want
-- FROM which_table
-- WHERE condition;

select * from courses where course_id <= 5;

select course_name , credits from courses where credits > 3;


-- AND , OR , NOT -- 
SELECT *
FROM courses
WHERE credits > 3
AND course_id > 2;

select * from courses where credits = 4 AND course_id > 5;

select * from courses where credits = 3 OR course_id = 5 ;

select * from courses where credits > 3 AND course_id <=5;

select * from courses where not credits=4;

select * from courses;

select * from courses where credits = 4 AND course_id > 3 AND course_id < 10;

-- in --
-- Show all courses where credits is 3 or 4 --
select * from courses where credits in(3,4);

-- Show all courses where course_id is 1, 3, or 5 --
select * from courses where course_id in(1,3,5);

-- Show only course_name and credits where credits is 2, 3, or 4 --
select course_name , credits from courses where credits in(2,3,4);

-- Show all courses where course_id is NOT 1, 2, or 3.--
select * from courses where course_id not in(1,2,3);

-- Show course_name, course_id, and credits where:
-- credits is 3 or 4
-- AND course ID is greater than 3

select * from courses where credits in(3,4) and course_id > 3;

-- between--
-- Show all courses where course_id is between 3 and 7.--
select * from courses where course_id between 3 and 7;

-- Show only course_name and course_id where course_id is between 2 and 5--
select course_name , course_id from courses where course_id between 2 and 5;

-- Show all courses where credits is between 2 and 4--
select  * from courses where credits between 2 and 4;

-- Show course_name and credits where credits is between 3 and 4-- 
select course_name, credits from courses where credits between 3 and 4;

-- Show courses where course_id is between 4 and 8 -- 
select * from courses where course_id between 4 and 8;

-- show course_name, course_id, credits where:
-- course_id is between 3 and 10
-- AND
-- credits is 3 or 4

select course_name, course_id from courses where course_id between 3 and 10 AND credits in (3,4);

-- like --
-- Show all courses whose course_name starts with D.--
select * from courses where course_name like 'D%';

-- Show all courses whose course_name ends with s.--
select * from courses where course_name like '%s';

-- Show all courses whose course_name contains Data.--
select * from courses where course_name like '%data%';

-- Show only course_name and credits where the course name starts with C.--
select * from courses where course_name and credits like 'c%';

-- Show all courses whose course name does NOT start with D.--
select * from courses where course_name not like 'd%';

-- Show course_name, course_id, and credits where:
-- course name contains Data
-- AND credits are 3 or 4

select course_name, course_id, credits
from courses
where course_name like '%Data%'
and credits in (3, 4);

-- Try to find courses whose name starts with J using _. --
select *
from courses
where course_name like 'J____';

-- order by--
-- Show all courses sorted by course_id from lowest to highest.--
select *
from courses
order by course_id asc;

-- Show all courses sorted by course_id from highest to lowest.--
select *
from courses
order by course_id desc;

-- Show course_name and credits, sorted by credits from highest to lowest.--
select course_name , credits from courses  order by credits desc;

-- Show all courses where credits = 4, sorted by course_id from lowest to highest.--
select * from courses where credits=4 order by course_id asc;

-- Show all courses whose name starts with D, sorted alphabetically A → Z.--
select *
from courses
where course_name like 'D%'
order by course_name asc;

-- show: course_name, course_id, credits,, where:credits IN (3, 4),, and sort the result by: credits → highest to lowest, course_id → lowest to highest
select course_name, course_id, credits
from courses
where credits in (3, 4)
order by credits desc, course_id asc;

-- GROUP BY--

select credits
from courses
group by credits;

-- AGGREGATE FUNCTION--
select COUNT(*)
from courses;

select * from courses;

select sum(credits)
from courses;

select avg(credits)
from courses;

select min(credits)
from courses;

select max(credits)
from courses;

-- Find the total number of courses.--
select count(*)
from courses;

select count(*), sum(credits), avg(credits), min(credits), max(credits) from courses;
SELECT 
    COUNT(*) AS total_courses,
    SUM(credits) AS total_credits,
    AVG(credits) AS average_credits,
    MIN(credits) AS minimum_credits,
    MAX(credits) AS maximum_credits
FROM courses;

select credits, COUNT(*)
from courses
group by credits;

-- Show each different credits group.--
select credits
from courses
group by credits;

-- Show the number of courses for each credits value.--
select credits,count(*)
from courses
group by credits;

-- Show the total credits for each credits value.--
select credits,sum(credits)
from courses
group by credits;

-- Show the average credits for each credits value.--
select credits,avg(credits)
from courses
group by credits;

-- Show the minimum credits for each credits value.--
select credits,min(credits)
from courses
group by credits;

-- Show the maximum credits for each credits value.--
select credits,max(credits)
from courses
group by credits;

-- Consider only courses where coure_id > 3, then show the number of courses for each credits value.--
select credits, count(*) as Total
from courses
where course_id>3
group by credits;

-- DISTINCT--



CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    student_id INT
);

INSERT INTO courses (course_id, course_name, credits, student_id)
VALUES
(1, 'Database Systems', 4, 101),
(2, 'Java', 3, 102),
(3, 'Database Systems', 4, 101),
(4, 'Python', 3, 103),
(5, 'Java', 3, 102),
(6, 'Computer Networks', 4, 104),
(7, 'Database Systems', 4, 105),
(8, 'Python', 3, 103),
(9, 'Operating Systems', 4, 106),
(10, 'Java', 3, 107);

SELECT *
FROM courses;


select course_name,count(*) from courses group by course_name having count(*) >=2;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Courses VALUES
(1,'Database Systems',4,101),
(2,'Operating Systems',4,102),
(3,'Computer Networks',3,103),
(4,'Data Structures',4,104),
(5,'Java Programming',4,105),
(6,'Python Programming',3,106),
(7,'Machine Learning',4,107),
(8,'Artificial Intelligence',4,108),
(9,'Cloud Computing',3,109),
(10,'Web Development',3,110),
(11,'Cyber Security',4,111),
(12,'Software Engineering',3,112),
(13,'DBMS Lab',2,113),
(14,'Linux',2,114),
(15,'Data Analytics',4,115),
(16,'Mobile App Development',3,116),
(17,'Computer Graphics',3,117),
(18,'Big Data',4,118),
(19,'IoT',3,119),
(20,'Compiler Design',4,120);

-- DISTINCT--

SELECT DISTINCT credits
FROM courses;
-- Show all unique course names.
select distinct course_name
from courses;

-- Show all unique credit values.
select distinct credits
from courses;

-- Show all unique student IDs.
select distinct student_id
from courses;

-- Show the unique combinations of: course_name + credits
select distinct course_name, credits
from courses;

-- Show the unique combinations of:course_name + student_id
select distinct course_name, student_id
from courses;

 -- Show unique course names where: credits = 4
 select distinct course_name,credits from courses where credits=4;
 
 -- Show unique student IDs for students taking courses with: credits = 3
select distinct student_id,credits from courses where credits=3;

-- Show unique: course_name + credits  where credits are 3 or 4.
select course_name, credits from courses where credits in(3,4);

-- ALIAS--

select course_name as CodingGita
from courses;
	
-- LIMIT WITH ORDER BY--
SELECT *
FROM courses
ORDER BY course_id DESC
LIMIT 3;

-- UNION--
SELECT course_name as UNIONexample
FROM courses
UNION
SELECT department_name
FROM departments;

select * from departments;

-- IS NULL / IS NOT NULL--
SELECT *
FROM courses
WHERE student_id IS NULL; 

SELECT *
FROM courses
WHERE student_id IS NOT NULL;

-- JOIN--
SELECT columns
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;

select students.student_name, departments.department_name
from students
inner join departments
on students.department_id = departments.department_id;

-- Show the student name and department name for every student whose department matches a department in the departments table.--
select students.student_name, departments.department_name
from students
inner join departments
on students.department_id = departments.department_id;

-- Show the student name and course name.--
select students.student_name, courses.course_name
from students
inner join courses
on students.student_id = courses.student_id;

-- Show the student_name and department_name.--
select students.student_name, departments.department_name
from students
inner join departments
on students.department_id = departments.department_id;

-- Show the student_name and course_name.--
select s.student_name, c.course_name
from students as s
inner join courses as c
on s.student_id = c.student_id;

-- Show the student name and course name for courses where credits = 4.--
select s.student_name, c.course_name, c.credits
from students as s 
inner join courses as c
on s.student_id = c.student_id
where c.credits=4;

-- Show the student name, course name, and marks for students whose marks are greater than 70.--
select s.student_name, c.course_name, s.marks
from students as s 
inner join courses as c
on s.student_id = c.student_id
where s.marks>70;

-- Show student_name, course_name, and marks where: marks are greater than 70 ,, AND course credits are 4--
select s.student_name, c.course_name, s.marks, c.credits
from students as s 
inner join courses as c
on s.student_id = c.student_id
where s.marks>70 AND c.credits = 4;

-- Show: student_name,, course_name,, department_name.
select s.student_name , c.course_name, d.department_name
from students as s 
inner join courses as c
on s.student_id = c.student_id 
inner join departments as d 
on s.department_id = d.department_id;

-- Show student_name, course_name, and marks for students whose marks are greater than 70, and sort the result by marks from highest to lowest.--
select s.student_name, c.course_name, s.marks
from students as s
inner join courses as c
on s.student_id = c.student_id
where s.marks > 70
order by s.marks desc;

-- Show student_name, course_name, and department_name for students who have marks greater than 70.--
select s.student_name, c.course_name, d.department_name
from students as s
inner join courses as c
on s.student_id = c.student_id
inner join departments as d
on s.department_id = d.department_id
where s.marks > 70;

-- Show student_name, course_name, and department_name for students whose marks are greater than 70 AND credits are 4.
select s.student_name, c.course_name, d.department_name
from students as s
inner join courses as c
on s.student_id = c.student_id
inner join departments as d
on s.department_id = d.department_id
where s.marks > 70
and c.credits = 4;

-- Show student_name, course_name, department_name, and marks for students who: have marks greater than 60,, AND credits are 3 or 4,, Sort the result by marks from highest to lowest.

select s.student_name, c.course_name, d.department_name, marks
from students as s
inner join courses as c
on s.student_id = c.student_id
inner join departments as d
on s.department_id = d.department_id
where s.marks > 60
AND c.credits in (3,4)
order by s.marks desc;

-- Show all students and their course names, including students who don't have a course.
select student_name, course_name 
from students as s
left join courses as c
on s.student_id = c.student_id;

-- Show the students who do NOT have any course.
select student_name 
from students as s
left join courses as c
on s.student_id = c.student_id
where c.course_name is null;

-- FULL OUTER JOIN--
-- Show all students and all courses. If a student has a matching course, show them together. Also include students without courses and courses without students.--
select s.student_name , c.course_name 
from students as s
left join courses as c
on s.student_id= c.student_id
UNION
select s.student_name , c.course_name 
from students as s
right join courses as c
on s.student_id= c.student_id;

-- Show all students and all courses, but display student_name, course_name, and student_id.--
select s.student_name, c.course_name, s.student_id
from students as s
left join courses as c
on s.student_id = c.student_id
UNION
select s.student_name, c.course_name, s.student_id
from students as s
right join courses as c
on s.student_id = c.student_id;

-- new table--
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, manager_id)
VALUES
(1, 'Rahul', NULL),
(2, 'Jay', 1),
(3, 'Amit', 1),
(4, 'Raj', 2),
(5, 'Neha', 2);

SELECT * FROM employees;

-- Show the employee name and their manager name.--
SELECT e.employee_name AS emp,
       m.employee_name AS man
FROM employees AS e
JOIN employees AS m
ON e.manager_id = m.employee_id;

-- Show the employee name and their manager's employee ID.--
select e.employee_name as emp,
m.employee_id as man
from employees as e
join employees as m
on e.manager_id = m.employee_id;

