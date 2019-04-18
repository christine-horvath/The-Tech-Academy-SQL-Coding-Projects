create database db_libraries;
GO
USE db_libraries; 
/*Create first table*/
CREATE TABLE library_branch (
	branchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branchName varchar(30) NOT NULL, 
	branchAddress varchar(30) NOT NULL 
);

select * from library_branch;
/*Insert values*/
INSERT INTO library_branch (branchName, branchAddress)
	VALUES
	('Sharpstown', '124 Sharpstown Rd'), 
	('Central','56 Shaker Blvd'),
	('Poland','44 Main Street'),
	('Boardman','9888 South Avenue')
;

/* create second table*/
ALTER TABLE books
ADD FOREIGN KEY (publisherName) references book_publishers(publisher_Name);
 
CREATE TABLE books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY(100,1), 
	title varchar(30) NOT NULL, 
	publisherName varchar(30) NOT NULL
);

/*Insert values into table 2*/
INSERT INTO books (title, publisherName)
	VALUES 
	('The Lost Tribe', 'Random House'),
	('Mopping', 'Penguin'),
	('Erasing', 'Avery'),
	('Rinsing', 'Orca'),
	('Organizing', 'Random House'),
	('Dusting', 'Penguin'),
	('Sweeping', 'Avery'),
	('Vacuuming', 'Orca'),
	('Washing', 'Random House'),
	('Scrubbing', 'Penguin'),
	('Dancing', 'Avery'),
	('Singing', 'Orca'),
	('Lifting', 'Random House'),
	('Writing', 'Penguin'),
	('Speed Reading', 'Avery'),
	('Running', 'Orca'),
	('Farming', 'Random House'),
	('Gardening', 'Penguin'),
	('Sleeping', 'Avery'),
	('Napping', 'Orca'),
	('Snacking', 'Random House'),
	('Walking', 'Penguin'),
	('Acting', 'Avery'),
	('Driving', 'Orca'),
	('Burping', 'Random House'),
	('Meditating', 'Penguin'),
	('Reflecting', 'Avery'),
	('Daring', 'Orca')
;

/* create table 3*/
CREATE Table book_copies (
	book_at_branch INT NOT NULL CONSTRAINT fk_book_at_branch FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_number INT NOT NULL CONSTRAINT fk_book_number FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT DEFAULT 2 
);

/*insert values into table 3*/
Insert Into book_copies(book_at_branch, book_number) select branchID, bookID from library_branch, books;

/*create table 4*/
Create Table borrowers (
	cardNo int NOT NULL PRIMARY KEY IDENTITY(80,1), 
	borrower_name varchar (50) NOT NULL, 
	borrower_address varchar (50) NOT NULL,
	borrower_number varchar (15) NOT NULL
	);
select * from borrowers;
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

/* create table 5*/
CREATE TABLE book_authors(
	AuthorName varchar (50) DEFAULT NULL,
	book_id INT NOT NULL CONSTRAINT fk_book_ID FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO book_authors (AuthorName, book_id)
	VALUES
		('Angie Healey',100),
		('Stephen King', 101),
		('Amber Falter', 101),
		('Nickey Winkleman', 102),
		('Olivia Smith', 103),
		('Stephen King', 104),
		('Sarah Green', 105),
		('Pat Deering', 106),
		('Sarah Storer', 107),
		('Sara Boosh', 108),
		('Stephen King', 109),
		('Stephen King',110),
		('Angie Healey', 111),
		('Amber Falter', 112),
		('Nickey Winkleman', 113),
		('Olivia Smith', 114),
		('Brene Brown', 115),
		('Sarah Green', 116),
		('Pat Deering', 117),
		('Sarah Storer', 118),
		('Sara Boosh', 119),
		('Steven Smith', 120),
		('Sandy B', 121),
		('Brene Brown', 122),
		('Sarah Green', 123),
		('Pat Deering', 124),
		('Sarah Storer', 125),
		('Sara Boosh', 126),
		('Stephen King', 127)
;

CREATE TABLE book_publishers (
	publisher_Name varchar (30) NOT NULL PRIMARY KEY,
	publisherAddress varchar (50) NOT NULL,
	publisherPhone varchar (15) NOT NULL 
);

INSERT INTO book_publishers (publisher_name, publisherAddress, publisherPhone)
	VALUES
		('RandomHouse', '52 6th Ave', '330-545-5252'),
		('Penguin', '902 Georgia Blvd', '330-518-8563'),
		('Avery', '4444 Dingus Lane',	'330-546-8888'),
		('Orca', '1 Ocean Ave', '330-587-6331')
;





;