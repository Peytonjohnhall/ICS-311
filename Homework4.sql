-- Author: Peyton J. Hall

/* Question 1:
Create a database using your name. */

-- Creating the Customer table
CREATE TABLE Customer (
    cus_code INTEGER PRIMARY KEY,
    cus_lname VARCHAR(20),
    cus_fname VARCHAR(20),
    cus_initial CHAR(1),
    cus_areacode INTEGER,
    cus_phone INTEGER
);

-- Creating the Invoice table
CREATE TABLE Invoice (
    inv_number INTEGER PRIMARY KEY,
    cus_code INTEGER,
    inv_date DATE,
    FOREIGN KEY (cus_code) REFERENCES Customer(cus_code)
);

-- Creating the Vendor table
CREATE TABLE Vendor (
    vend_code INTEGER PRIMARY KEY,
    vend_name VARCHAR(30),
    vend_contact VARCHAR(30),
    vend_areacode INTEGER,
    vend_phone INTEGER
);

-- Creating the Product table
CREATE TABLE Product (
    prod_code INTEGER PRIMARY KEY,
    prod_desc VARCHAR(50),
    prod_price INTEGER,
    prod_quant INTEGER,
    vend_code INTEGER,
    FOREIGN KEY (vend_code) REFERENCES Vendor(vend_code)
);

-- Creating the Line table
CREATE TABLE Line (
    inv_number INTEGER,
    prod_code INTEGER,
    line_units INTEGER,
    PRIMARY KEY (inv_number, prod_code),
    FOREIGN KEY (inv_number) REFERENCES Invoice(inv_number),
    FOREIGN KEY (prod_code) REFERENCES Product(prod_code)
);


/* Question 2: 
Insert data in tables using insert into statements: */


INSERT INTO Customer (cus_code, cus_lname, cus_fname, cus_initial, cus_areacode, cus_phone) VALUES
(10010, 'Johnson', 'Albert', 'A', 612, 8442573),
(10011, 'Edwards', 'Leona', 'K', 763, 8941238),
(10012, 'Smith', 'Walter', 'W', 612, 8942285),
(10013, 'Roberts', 'Paul', 'F', 612, 2221672),
(10014, 'Orlando', 'Myla', NULL, 612, 2971228);

INSERT INTO Invoice (inv_number, cus_code, inv_date) VALUES
(1001, 10011, '2008-08-03'),
(1002, 10014, '2008-08-04'),
(1003, 10012, '2008-03-20'),
(1004, 10014, '2008-09-23');

INSERT INTO Vendor (vend_code, vend_name, vend_contact, vend_areacode, vend_phone) VALUES
(232, 'Bryson', 'Smith', 615, 2233234),
(235, 'Walls', 'Anderson', 615, 2158995),
(236, 'Jason', 'Schmidt', 651, 2468850);

INSERT INTO Product (prod_code, prod_desc, prod_price, prod_quant, vend_code) VALUES
(12321, 'hammer', 189, 20, 232),
(65781, 'chain', 12, 45, 235),
(34256, 'tape', 35, 60, 236),
(12333, 'drill', 200, 10, 232);

INSERT INTO Line (inv_number, prod_code, line_units) VALUES
(1001, 12321, 1),
(1001, 65781, 3),
(1002, 34256, 6),
(1003, 12321, 5),
(1002, 12321, 6);

/*
Question 3:
Write an SQL statement to do each task in the given order (try 1, 2, 3, 4, then 5). 
Explain whether and why the statement is correctly executed or not.

INSERT INTO Customer (cus_code, cus_fname, cus_lname, cus_initial, cus_areacode, cus_phone) 
VALUES (10012, 'Juan', 'Rodriguez', 'J', 612, 7788776);
This will fail because there is already an entry with cus_code = 10012 
in the Customer table (based on previous inserts). Since cus_code is a primary key, 
it must be unique, so trying to insert another record with the same cus_code violates 
the entity integrity.

INSERT INTO Invoice (inv_number, cus_code, inv_date) 
VALUES (1005, 10017, '2008-11-30');
This will fail because there is no cus_code = 10017 in the Customer table. 
Since cus_code in the Invoice table is a foreign key referencing the Customer 
table, this violates referential integrity. The foreign key constraint 
prevents inserting an invoice with a non-existent customer.

INSERT INTO Product (prod_code, prod_desc, prod_price, prod_quant, vend_code) 
VALUES (12322, 'hammer', 189, 20, 231);
This will fail because vend_code = 231 does not exist in the Vendor table yet. 
Since vend_code is a foreign key referencing the Vendor table, this violates 
referential integrity. You need to insert the vendor before adding products 
referencing that vendor.

INSERT INTO Vendor (vend_code, vend_name, vend_contact, vend_areacode, vend_phone) 
VALUES (231, 'Adam', 'Eric', 615, 2158995);
This will succeed since vend_code = 231 does not exist in the Vendor table, 
and the fields meet all requirements. This insertion does not violate any constraints.

INSERT INTO Product (prod_code, prod_desc, prod_price, prod_quant, vend_code) 
VALUES (12322, 'coil', 189, 20, 231);
This will fail because there is already a product with prod_code = 12322 
(the same issue as in step 1 with the primary key). Since prod_code is a 
primary key in the Product table, it must be unique, so trying to insert 
another record with the same prod_code violates entity integrity.
*/

/* Question 4:
Write SQL statements to answer each of the following questions. */

-- List the Customer Code, Last name, and Customer phone for all customers:
SELECT cus_code, cus_lname, cus_phone 
FROM Customer;

-- List the invoice number and invoice date for all invoices of customer number 10014:
SELECT inv_number, inv_date 
FROM Invoice 
WHERE cus_code = 10014;

-- List the product code, product description, and product quantity for products with invoice number 1001:
SELECT P.prod_code, P.prod_desc, P.prod_quant 
FROM Line L
JOIN Product P ON L.prod_code = P.prod_code
WHERE L.inv_number = 1001;

-- List all product description and product price supplied by a vendor whose vendor contact is 'Somebody':
SELECT P.prod_desc, P.prod_price 
FROM Product P
JOIN Vendor V ON P.vend_code = V.vend_code
WHERE V.vend_contact = 'Somebody';

-- Produce a list of product description, vendor name, and vendor phone for all products with quantity less than or equal to 60:
SELECT P.prod_desc, V.vend_name, V.vend_phone 
FROM Product P
JOIN Vendor V ON P.vend_code = V.vend_code
WHERE P.prod_quant <= 60;

-- For each product bought by a customer, list product description, customer’s first name, and last name:
SELECT P.prod_desc, C.cus_fname, C.cus_lname 
FROM Line L
JOIN Product P ON L.prod_code = P.prod_code
JOIN Invoice I ON L.inv_number = I.inv_number
JOIN Customer C ON I.cus_code = C.cus_code;

