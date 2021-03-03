1- CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));
---- CREATE "authors" TABLE SO WE HAVE TWO TABLES INSTEAD OF ONE (books) WHICH HAS SOME DUPLICATED DATA

---------------------------------------------------------------------------------------------------

2- INSERT INTO authors(name) SELECT DISTINCT author FROM books;
---- GETTING THE AUTHORS DATA FROM THE "books" TABLE AND INSERT THESE DATA TO "authors" TABLE

---------------------------------------------------------------------------------------------------

3- ALTER TABLE books ADD COLUMN author_id INT;
---- ADD COLUMN CALLED "author_id" TO "books" TABLE

---------------------------------------------------------------------------------------------------

4- UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
---- SETTING THE VALUE OF "author_id" AS THE VALUES OF id COLUMN IN THE "authors" TABLE AFTER MATHCING THE NAME OF EACH AUTHOR IN BOTH TABLES

---------------------------------------------------------------------------------------------------

5- ALTER TABLE books DROP COLUMN author;
---- REMOVING "author" COLUMN FROM THE "books" TABLE

---------------------------------------------------------------------------------------------------

6- ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
---- LINKING THE PRIMARY KEY IN "authors" TABLE AS A FORIEGN KEY IN "books" TABLE