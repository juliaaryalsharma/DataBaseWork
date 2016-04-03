-- File name Jaryalsharma4.sql 
-- Julia Aryal Sharma 

USE SIS;

--1.
PRINT '*** QUESTION1 ***'
PRINT ''

DELETE FROM Person
WHERE firstName = 'Indu' AND lastName = 'Taneja'; 

DELETE FROM Course
WHERE number = 'BUS1070' OR number = 'LIBS1010'; 
			
--2.
PRINT '*** QUESTION2 ***'
PRINT ''

SELECT c.number, c.name, c.hours, c.credits
FROM Course c
WHERE c.number IN (SELECT courseNumber 
					FROM ProgramCourse pc
					WHERE pc.semester = 1 AND programCode IN (SELECT code
										  FROM  Program p
										  WHERE p.acronym = 'ITID'))
ORDER BY c.number ASC;

--3.
PRINT '*** QUESTION3 ***'
PRINT ''

SELECT p.number, p.firstName, p.lastName
FROM Person p
WHERE p.number IN (SELECT studentNumber
					FROM Payment pa
					WHERE amount > 1000.00 AND pa.paymentMethodId IN (SELECT id
																	  FROM PaymentMethod pm
														              WHERE explanation = 'Cash' OR explanation = 'Certified Cheque'))
ORDER BY p.lastName; 
                 
--4.
PRINT '*** QUESTION4 ***'
PRINT ''

SELECT p.firstName, p.lastName
FROM Person p
WHERE p.number IN ( SELECT s.number
					FROM Student s
					WHERE isInternational = '1' AND s.number IN (SELECT studentNumber
																FROM StudentProgram sp
																WHERE programCode IN (SELECT code 
																						FROM Program p
																						WHERE credentialCode = 'OCGC')))
ORDER BY lastName; 

--5.
PRINT '***QUESTION5 ***'
PRINT ''

INSERT INTO Person([number]
					,[lastName]
					,[firstName]
					,[street], [city]
					,[provinceCode]
					,[countryCode]
					,[postalCode]
					,[mainPhone]
					,[alternatePhone]
					,[collegeEmail]
					,[personalEmail]
					,[birthdate])
 VALUES (7424476
		,'TANEJA'
		,'INDU'
		,'FLAT NO. 100 TRIVENI APARTMENTS PITAM PURA' 
		,'NEW DELHI'
		,NULL
		,'IND'
		,'110034'
		,'0141-6610242'
		,'94324060195'
		,'iteneja@conestogac.on.ca'
		,'iteneja@bsnl.co.in'
		,'1989-10-07' );

 SELECT *
 FROM Person
 WHERE number = 7424476; 

--6.
PRINT '*** QUESTION6 ***'
PRINT ''

INSERT INTO Student([number]
	  ,[isInternational]
      ,[academicStatusCode]
      ,[financialStatusCode]
      ,[sequentialNumber]
      ,[balance]
      ,[localStreet]
      ,[localCity]
      ,[localProvinceCode]
      ,[localCountryCode]
      ,[localPostalCode]
      ,[localPhone])
VALUES ( 7424476
	  ,1
      ,'N'
      ,'D'
      ,0
      ,1130
      ,'442 GIBSON ST N'
      ,'KITCHENER'
      ,'ON'
      ,'CAN'
      ,'N2M 4T4'
      ,'(226) 147-2985' ) 

SELECT number, isInternational,  academicStatusCode, financialStatusCode, sequentialNumber , balance 
FROM Student
WHERE number = 7424476;

SELECT localStreet
FROM Student
WHERE number = 7424476;

SELECT localCity, localPostalCode
FROM Student
WHERE number = 7424476;

--7.
PRINT '*** QUESTION7 ***'
PRINT ''

SELECT *
FROM Program; 
	  
INSERT INTO StudentProgram([studentNumber]
      ,[programCode]
      ,[semester]
      ,[programStatusCode])
VALUES ( 7424476
			   ,'0066C'
			   ,1
			   ,'A') 

SELECT studentNumber, programCode, semester, programStatusCode
FROM StudentProgram
WHERE studentNumber = 7424476;


--8.
PRINT '*** QUESTION8 ***'
PRINT ''

INSERT INTO CourseStudent ([CourseOfferingId]
					,[studentNumber]
					,[finalMark] )
VALUES ( 6
		,7424476
		,0 )

SELECT courseOfferingId, studentNumber, finalMark
FROM CourseStudent
WHERE studentNumber = 7424476; 


--9.
PRINT '*** QUESTION9 ***'
PRINT ''

INSERT INTO Course( [number]
      ,[hours]
      ,[credits]
      ,[name]
      ,[frenchName] )
VALUES ('LIBS1010'
			,45
			,3
			,'Critical Thinking Skills' 
			,'Pensée Critique' )

--10.
PRINT '*** QUESTION10 ***'
PRINT ''

INSERT INTO Course
VALUES ( 'BUS1070'
		 ,45
		 ,3
		 ,'Introduction To Human Relations'
		 ,'Introduction aux relations humaines' )
	

--11.
PRINT '*** QUESTION11 ***'
PRINT ''

SELECT *
FROM IncidentalFee;

UPDATE IncidentalFee SET amountPerSemester = 100
WHERE id = 5; 

SELECT *
FROM IncidentalFee;

BEGIN TRANSACTION; 
UPDATE IncidentalFee SET amountPerSemester = 150
WHERE id = 5; 
ROLLBACK;
	 
SELECT amountPerSemester
FROM IncidentalFee
WHERE id = 5; 

--12.
PRINT '*** QUESTION12 ***'
PRINT ''

BEGIN TRANSACTION; 
UPDATE IncidentalFee SET amountPerSemester = 200
WHERE id = 5; 
COMMIT;

SELECT amountPerSemester
FROM IncidentalFee
WHERE id = 5; 
