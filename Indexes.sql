

CREATE INDEX idx_FirstName
ON Borrowers ([First Name])

CREATE INDEX idx_Genre
ON Books (Genre)

CREATE INDEX idx_DateBorrowed
ON Loans ([Date Borrowed] ,[Due Date])