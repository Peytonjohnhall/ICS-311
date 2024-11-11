/* -- mysql source tmp or D2L -- */

/* You may use the database that is assigned to you instead of assignment6 */
drop database if exists assignment6;
create database assignment6;
use assignment6;

drop table if exists charter;
drop table if exists crew;
drop table if exists customer;
drop table if exists earnedrating;
drop table if exists employee;
drop table if exists model;
drop table if exists pilot;
drop table if exists rating;
drop table if exists aircraft;

CREATE TABLE AIRCRAFT (
AC_NUMBER varchar(5) primary key,
MOD_CODE varchar(10),
AC_TTAF double,
AC_TTEL double,
AC_TTER double
);

INSERT INTO AIRCRAFT VALUES('1484P','PA23-250',1833.1,1833.1,101.8);
INSERT INTO AIRCRAFT VALUES('2289L','DC-90A',4243.8,768.9,1123.4);
INSERT INTO AIRCRAFT VALUES('2778V','MA23-350',7992.9,1513.1,789.5);
INSERT INTO AIRCRAFT VALUES('4278Y','PA31-950',2147.3,622.1,243.2);

/* -- */

CREATE TABLE CHARTER (
CHAR_TRIP int primary key,
CHAR_DATE date,
AC_NUMBER varchar(5),
CHAR_DESTINATION varchar(3),
CHAR_DISTANCE double,
CHAR_HOURS_FLOWN double,
CHAR_HOURS_WAIT double,
CHAR_TOT_CHG double,
CHAR_OIL_QTS int,
CUS_CODE int,
foreign key (AC_NUMBER) references AIRCRAFT(AC_NUMBER)
);

INSERT INTO CHARTER VALUES(10001,'2008-02-05','2289L','ATL',936,5.1,2.2,354.1,1,10011);
INSERT INTO CHARTER VALUES(10002,'2008-02-05','2778V','BNA',320,1.6,0,72.6,0,10016);
INSERT INTO CHARTER VALUES(10003,'2008-02-05','4278Y','GNV',1574,7.8,0,339.8,2,10014);
INSERT INTO CHARTER VALUES(10004,'2008-02-06','1484P','STL',472,2.9,4.9,97.2,1,10019);
INSERT INTO CHARTER VALUES(10005,'2008-02-06','2289L','ATL',1023,5.7,3.5,397.7,2,10011);
INSERT INTO CHARTER VALUES(10006,'2008-02-06','4278Y','STL',472,2.6,5.2,117.1,0,10017);
INSERT INTO CHARTER VALUES(10007,'2008-02-06','2778V','GNV',1574,7.9,0,348.4,2,10012);
INSERT INTO CHARTER VALUES(10008,'2008-02-07','1484P','TYS',644,4.1,0,140.6,1,10014);
INSERT INTO CHARTER VALUES(10009,'2008-02-07','2289L','GNV',1574,6.6,23.4,459.9,0,10017);
INSERT INTO CHARTER VALUES(10010,'2008-02-07','4278Y','ATL',998,6.2,3.2,279.7,0,10016);
INSERT INTO CHARTER VALUES(10011,'2008-02-07','1484P','BNA',352,1.9,5.3,66.4,1,10012);
INSERT INTO CHARTER VALUES(10012,'2008-02-08','2778V','MOB',884,4.8,4.2,215.1,0,10010);
INSERT INTO CHARTER VALUES(10013,'2008-02-08','4278Y','TYS',644,3.9,4.5,174.3,1,10011);
INSERT INTO CHARTER VALUES(10014,'2008-02-09','4278Y','ATL',936,6.1,2.1,302.6,0,10017);
INSERT INTO CHARTER VALUES(10015,'2008-02-09','2289L','GNV',1645,6.7,0,459.5,2,10016);
INSERT INTO CHARTER VALUES(10016,'2008-02-09','2778V','MQY',312,1.5,0,67.2,0,10011);
INSERT INTO CHARTER VALUES(10017,'2008-02-10','1484P','STL',508,3.1,0,105.5,0,10014);
INSERT INTO CHARTER VALUES(10018,'2008-02-10','4278Y','TYS',644,3.8,4.5,167.4,0,10017);

/* -- */

CREATE TABLE CREW (
CHAR_TRIP int,
EMP_NUM int,
CREW_JOB varchar(20),
TRIP_HOURS_FLOWN int,
primary key (CHAR_TRIP, EMP_NUM)
);

INSERT INTO CREW VALUES(10001,104,'Pilot',1);
INSERT INTO CREW VALUES(10002,101,'Pilot',2);
INSERT INTO CREW VALUES(10003,105,'Pilot',3);
INSERT INTO CREW VALUES(10003,109,'Copilot',4);
INSERT INTO CREW VALUES(10004,106,'Pilot',5);
INSERT INTO CREW VALUES(10005,101,'Pilot',3);
INSERT INTO CREW VALUES(10006,109,'Pilot',4);
INSERT INTO CREW VALUES(10007,104,'Pilot',6);
INSERT INTO CREW VALUES(10007,105,'Copilot',7);
INSERT INTO CREW VALUES(10008,106,'Pilot',2);
INSERT INTO CREW VALUES(10009,105,'Pilot',11);
INSERT INTO CREW VALUES(10010,108,'Pilot',12);
INSERT INTO CREW VALUES(10011,101,'Pilot',4);
INSERT INTO CREW VALUES(10011,104,'Copilot',6);
INSERT INTO CREW VALUES(10012,101,'Pilot',8);
INSERT INTO CREW VALUES(10013,105,'Pilot',14);
INSERT INTO CREW VALUES(10014,106,'Pilot',5);
INSERT INTO CREW VALUES(10015,101,'Copilot',9);
INSERT INTO CREW VALUES(10015,104,'Pilot',10);
INSERT INTO CREW VALUES(10016,105,'Copilot',3);
INSERT INTO CREW VALUES(10016,109,'Pilot',1);
INSERT INTO CREW VALUES(10017,101,'Pilot',2);
INSERT INTO CREW VALUES(10018,104,'Copilot',8);
INSERT INTO CREW VALUES(10018,105,'Pilot',9);

/* -- */

CREATE TABLE PILOT (
EMP_NUM int primary key,
PIL_LICENSE varchar(25),
PIL_RATINGS varchar(25),
PIL_MED_TYPE varchar(1),
PIL_MED_DATE date,
PIL_PT135_DATE date,
HOURS_FLOWN int
);

INSERT INTO PILOT VALUES(101,'ATP','SEL/MEL/Instr/CFII','1','2008-04-12','2007-05-16',120);
INSERT INTO PILOT VALUES(104,'ATP','SEL/MEL/Instr','1','2007-06-10','2008-03-23',230);
INSERT INTO PILOT VALUES(105,'COM','SEL/MEL/Instr/CFI','2','2008-02-25','2008-02-12',105);
INSERT INTO PILOT VALUES(106,'COM','SEL/MEL/Instr','2','2008-04-02','2007-12-24',320);
INSERT INTO PILOT VALUES(109,'COM','SEL/MEL/SES/Instr/CFII','1','2008-04-14','2008-04-21',400);


/* -- */

CREATE TABLE CUSTOMER (
CUS_CODE int primary key,
CUS_LNAME varchar(15),
CUS_FNAME varchar(15),
CUS_INITIAL varchar(1),
CUS_AREACODE varchar(3),
CUS_PHONE varchar(8),
CUS_BALANCE double
);

INSERT INTO CUSTOMER VALUES(10010,'Ramas','Alfred','A','615','844-2573',0);
INSERT INTO CUSTOMER VALUES(10011,'Dunne','Leona','K','713','894-1238',0);
INSERT INTO CUSTOMER VALUES(10012,'Smith','Kathy','W','615','894-2285',896.53);
INSERT INTO CUSTOMER VALUES(10013,'Olowski','Paul','F','615','894-2180',1285.18);
INSERT INTO CUSTOMER VALUES(10014,'Orlando','Myron',NULL,'615','222-1672',673.21);
INSERT INTO CUSTOMER VALUES(10015,'O''Brian','Amy','B','713','442-3381',1014.55);
INSERT INTO CUSTOMER VALUES(10016,'Brown','James','G','615','297-1228',0);
INSERT INTO CUSTOMER VALUES(10017,'Williams','George','','615','290-2556',0);
INSERT INTO CUSTOMER VALUES(10018,'Farriss','Anne','G','713','382-7185',0);
INSERT INTO CUSTOMER VALUES(10019,'Smith','Olette','K','615','297-3809',453.9);

/* -- */

CREATE TABLE EARNEDRATING (
EMP_NUM int,
RTG_CODE varchar(5),
EARNRTG_DATE date, 
primary key (emp_num, rtg_code)
);
INSERT INTO EARNEDRATING VALUES(101,'CFI','2008-02-18');
INSERT INTO EARNEDRATING VALUES(101,'CFII','2009-12-15');
INSERT INTO EARNEDRATING VALUES(101,'INSTR','2012-11-08');
INSERT INTO EARNEDRATING VALUES(101,'MEL','2014-06-23');
INSERT INTO EARNEDRATING VALUES(101,'SEL','2018-04-21');
INSERT INTO EARNEDRATING VALUES(104,'INSTR','2006-07-15');
INSERT INTO EARNEDRATING VALUES(104,'MEL','2007-01-09');
INSERT INTO EARNEDRATING VALUES(104,'SEL','2010-03-12');
INSERT INTO EARNEDRATING VALUES(105,'CFI','2017-11-18');
INSERT INTO EARNEDRATING VALUES(105,'INSTR','2018-04-17');
INSERT INTO EARNEDRATING VALUES(105,'MEL','2019-08-12');
INSERT INTO EARNEDRATING VALUES(105,'SEL','2020-09-23');
INSERT INTO EARNEDRATING VALUES(106,'INSTR','2015-12-20');
INSERT INTO EARNEDRATING VALUES(106,'MEL','2016-04-02');
INSERT INTO EARNEDRATING VALUES(106,'SEL','2018-03-10');
INSERT INTO EARNEDRATING VALUES(109,'CFI','2008-11-05');
INSERT INTO EARNEDRATING VALUES(109,'CFII','2013-06-21');
INSERT INTO EARNEDRATING VALUES(109,'INSTR','2016-07-23');
INSERT INTO EARNEDRATING VALUES(109,'MEL','2017-03-15');
INSERT INTO EARNEDRATING VALUES(109,'SEL','2018-02-05');
INSERT INTO EARNEDRATING VALUES(109,'SES','2020-05-12');

/* -- */

CREATE TABLE EMPLOYEE (
EMP_NUM int primary key,
EMP_TITLE varchar(4),
EMP_LNAME varchar(15),
EMP_FNAME varchar(15),
EMP_INITIAL varchar(1),
EMP_DOB date,
EMP_HIRE_DATE date
);
INSERT INTO EMPLOYEE VALUES(100,'Mr.','Kolmycz','George','D','1942-06-15','1987-03-15');
INSERT INTO EMPLOYEE VALUES(101,'Ms.','Lewis','Rhonda','G','1965-03-19','1988-04-25');
INSERT INTO EMPLOYEE VALUES(102,'Mr.','VanDam','Rhett','','1958-11-14','1992-12-20');
INSERT INTO EMPLOYEE VALUES(103,'Ms.','Jones','Anne','M','1974-10-16','2005-08-28');
INSERT INTO EMPLOYEE VALUES(104,'Mr.','Lange','John','P','1971-11-08','1996-10-20');
INSERT INTO EMPLOYEE VALUES(105,'Mr.','Williams','Robert','D','1975-03-14','2006-01-08');
INSERT INTO EMPLOYEE VALUES(106,'Mrs.','Duzak','Jeanine','K','1968-02-12','1991-01-05');
INSERT INTO EMPLOYEE VALUES(107,'Mr.','Diante','Jorge','D','1974-08-21','1996-07-02');
INSERT INTO EMPLOYEE VALUES(108,'Mr.','Wiesenbach','Paul','R','1966-02-14','1994-11-18');
INSERT INTO EMPLOYEE VALUES(109,'Ms.','Travis','Elizabeth','K','1961-06-18','1991-04-14');
INSERT INTO EMPLOYEE VALUES(110,'Mrs.','Genkazi','Leighla','W','1970-05-19','1992-12-01');

/* -- */

CREATE TABLE MODEL (
MOD_CODE varchar(10) primary key,
MOD_MANUFACTURER varchar(15),
MOD_NAME varchar(20),
MOD_SEATS double,
MOD_CHG_MILE double
);
INSERT INTO MODEL VALUES('DC-90A','Beechcraft','KingAir',8,2.67);
INSERT INTO MODEL VALUES('MA23-250','Piper','Aztec',6,1.92);
INSERT INTO MODEL VALUES('PA31-950','Piper','Navajo Chieftain',10,2.34);


/* -- */

CREATE TABLE RATING (
RTG_CODE varchar(5) primary key,
RTG_NAME varchar(50)
);
INSERT INTO RATING VALUES('CFI','Certified Flight Instructor');
INSERT INTO RATING VALUES('CFII','Certified Flight Instructor, Instrument');
INSERT INTO RATING VALUES('INSTR','Instrument');
INSERT INTO RATING VALUES('MEL','Multiengine Land');
INSERT INTO RATING VALUES('SEL','Single Engine, Land');
INSERT INTO RATING VALUES('SES','Single Engine, Sea');


/* Question 1 

Create a view called “Crew_Flight_rating_V” that includes the following 
Employee First and Last Name, Earned rating date, Earned rating name for 
all employees who earned their rating between Feb 5th, 2018 and Sep 23rd, 2020. 
Your answer should include both the SQL statement for view created along with 
the contents of the view (You get the contents of the view by Select * From 
Flight_Rating_V).
*/

CREATE VIEW Crew_Flight_rating_V AS
SELECT 
    EMPLOYEE.EMP_FNAME AS First_Name,
    EMPLOYEE.EMP_LNAME AS Last_Name,
    EARNEDRATING.EARNRTG_DATE AS Earned_Rating_Date,
    RATING.RTG_NAME AS Earned_Rating_Name
FROM 
    EARNEDRATING
JOIN 
    EMPLOYEE ON EARNEDRATING.EMP_NUM = EMPLOYEE.EMP_NUM
JOIN 
    RATING ON EARNEDRATING.RTG_CODE = RATING.RTG_CODE
WHERE 
    EARNEDRATING.EARNRTG_DATE BETWEEN '2018-02-05' AND '2020-09-23';


SELECT * FROM Crew_Flight_rating_V;


/* Question 2 

Create a trigger named crew_hours_trig that will automatically update the 
PILOT table whenever a new charter flight is created in the CREW table. 
After a row is inserted into the CREW table, update the PILOT table’s HOURS_FLOWN 
with TRIP_HOURS_FLOWN. 
*/

DELIMITER //

CREATE TRIGGER crew_hours_trig
AFTER INSERT ON CREW
FOR EACH ROW
BEGIN
    UPDATE PILOT
    SET HOURS_FLOWN = HOURS_FLOWN + NEW.TRIP_HOURS_FLOWN
    WHERE EMP_NUM = NEW.EMP_NUM;
END //

DELIMITER ;


/* Question 3 

Create a trigger named trg_cust_wait_charge that will automatically update the 
CUSTOMER table’s CUS_BALANCE before a new CHARTER row is added. 
Use the CHARTER table’s CHAR_TOT_CHG as the update source (Assume that all 
charter charges are charged to the customer balance.)  
Check CHARTER table’s CHAR_HOURS_WAIT - If char_hours_wait is greater or equal 
to 15, then add extra $115 to customer balance, otherwise, add $10 to customer 
balance. Declare and use a variable X_WAIT_CHG to store this value.
Update CUSTOMER with CHAR_TOT_CHG plus X_WAIT_CHG
Hint: Consider declaring and using variable x_wait_chg to store calculated 
value in b)
*/

DELIMITER //

CREATE TRIGGER trg_cust_wait_charge
BEFORE INSERT ON CHARTER
FOR EACH ROW
BEGIN
    DECLARE x_wait_chg DOUBLE;

    -- Determine the additional wait charge based on CHAR_HOURS_WAIT
    IF NEW.CHAR_HOURS_WAIT >= 15 THEN
        SET x_wait_chg = 115;
    ELSE
        SET x_wait_chg = 10;
    END IF;

    -- Update the CUSTOMER's CUS_BALANCE with the total charge and wait charge
    UPDATE CUSTOMER
    SET CUS_BALANCE = CUS_BALANCE + NEW.CHAR_TOT_CHG + x_wait_chg
    WHERE CUS_CODE = NEW.CUS_CODE;
END //

DELIMITER ;


/* Question 4 

Create a stored procedure to update customer balance.  
Procedure takes the customer code as input parameter.  
The procedure increases the customer balance for this customer by 35%.
*/

DELIMITER //

CREATE PROCEDURE update_customer_balance(IN cust_code INT)
BEGIN
    UPDATE CUSTOMER
    SET CUS_BALANCE = CUS_BALANCE * 1.35
    WHERE CUS_CODE = cust_code;
END //

DELIMITER ;


CALL update_customer_balance(10010);


/* Question 5 

Create a stored procedure that will take an Employee number and percentage, 
then update the corresponding employee’s hourly salary by the input percentage 
(increase the hourly salary, so you are giving the employee a raise).  
Hint: First, Alter Employee table to add the hourly_salary field, update it 
with a value of 23.50 for all rows in the table, before creating the procedure. 
*/

ALTER TABLE EMPLOYEE
ADD COLUMN hourly_salary DOUBLE;

UPDATE EMPLOYEE
SET hourly_salary = 23.50;

DELIMITER //

CREATE PROCEDURE update_hourly_salary(IN emp_num INT, IN percentage_increase DOUBLE)
BEGIN
    UPDATE EMPLOYEE
    SET hourly_salary = hourly_salary * (1 + percentage_increase / 100)
    WHERE EMP_NUM = emp_num;
END //

DELIMITER ;


CALL update_hourly_salary(101, 10);


