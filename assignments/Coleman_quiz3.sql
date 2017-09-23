-- Tyler Coleman

SELECT title FROM course WHERE credits = 4;

SELECT DISTINCT title from course NATURAL JOIN instructor NATURAL JOIN teaches where instructor.name = 'Brandt';

SELECT DISTINCT name from course NATURAL JOIN instructor NATURAL JOIN teaches where year = '2009';

SELECT title from student NATURAL JOIN takes NATURAL JOIN course where name = 'Shankar';

SELECT student.name, instructor.name 
FROM student, advisor, instructor 
WHERE advisor.i_ID = instructor.ID and student.ID = advisor.s_ID 
ORDER BY student.name, instructor.name;

-- INSERT INTO course value ('CS-423', 'Database Management Systems', 'Comp. Sci.', '3');

SELECT course_id, title from course where RIGHT(course_id, 3) > 300;

SELECT COUNT(room_number) FROM classroom WHERE building = 'Watson';

SELECT dept_name FROM department where budget = (SELECT max(budget) FROM department);

SELECT sum(salary) FROM instructor;

