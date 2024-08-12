# library SQL Server Project

## Overview

This project demonstrates how to create and manage a simple database for books and their authors using SQL Server. The database consists of two tables: `Authors` and `Books`, which are linked through a foreign key relationship. The project also includes some example queries to retrieve data such as the total number of books, the author with the most books, and the number of books according to the authors' nationalities.

## Prerequisites

Before running this project, ensure you have the following installed:

- **SQL Server**: Any version that supports the creation of databases and tables.
- **SQL Server Management Studio (SSMS)**: To manage and interact with the SQL Server database.

## Installation

### 1. Setting Up the Database

1. **Open SQL Server Management Studio (SSMS)** and connect to your SQL Server instance.
2. **Create a new database** if desired, or use an existing one:

   ```sql
   CREATE DATABASE BooksAndAuthorsDB;
   GO
   USE BooksAndAuthorsDB;
   ```

### 2. Create Tables

Execute the following script in SSMS to create the `Authors` and `Books` tables:

```sql
-- Step 1: Creating Authors and Books Tables
CREATE TABLE Authors (
    AuthorID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    firstname varchar(255),
    lastname varchar(255),
    Nationality VARCHAR(55) NOT NULL CHECK (Nationality IN ('Canadian', 'South African', 'American', 'Irish'))
);

CREATE TABLE Books (
    BookID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Title varchar(255),
    Book_Description varchar(255),
    AuthorID int,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
```

### 3. Insert Sample Data

Insert sample data into the `Authors` and `Books` tables:

```sql
-- Step 3: Inserting Data into Authors and Books
-- Authors
INSERT INTO Authors (firstname, lastname, Nationality)
VALUES
    ('Robert', 'Greene', 'American'),
    ('George', 'Orwell', 'American'),
    ('J.K.', 'Rowling', 'Irish'),
    ('J.R.R.', 'Tolkien', 'Irish'),
    ('F. Scott', 'Fitzgerald', 'American');

-- Books
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
```

## Usage

### Example Queries

After setting up the database and inserting data, you can run the following queries to extract useful information:

1. **Total Number of Books**:

   ```sql
   SELECT COUNT(*)
   FROM Books;
   ```

2. **Author with the Most Books**:

   ```sql
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
   ```

3. **Number of Books by Nationality**:
   ```sql
   SELECT
       a.Nationality,
       COUNT(b.BookID) AS NumberOfBooks
   FROM
       Authors a
   LEFT JOIN
       Books b ON a.AuthorID = b.AuthorID
   GROUP BY
       a.Nationality;
   ```

## Project Structure

- **/Database**: Contains SQL scripts to create the database, tables, and insert sample data.
- **/Queries**: Contains example queries for interacting with the database.

## Contributing

If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
