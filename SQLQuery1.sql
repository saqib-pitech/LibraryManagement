﻿USE TRAINING
CREATE TABLE BOOK (
	BOOKCODE INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	BOOKNAME VARCHAR (30) NOT NULL ,
	AUTHOR VARCHAR(80) NULL,
	ISISSUABLE BIT NOT NULL DEFAULT 1,
	ISISSUED BIT NOT NULL DEFAULT 0,	
)
--(BOOKCODE, BOOKNAME, AUTHOR, ISISSUABLE, ISISSUED)
INSERT INTO BOOK VALUES('DAVID COPPERFIELD',	'DICKENS',	0,0); 
INSERT INTO BOOK VALUES('OLIVER TWIST',		'DICKENS',	1,0);
INSERT INTO BOOK VALUES('EMMA',				'AUSTEN',	0,0);
INSERT INTO BOOK VALUES('HAMLET', 'SHAKESPEARE', 1,1);
INSERT INTO BOOK VALUES('PRIDE AND PREJUDICE', 'AUSTEN', 0,0);
INSERT INTO BOOK VALUES('SUN ALSO RISES', 'HEMMINGWAY', 1,0);
INSERT INTO BOOK VALUES('MACBETH', 'SHAKESPEARE', 1,1);
INSERT INTO BOOK (BOOKNAME) VALUES('FAREWELL TO ARMS');
SELECT * FROM BOOK
CREATE TABLE MEMBERTYPE (
	MEMBERTYPEID INT IDENTITY(1, 1) NOT NULL Primary Key,
	MEMBERTYPE VARCHAR(30) NOT NULL,
	NO_OF_BOOKALLOWED INT NOT NULL,
	DAYSALLOWED INT NOT NULL,
)
INSERT INTO MEMBERTYPE VALUES ('STUDENT', 3,10);
INSERT INTO MEMBERTYPE VALUES ('FACULTY', 25,90);
SELECT * FROM MEMBERTYPE
CREATE TABLE MEMBER (
	MEMBERCODE INT IDENTITY(1, 1) NOT NULL Primary Key,
	MEMBERNAME VARCHAR(30) NOT NULL,
	MEMBERTYPEID INT NOT NULL,
	NO_OF_BOOKISSUED INT NULL DEFAULT 0,
	CONSTRAINT FK_MEMBERTYPE FOREIGN KEY(MEMBERTYPEID) REFERENCES DBO.MEMBERTYPE (MEMBERTYPEID)
)
INSERT INTO MEMBER( MEMBERNAME, MEMBERTYPEID, NO_OF_BOOKISSUED) VALUES('Ross',	1, 1);
INSERT INTO MEMBER( MEMBERNAME, MEMBERTYPEID, NO_OF_BOOKISSUED) VALUES('Phoebe',	1, 2);
INSERT INTO MEMBER( MEMBERNAME, MEMBERTYPEID, NO_OF_BOOKISSUED) VALUES('Chandler',1, 0);
INSERT INTO MEMBER( MEMBERNAME, MEMBERTYPEID, NO_OF_BOOKISSUED) VALUES('Joey',	2, 1);
INSERT INTO MEMBER( MEMBERNAME, MEMBERTYPEID, NO_OF_BOOKISSUED) VALUES('Monica',	2, 0);
SELECT * FROM MEMBER
CREATE TABLE ISSUEBOOK (
	ISSUECODE INT IDENTITY(1, 1) NOT NULL Primary key,
	MEMBERCODE INT NOT NULL,
	BOOKCODE INT NOT NULL,
	ISSUEDATE DATETIME NOT NULL DEFAULT GETDATE(),
	DUEDATE DATETIME NOT NULL,
	RETURNDATE DATETIME NULL,
	CONSTRAINT FK_BOOK FOREIGN KEY(BOOKCODE) REFERENCES DBO.BOOK(BOOKCODE),
	CONSTRAINT FK_MEMBER FOREIGN KEY(MEMBERCODE) REFERENCES DBO.MEMBER(MEMBERCODE)
)
INSERT INTO ISSUEBOOK(MEMBERCODE, BOOKCODE, ISSUEDATE, DUEDATE, RETURNDATE) VALUES(1, 2, GETDATE(),DATEADD(DD,90,GETDATE()),NULL)
INSERT INTO ISSUEBOOK(MEMBERCODE, BOOKCODE, ISSUEDATE, DUEDATE, RETURNDATE) VALUES(2, 1, GETDATE(),DATEADD(DD,10,GETDATE()),NULL)
INSERT INTO ISSUEBOOK(ISSUECODE, MEMBERCODE, BOOKCODE, ISSUEDATE, DUEDATE, RETURNDATE) VALUES(1,1,3, '12/12/2005','15/12/2005','13/12/2005')
INSERT INTO ISSUEBOOK(MEMBERCODE, BOOKCODE, ISSUEDATE, DUEDATE, RETURNDATE) VALUES(3, 1, '06/17/2021','06/27/2021','06/25/2021')
INSERT INTO ISSUEBOOK(MEMBERCODE, BOOKCODE, ISSUEDATE, DUEDATE, RETURNDATE) VALUES(2, 3, '07/01/2021','07/10/2021','07/10/2021');
SELECT * FROM ISSUEBOOK