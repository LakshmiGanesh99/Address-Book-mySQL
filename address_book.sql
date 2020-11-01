#UC1 create a database
CREATE DATABASE address_Book_Service;
USE address_Book_Service;

#UC2 Creating a Address Book Table
CREATE TABLE address_book
(
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
address VARCHAR(100) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(20) NOT NULL,
zip VARCHAR(6) NOT NULL,
phone_number VARCHAR(10) NOT NULL,
emailId VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
)

DESCRIBE address_book;

#UC3 inserting new contacts to address book
INSERT address_book (first_name, last_name, address, city, state, zip, phone_number, emailId) VALUES
('Lakshmi', 'Ganesh', 'old gajuwaka', 'vizag', 'ap', '530036','9494691188', 'klg@klg.com'),
('Priya', 'K', 'old gajuwaka', 'mumbai', 'mh', '530066','9882763875', 'pl@pl.com'),
('mln', 'b', 'guargon', 'guargon', 'haryana', '530044','9494691888', 'mln@mln.com');

#UC4 updating or editing existing contact person using their name
SET SQL_SAFE_UPDATES=0;
UPDATE address_book 
SET city = 'Hyderabad', zip = '588987'
WHERE first_name = 'Lakshmi';

#UC5 ability to delete a persons contact using persons contac name
DELETE FROM address_book WHERE first_name = 'mln'; 

#UC6 Ability to Retrieve Person belonging to a City or State from the Address Book
SELECT * FROM address_book WHERE city = 'mumbai';
SELECT * FROM address_book WHERE state = 'ap';

#UC7 Ability to understand the size of address book by City and State
SELECT COUNT(city)
FROM address_book;
SELECT COUNT(state)
FROM address_book;

#UC8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city
SELECT * FROM address_book WHERE city = 'mumbai' ORDER BY first_name ASC ;

INSERT address_book (first_name, last_name, address, city, state, zip, phone_number, emailId) VALUES   ## inserted these data for more reference
('Kalyan', 'K', 'anderi', 'mumbai', 'mh', '530066','9882763845', 'pl@p.com'),
('kartik', 'b', 'daravi', 'mumbai', 'mh', '530044','9494631888', 'mlk@mln.com');

#UC9 Ability to identify each Address Book with name and Type. adding a column named TYPE(profession) to the table 
ALTER TABLE address_book ADD profession VARCHAR(50);
UPDATE address_book SET profession = 'Doctor' WHERE first_name = 'Lakshmi';
UPDATE address_book SET profession = 'Actor' WHERE first_name = 'Priya';
UPDATE address_book SET profession = 'Doctor' WHERE first_name = 'Kalyan';
UPDATE address_book SET profession = 'Doctor' WHERE first_name = 'kartik';


#UC10 Ability to get number of contact persons i.e. count by type(profession)
SELECT COUNT(profession) FROM address_book;
