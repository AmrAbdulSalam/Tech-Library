

CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport(
	@StartDate Date ,
	@EndDate Date
)
AS
BEGIN
	SELECT 
		  [First Name],
		  [Last Name],
		  Email,
		  Title,
		  [Date Borrowed],
		  ISBN
	FROM Loans
	INNER JOIN Books
	ON Loans.BookID = Books.[BookID ]
	INNER JOIN Borrowers
	ON Loans.BorrowerID = Borrowers.BorrowerID
	WHERE [Date Borrowed] BETWEEN @StartDate AND @EndDate
	ORDER BY [Date Borrowed]
END

EXEC sp_BorrowedBooksReport '2005-10-10' , '2010-10-9'