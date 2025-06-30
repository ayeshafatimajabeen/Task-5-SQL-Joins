
-- Task 5:  SQL Joins (Inner, Left, Right, Full)
CREATE DATABASE INFO;
USE INFO;
-- Table 1: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Table 2: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers (CustomerID, Name) VALUES
(1, 'Ayesha'),
(2, 'Zara'),
(3, 'Mehak'),
(4, 'Sara'),
(5, 'Unknown');
INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Phone'),
(103, 1, 'Mouse'),
(104, 5, 'Keyboard');  -- Note: No customer with ID 5 (for RIGHT/FULL join testing)
SELECT * FROM Customers;
SELECT * FROM Orders;


SELECT Customers.Name, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.Name, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Orders.CustomerID, Customers.Name, Orders.Product
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;
