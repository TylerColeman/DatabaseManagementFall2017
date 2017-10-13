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

--6
-- This will execute

-- 7
-- This will not execute because it violates the constraint that title and location must be unique values

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

