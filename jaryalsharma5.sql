-- File name Jaryalsharma5.sql
-- Julia Aryal Sharma

USE SIS;

--1.
PRINT '*** QUESTION1 ***'
PRINT ''

IF (EXISTS(SELECT *
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
Where CONSTRAINT_NAME = 'Produce_Catergory_FK'))
BEGIN
	ALTER TABLE Produce
    DROP CONSTRAINT Produce_Category_FK
END


--2.
PRINT '*** QUESTION2 ***'
PRINT ''

IF (EXISTS(SELECT *
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
Where CONSTRAINT_NAME = 'Produce_Commodity_FK'))
BEGIN
	ALTER TABLE Produce
    DROP CONSTRAINT Produce_Commodity_FK
END


--3.
PRINT '*** QUESTION3 ***'
PRINT ''

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'Produce')
DROP TABLE Produce;

--4.
PRINT '*** QUESTION4 ***'
PRINT ''

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'Category')
DROP TABLE Category;


--5.
PRINT '*** QUESTION5 ***'
PRINT ''

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'Commodity')
DROP TABLE Commodity;


--6.
PRINT '*** QUESTION6 ***'
PRINT ''

CREATE TABLE Category
(code NVARCHAR(4) NOT NULL
 ,meaning NVARCHAR(16) NOT NULL
 ,CONSTRAINT pk_CatergoryCode PRIMARY KEY CLUSTERED(code)
)

INSERT INTO Category (code, meaning ) VALUES ('DF', 'Rasins' );
INSERT INTO Category (code, meaning ) VALUES ('FH', 'Chives' );
INSERT INTO Category (code, meaning ) VALUES ('FR', 'Apples' );
INSERT INTO Category (code, meaning ) VALUES ('NS', 'Cashews' );
INSERT INTO Category (code, meaning ) VALUES ('ON', 'Other Nuts' );
INSERT INTO Category (code, meaning ) VALUES ('VG', 'Carrots' );
INSERT INTO Category (code, meaning ) VALUES ('ALL', 'All Commodities' );


--7.
PRINT '*** QUESTION7 ***'
PRINT ''

CREATE TABLE Commodity
(id INT IDENTITY NOT NULL
 ,name NVARCHAR(16) NOT NULL
 ,CONSTRAINT pk_CommodityId PRIMARY KEY CLUSTERED(id)
)

SET IDENTITY_INSERT Commodity ON
INSERT INTO Commodity (id, name) VALUES (1, 'Raisins');
INSERT INTO Commodity (id, name) VALUES (2, 'Chives');
INSERT INTO Commodity (id, name) VALUES (3, 'Apples');
INSERT INTO Commodity (id, name) VALUES (4, 'Cashews');
INSERT INTO Commodity (id, name) VALUES (5, 'Other Nuts');
SET IDENTITY_INSERT Commodity OFF

--8.
PRINT '*** QUESTION8 ***'
PRINT ''

CREATE TABLE Produce
	(plu NVARCHAR(8) NOT NULL,
	growingMethodId NCHAR(1) DEFAULT '0',
	barCode NVARCHAR(32) NOT NULL,
	commodityId INT NOT NULL,
	variety NVARCHAR(16) NOT NULL,
	additional NVARCHAR(16),
	varietyInfo NVARCHAR(16),
	isGlobal BIT NOT NULL DEFAULT 1,
	categoryCode NVARCHAR(4) NOT NULL,
	size NVARCHAR(8),
	restrictions NVARCHAR(64),
	botanical NVARCHAR(32),
	naSize NVARCHAR(32),
	worldSize NVARCHAR(32),
	revisionDate NVARCHAR(64),
	notes NVARCHAR(MAX),
	alsoKnownAs NVARCHAR(128),
	CONSTRAINT pk_ProducePlu PRIMARY KEY (plu),
	CONSTRAINT chk_growingMethodId CHECK ( growingMethodId IN ('0', '1', '2')),
	CONSTRAINT ak_barCode UNIQUE(barCode),
	CONSTRAINT ak_CommodityId_variety UNIQUE(CommodityId,variety),
	CONSTRAINT Produce_Category_FK FOREIGN KEY (categoryCode) REFERENCES Category(code),
	CONSTRAINT Produce_Commodity_FK FOREIGN KEY (CommodityId) REFERENCES Commodity(id) ON DELETE CASCADE )


INSERT INTO Produce (
	plu,
	growingMethodId,
	barCode,
	commodityId,
	variety,
	additional,
	varietyInfo,
	isGlobal,
	categoryCode,
	size,
	restrictions,
	botanical,
	naSize,
	worldSize,
	revisionDate,
	notes,
	alsoKnownAs )


VALUES (3339,
	0,
	'14323098063468',
	3,
	'Belchard',
	NULL,
	NULL,
	1,
	'FR',
	NULL,
	NULL,
	'Malis Pumila',
	NULL,
	NULL,
	'11-1-2004',
	NULL,
	NULL );

