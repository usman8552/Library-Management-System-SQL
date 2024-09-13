-- CREATING DATABASE

-- create database librarymangementsystem;
-- use librarymangementsystem;
-- drop database librarymangementsystem;

-- Q1. Create Table:
-- Write an SQL statement to create all tables with the specified columns.

-- CREATING TABLES
-- 1. CREATE BOOKS TABLE
CREATE TABLE books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(50),
    Author VARCHAR(50),
    PublicationYear YEAR,
    Genre VARCHAR(50)
);

-- 2.CREATE Members TABLE
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    MembershipDate DATE
);

-- 3.CREATE Loans TABLE
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID)
        REFERENCES books (BookID),
    FOREIGN KEY (MemberID)
        REFERENCES Members (MemberID)
);

-- 4. CREATE Authors TABLE
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    BirthYear YEAR
);

-- 5.CREATE BookAuthors TABLE
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (AuthorID)
        REFERENCES Authors (AuthorID)
);

-- 6.CREATE Fines TABLES
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    LoanID INT,
    FineAmount DEC(10 , 2 ),
    PaidDate DATE,
    FOREIGN KEY (LoanID)
        REFERENCES Loans (LoanID)
);


-- Q2. Insert Records:
-- Insert at least 10 records in all the tables

-- 1.1 Inserting values into the Books table
INSERT INTO Books (BookID, Title, Author, PublicationYear, Genre) 
VALUES
(1, "Introduction to Computer Science", "John Smith", 1999, "Computer Science"),
(2, "Basic Science of Electronics", "Michael Brown", 2010, "Electronics Engineering"),
(3, "Advanced Digital Signal Processing Science", "David Johnson", 2008, "Telecommunication Engineering"),
(4, "Microcontrollers and Embedded Systems Science", "Alice White", 1994, "Embedded Systems"),
(5, "Wireless Communication Science", "Robert Miller", 1990, "Telecommunication Engineering"),
(6, "Advanced Circuit Analysis", "Emily Davis", 2017, "Electronics Engineering"),
(7, "Control Systems Engineering", "George Anderson", 1996, "Control Systems Engineering"),
(8, "Optical Fiber Communication", "Richard Lee", 2005, "Optical Communication"),
(9, "Semiconductor Devices", "Laura Scott", 2018, "Electronics Engineering"),
(10, "Power Systems Analysis", "James Wilson", 2011, "Electrical Engineering");


-- 2.1 Inserting values into the Members table
INSERT INTO Members (MemberID, FirstName, LastName, Email, MembershipDate)
VALUES
(1, "Virat", "Kohli", "virat.kohli@gmail.com", "2022-01-10"),
(2, "Rohit", "Sharma", "rohit.sharma@gmail.com", "2022-02-15"),
(3, "Jasprit", "Bumrah", "jasprit.bumrah@gmail.com", "2022-03-20"),
(4, "KL", "Rahul", "kl.rahul@gmail.com", "2022-04-05"),
(5, "Hardik", "Pandya", "hardik.pandya@gmail.com", "2022-05-12"),
(6, "Pat", "Cummins", "pat.cummins@gmail.com", "2023-01-15"),
(7, "David", "Warner", "david.warner@gmail.com", "2023-02-10"),
(8, "Steve", "Smith", "steve.smith@gmail.com", "2023-03-22"),
(9, "Marnus", "Labuschagne", "marnus.labuschagne@gmail.com", "2023-04-30"),
(10, "Glenn", "Maxwell", "glenn.maxwell@gmail.com", "2023-05-18");

--  3.1 Inserting values into the Loans table with adjusted ReturnDate values

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 2, 3, '2023-04-12', '2023-05-15'),
(2, 2, 2, '2024-02-10', NULL),
(3, 3, 3, '2024-03-18', '2024-04-20'),
(4, 2, 4, '2024-01-25', NULL),
(5, 5, 5, '2023-06-10', '2023-07-12'),
(6, 6, 2, '2023-07-22', '2023-08-20'),
(7, 2, 1, '2023-11-15', NULL),
(8, 8, 3, '2023-09-10', '2023-10-05'),
(9, 2, 4, '2024-02-14', NULL),
(10, 10, 5, '2024-03-01', NULL),
(11, 1, 1, '2024-03-10', NULL),
(12, 2, 1, '2024-03-15', NULL),
(13, 2, 1, '2024-03-20', NULL),
(14, 4, 1, '2024-03-25', NULL),
(15, 2, 2, '2024-02-10', NULL),
(16, 2, 3, '2024-03-18', '2024-04-20');

--  4.1 Inserting values into the Authors table
INSERT INTO Authors (AuthorID, AuthorName, BirthYear)
VALUES
(1, "John Smith", 1970),
(2, "Michael Brown", 1965),
(3, "David Johnson", 1980),
(4, "Alice White", 1978),
(5, "Robert Miller", 1969),
(6, "Emily Davis", 1985),
(7, "George Anderson", 1982),
(8, "Richard Lee", 1975),
(9, "Laura Scott", 1984),
(10, "James Wilson", 1977);

--  5.1 Inserting values into the BookAuthors table
INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

--  6.1 Inserting values into the Fines table

INSERT INTO Fines (FineID, LoanID, FineAmount, PaidDate) VALUES
(1, 1, 15.50, '2023-06-01'),
(2, 3, 5.00, '2024-05-10'),
(3, 4, 20.00, NULL),
(4, 6, 12.75, '2023-09-01'),
(5, 9, 18.00, NULL),
(6, 6, 8.25, '2023-08-30'),
(7, 7, 18.00, NULL),
(8, 8, 9.50, '2023-10-10'),
(9, 9, 5.75, NULL),
(10, 10, 22.00, NULL);


show tables;
select * from books;
select * from authors;
select * from bookauthors;
select * from fines;
select * from loans;
select * from members;

-- Q3. Select Records:
-- Write a query to select all books published before 2000 from the Books table.

SELECT 
    *
FROM
    books
WHERE
    publicationYear < '2000-01-01';

-- Q4. Where Clause (AND/OR):
-- Write a query to select all Loans where the LoanDate is in 2024 and the ReturnDate is NULL
select * from loans;

SELECT 
    *
FROM
    loans
WHERE
    YEAR(LoanDate) = '2024'
        AND ReturnDate IS NULL;

-- Q5. LIKE Operator:
-- Write a query to select all Books where the Title contains 'Science'.
select * from books;

SELECT 
    BookID, Title, Genre
FROM
    books
WHERE
    Title LIKE '%Science%';

-- Q6. CASE Statement:
-- Write a query to select Title and a new column Availability from the Books table. 
-- If a book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), 
-- set Availability to 'Checked Out', otherwise 'Available'.

select * from books;
select * from loans;

SELECT 
    b.Title,
    CASE
        WHEN l.ReturnDate IS NULL THEN 'Checked Out'
        ELSE 'Available'
    END AS Availability
FROM
    Books b
        LEFT JOIN
    Loans l ON b.BookID = l.BookID;


-- Q7. Subquery:
-- Write a query to find all Members who have borrowed more than 5 books. 
-- Use a subquery to find these MemberIDs.
select * from members;
select * from books;
select * from loans;

SELECT 
    MemberID
FROM
    Members
WHERE
    MemberID IN (SELECT 
            MemberID
        FROM
            Loans
        GROUP BY MemberID
        HAVING COUNT(loanid) > 5);


-- Q8. Group By:
-- Write a query to get the total number of books borrowed by each Member.
-- Group the results by MemberID.

select * from books;
select * from loans;

SELECT 
    MemberID, COUNT(BookID) AS TotalBooksBorrowed
FROM
    Loans
GROUP BY MemberID;

-- Q9. Having Clause:
-- Write a query to get the total FineAmount collected for each LoanID, 
-- but only include loans where the total fine amount is greater than $10. Use the HAVING clause.

select * from fines;

SELECT 
    fineid, loanid, SUM(loanid) AS 'Total_FineAmount'
FROM
    fines
GROUP BY loanid
HAVING SUM(loanid) > 10;

-- Q10. Limit:
-- Write a query to select the top 5 most frequently borrowed books.

select * from books;
select * from loans;
select * from fines;
select * from members;

SELECT 
    Books.Title, COUNT(Loans.BookID) AS TimesBorrowed
FROM
    Loans
        INNER JOIN
    Books ON Loans.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY TimesBorrowed DESC
LIMIT 5;

-- Q11. Inner Join:
-- Write a query to join Loans with Books to get a list of all loans with Title, LoanDate, and ReturnDate.

select * from books;
select * from loans;
SELECT 
    TItle, LoanDate, ReturnDate
FROM
    books
        JOIN
    loans USING (BookID);


-- Q12. Outer Join:
-- Write a query to get a list of all Books and any associated loans. 
-- Include books that might not be currently borrowed.


select * from books;
select * from loans;

SELECT 
    Books.Title, Loans.LoanDate, Loans.ReturnDate
FROM
    Books
        LEFT JOIN
    Loans USING (BookID);
