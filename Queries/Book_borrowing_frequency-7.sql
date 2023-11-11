


CREATE OR ALTER FUNCTION fn_BookBorrowingFrequency(
	@BookID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @BookCount INT
	SELECT 
		@BookCount = COUNT(BookID) 
	FROM Loans
	WHERE BookID = @BookID;
	RETURN @BookCount
END