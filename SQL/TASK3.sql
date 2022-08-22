use uni;


-- Task 1: BETWEEN TWO NULLS
-- Obtain a list of applications where the CourseID is unknown
SELECT *
from Application
WHERE CourseAppliedFor IS null;

-- Obtain a list of students where their CourseID is not unknown
SELECT *
FROM student
WHERE CourseAppliedFor IS null;

-- Obtain a list of students whom were born in the month of June 2002
SELECT *
FROM student
WHERE year(DateOfBirth) = '2002' AND monthname(DateOfBirth) = 'June';

-- Obtain a list of applications where CourseID is unknown and the applications where made between 01/04/2020 and 31/07/2020
SELECT *
from Application
WHERE CourseAppliedFor IS null AND DateOfApplication > '2020-04-01' AND DateOfApplication < '2020-07-31';

-- Task 2: GROUPING FUNCTIONS
-- 1.Obtain the number of modules which are assigned to each course
SELECT Subject, count(ModuleID) 
from module
GROUP BY Subject;

-- 2. Retrieve Information on the number of successful applications per course
SELECT count(accepted), Subject
from module ,Application
WHERE Accepted = '1'
GROUP BY Subject;

-- 3. Find the average Membership Fee of Student Clubs by the ID of the Staff member(Lecturer) supervising it
SELECT avg(MembershipFee) as AvgMemFee,ClubName ,LecturerID
from club, lecturer
GROUP BY ClubName;

-- 4. Find the Sum total of Joining Fees for all active clubs by Staff Member supervising them
SELECT sum(JoiningFee) as TotalJoinFee, ClubName ,SupervisingStaff
from Club
WHERE Active = '1'
GROUP BY SupervisingStaff;


-- Task 3: ADVANCED JOINS
-- Obtain a list of all modules and the names of any courses they may be taught(include modules without courses)
SELECT ModuleName, CourseName,Course.CourseID
from module
LEFT JOIN Course
ON module.CourseID = Course.CourseID
ORDER BY CourseID;

-- Obtain a list of students along with any related application numbers if they have them
SELECT Student.*,application.applicationID
from application
LEFT JOIN Student
ON student.StudentID = application.StudentID;

-- Obtain the Class ID, Class Date and Feedback score of the latest class scheduled for each Class ID
SELECT schedule.ClassID, CDate,schedule.FeedbackScore
FROM schedule
INNER JOIN (
SELECT ClassID, MAX(CDate) as MxDate
FROM schedule
GROUP BY ClassID)a;




