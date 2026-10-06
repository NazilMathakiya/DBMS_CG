-- PostgreSQL Window Functions
-- CodingGita Semester 3 DBMS

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(50),
    marks INT
);

INSERT INTO students (student_name, course, marks)
VALUES
('Motu', 'Python', 85),
('Patlu', 'Python', 72),
('Raju', 'MERN', 90),
('Shyam', 'MERN', 65),
('Ravi', 'MERN', 78),
('Anjali', 'Python', 95),
('Neha', 'Java', 88),
('Amit', 'Java', 75);

SELECT * FROM students;

SELECT
    student_name,
    marks,
    AVG(marks) OVER() AS average_marks
FROM students;