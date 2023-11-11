

WITH Authors As 
(
	SELECT 
		Author ,
		COUNT(Author) AS AuthorPopularity
	FROM Loans
	INNER JOIN Books
	ON Books.[BookID ] = Loans.BookID
	GROUP BY Author
)

SELECT * ,
	ROW_NUMBER() OVER (ORDER BY AuthorPopularity DESC) AS AuthorRank
	FROM Authors