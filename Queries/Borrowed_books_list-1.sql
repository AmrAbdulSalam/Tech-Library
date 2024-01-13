
SELECT [first name], 
	   [last name],
	   bo.[BookID ] 
	   [date borrowed], 
	   [date returned], 
	   Title, 
	   Genre, 
	   [current status]  
FROM loans loa
INNER JOIN borrowers borrow
ON borrow.borrowerID = loa.borrowerID
INNER JOIN books bo 
ON bo.[BookID ] = loa.BookId
WHERE [First Name] = 'Oliver';

