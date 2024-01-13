
CREATE OR ALTER FUNCTION fn_CalculateOverdueFees(
	@LoanId INT
)
RETURNS INT AS
BEGIN
	DECLARE @TotalFees  INT = 0
	DECLARE @Days INT
	SELECT 
		@Days = (DATEDIFF(DAY , [Due Date] , [Date Returned])) 
	FROM Loans
	WHERE LoanID = @LoanId
	
	IF(@Days <= 30 AND @Days > 0) 
		SET @TotalFees = @Days;
	ELSE IF(@Days > 30) 
		SET @TotalFees = @Days * 2;
	RETURN @TotalFees
END;