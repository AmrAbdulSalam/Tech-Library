BULK INSERT Borrowers
FROM 'D:\Data\BorrowerData.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
);

BULK INSERT Books
FROM 'D:\Data\BookData.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
);

BULK INSERT Loans
FROM 'D:\Data\LoanData.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
);