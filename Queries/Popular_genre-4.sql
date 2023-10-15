
WITH PopularGenre AS 
(
	SELECT 
		Genre,
		COUNT(Genre) AS GenreCount
	FROM Loans
	INNER JOIN Books
	ON Books.[BookID ] = Loans.[BookID]
	WHERE MONTH([Date Borrowed]) = '2'
	GROUP BY Genre
)

SELECT 
	*,
	DENSE_RANK() OVER (ORDER BY GenreCount DESC) AS PopularGenre
FROM PopularGenre