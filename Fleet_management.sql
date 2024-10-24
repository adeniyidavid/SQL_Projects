--Creating a fleet management database
-- I will start by creating the vehicles details

CREATE TABLE Vehicle(
		License_Plate VARCHAR(100) PRIMARY KEY,
		Make VARCHAR(50),
		Model VARCHAR(100),
		Year INT,
		Color VARCHAR(50),
		VIN VARCHAR(100),
);

--before inserting the values, i will create other tables first
--Now i'm creating the Drivers table

CREATE TABLE Drivers(
		FirstName VARCHAR(100),
		LastName VARCHAR(100),
		License_number VARCHAR(50) PRIMARY KEY,
		Phone VARCHAR(50),
		Address VARCHAR(100),
		State VARCHAR(100),
		Zipcode VARCHAR(100),
);

--Now the Trips table

CREATE TABLE Trips(
		Vehicle_id INT PRIMARY KEY,
		Start_Date DATE,
		End_Date DATE,
		Start_location VARCHAR(150),
		End_location VARCHAR(150),
);

--Now the maintenance table

CREATE TABLE Maintenance(
		Vehicle_id INT,
		Maintenance_date DATE,
		Description VARCHAR(500),
		Cost DECIMAL(10, 2),
);

--Now i will start inserting the values into the tables

INSERT INTO Vehicle
VALUES('ABC123', 'Toyota', 'Corolla', '2020', 'White', '1HGCM82633A004352'),
	  ('XYZ789', 'Ford', 'Fusion', '2018', 'Blue', '2HGCM82633A004353');

--forgot to add 'city, to the drivers table. Adding it now

ALTER TABLE Drivers
ADD City VARCHAR(50);

INSERT INTO Drivers(FirstName, LastName, License_number, Phone, Address, City, State, Zipcode)
VALUES('Micheal', 'Smith', 'D1234567', '1234567890', '123 Main st', 'Anytown', 'CA', '12345'),
	  ('Sarah', 'Connor', 'D7654321', '0987654321', '456 elm st', 'Otherville', 'NY', '54321');

--forgot to add 'Driverid and Distance, to the Trips table, adding it now
ALTER TABLE Trips
ADD Driver_ID INT,
	Distance INT;

INSERT INTO Trips (Vehicle_id, Driver_ID, Start_Date, End_Date, Start_location, End_location, Distance)
VALUES('1', '1', '2024-07-01', '2024-07-02', 'Los Angeles', 'San Francisco', '380'),
	  ('2', '2', '2024-07-03', '2024-07-04', 'New York', 'Washington DC', '225');

--Inserting into maintenance table now

INSERT INTO Maintenance
VALUES('1', '2024-06-15', 'Oil Change', '50.00'),
	  ('2', '2024-06-20', 'Tire replacement', '300.00');


--Now the DML

UPDATE Maintenance
SET Cost = 350.00
WHERE Vehicle_id = 2;

DELETE FROM Vehicle
WHERE License_Plate = 'ABC123';

--Given that Vehicle_id was declared as PRIMARY KEY, it can't have a duplicate as requested by the question, so i changed it to '3' instead of using '1'
INSERT INTO Trips(Vehicle_id, Driver_ID, Start_Date, End_Date, Start_location, End_location, Distance)
VALUES('3', '1', '2024-07-05', '2024-07-06', 'Boston', 'Philadelphia', '300');

UPDATE Vehicle
SET Color = 'Red'
WHERE License_Plate = 'XYZ789';

INSERT INTO Maintenance
VALUES('1', '2024-07-10', 'Brake inspection', '100.00');

UPDATE Drivers
SET Phone = 2223334444
WHERE FirstName = 'Micheal';

DELETE FROM Trips
WHERE Vehicle_id = '2';


SELECT * FROM Vehicle
SELECT * FROM Trips
SELECT * FROM Maintenance
SELECT * FROM Drivers