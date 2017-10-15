-- Tyler Coleman

-- 1
INSERT INTO department values ("Athletics", "Packard", 50000);

-- 2
INSERT INTO events(title, eDate, location, dept_name) values("Women's Volleyball vs LLC","2017-10-11","D.L. Ligon Coliseum","Athletics");

-- 3
INSERT INTO events(title, eDate, location, dept_name) values("ACM Monthly Meeting","2017-10-11","BO 209","Comp. Sci.");

-- 4
-- You can specify the attribute eNumber if you want to even though it is auto increment.

-- 5
-- This will NOT execute because it violates the foreign key constraint dept_name because Art is not a department in the departments relation.

-- 6
-- This will execute.

-- 7
-- This will not execute because it violates the constraint that title and location must be unique values.

-- 8 
ALTER TABLE events DROP INDEX title;

-- 9
UPDATE events 
SET location = 'Bolin 209'
WHERE location = 'BO 209';

-- 10
create table actors(
AID int,
primary key (AID),
name varchar(40));

create table movies(
MID int,
primary key (MID),
title varchar(40));

create table actor_role(
AID int,
MID int,
primary key (AID,MID,rolename),
rolename varchar(40),
FOREIGN KEY (AID) REFERENCES actors(AID),
FOREIGN KEY (MID) REFERENCES movies(MID));

-- 11
INSERT INTO actors VALUES(100, "Charlie Chaplin");
INSERT INTO actors VALUES(101, "Tyler Coleman");
INSERT INTO actors VALUES(102, "Daniel Tomei");
INSERT INTO actors VALUES(103, "Donald Trump");
INSERT INTO actors VALUES(104, "Bingyang Wei");
INSERT INTO actors VALUES(105, "Richard Simpson");

INSERT INTO movies VALUES(1000, "That movie with Charlie Chaplin in it");
INSERT INTO movies VALUES(1001, "Why Java is the Best Prog. Language");
INSERT INTO movies VALUES(1002, "Why C++ is the Best Prog. Language");
INSERT INTO movies VALUES(1003, "Life of a College Kid");
INSERT INTO movies VALUES(1004, "Fast and Furious 157");

INSERT INTO actor_role VALUES (100, 1000, "The Clown");
INSERT INTO actor_role VALUES (100, 1000, "The Wise Guy");
INSERT INTO actor_role VALUES (101, 1000, "Stunt Double");
INSERT INTO actor_role VALUES (104, 1001, "Professor");
INSERT INTO actor_role VALUES (105, 1002, "Professor");
INSERT INTO actor_role VALUES (101, 1003, "Student");
INSERT INTO actor_role VALUES (103, 1004, "All Roles");
INSERT INTO actor_role VALUES (100, 1004, "Director");

-- 12
SELECT title, count(DISTINCT(rolename)) as 'Number of Roles'
FROM actors NATURAL JOIN movies NATURAL JOIN actor_role
GROUP BY name, title
HAVING actors.name = 'Charlie Chaplin';

-- 13
SELECT name 
FROM actors natural left JOIN actor_role
WHERE MID is null;

-- 14 
SELECT DISTINCT(name), title
FROM actors natural left JOIN actor_role NATURAL LEFT JOIN movies
GROUP BY name, title;
