/*--------------------------------
		PRODUCT TABLE
--------------------------------*/
CREATE TABLE Products(
		ProductID INT PRIMARY KEY,
		ProductName VARCHAR(30),
		ProductType VARCHAR(20),
		Price DECIMAL(5, 2)
);

/*--------------------------------
		CUSTOMER TABLE
--------------------------------*/
CREATE TABLE Customers(
		CustomerID INT PRIMARY KEY,
		CustomerName VARCHAR(100),
		Email VARCHAR(30),
		Phone VARCHAR(20)
);

/*--------------------------------
		ORDERS TABLE
--------------------------------*/
CREATE TABLE Orderss(
		OrderID INT PRIMARY KEY,
		CustomerID INT,
		OrderDate DATE,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

/*--------------------------------
		ORDERSDETAILS TABLE
--------------------------------*/
CREATE TABLE orderDetails(
		OrderDetailID INT,
		OrderID INT,
		ProductID INT,
		Quantity DECIMAL(5, 0),
	FOREIGN KEY(OrderID) REFERENCES Orderss(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(productID)
);
DROP TABLE orderDetails
/*--------------------------------
		PRODUCT TYPE TABLE
--------------------------------*/
CREATE TABLE ProductType(
		ProductTypeID INT PRIMARY KEY,
		ProductType_Name VARCHAR(20)
);

/*--------------------------------
	INSERT INTO PRODUCT TABLE
--------------------------------*/
INSERT INTO Products
VALUES(1, 'Widget A', 'Widget', 10.00),
	  (2, 'Widget B', 'Widget', 15.00),
	  (3, 'Gadget X', 'Gadget', 20.00),
	  (4, 'Gadget Y', 'Gadget', 25.00),
	  (5, 'Doohickey', 'Doohickey', 30.00);

/*--------------------------------
	INSERT INTO CUSTOMERS TABLE
--------------------------------*/
INSERT INTO Customers
VALUES(1, 'John Smith', 'john@example.com', 123-456-7890),
	  (2, 'Jane Joe', 'jane.doe@example.com', 987-654-3210),
	  (3, 'Alice Brown', 'alice.brown@example.com', 456-789-0123);

/*--------------------------------
	INSERT INTO ORDERSS TABLE
--------------------------------*/
INSERT INTO Orderss
VALUES(101, 1, '2024-05-01'),
	  (102, 2, '2024-05-02'),
	  (103, 3, '2024-05-01');

/*--------------------------------
	INSERT INTO ORDERSDETAILS TABLE
--------------------------------*/
INSERT INTO orderDetails
VALUES(1, 101, 1, 2),
	  (2, 101, 3, 1),
	  (3, 102, 2, 3),
	  (4, 102, 4, 2),
	  (5, 103, 5, 1);

/*--------------------------------
	INSERT INTO PRODUCT TYPE TABLE
--------------------------------*/
INSERT INTO ProductType
VALUES(1, 'Widget'),
	  (2, 'Gadget'),
	  (3, 'Doohickey');

/*--------------------------------
	INSTRUCTIONS/QUERIES
--------------------------------*/
SELECT * FROM Customers				--Q1
SELECT * FROM Orderss				--Q2
SELECT * FROM Products				--Q3
SELECT * FROM orderDetails			--Q4
SELECT * FROM ProductType			--Q5

--Products names and quantity ordered												 Q6
SELECT Products.ProductName, SUM(orderDetails.Quantity) AS TotalQuantity
FROM Products 
JOIN orderDetails ON Products.ProductID = orderDetails.ProductID
GROUP BY Products.ProductName;

--Customers who have placed an order on every day of the week							Q7
SELECT Customers.CustomerName, COUNT(Orderss.OrderID) AS TotalOrders
FROM Customers
JOIN Orderss
ON Customers.CustomerID = Orderss.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(DISTINCT Orderss.OrderDate) = 7;

--OR

--Using DATEPART(dw, [which means days of the week])
SELECT Customers.CustomerName
FROM Customers
JOIN Orderss
ON Customers.CustomerID = Orderss.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(DISTINCT DATEPART(dw, Orderss.OrderDate)) = 7;


--customer who have placed most orders and the total orders placed                     Q8
SELECT TOP 1 Customers.CustomerName, COUNT(Orderss.OrderID) AS TotalOrders
FROM Customers
JOIN Orderss ON Customers.CustomerID = Orderss.CustomerID
GROUP BY customers.CustomerName
ORDER BY TotalOrders;


--Products that have been ordered the most with the quantity							Q9
SELECT TOP 1 Products.ProductName, SUM(orderDetails.quantity) AS Total_quantity
FROM Products
JOIN orderDetails ON Products.ProductID = orderDetails.productID
GROUP BY Products.ProductName
ORDER BY Total_quantity DESC;

--customers who have ordered at least 1 widget											 Q10
SELECT Customers.CustomerName
FROM Customers
JOIN Products ON Customers.CustomerID = Products.ProductID
WHERE Products.ProductType = 'Widget';

--Customers who placed order gor at least widget and at least one gadget                   Q11
SELECT Customers.CustomerName, SUM(Products.Price * OrderDetails.Quantity) AS TotalCost
FROM Customers
JOIN Orderss ON Customers.CustomerID = Orderss.CustomerID
JOIN OrderDetails ON Orderss.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductType IN ('Widget', 'Gadget')
GROUP BY Customers.CustomerName
HAVING COUNT(DISTINCT Products.ProductType) = 2;

--customers who ordered for at least one gadget and the cost                              Q12
SELECT Customers.CustomerName, SUM(Products.Price * orderDetails.Quantity) AS TotalCost
FROM Customers
JOIN Orderss ON Customers.CustomerID = Orderss.CustomerID
JOIN orderDetails ON Orderss.OrderID = orderDetails.OrderID
JOIN Products ON orderDetails.productID = Products.ProductID
WHERE Products.ProductType = 'Gadget'
GROUP BY Customers.CustomerName;

--customers who ordered for at least one doohickey and the cost                            Q13
SELECT Customers.CustomerName, SUM(Products.Price * orderDetails.Quantity) AS TotalCost
FROM Customers
JOIN Orderss ON Customers.CustomerID = Orderss.CustomerID
JOIN orderDetails ON Orderss.OrderID = orderDetails.OrderID
JOIN Products ON orderDetails.productID = Products.ProductID
WHERE Products.ProductType = 'Doohickey'
GROUP BY Customers.CustomerName;

--customers who have placed an order on every day of the week                              Q14
SELECT Customers.CustomerName, COUNT(Orderss.OrderID) AS TotalOrders
FROM Customers
JOIN Orderss
ON Customers.CustomerID = Orderss.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(DISTINCT Orderss.OrderDate) = 7;



--Total number of widgets and gadgets ordered by each customer and the cost				   Q15
SELECT Customers.CustomerName, SUM(OrderDetails.Quantity) AS TotalQuantity, 
       SUM(Products.Price * OrderDetails.Quantity) AS TotalCost
FROM Customers
JOIN Orderss ON Customers.CustomerID = Orderss.CustomerID
JOIN OrderDetails ON Orderss.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductType IN ('Widget', 'Gadget')
GROUP BY Customers.CustomerName;








