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

#UC11 Ability to add Friend and family to each contact by adding a new column of name contact type
ALTER TABLE address_book ADD contact_type VARCHAR(50);
UPDATE address_book SET contact_type = 'Friend' WHERE first_name = 'Lakshmi';
UPDATE address_book SET contact_type = 'Family' WHERE first_name = 'Priya';
UPDATE address_book SET contact_type = 'Friend' WHERE first_name = 'Kalyan';
UPDATE address_book SET contact_type = 'Friend' WHERE first_name = 'kartik';

#UC12
 DROP TABLE address_book;
 
 
CREATE TABLE `Address_Details` (
  `add_id` varchar(6) NOT NULL,
  `address` varchar(250),
  `city` varchar(150),
  `state` varchar(150),
  `pin` varchar(6),
  PRIMARY KEY (`add_id`)
);

CREATE TABLE `Address_Book` (
  `book_id` varchar(6) NOT NULL,
  `Book_Name` varchar(150) NOT NULL,
  `Contact_Type` varchar(150) NOT NULL,
  PRIMARY KEY (`book_id`)
);

CREATE TABLE `Person_Details` (
  `id` int unsigned auto_increment NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(250) NOT NULL,
  `add_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key (add_id) references `Address_Details`(add_id)
);

CREATE TABLE `Book_Person` (
  `book_id` varchar(6) NOT NULL,
  `id` int unsigned NOT NULL,
    foreign key (book_id) references `Address_book`(book_id),
	foreign key (id) references `person_details`(id)
);

INSERT INTO address_details(add_id, address, city, state, pin) VALUES 
('ADD101', 'Flat', 'Hyderabad', 'Telangana', '500011'),
('ADD102', 'Plot', 'Vizag', 'AP', '542111'),
('ADD103', 'Hut', 'Pune', 'Maharashtra', '875111'),
('ADD104', 'office', 'Mumbai', 'Maharashtra', '875262');

INSERT INTO address_book(book_id,book_name,contact_type) VALUES
('AB001', 'book_A', 'family'),
('AB002', 'book_B', 'friend'),
('AB003', 'book_A', 'office');

INSERT INTO person_details(first_name,last_name,phone,email,add_id) VALUES
('Miral','Modi','1231231231','abc@gmail.com','ADD104'),
('Mula','Venkat','9879879879','def@gmail.com','ADD102'),
('Bhargav','Mankala','9639639639','cba@gmail.com','ADD101'),
('Koushik','Mankala','3693693693','fed@gmail.com','ADD101'),
('Nishant','Chauhan','4564564564','xyz@gmail.com','ADD103');

INSERT INTO book_person(book_id,id) VALUES
('AB001',3),
('AB001',4),
('AB002',5),
('AB003',5),
('AB003',1),
('AB002',2);

SELECT * 
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
HAVING state = 'AP';

SELECT state,COUNT(*)
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
GROUP BY state;

SELECT city,COUNT(*)
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
GROUP BY city;

SELECT city,first_name
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
HAVING city = 'Hyderabad'
ORDER BY first_name;

SELECT contact_type, count(*)
FROM address_book JOIN book_person
ON address_book.book_id = book_person.book_id
GROUP BY contact_type;
