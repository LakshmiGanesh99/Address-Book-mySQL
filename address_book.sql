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
