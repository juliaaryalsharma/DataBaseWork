-- File name Jaryalsharma3.sql
-- Julia Aryal Sharma

USE SIS;

--1.
PRINT '*** QUESTION1 ***'
PRINT ''

SELECT cp.prerequisiteNumber, c.name
FROM CoursePrerequisiteAnd cp INNER JOIN Course c
			ON (cp.prerequisiteNumber = c.number)
			WHERE cp.courseNumber='COMP2280'
			ORDER BY cp.prerequisiteNumber;

--2.
PRINT '*** QUESTION2 ***'
PRINT ''

SELECT e.number, p.firstName, p.lastname, e.schoolCode, e.extension
FROM Employee e INNER JOIN Person p
			ON (e.number = p.number)
			WHERE p.lastName LIKE 'W%'
			ORDER BY e.number ;

--3.
PRINT '*** QUESTION3 ***'
PRINT ''

SELECT p.number, p.firstName, p.lastName, p.city
FROM Person p LEFT OUTER JOIN Student s
			ON (p.number = s.number)
			WHERE s.number IS NULL
			ORDER BY p.lastname;

--4.
PRINT '*** QUESTION4 ***'
PRINT ''

SELECT s.product,s.uniqueId
FROM LabSoftware ls INNER JOIN Software s
					ON (ls.softwareUniqueId = s.uniqueId)
					INNER JOIN Room r
					ON ( ls.roomID = r.id)
					WHERE r.number ='2A205'
					ORDER BY s.product;

--5.
PRINT '***QUESTION5 ***'
PRINT ''

SELECT co.sessionCode, co.courseNumber, p.firstName, p.lastname, e.extension
FROM CourseOffering co INNER JOIN Person p
								ON (co.employeeNumber = p.number)
								INNER JOIN Employee e
								ON ( co.employeeNumber = e.number)
								WHERE sessionCode = 'F10'
								ORDER BY co.courseNumber;

--6.
PRINT '*** QUESTION6 ***'
PRINT ''

SELECT p.number,p.firstName, p.lastname, p.collegeEmail, p.personalEmail, so.notes
FROM Student s INNER JOIN StudentOffence so
						ON(s.number = so.studentNumber)
						INNER JOIN Person p
						ON ( so.studentNumber = p.number)
						ORDER BY p.number;

--7.
PRINT '*** QUESTION7 ***'
PRINT ''

SELECT e1.number AS 'Employee', e1.reportsTo AS 'Employee Reports To', e2.reportsTo AS 'Supervisor Reports To'
FROM Employee e1 LEFT OUTER JOIN Employee e2
					ON (e1.reportsTo = e2.number)
					ORDER BY e1.number;

--8.
PRINT '*** QUESTION8 ***'
PRINT ''

SELECT LOWER (LEFT( p.firstName,1) + LEFT(p.lastName, 7)) AS 'User Id' , e.schoolCode, e.extension
FROM Person p INNER JOIN Employee e
					ON(p.number = e.number)
					WHERE LEFT (p.lastName, 1) = 'P'
					ORDER BY 'USER ID' ASC;

--9.
PRINT '*** QUESTION9 ***'
PRINT ''

SELECT c.number, c.hours, c.credits, c.name
FROM Course c LEFT OUTER JOIN CourseOffering co
				ON ( c.number = co.courseNumber)
				WHERE sessionCode IS NULL AND CHARINDEX ('Programming', name) > 0
				ORDER BY c.number;
