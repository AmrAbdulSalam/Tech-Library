
CREATE TABLE #Temporary_Borrowers_Table(
	ID INT ,
	FirstName varchar(40),
	LastName varchar(40)
)
go
CREATE OR ALTER PROCEDURE sp_Retrieves_Overdue_Books
AS
BEGIN
	INSERT INTO  #Temporary_Borrowers_Table
	SELECT 
		 Borrowers.BorrowerID,
		 [First Name],
		 [Last Name]
	FROM Borrowers
	INNER JOIN Loans
	ON Borrowers.BorrowerID = Loans.BorrowerID
	WHERE [Due Date] > [Date Returned] 
END

EXEC sp_Retrieves_Overdue_Books

SELECT DISTINCT * ,
	   DATEDIFF(DAY , [Due Date] , [Date Returned]) AS Days
FROM #Temporary_Borrowers_Table	
INNER JOIN Loans
ON Loans.BorrowerID = #Temporary_Borrowers_Table.ID
