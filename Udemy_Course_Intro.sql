# INTRODUCTION TO COURSE

# Create & use the database
CREATE DATABASE IF NOT EXISTS sales;
USE sales;

# Create Tables
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE items (
    item_code VARCHAR(255) PRIMARY KEY,
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255)
);

CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
);

CREATE TABLE sales (
    item_code VARCHAR(255),
    item_name VARCHAR(255)
);

# adds foreign Key to table sales
ALTER TABLE sales
ADD FOREIGN KEY (item_code) REFERENCES items(item_code) ON DELETE CASCADE;

# adds unique key to table customers to have unique email addresses
ALTER TABLE customers
ADD UNIQUE KEY (email_address);

# adds gender column to table customers
ALTER TABLE customers
ADD COLUMN gender ENUM('M','F') AFTER last_name;

# adds default of 0 to number of complaints
ALTER TABLE customers
CHANGE number_of_complaints number_of_complaints INT Default 0;

# alters the headquarters_phone_number field in the companies table to not null
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

# DROPs NULL
ALTER TABLE companies
MODIFY COLUMN headquarters_phone_number VARCHAR (255) NULL;

#inserts first record to table customers
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('Anthony', 'Cordova','M','anthonym.cordova@gmail.com',0);


/*Other examples:
removes unique key
ALTER TABLE customers
DROP INDEX email_address;

DROP TABLES customers, items, companies;

alter removes default values
ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;*/
