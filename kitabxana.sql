CREATE TABLE BOOKS
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(100) CHECK(LEN(name)>2),
	bookPC int CHECK(bookPC>9)
)


CREATE TABLE Authors
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(255),
	surname NVARCHAR(255),
)

DROP TABLE Authors
DROP TABLE BOOKS

ALTER TABLE BOOKS
ADD authorID int 
FOREIGN KEY (authorID) REFERENCES Authors(id)



CREATE VIEW AuthorsAndBooks AS
SELECT BOOKS.name,BOOKS.bookPC,Authors.name+' '+Authors.surname AS FullName FROM BOOKS,Authors WHERE BOOKS.authorID=Authors.id;



INSERT INTO Authors VALUES('Davud','HACI'); 

INSERT INTO Authors VALUES('Sadiq','HACI'); 
INSERT INTO Authors VALUES('SAdiq','HACiLI'); 

INSERT INTO BOOKS VALUES('Sefiller',55,1); 

INSERT INTO BOOKS VALUES('Blue Diamond',40,1); 
INSERT INTO BOOKS VALUES('Hary Potter',1313,2); 



SELECT * FROM AuthorsAndBooks;


CREATE PROCEDURE findandshow
AS
SELECT BOOKS.name,BOOKS.bookPC,Authors.name+' '+Authors.surname AS FullName FROM BOOKS,Authors WHERE Authors.name LIKE 'davud';

DROP PROCEDURE findandshow

EXEC findandshow;


CREATE PROCEDURE insertAuth
AS
INSERT INTO Authors VALUES('Mehman','Mellime'); 


CREATE PROCEDURE updatetAuth
AS
UPDATE Authors
SET Authors.name = 'Haci2'
WHERE Authors.id=1;



EXEC insertAuth;
EXEC updatetAuth;


SELECT * FROM Authors;





CREATE PROCEDURE authView
AS
SELECT BOOKS.name,BOOKS.bookPC AS BooksCount,Authors.name+' '+Authors.surname AS FullName FROM BOOKS,Authors ORDER BY BOOKS.bookPC DESC;

DROP PROCEDURE authView



EXEC authView;