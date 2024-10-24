--i'm creating another database for assignment called A_project so as not to disturb the cohort_7 database
CREATE Database A_Project;
USE A_Project;

--Now i'm creating a Customer table
CREATE TABLE Customer(
		Customer_ID INT PRIMARY KEY,
		FirstName VARCHAR(100) NOT NULL,
		LastName VARCHAR(100) NOT NULL,
		Email VARCHAR(100) NOT NULL,
		Phone VARCHAR(20) NOT NULL,
		Address VARCHAR(200) NOT NULL,
		City VARCHAR (100) NOT NULL,
		State VARCHAR(50) NOT NULL,
		ZipCode VARCHAR(20) NOT NULL,
);

--Now i'm creating a Product table
CREATE TABLE Product(
		Product_ID INT PRIMARY KEY,
		Product_Name VARCHAR(100) NOT NULL,
		Description VARCHAR(500) NOT NULL,
		Price DECIMAL(10, 2) NOT NULL,
		Stock_Quantity INT NOT NULL,
		Category_ID INT NOT NULL,
	CONSTRAINT const_i FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

--Now i'm creating a Categories table
CREATE TABLE Categories(
		Category_ID INT PRIMARY KEY,
		Category_Name VARCHAR(100) NOT NULL,
		Description VARCHAR(500) NOT NULL,
);

--Now i'm creating a Orders table
CREATE TABLE Orders(
		Order_ID INT PRIMARY KEY,
		Customer_ID INT NOT NULL,
		Order_Date DATE NOT NULL,
		Total_Amount DECIMAL(10, 2) NOT NULL,
	CONSTRAINT const_o FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

--Now i'm creating a OrderDetails table
CREATE TABLE Order_Details(
		OrderDetail_ID INT PRIMARY KEY,
		Order_ID INT NOT NULL,
		Product_ID INT NOT NULL,
		Quantity INT NOT NULL,
		Unit_Price DECIMAL(10, 2) NOT NULL,
	CONSTRAINT const_od FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),

	CONSTRAINT const_p FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

SELECT * FROM Order_Details
