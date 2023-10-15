

WITH BorrowersCount AS 
(
	SELECT 
		BorrowerID,
		count(BorrowerID) AS Borrowed_Books_Count
	FROM Loans
	GROUP BY BorrowerID
)

SELECT 
	Borrowers.BorrowerID,
	[First Name], 
	[Last Name], 
	Borrowed_Books_Count,
	DENSE_RANK() OVER (ORDER BY Borrowed_Books_Count DESC) AS Borrowers_Rank
FROM BorrowersCount
INNER JOIN Borrowers
ON Borrowers.BorrowerID = BorrowersCount.BorrowerID
