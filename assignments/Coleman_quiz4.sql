-- Tyler Coleman

-- 1
SELECT dept_name, AVG(salary)
FROM instructor
GROUP BY dept_name
HAVING avg(salary) >= 80000
ORDER BY avg(salary) DESC;

-- 2 
SELECT building, room_number, capacity
FROM classroom
WHERE capacity = (SELECT max(capacity) from classroom);

-- 3
SELECT building, room_number, capacity
FROM classroom
WHERE building LIKE 'P%' and capacity >= 25;

-- 4 
SELECT DISTINCT(name)
from student NATURAL JOIN takes NATURAL JOIN 
(SELECT course_id
FROM teaches, instructor
where teaches.id = instructor.id and name = 'Srinivasan') as t;

-- 5 
SELECT COUNT(name) as "Num_Einstein's_Advisees"
FROM student, (SELECT i_id, s_id 
                FROM (SELECT name, id FROM instructor) as i NATURAL JOIN advisor 
				WHERE name = 'Einstein' and i.ID = advisor.i_ID) as tmp
WHERE student.id = tmp.s_id;

-- 6 
SELECT DISTINCT(name)
from takes as a, takes as b NATURAL JOIN student
where a.semester = 'Fall' and a.year = 2009
and b.semester = 'Spring' and b.year = 2010
and a.ID = b.ID
ORDER BY name;

-- 7 
SELECT name
FROM instructor, teaches
where (instructor.id = teaches.id and semester = 'Fall' and year = 2009)
UNION 
SELECT name
FROM instructor, teaches
where (instructor.id = teaches.id and semester = 'spring' and year = 2010)
ORDER BY name;

-- 8
SELECT title
FROM section NATURAL JOIN course
where (semester = 'Fall' and year = 2009) 
and section.course_id NOT IN 
(SELECT section.course_id from course, section where semester = 'Spring' and year = 2010);

-- 9
SELECT dept_name, COUNT(name)
from (SELECT dept_name, name
	  FROM department NATURAL JOIN student) as a
GROUP BY dept_name
ORDER BY dept_name;

-- 10
SELECT course_id, title
from (SELECT DISTINCT(time_slot_id) 
      FROM time_slot 
      where (day = 'M' or day = 'W' or day = 'F')
      and start_hr = 8) as ts NATURAL JOIN section NATURAL JOIN course;

-- 11
SELECT course_id
from course
where credits = 4 and dept_name != "Comp. Sci.";

-- 12
SELECT DISTINCT(name), course_id, grade
from takes, student
where grade like "A%"
and takes.ID = student.ID
ORDER BY course_id, name;

-- 13
SELECT grade, count(ID) as "Num_students"
FROM takes
GROUP BY grade
HAVING grade IS NOT NULL;

-- 14
SELECT name
FROM (SELECT min(tot_cred) as "min_elec_cred"
      FROM student
      WHERE dept_name = "Elec. Eng.") as a, student
WHERE student.tot_cred > a.min_elec_cred
ORDER BY name;

-- 15
SELECT time_slot_id, COUNT(DISTINCT(course_id)) as "Num_sections_scheduled"
FROM section NATURAL JOIN time_slot
GROUP BY time_slot_id;

-- 16
SELECT DISTINCT(name)
FROM student, takes
where student.id NOT IN (SELECT ID from takes);

-- bonus
SELECT substr(grade,1,1) as a, count(ID)
FROM takes
GROUP BY substr(grade,1, 1)
HAVING a IS NOT NULL;