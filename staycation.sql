CREATE DATABASE Staycation_Caravan;
USE Staycation_Caravan;

 CREATE TABLE Customer (
	CustomerID  INT,
 	Customer_First_Name VARCHAR(50),
 	Customer_Second_Name VARCHAR(50),
 	Customer_Address CHAR(150),
 	Customer_Email CHAR(150)
	);
    
    INSERT INTO Customer
(CustomerID, Customer_First_Name, Customer_Second_Name, Customer_Address, Customer_Email)
VALUE
(1,'Phoebe', 'Rowland', '28 Cecil Aveunue', 'Phoebe2709@hotmail.com'),
(2, 'Sophie', 'Rowland', '28 Cecil Aveunue', 'Sophie@hotmail.com'),
(3, 'John', 'Smith', '54 Harold Wood', 'John1@hotmail.com'),
(4, 'Dave', 'Hart', '86 Prime Road', 'Dave1@hotmail.com'),
(5, 'Shannon', 'March', '16 Hull Road', 'Shannon@hotmail.com'),
(6, 'Hanaa', 'Smith', '40 Cross Road', 'Hanaa@hotmail.com');

CREATE TABLE Caravan (
Caravan_type VARCHAR(50),
Price FLOAT(10)
);

INSERT INTO Caravan
VALUES
('Standard', 250),
('Standard Newer Model', 270),
('Deluxe', 300),
('Deluxe Newer Model', 320),
('Prestige', 350),
('Prestige Newer Model', 370),
('Prestige with Decking', 400),
('Platinum', 420);


-- PRICE IS LESS THEN 350

SELECT *
FROM CARAVAN
WHERE PRICE < 350;

SELECT * 
FROM Caravan;

CREATE TABLE reservation (
CustomerID INT NOT NULL,
date_in DATE,
date_out DATE,
Area VARCHAR(50),
PRIMARY KEY (CustomerID)
);

INSERT INTO reservation
VALUE
(1, '2022-04-23','2022-04-30', 'Devon'),
(2, '2022-05-23','2022-05-30', 'Essex'),
(3, '2022-06-23','2022-06-30', 'Devon'),
(4, '2022-07-23','2022-07-30', 'Somerset'),
(5, '2022-08-23','2022-08-30', 'Cornwall'),
(6, '2022-09-23','2022-09-30', 'Devon');

SELECT * 
FROM reservation;

CREATE TABLE Payment (
account_number INT,
account_holder_name VARCHAR(40),
account_holder_surname VARCHAR(40)
);

INSERT INTO Payment 
(account_number, account_holder_name, account_holder_surname)
VALUES
(100, 'Phoebe', 'Rowland'),
(101, 'Sophie', 'Rowland'),
(102, 'John', 'Smith'),
(103, 'Dave', 'Hart'),
(104, 'Shannon', 'March'),
(105, 'Hanaa', 'Smith');

CREATE TABLE Caravan_status (
CustomerID INT,
Booking_status BOOL
);


INSERT INTO Caravan_status
(CustomerID, Booking_status)
VALUES
(1, true),
(2, false),
(3, true),
(4, false),
(5, true),
(6, false);

DELIMITER //
CREATE FUNCTION is_availble (
    Booking_status BOOL
) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE CustomerID VARCHAR(50);
    IF Booking_status = true THEN
        SET CustomerID = 'availble';
    ELSEIF Booking_status = false THEN
        SET CustomerID = 'Not availble';
    END IF;
    RETURN (CustomerID);
END//
DELIMITER ;


SELECT
    CustomerID,
	Booking_status,
	is_availble(Booking_status)
FROM
    Caravan_status;
    
SELECT
	t1.CustomerID AS T1ID,
    t1.Customer_First_Name AS T1Customername,
    t2.CustomerID AS T2ID
FROM
	Customer t1
		INNER JOIN
	reservation t2
		ON t1.CustomerID = t2.CustomerID;