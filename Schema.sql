CREATE TABLE [Borrowers] (
[BorrowerID] Integer identity(1234,5) primary key,
[First Name] Varchar(10) NOT NULL,
[Last Name] Varchar(10) NOT NULL,
[Email] Varchar(220) NOT NULL,
[Date of Birth] Date NOT NULL,
[Membership Date] Date NOT NULL,
);


CREATE TABLE [Books] (
[BookID ] Integer identity(1234,5) primary key,
[Title] Varchar(20) NOT NULL,
[Author] Varchar(20) NOT NULL,
[ISBN] Varchar(20) NOT NULL,
[Published Date] Date NOT NULL,
[Genre] Varchar(10) NOT NULL,
[Shelf Location] Varchar(10) NOT NULL,
[Current Status] Varchar(10) Check([Current Status] in ('Available' , 'Borrowed'))NOT NULL,
);


CREATE TABLE [Loans] (
[LoanID] Integer identity(1234,5) primary key,
[BorrowerID] Integer NOT NULL,
[BookID] Integer NOT NULL,
[Date Borrowed] Date NOT NULL,
[Due Date] Date NOT NULL,
[Date Returned] Date DEFAULT NULL,
CONSTRAINT [FK_Loans.BorrowerID]
FOREIGN KEY ([BorrowerID])
REFERENCES Borrowers,
CONSTRAINT [FK_Loans.BookID]
FOREIGN KEY ([BookID])
REFERENCES [Books]([BookID ])
);