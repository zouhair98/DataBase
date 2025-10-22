
-- MySql challenge task 1 : 

-- 1. Create a new database
CREATE DATABASE Bookstore;

-- 2. Use the database bookstore
USE Bookstore;

-- 3. Create the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- 4. Create the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    published_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 5. Show the tables structure
DESCRIBE Authors;
DESCRIBE Books;

-- 6. Drop  Books table
DROP TABLE Books;
--- re-create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    published_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 7. Drop the database
DROP DATABASE Bookstore;
--- re-create the database again 
CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    published_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
----------------------------------------------------------------------------------------------
-- MySql challenge task 1 :  
-- 1 INSERT DATA 
-- Insert authors
INSERT INTO Authors (name, country)
VALUES 
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Haruki Murakami', 'Japan');

-- Insert books
INSERT INTO Books (title, published_year, author_id)
VALUES
('Harry Potter and the Philosopher''s Stone', 1997, 1),
('A Game of Thrones', 1996, 2),
('Kafka on the Shore', 2002, 3),
('Norwegian Wood', 1987, 3);
-------------- 2 QUERY DATA ----------------------
-- Show all authors
SELECT * FROM Authors;

-- Show all books
SELECT * FROM Books;

-- Show only the titles of books published after 1990
SELECT title FROM Books WHERE published_year > 1990;

-- Show all books written by “Haruki Murakami”
SELECT title, published_year FROM Books WHERE author_id in (select author_id from Authors  where name = 'Haruki Murakami');

------------ 3 update data  :---------------------

-- Change “Norwegian Wood” published year to 1989
UPDATE Books SET published_year = 1989 WHERE title = 'Norwegian Wood';

-- Update J.K. Rowling’s country to “United Kingdom”
UPDATE Authors SET country = 'United Kingdom' WHERE name = 'J.K. Rowling';

-----------4. DELITING Data ----------------------
-- deliting book from books table by a name condition
DELETE FROM Books WHERE title = 'Kafka on the Shore';

--- deliting George R.R. Martin book before deliting the author 
DELETE FROM Books WHERE author_id = (SELECT author_id FROM Authors WHERE name = 'George R.R. Martin');
--- deliting  the author  using a condition name= "George R.R. Martin"
DELETE FROM Authors WHERE name = 'George R.R. Martin';
