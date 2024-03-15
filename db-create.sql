-- DATABASE CREATION IN CASE IT DOES NOT EXIST

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BIOSHOP')
BEGIN
    CREATE DATABASE BIOSHOP;
END;

-- DATABASE TO WORK WITH

use BIOSHOP;

-- CREATION OF THE TABLES

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Customers')
BEGIN
    CREATE TABLE Customers
    (
        id INT PRIMARY KEY IDENTITY(1,1),
        name VARCHAR(50) not null,
        surname VARCHAR(50) not null,
		email varchar(50) UNIQUE not null
    );
END;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Products')
BEGIN
    CREATE TABLE Products
    (
		ProductId INT PRIMARY KEY IDENTITY(1,1),
		ProductName VARCHAR(50) not null,
		Price decimal(7, 2) default 0
    );
END;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Orders')
BEGIN
    CREATE TABLE Orders
    (	
		OrderId INT PRIMARY KEY IDENTITY(1,1),
		CustomerId int 
		foreign key (CustomerId) references Customers(id),
		OrderDate date not null
	 );
END;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'OrderDetails')
BEGIN
    CREATE TABLE OrderDetails
    (	
		OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
		OrderId int,
		foreign key (OrderId) references Orders(OrderId),
		ProductId int, 
		foreign key (ProductId) references Products(ProductId),
		Quantity int not null
	 );
END;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Suppliers')
BEGIN
    CREATE TABLE Suppliers
    (	
		SupplierId INT PRIMARY KEY IDENTITY(1,1),
		SupplierName varchar(50),
		Address varchar(100),
		ProductId int, 
	);
END;

CREATE TABLE SupplierProducts (
    SupplierProductId INT PRIMARY KEY IDENTITY(1,1),
    SupplierId INT,
    ProductId INT,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
);

-- ADDING UNIQUE CONSTRAINT AS IT WAS MISSING
ALTER TABLE Products
ADD CONSTRAINT UQ_Products_ProductName UNIQUE (ProductName)
