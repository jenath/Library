DROP TABLE IF EXISTS checked_out, book, person;

-- Create tables

IF OBJECT_ID('dbo.book', 'U') IS NULL 
BEGIN
    CREATE TABLE book(
        book_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        title VARCHAR(50),
        author VARCHAR(100),
        isbn VARCHAR(10),
    );
END

IF OBJECT_ID('dbo.person', 'U') IS NULL 
BEGIN
    CREATE TABLE person(
        user_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50), 
    );
END

IF OBJECT_ID('dbo.checked_out', 'U') IS NULL 
BEGIN
    CREATE TABLE checked_out(
        user_id INT,
        book_id INT,
        due_date DATE,

        FOREIGN KEY (user_id) REFERENCES person(user_id),
        FOREIGN KEY (book_id) REFERENCES book(book_id),
    );
END

-- Insert test data

INSERT INTO book (title, author, isbn) VALUES ('leaf book', 'yoshimitsu', '1812148578');
-- INSERT INTO person VALUES ('Stipe', 'Miocic');
-- INSERT INTO checked_out VALUES ('12-01-2023')
