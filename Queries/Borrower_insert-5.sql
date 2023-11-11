

CREATE OR ALTER PROCEDURE sp_AddNewBorrower(
	@FirstName varchar(10), 
	@LastName varchar(10), 
	@Email varchar(220), 
	@DateOfBirth date, 
	@MembershipDate date,
	@BorrowerId INT OUTPUT
)
AS 
BEGIN
	IF EXISTS(SELECT Email FROM Borrowers WHERE Email = @Email)
	BEGIN 
		PRINT 'Email :' + @Email + ' Is already found';
	END
	ELSE
	BEGIN
		INSERT INTO Borrowers 
		VALUES(@FirstName , @LastName , @Email , @DateOfBirth , @MembershipDate);
		SELECT 
			@BorrowerId = BorrowerID 
		FROM Borrowers
		WHERE Email = @Email;
		RETURN ;
	END
END;

DECLARE @BorrowerIdValue INT;
EXEC sp_AddNewBorrower 'John' , 'NSSA1' , 'john@gmail.com' , '04/06/2000' , '12/10/2023' ,@BorrowerIdValue ;
EXEC sp_AddNewBorrower 'John' , 'NSSA1' , 'john99@gmail.com' , '04/06/2000' , '12/10/2023' , @BorrowerIdValue OUTPUT;
PRINT @BorrowerIdValue;