use uni; 

-- Count how students are enrolled overall
SELECT COUNT(ClassID)
FROM class;   

-- Calculate the sum of full time fees for every full-time course
SELECT sum(FullTimeFee)
FROM fees;

-- Identify the cost of the least and most expensive course
select min(FullTimeFee) as LeastExpensive, max(FullTimeFee) as MostExpensive
from fees;

-- Calculate the average cost of all part time courses
SELECT AVG(PartTimeFee)
FROM fees;

-- Calculate the fee of each full time course after applying (subtracting) the scholarship discount
SELECT (FullTimeFee-ScholarshipDiscount) as TotalFees_After_Scholarship
FROM fees; 

-- Select only the course number of the cheapest full-time course
SELECT min(FullTimeFee),CourseID
FROM Fees;

-- Find cost of the most expensive course after applying the scholarship discount
SELECT max(FullTimeFee - ScholarshipDiscount) as ExpensiveCourse_After_Scholarship_Discount
from fees;

-- Count the number of applications for History courses made between 01/03/2020 and 30/08/2020
SELECT count(CourseAppliedFor=11)
FROM application
WHERE DateofApplication between '01/03/2020' and '30/08/2020';





-- Task 2: DATABASE FUNCTIONS

-- Write a select statement to obtain all of the student information for successful applications made for Course 11 which do not relate to current students
SELECT *
FROM Application
WHERE accepted = 1 AND CourseAppliedFor = 11 AND StudentID = 0;

-- Modify the select statement from the previous example into an insert statement and insert the data into the student table
INSERT INTO Student(CourseID,Forenames,Surname,EmailAddress)
SELECT CourseAppliedFor, Forenames,Surname,EmailAddress
FROM application
WHERE accepted = 1 AND CourseAppliedFor = 11 AND StudentID = 0;

-- Write a select statement to obtain all the information for the unsuccessful applications made for Course 11
SELECT * 
FROM Application
WHERE accepted = 0 and CourseAppliedFor = 11;


-- Modify the select statement from the previous example into a delete statement and delete the unsuccessful Course 11
DELETE FROM Application
WHERE CourseAppliedFor = 11 AND accepted = 0;

-- Write a select statement to identify the unsuccessful applications for course 1 made after 01/08/2020
select *
from Application
where accepted = 1 AND CourseAppliedFor = 1 AND DateOfApplication > '2020-08-01';

-- Using the select statement from the previous example, modify it into an update statement and update the applications to successful
UPDATE Application
SET accepted = 1
where accepted = 0 AND CourseAppliedFor = 1 AND DateOfApplication > '2020-08-01';

-- Roll back the previous update
ROLLBACK;

-- Modify the previous update to include applications for economics courses made after 01/09/2020
UPDATE Application
SET accepted = 1
where accepted = 1 AND CourseAppliedFor = 1 AND DateOfApplication > '2020-09-01';



-- TASK 3 - STRETCH AND CHALLENGE - INNER JOINS

-- Obtain a list of Students and the name of the Courses they are studying
SELECT Coursename, Forenames,Surname
from Course
INNER JOIN Student
ON Student.CourseID = course.CourseID;

-- Obtain a list of course names, full time fees and part time fees for each course
select PartTimeFee,FullTimeFee,CourseName
from course
INNER JOIN fees
ON fees.CourseID = Course.CourseID;

-- Obtain a list of classIDs for the Economics Course and the modules they relate t
select ClassID, ModuleName
from class
INNER JOIN module
ON module.moduleID = module.ModuleID
WHERE CourseID = 1;


