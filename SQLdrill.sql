/*1. All information from the habitat table.*/
	SELECT * FROM tbl_habitat;
		
/*2. Retrieve all names from the species_name column that have a species_order value of 3.*/
	SELECT * FROM tbl_species WHERE species_order = 3;
 	
/* 3. Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.*/
	SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* 4. Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.*/
	SELECT 
	a1.species_name, a2.nutrition_id 
	from tbl_species a1
	inner join tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
	WHERE nutrition_id BETWEEN 2202 and 2206;

/* 5. Retrieve all names within the species_name column using the alias "Species Name:" from the species 
table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table. */

	SELECT 
		tbl_species.species_name as 'Species Type:', tbl_nutrition.nutrition_type as 'Nutrition Type:'
		from tbl_species
		inner join tbl_nutrition
		ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
		order by tbl_nutrition.nutrition_type;

/*6. from specialist table, retrieve the first and last name and contact number for those 
who provide care for the penguins from the species table*/

SELECT specialist_fname As 'First Name', specialist_lname AS 'Last Name', specialist_contact AS 'Phone Number'
	FROM tbl_specialist c
		INNER JOIN tbl_care b on b.care_specialist = c.specialist_id
		INNER JOIN tbl_species a on a.species_care = b.care_id
		WHERE a.species_name = 'penguin';

SELECT * FROM tbl_cust
SELECT * FROM tbl_graddata
/*7. create dB*/
CREATE DATABASE db_customers;
GO
/*create table 1*/ 
	CREATE TABLE tbl_cust
		cust_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		f_name VARCHAR (50) NOT NULL,
		l_name VARCHAR (50) NOT NULL
);
/*create table 2*/
	CREATE TABLE tbl_graddata (
		cust_almamater VARCHAR(50) PRIMARY KEY NOT NULL,
		cust_major VARCHAR(50) NOT NULL,
		cust_gradyear INT NOT NULL,
		cust_id INT NOT NULL CONSTRAINT fk_cust_id FOREIGN KEY REFERENCES tbl_cust(cust_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

/*insert values into customer table*/
	INSERT INTO tbl_cust 
		(f_name, l_name)
		VALUES
		('Griffin', 'Browning'),
		('Christine', 'Horvath'),
		('Shanelle', 'Ward'),
		('Kendra', 'Philhower')
;
select * from tbl_cust;
/*insert values into grad data table*/

	INSERT INTO tbl_graddata
		(cust_almamater, cust_major, cust_gradyear, cust_id)
		VALUES 
		('Lourdes University', 'English', 2011, 9),
		('Ohio State', 'English', 2011, 10),
		('CCAD', 'Art', 2011, 11),
		('Otterbein University', 'Health Science', 2011, 12)
		;
select * from tbl_graddata;
select * from tbl_cust;

/*query from both tables - Show Customer First Name, Last Name, and Alma Mater*/

SELECT tbl_cust.f_name as 'First Name', tbl_cust.l_name AS 'Last Name', tbl_graddata.cust_almamater as 'Alma Mater'
	from tbl_cust
	inner join tbl_graddata
	ON tbl_cust.cust_id = tbl_graddata.cust_id;


