create database db_libraries;
GO
USE db_libraries; 
/*Create first table
CREATE TABLE library_branch (
	branchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branchName varchar(30) NOT NULL, 
	branchAddress varchar(30) NOT NULL 
);
*/

select * from library_branch;
/*Insert values*/
INSERT INTO library_branch (branchName, branchAddress)
	VALUES
	('Sharpstown', '124 Sharpstown Rd'), 
	('Central','56 Shaker Blvd'),
	('Poland','44 Main Street'),
	('Boardman','9888 South Avenue')
;

/*
CREATE TABLE book_publishers (
	publisher_Name varchar (30) NOT NULL PRIMARY KEY,
	publisherAddress varchar (50) NOT NULL,
	publisherPhone varchar (15) NOT NULL 
);
*/

INSERT INTO book_publishers (publisher_name, publisherAddress, publisherPhone)
	VALUES
		('RandomHouse', '52 6th Ave', '330-545-5252'),
		('Penguin', '902 Georgia Blvd', '330-518-8563'),
		('Avery', '4444 Dingus Lane',	'330-546-8888'),
		('Orca', '1 Ocean Ave', '330-587-6331')
;

select * from book_publishers;

/* create third table
 
CREATE TABLE books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY(100,1), 
	title varchar(30) NOT NULL, 
	publisherName varchar(30) NOT NULL CONSTRAINT fk_publisherName Foreign Key references book_publishers(publisher_name)
);
*/

/*Insert values into table */

INSERT INTO books (title, publisherName)
	VALUES 
	('The Lost Tribe', 'RandomHouse'),
	('Mopping', 'Penguin'),
	('Erasing', 'Avery'),
	('Rinsing', 'Orca'),
	('Organizing', 'RandomHouse'),
	('Dusting', 'Penguin'),
	('Sweeping', 'Avery'),
	('Vacuuming', 'Orca'),
	('Washing', 'RandomHouse'),
	('Scrubbing', 'Penguin'),
	('Dancing', 'Avery'),
	('Singing', 'Orca'),
	('Lifting', 'RandomHouse'),
	('Writing', 'Penguin'),
	('Speed Reading', 'Avery'),
	('Running', 'Orca'),
	('Farming', 'RandomHouse'),
	('Gardening', 'Penguin'),
	('Sleeping', 'Avery'),
	('Napping', 'Orca'),
	('Snacking', 'RandomHouse'),
	('Walking', 'Penguin'),
	('Acting', 'Avery'),
	('Driving', 'Orca'),
	('Burping', 'RandomHouse'),
	('Meditating', 'Penguin'),
	('Reflecting', 'Avery'),
	('Daring', 'Orca')
;

/* create table 4
CREATE Table book_copies (
	book_at_branch INT NOT NULL CONSTRAINT fk_book_at_branch FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_number INT NOT NULL CONSTRAINT fk_book_number FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT DEFAULT 2 
);
*/

/*insert values into table*/
Insert Into book_copies(book_at_branch, book_number) select branchID, bookID from library_branch, books;

/*create table 5
Create Table borrowers (
	cardNo int NOT NULL PRIMARY KEY IDENTITY(80,1), 
	borrower_name varchar (50) NOT NULL, 
	borrower_address varchar (50) NOT NULL,
	borrower_number varchar (15) NOT NULL
	);
*/

/*insert values into table 4*/

INSERT INTO borrowers (borrower_name, borrower_address, borrower_number)
	VALUES
	('Ivy Dorow', '1 Claremont St', '330-462-8546'),
	('Julia Johnston', '5592 Katahdin Dr', '330-462-7788'),
	('Jill Flauto', '34 Island Drive', '330-546-9762'),
	('Mike Sikora', '820 Tuscany Ct', '330-546-9731'),
	('Griffin Browning', '10 Sylvania St', '330-546-8426'),
	('Christine Horvath', '6806 Katahdin Dr', '330-546-7474'),
	('Dee Reynolds', '40 King St', '330-546-9639'),
	('Charlie Kelly', '610 Farley Way', '330-546-4646')
;

/* create table 5
CREATE TABLE book_authors(
	AuthorName varchar (50) DEFAULT NULL,
	book_id INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE
);
*/
INSERT INTO book_authors (AuthorName, book_id)
	VALUES
		('Angie Healey', 103),
		('Stephen King', 104),
		('Nickey Winkleman', 105),
		('Olivia Smith', 106),
		('Stephen King', 107),
		('Sarah Green', 108),
		('Pat Deering', 109),
		('Sarah Storer', 110),
		('Sara Boosh', 111),
		('Stephen King', 112),
		('Stephen King', 113),
		('Angie Healey', 114),
		('Amber Falter', 115),
		('Nickey Winkleman', 116),
		('Olivia Smith', 117),
		('Brene Brown', 118),
		('Sarah Green', 119),
		('Pat Deering', 120),
		('Sarah Storer', 121),
		('Sara Boosh', 122),
		('Steven Smith', 123),
		('Sandy B', 124),
		('Brene Brown', 125),
		('Sarah Green', 126),
		('Pat Deering', 127),
		('Sarah Storer', 128),
		('Sara Boosh', 129),
		('Stephen King', 130)
;
/*
CREATE TABLE book_loans (
	loanbranchID INT NOT NULL CONSTRAINT fk_loanbranchID FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	loanbookID INT NOT NULL CONSTRAINT fk_loanbookID FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	loanCardNo INT NOT NULL CONSTRAINT fk_loanCardNo FOREIGN KEY REFERENCES borrowers(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	dateout DATE NOT NULL,
	duedate DATE NOT NULL 
);
*/

INSERT INTO book_loans (loanbranchID, loanbookID, loanCardNo, dateout, duedate)
	VALUES
	(1, 103, 80, '2019-04-04', '2019-04-18'),
	(1,	103, 81, '2019-04-05', '2019-04-19'),
	(1, 107, 81, '2019-04-06', '2019-04-20'),
	(1,	107, 81, '2019-04-07', '2019-04-20'),
	(1,	111, 82, '2019-04-08', '2019-04-21'),
	(1,	111, 83, '2019-04-09', '2019-04-22'),
	(1,	115, 83, '2019-04-10', '2019-04-23'),
	(1,	115, 84, '2019-04-04', '2019-04-18'),
	(1,	119, 85, '2019-04-05', '2019-04-19'),
	(1,	119, 86, '2019-04-06', '2019-04-20'),
	(1,	123, 86, '2019-04-07', '2019-04-21'),
	(1,	123, 87, '2019-04-08', '2019-04-22'),
	(1,	127, 87, '2019-04-09', '2019-04-23'),
	(1,	130, 85, '2019-04-10', '2019-04-24'),
	(2,	104, 80, '2019-04-04', '2019-04-18'),
	(2,	104, 81, '2019-04-05', '2019-04-19'),
	(2,	108, 80, '2019-04-06', '2019-04-20'),
	(2,	108, 82, '2019-04-07', '2019-04-21'),
	(2,	112, 82, '2019-04-08', '2019-04-22'),
	(2,	112, 83, '2019-04-09', '2019-04-23'),
	(2,	113, 83, '2019-04-10', '2019-04-18'),
	(2,	113, 84, '2019-04-04', '2019-04-19'),
	(2,	116, 83, '2019-04-05', '2019-04-20'),
	(2,	116, 84, '2019-04-06', '2019-04-21'),
	(2,	120, 85, '2019-04-07', '2019-04-22'),
	(2,	120, 86, '2019-04-08', '2019-04-23'),
	(2,	124, 86, '2019-04-04', '2019-05-01'),
	(2,	124, 87, '2019-04-05', '2019-05-02'),
	(2,	127, 81, '2019-04-06', '2019-05-03'),
	(2,	128, 87, '2019-04-07', '2019-05-04'),
	(3,	105, 81, '2019-04-04', '2019-05-05'),
	(3,	105, 81, '2019-04-04', '2019-05-06'),
	(3,	109, 82, '2019-04-04', '2019-05-07'),
	(3,	109, 83, '2019-04-04', '2019-05-05'),
	(3,	117, 83, '2019-04-04', '2019-05-05'),
	(3,	117, 84, '2019-04-04', '2019-05-05'),
	(3,	121, 85, '2019-04-05', '2019-05-05'),
	(3,	121, 86, '2019-04-06', '2019-05-04'),
	(3,	125, 86, '2019-04-07', '2019-05-03'),
	(3,	125, 87, '2019-04-08', '2019-05-02'),
	(3,	128, 82, '2019-04-09', '2019-05-01'),
	(3,	128, 87, '2019-04-04', '2019-05-02'),
	(4,	106, 81, '2019-04-05', '2019-05-03'),
	(4,	106, 81, '2019-04-01', '2019-05-04'),
	(4,	110, 82, '2019-04-02', '2019-05-10'),
	(4,	110, 83, '2019-04-03', '2019-05-11'),
	(4,	114, 83, '2019-04-04', '2019-05-05'),
	(4,	114, 84, '2019-04-05', '2019-05-05'),
	(4,	118, 84, '2019-04-04', '2019-05-05'),
	(4,	118, 85, '2019-04-18', '2019-05-05'),
	(4,	122, 85, '2019-04-19', '2019-05-04'),
	(4,	122, 86, '2019-04-20', '2019-05-05'),
	(4,	125, 87, '2019-04-21', '2019-05-06'),
	(4,	125, 80, '2019-04-04', '2019-05-11'),
	(4,	129, 83, '2019-04-04', '2019-05-12'),
	(4,	130, 84, '2019-04-22', '2019-05-13')
	;

/* 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

SELECT book_copies.number_of_copies
	from book_copies
	INNER JOIN books on books.bookID = book_copies.book_number
	INNER JOIN library_branch on branchID = book_copies.book_at_branch
	WHERE title = 'The Lost Tribe' and branchName = 'Sharpstown'
;

/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

SELECT SUM(book_copies.number_of_copies)
	from book_copies
	INNER JOIN books on books.bookID = book_copies.book_number
	INNER JOIN library_branch on branchID = book_copies.book_at_branch
	WHERE title = 'The Lost Tribe' 
;

/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/

SELECT borrower_name
	FROM borrowers
	INNER JOIN book_loans on borrowers.cardNo = book_loans.loanCardNo
	WHERE loanbookID = NULL;
	
/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/

SELECT title, borrower_name, borrower_address
	FROM books
	INNER JOIN book_loans on loanbookID = books.bookID
	INNER JOIN borrowers on cardNo = book_loans.loanCardNo
	WHERE duedate = '2019-04-18' and loanbranchID = 1;
	

/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

SELECT library_branch.branchName as 'Branch', COUNT(book_loans.loanbookID) AS 'Total Checked Out'
	from library_branch
	INNER JOIN book_loans ON book_loans.loanbranchID = library_branch.branchID
	WHERE book_loans.duedate between '2019-04-19' and '2019-05-13'
	group by library_branch.branchName;

/*6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/

SELECT borrower_name, borrower_address, borrower_number, COUNT(book_loans.loanbookID) AS 'Books Checked Out'
	from borrowers
	INNER JOIN book_loans on book_loans.loancardNo = borrowers.cardNo
	group by borrower_name, borrower_address, borrower_number
	having count (book_loans.loanbookID) >5;

/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

SELECT [books].title, SUM(book_copies.number_of_copies) AS 'Copies', book_authors.authorName
	from [books] 
		INNER JOIN book_copies on book_copies.book_number = books.bookID
		INNER JOIN book_authors on book_authors.book_id = books.bookID 
		INNER JOIN library_branch on library_branch.branchID = book_copies.book_at_branch
		WHERE library_branch.branchName = 'Central' and book_authors.authorName = 'Stephen King'
		GROUP BY books.title, authorName;

