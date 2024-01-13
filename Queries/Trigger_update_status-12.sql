

CREATE TABLE AuditLog(
	BookId INT ,
	StatusChange Varchar(10) Check(StatusChange in ('Available' , 'Borrowed'))NOT NULL, 
	ChangeDate DATE
)



CREATE OR ALTER TRIGGER t_Update_Book_Status 
ON Books
AFTER UPDATE
NOT FOR REPLICATION
AS
BEGIN
IF( UPDATE([Current Status]) )
BEGIN
	INSERT INTO AuditLog
	SELECT
		  [BookID ],
		  [Current Status],
		  GETDATE()
	FROM inserted
END
END
GO 


SELECT * FROM AuditLog

UPDATE Books
SET [Current Status] = 'Available'
WHERE [BookID ] = 13874

