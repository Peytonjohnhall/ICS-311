-- Author: Peyton J. Hall

/* ICS 311 —Database Management Systems
Homework #5

Write SQL statements to answer the following questions using Assignment 4’s 
schema (Customer-Invoice-Line-Product-Vendor). Make sure that your SQL script 
runs without any errors. Submit your answers in a .SQL file.
*/

/* Assignment 4’s schema (Customer-Invoice-Line-Product-Vendor): */

CREATE TABLE Customer (
    cus_code INTEGER PRIMARY KEY,
    cus_lname VARCHAR(20),
    cus_fname VARCHAR(20),
    cus_initial CHAR(1),
    cus_areacode INTEGER,
    cus_phone INTEGER
);

CREATE TABLE Invoice (
    inv_number INTEGER PRIMARY KEY,
    cus_code INTEGER,
    inv_date DATE,
    FOREIGN KEY (cus_code) REFERENCES Customer(cus_code)
);

CREATE TABLE Vendor (
    vend_code INTEGER PRIMARY KEY,
    vend_name VARCHAR(30),
    vend_contact VARCHAR(30),
    vend_areacode INTEGER,
    vend_phone INTEGER
);

CREATE TABLE Product (
    prod_code INTEGER PRIMARY KEY,
    prod_desc VARCHAR(50),
    prod_price INTEGER,
    prod_quant INTEGER,
    vend_code INTEGER,
    FOREIGN KEY (vend_code) REFERENCES Vendor(vend_code)
);

CREATE TABLE Line (
    inv_number INTEGER,
    prod_code INTEGER,
    line_units INTEGER,
    PRIMARY KEY (inv_number, prod_code),
    FOREIGN KEY (inv_number) REFERENCES Invoice(inv_number),
    FOREIGN KEY (prod_code) REFERENCES Product(prod_code)
);

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


/* Question 1:
Find the count of distinct products that are priced 
greater than or equal to than 285? */
SELECT COUNT(DISTINCT prod_code) AS product_count
FROM Product
WHERE prod_price >= 285;

/* Question 2:
 For each vendor, find their product that has the lowest product quantity. Your
 output should include vendor code, vendor name, product description and 
 product quantity for each vendor. 
Hint: Use subquery to get minimum quantity
*/
SELECT V.vend_code, V.vend_name, P.prod_desc, P.prod_quant
FROM Product P
JOIN Vendor V ON P.vend_code = V.vend_code
WHERE P.prod_quant = (
    SELECT MIN(prod_quant)
    FROM Product
    WHERE vend_code = P.vend_code
);

/* Question 3:
Find how many products are there in each invoice. The output should include 
invoice number and number of products in the invoice. 
*/
SELECT L.inv_number, COUNT(DISTINCT L.prod_code) AS product_count
FROM Line L
GROUP BY L.inv_number;

/* Question 4:
Find how many invoices are made by each customer. The output should be a list 
of cus_code and for each cus_code, the number of invoices made by this customer. 
*/
SELECT I.cus_code, COUNT(I.inv_number) AS invoice_count
FROM Invoice I
GROUP BY I.cus_code;

/* Question 5:
Find the total value for all products in the inventory for all product code 
greater than 20000. The total value in the inventory is the sum of product 
quantity * product price for all products listed in the product table. 
*/
SELECT SUM(prod_quant * prod_price) AS total_inventory_value
FROM Product
WHERE prod_code > 20000;

/* Question 6:
Find vendor name, vendor contact, and the number of 
products supplied by each vendor. 
*/
SELECT V.vend_name, V.vend_contact, COUNT(P.prod_code) AS product_count
FROM Vendor V
JOIN Product P ON V.vend_code = P.vend_code
GROUP BY V.vend_name, V.vend_contact;

/* Question 7:
Find product description, price, and vendor code 
for the cheapest (lowest price) product. 
*/
SELECT prod_desc, prod_price, vend_code
FROM Product
WHERE prod_price = (SELECT MIN(prod_price) FROM Product);

/* Question 8:
For each invoice, find the total price. The total invoice price is the sum of 
product price* line units for each product purchased in the invoice. 
*/
SELECT L.inv_number, SUM(P.prod_price * L.line_units) AS total_invoice_price
FROM Line L
JOIN Product P ON L.prod_code = P.prod_code
GROUP BY L.inv_number;

/* Question 9:
Find how many products are bought by each customer. The output should be a list 
of cus_code and for each cus_code, the number of products purchased by this 
customer.  A more complex query (if you want to try it), would be to list the 
name of the customer, along with the cus_code. 
*/
SELECT I.cus_code, C.cus_fname, C.cus_lname, SUM(L.line_units) AS total_products
FROM Invoice I
JOIN Line L ON I.inv_number = L.inv_number
JOIN Customer C ON I.cus_code = C.cus_code
GROUP BY I.cus_code, C.cus_fname, C.cus_lname;