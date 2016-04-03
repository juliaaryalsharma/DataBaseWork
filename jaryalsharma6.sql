-- File name Jaryalsharma6.sql
-- Julia Aryal Sharma

USE SIS;

SET ANSI_WARNINGS OFF;

--1.
PRINT '*** QUESTION1 ***'
PRINT ''

SELECT COUNT (schoolCode) AS 'Employees in the school of business'
FROM Employee
WHERE schoolCode ='BUS';

--2.
PRINT '*** QUESTION2 ***'
PRINT ''

SELECT  cs.studentNumber, cs.finalMark, p.firstName, p.lastName
FROM CourseStudent cs
INNER JOIN CourseOffering co ON cs.CourseOfferingId = co.id
INNER JOIN Person p ON cs.studentNumber = p.number
WHERE co.sessionCode = 'F09' AND co.courseNumber = 'PROG8080'
                            AND cs.finalMark > (SELECT avg(finalMark)
												FROM CourseStudent cs2
												WHERE cs2.CourseOfferingId = cs.CourseOfferingId
												GROUP BY CourseOfferingId)
												ORDER BY p.lastName ASC;

--3.
PRINT '*** QUESTION3 ***'
PRINT ''

SELECT co.courseNumber AS 'Course', MIN(cs.finalMark) AS 'Lowest Mark' ,ROUND( AVG(cs.finalMark),0) AS 'Average Mark' , MAX(cs.finalMark) AS 'Maximun Mark'
FROM CourseOffering co INNER JOIN CourseStudent cs ON (co.id = cs.CourseOfferingId)
WHERE co.sessionCode = 'F10'
GROUP BY co.CourseNumber;

--4.
PRINT '*** QUESTION4 ***'
PRINT ''

SELECT a.studentNumber, p.firstName, p.lastName
FROM Audit a INNER JOIN Person p ON (a.studentNumber =p.number)
GROUP BY a.studentNumber, p.firstName, p.lastName
HAVING SUM(a.amount) < (SELECT AVG(a1.amount)
						FROM Audit a1);

--5a.
PRINT '*** QUESTION5a ***'
PRINT ''

SELECT co.employeeNumber, p.firstName, p.lastName, COUNT(co.courseNumber) AS 'Courses Taught'
FROM Person p INNER JOIN Employee e ON (p.number = e.number)
			  INNER JOIN CourseOffering co ON (p.number = co.employeeNumber)
WHERE e.schoolCode='EIT' AND (co.sessionCode LIKE '%08' OR co.sessionCode LIKE '%09')
GROUP BY co.employeeNumber, p.firstName, p.lastName
ORDER BY p.lastName;

--5b.
PRINT '*** QUESTION5b ***'
PRINT ''

SELECT e.number, p.firstName, p.lastName, COUNT(co.id) AS 'Courses Taught'
FROM Employee e LEFT OUTER JOIN Person p ON (e.number = p.number)
			  LEFT OUTER JOIN CourseOffering co ON (e.number = co.employeeNumber)
WHERE e.schoolCode='EIT' AND (co.sessionCode LIKE '%08' OR co.sessionCode LIKE '%09' OR co.sessionCode is NULL)
GROUP BY e.number, p.firstName, p.lastName
ORDER BY p.lastName;

--6.
PRINT '*** QUESTION6 ***'
PRINT ''

SELECT p.acronym, p.name, FORMAT(SUM(pf.tuition + (pf.tuition *pf.coopFeeMultiplier)), 'C', 'en-ca') AS 'Total Fees'
FROM Program p INNER JOIN ProgramFee pf ON (p.code = pf.code)
WHERE p.code LIKE '%C'
GROUP BY p.acronym,p.name
ORDER BY p.acronym;

--7.
PRINT '*** QUESTION7 ***'
PRINT ''

SELECT pn.firstName, pn.lastName, p.studentNumber, FORMAT(sum(p.amount), 'C', 'en-ca') as 'Fee Payment Total'
FROM Payment p INNER JOIN Person pn ON p.studentNumber = pn.number
GROUP BY p.studentNumber, pn.firstName, pn.lastName
HAVING sum(p.amount) >= (select 3*avg(amount) from Payment)
ORDER BY pn.lastName;

SET ANSI_WARNINGS ON;
