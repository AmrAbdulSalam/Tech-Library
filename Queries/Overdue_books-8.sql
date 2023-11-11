

WITH OverDue_Books AS
(
	SELECT 
		BookID,
		[First Name],
		[Last Name],
		[Due Date],
		[Date Returned],
		DATEDIFF(DAY , [Due Date] , [Date Returned]) AS OverDue_Days
	FROM Loans
	INNER JOIN Borrowers
	ON Borrowers.BorrowerID = Loans.BorrowerID
	WHERE 
		DATEDIFF(DAY , [Due Date] , [Date Returned]) > 30
		OR
		[Date Returned] IS NULL AND (DATEDIFF(DAY , [Due Date] , GETDATE()) > 30)
)

SELECT * FROM OverDue_Books