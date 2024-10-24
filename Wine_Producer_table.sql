/*--------------------------------
		WINE TABLE
--------------------------------*/
CREATE TABLE Wine(
		Wine_id INT NOT NULL,
		Category VARCHAR(50) NOT NULL,
		Year DATE NOT NULL,
		Degree DECIMAL(3, 1) NOT NULL,
);

/*--------------------------------
		PRODUCER TABLE
--------------------------------*/
CREATE TABLE Producer(
		Producer_num INT NOT NULL,
		Firstname VARCHAR(30) NOT NULL,
		Lastname VARCHAR(30) NOT NULL,
		Region VARCHAR(30) NOT NULL,
);

/*-------------------------------------
		INSERT INTO WINE TABLE
---------------------------------------*/
INSERT INTO Wine
VALUES('1', 'Red', '2019', '13.5'),
	  ('2', 'White', '2020', '12.0'),
	  ('3', 'Rose', '2018', '11.5'),
	  ('4', 'Red', '2021', '14.0'),
	  ('5', 'Sparkling', '2017', '10.5'),
	  ('6', 'White', '2019', '12.5'),
	  ('7', 'Red', '2022', '13.0'),
	  ('8', 'Rose', '2020', '11.0'),
	  ('9', 'Red', '2018', '12.0'),
	  ('10', 'Sparkling', '2019', '10.0'),
	  ('11', 'White', '2021', '11.5'),
	  ('12', 'Red', '2022', '15.0')

/*-------------------------------------
		INSERT INTO PRODUCER TABLE
---------------------------------------*/
INSERT INTO Producer
VALUES('1', 'John', 'Smith', 'Sousse'),
	  ('2', 'Emma', 'Johnson', 'Tunis'),
	  ('3', 'Michael', 'Williams', 'Sfax'),
	  ('4', 'Emily', 'Brown', 'Sousse'),
	  ('5', 'James', 'Jones', 'Sousse'),
	  ('6', 'Sarah', 'Davis', 'Tunis'),
	  ('7', 'David', 'Miller', 'Sfax'),
	  ('8', 'olivia', 'Wilson', 'Monastir'),
	  ('9', 'Daniel', 'Moore', 'Sousse'),
	  ('10', 'Sophia', 'Taylo', 'Tunis'),
	  ('11', 'Mathew', 'Anderson', 'Sfax'),
	  ('12', 'Amelia', 'Thomas', 'Sousse')

/*-------------------------------------
		QUERIES/INSTRUCTIONS
---------------------------------------*/
--List of all producers             Q4
SELECT * FROM Producer

--Sorted list of producers by name       Q5
SELECT * FROM Producer    
ORDER BY Firstname

--Producers from sousse              Q6
SELECT * FROM Producer   
WHERE Region = 'Sousse'

--Total quantity of wine produced by wine_id 12   Q7
SELECT COUNT(*) FROM Wine    
WHERE Wine_id = 12

--Total quantity by category         Q8
SELECT Category, COUNT(*) AS total_quantity 
FROM Wine
GROUP BY Category;

--Producers in sousse region who have harvested wine of degree >= 12 (instead od quantities > 300 cos we weren't given quantity column)  Q9
SELECT Producer.Firstname, Producer.Lastname
FROM Producer
JOIN Wine ON Producer.Producer_num = Wine.Wine_id
WHERE Producer.Region = 'Sousse' AND Wine.Degree >= 12
ORDER BY Producer.lastname, Producer.firstname;

--Wines with degree greater than 12   Q10
SELECT * FROM Wine   
WHERE Degree > 12 AND Wine_id = 24;


--AVG Degree of wine produced           Q12
SELECT AVG(Degree) AS Average_degree FROM Wine;

--Oldest Wine in the database           Q13
SELECT * FROM Wine
ORDER BY year ASC
--LIMIT 1;

--List of wines along with producer details  Q15
SELECT Wine.Wine_id, Wine.Category, Wine.Year, Wine.Degree, Producer.Firstname, Producer.Lastname
FROM Wine
JOIN Producer
ON Wine.Wine_id = Producer.Producer_num;






