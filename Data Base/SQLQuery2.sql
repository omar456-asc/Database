CREATE TABLE [AGENCIES] (
  [AencyID] INT NOT NULL,
  [AgencyLocation] VARCHAR(100) NOT NULL,
  PRIMARY KEY ([AencyID])
);

CREATE TABLE [CUSTOMERS] (
  [CustomerID] INT NOT NULL,
  [CustomerName] VARCHAR(50) NOT NULL,
  [CustomerAdress] VARCHAR(100) NOT NULL,
  [CustomerTelephoneNumber] VARCHAR(11) NOT NULL,
  [AgencyID] INT NOT NULL,
  PRIMARY KEY ([CustomerID])
);

CREATE INDEX [FK] ON  [CUSTOMERS] ([AgencyID]);

CREATE TABLE [RENTALS] (
  [RentalID] INT NOT NULL,
  [CustomerID] INT NOT NULL,
  [RentalStartDate] DATE NOT NULL,
  [RentalReturnDate] DATE NOT NULL,
  [VehicleID] INT NOT NULL,
  [TotalRental] DECIMAL NOT NULL,
  PRIMARY KEY ([RentalID])
);
CREATE TABLE [VEHICLES] (
  [VehicleID] INT NOT NULL,
  [VehicleClassID] INT NOT NULL,
  [RentalID] INT NOT NULL,
  PRIMARY KEY ([VehicleID])
);

CREATE INDEX [FK] ON  [VEHICLES] ([VehicleClassID], [RentalID]);

CREATE TABLE [VEHICLECLASSES] (
  [VehicleClassID] INT NOT NULL,
  [VehicleClassName] VARCHAR(50) NOT NULL,
  [VehicleClassPrice] DECIMAL NOT NULL,
  PRIMARY KEY ([VehicleClassID])
);
INSERT INTO AGENCIES VALUES (1,'Cairo,Egypt');
INSERT INTO AGENCIES VALUES (2,'Alexandria,Egypt');
INSERT INTO AGENCIES VALUES (3,'Tanta,Egypt');
INSERT INTO AGENCIES VALUES (4,'Kafr El-Shiekh,Egypt');
INSERT INTO CUSTOMERS VALUES(1,'mohamed ahmed','alex,egypt','01234567891',1);
INSERT INTO CUSTOMERS VALUES(2,'ahmed mohamed','alex,egypt','01123456789',2);
INSERT INTO CUSTOMERS VALUES(3,'mostafa mohamed','alex,egypt','01523456789',3);
INSERT INTO CUSTOMERS VALUES(4,'ahmed mostafa','alex,egypt','premium',4);
INSERT INTO RENTALS VALUES(1,2,12/12/2020,25/12/2021,1,30000.0);
INSERT INTO VEHICLES VAlUES(1,2,3);
INSERT INTO VEHICLECLASSES VAlUES(2,'Toyta',300000.0);
INSERT INTO VEHICLECLASSES VALUES(3,'Aston Martin',200000.0	);


-- 3 select using subquery

SELECT * 
   FROM VEHICLES 
   WHERE VehicleID IN (SELECT VehicleID 
         FROM VEHICLES 
         WHERE VehicleClassID = 1) ;
SELECT * 
   FROM AGENCIES 
   WHERE AgencyLocation IN (SELECT AgencyLocation
         FROM AGENCIES 
         WHERE AgencyLocation = 'Alexandria,Egypt') ;
SELECT * 
   FROM CUSTOMERS 
   WHERE CustomerAdress IN (SELECT CustomerAdress 
         FROM CUSTOMERS 
         WHERE CustomerAdress = 'alex,egypt') ;


-- 2 select statments using count and group functions

SELECT VehicleClassName, COUNT(*)  'count'
FROM VEHICLECLASSES 
GROUP BY VehicleClassName;
SELECT TotalRental, COUNT(*) 'count'
FROM RENTALS 
GROUP BY TotalRental;


-- 5 update statments

UPDATE RENTALS
SET TotalRental = 140.99
WHERE RentalID = 1;
UPDATE VEHICLECLASSES
SET VehicleClassPrice = 90.99
WHERE VehicleClassID = 4;
UPDATE RENTALS
SET TotalRental = 100.99
WHERE RentalID = 2;
UPDATE CUSTOMERS
SET CustomerName = 'Omar walid',CustomerID=1
WHERE CustomerID = 2;
UPDATE RENTALS
SET RentalStartDate= 8/10/2021
WHERE RentalID = 2;


-- 5 delete statments

DELETE FROM AGENCIES WHERE AencyID= 1;
DELETE FROM CUSTOMERS WHERE CustomerID= 2;
DELETE FROM CUSTOMERS WHERE AgencyID = 4;
DELETE FROM VEHICLES WHERE VehicleID= 2;
DELETE FROM VEHICLECLASSES WHERE VehicleClassID= 3;

-- 5 select statements using different joins

SELECT AGENCIES.AencyID, AGENCIES.AgencyLocation
FROM AGENCIES
INNER JOIN CUSTOMERS ON AGENCIES.AencyID=AGENCIES.AencyID;
SELECT CUSTOMERS.CustomerID, CUSTOMERS.CustomerName
FROM CUSTOMERS
LEFT JOIN AGENCIES ON CUSTOMERS.CustomerID=CUSTOMERS.CustomerID;
SELECT RENTALS.RentalID, RENTALS.RentalID
FROM RENTALS
RIGHT JOIN AGENCIES ON RENTALS.RentalID=RENTALS.RentalID;


-- Questions answers 

SELECT FIRST_VALUE(CustomerName) over(ORDER BY CustomerName) from CUSTOMERS;
SELECT FIRST_VALUE(VehicleClassName) over(ORDER BY VehicleClassName) from VEHICLECLASSES;
SELECT First_VALUE(AencyID) over(ORDER BY AencyID) from AGENCIES;
SELECT Last_VALUE(CustomerID) over(ORDER BY CustomerID) from CUSTOMERS;
SELECT COUNT(RentalID) AS NumberOfMembers FROM RENTALS;
SELECT COUNT(CustomerID) AS NumberOfMembers FROM CUSTOMERS;
SELECT COUNT(AgencyID) AS NumberOfMembers FROM CUSTOMERS;
SELECT COUNT(vehicleID) AS NumberOfMembers FROM VEHICLES;
SELECT COUNT(VehicleClassID) AS NumberOfBooks FROM VEHICLECLASSES;
SELECT SUM(TotalRental) AS TotalPrices FROM RENTALS;
SELECT MAX(VehicleClassPrice) AS MaxPrices FROM VEHICLECLASSES;
SELECT MIN(TotalRental) AS MaxPrices FROM RENTALS;
SELECT AVG(VehicleClassPrice) AS AvgPrices FROM VEHICLECLASSES;
SELECT LOWER(CustomerName) from CUSTOMERS;
SELECT upper(VehicleClassName) from VEHICLECLASSES;
SELECT GETDATE();

CREATE INDEX [FK] ON  [RENTALS] ([CustomerID], [VehicleID]);


