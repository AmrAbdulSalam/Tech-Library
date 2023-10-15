

WITH ActiveBorrowers AS
(
	SELECT 
		   [First Name],
		   [Last Name],
		   COUNT(Loans.BorrowerID) As BorrowedNo
	FROM Loans 
	INNER JOIN Borrowers
	ON Loans.BorrowerID = Borrowers.BorrowerID
	WHERE [Date Returned] IS NULL
	GROUP BY [First Name] , [Last Name]
	HAVING COUNT(Loans.BorrowerID) >= 2
)

SELECT * FROM ActiveBorrowers;