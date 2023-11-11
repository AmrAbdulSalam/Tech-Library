
WITH [Genre Preference] AS
(
	SELECT 
		Borrowers.BorrowerID,
		[First Name],
		[Last Name],
		[Date of Birth],
		Genre,
		DATEDIFF(YEAR , [Date of Birth] , SYSDATETIME()) AS Age
	FROM Loans
	INNER JOIN Borrowers
	ON Borrowers.BorrowerID = Loans.BorrowerID
	INNER JOIN Books
	ON Books.[BookID ] = Loans.BookID
),
AgeRange As
(
	SELECT 
	CASE
		WHEN Age > 0 AND Age <= 10 THEN '(0-10)'
		WHEN Age > 10 AND Age <= 20 THEN '(11-20)'
		WHEN Age > 20 AND Age <= 30 THEN '(21-30)'
		WHEN Age > 30 AND Age <= 40 THEN '(31-40)'
		WHEN Age > 40 AND Age <= 50 THEN '(41-50)'
		WHEN Age > 50 AND Age <= 60 THEN '(51-60)'
		WHEN Age > 60 AND Age <= 70 THEN '(61-70)'
	END as Age_Range ,
	Genre ,
	COUNT(*) AS PrefenceCount
	FROM [Genre Preference]
	GROUP BY 
		  CASE
			WHEN Age > 0 AND Age <= 10 THEN '(0-10)'
			WHEN Age > 10 AND Age <= 20 THEN '(11-20)'
			WHEN Age > 20 AND Age <= 30 THEN '(21-30)'
			WHEN Age > 30 AND Age <= 40 THEN '(31-40)'
			WHEN Age > 40 AND Age <= 50 THEN '(41-50)'
			WHEN Age > 50 AND Age <= 60 THEN '(51-60)'
			WHEN Age > 60 AND Age <= 70 THEN '(61-70)'
		  END ,
		  Genre
	HAVING COUNT(*) > 0
),
RankGenres As 
(
	SELECT * ,
	RANK() OVER (PARTITION BY Genre ORDER BY PrefenceCount DESC) AS PrefernceGenre
	FROM AgeRange
)

SELECT Genre , Age_Range ,PrefenceCount FROM RankGenres WHERE PrefernceGenre = 1