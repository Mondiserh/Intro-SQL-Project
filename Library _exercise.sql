-- Step 1: creating books and author Tables
--author Table 
CREATE TABLE Authors (
    AuthorID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    firstname varchar(255),
    lastname varchar(255),
    Nationality VARCHAR(55) NOT NULL CHECK (Nationality IN ('Canadian', 'South African', 'American', 'Irish'))
);

-- Books Table
CREATE TABLE Books (
    BookID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Title varchar(255),
    Book_Description varchar(255),
    AuthorID int,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
-- Step 3: Inserting Data into Books and Authors
-- Authors
INSERT INTO Authors (firstname, lastname, Nationality)
VALUES 
    ('Robert', 'Greene', 'American'),
    ('George', 'Orwell', 'American'),  
    ('J.K.', 'Rowling', 'Irish'),      
    ('J.R.R.', 'Tolkien', 'Irish'),  
    ('F. Scott', 'Fitzgerald', 'American');

--Books 
INSERT INTO Books (Title, Book_Description, AuthorID)
VALUES 
    ('48 Laws of Power', 'A self-help book exploring power dynamics and strategies.', 1),
    ('1984', 'A dystopian social science fiction novel and cautionary tale.', 2),
    ('Harry Potter and the Sorcerer''s Stone', 'The first book in the Harry Potter series.', 3),
    ('The Hobbit', 'A fantasy novel and children''s book.', 1),
    ('The Great Gatsby', 'A novel about the American dream and societal decadence.', 5),
    ('The Old Man and the Sea', 'A novel about an aging fisherman''s struggle.', 2),
    ('To Kill a Mockingbird', 'A novel addressing racial injustice in the Deep South.', 2),
    ('Pride and Prejudice', 'A romantic novel of manners.', 2),
    ('Adventures of Huckleberry Finn', 'A novel about a boy''s adventures along the Mississippi River.', 4),
    ('War and Peace', 'A historical novel about the French invasion of Russia.', 1);

-- Step 3: Queries 

-- Query 1: How many books there are in total .
SELECT COUNT(*)
FROM Books;

-- Query 2: Which author has the most books.
SELECT TOP 1
    a.firstname,
    a.lastname,
    COUNT(b.BookID) AS NumberOfBooks
FROM 
    Authors a
LEFT JOIN 
    Books b ON a.AuthorID = b.AuthorID
GROUP BY 
    a.firstname, a.lastname
ORDER BY 
    NumberOfBooks DESC;

-- Query 3: How many books there are according to nationality.
SELECT 
    a.Nationality,
    COUNT(b.BookID) AS NumberOfBooks
FROM 
    Authors a
LEFT JOIN 
    Books b ON a.AuthorID = b.AuthorID
GROUP BY 
    a.Nationality;

