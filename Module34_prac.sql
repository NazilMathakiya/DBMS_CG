CREATE OR REPLACE PROCEDURE add_student(
    p_name VARCHAR,
    p_course VARCHAR,
    p_marks INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO students(student_name, course, marks)
    VALUES (p_name, p_course, p_marks);
END;
$$;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(50),
    marks INT
);

INSERT INTO students (student_name, course, marks)
VALUES
('Motu', 'Python', 86),
('Patlu', 'Python', 70),
('Raju', 'MERN', 90),
('Shyam', 'MERN', 65);