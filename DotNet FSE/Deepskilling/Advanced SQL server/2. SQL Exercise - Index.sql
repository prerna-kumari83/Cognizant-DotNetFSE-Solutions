-- ============================================
-- Database Schema
-- ============================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ============================================
-- Sample Data
-- ============================================
INSERT INTO Customers (CustomerID, Name, Region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East'),
(4, 'David', 'West');

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Tablet', 'Electronics', 600.00),
(4, 'Headphones', 'Accessories', 150.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-20'),
(3, 3, '2023-03-25'),
(4, 4, '2023-04-30');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 4, 3);

-- ============================================
-- Exercise 1: Creating a Non-Clustered Index
-- Goal: Create a non-clustered index on the ProductName
-- column in the Products table and compare query
-- execution time before and after index creation.
-- ============================================

-- Step 1: Query to fetch product details before index creation
SET STATISTICS TIME ON;
SELECT * FROM Products WHERE ProductName = 'Laptop';
SET STATISTICS TIME OFF;

-- Step 2: Create a non-clustered index on ProductName
CREATE NONCLUSTERED INDEX IX_Products_ProductName
ON Products (ProductName);

-- Step 3: Query to fetch product details after index creation
SET STATISTICS TIME ON;
SELECT * FROM Products WHERE ProductName = 'Laptop';
SET STATISTICS TIME OFF;

-- ============================================
-- Exercise 2: Creating a Clustered Index
-- Goal: Create a clustered index on the OrderDate column
-- in the Orders table and compare query execution time
-- before and after index creation.
-- ============================================

-- Step 1: Query to fetch orders before index creation
SET STATISTICS TIME ON;
SELECT * FROM Orders WHERE OrderDate = '2023-01-15';
SET STATISTICS TIME OFF;

-- Step 2: Create a clustered index on OrderDate
--
-- NOTE: The PRIMARY KEY on OrderID already creates a clustered index
-- by default in SQL Server, and a table can only have ONE clustered
-- index. To follow this exercise exactly, first convert the primary
-- key to a NONCLUSTERED constraint, then create the clustered index
-- on OrderDate. Run this block once, before creating the index:

/*
DECLARE @PKName NVARCHAR(128);
SELECT @PKName = name FROM sys.key_constraints
WHERE type = 'PK' AND parent_object_id = OBJECT_ID('Orders');

EXEC('ALTER TABLE Orders DROP CONSTRAINT ' + @PKName);
ALTER TABLE Orders ADD CONSTRAINT PK_Orders_OrderID PRIMARY KEY NONCLUSTERED (OrderID);
*/

CREATE CLUSTERED INDEX IX_Orders_OrderDate
ON Orders (OrderDate);

-- Step 3: Query to fetch orders after index creation
SET STATISTICS TIME ON;
SELECT * FROM Orders WHERE OrderDate = '2023-01-15';
SET STATISTICS TIME OFF;

-- ============================================
-- Exercise 3: Creating a Composite Index
-- Goal: Create a composite index on the CustomerID and
-- OrderDate columns in the Orders table and compare
-- query execution time before and after index creation.
-- ============================================

-- Step 1: Query to fetch orders before index creation
SET STATISTICS TIME ON;
SELECT * FROM Orders WHERE CustomerID = 1 AND OrderDate = '2023-01-15';
SET STATISTICS TIME OFF;

-- Step 2: Create a composite (non-clustered) index on CustomerID and OrderDate
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID_OrderDate
ON Orders (CustomerID, OrderDate);

-- Step 3: Query to fetch orders after index creation
SET STATISTICS TIME ON;
SELECT * FROM Orders WHERE CustomerID = 1 AND OrderDate = '2023-01-15';
SET STATISTICS TIME OFF;