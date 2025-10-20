-- Create database and sample tables for nested GridView demo
IF DB_ID(N'AspGridDemo') IS NULL
BEGIN
    CREATE DATABASE AspGridDemo;
END
GO

USE AspGridDemo;
GO

IF OBJECT_ID(N'dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID(N'dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Orders
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    Product NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL CONSTRAINT DF_Orders_Quantity DEFAULT(1),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY(CustomerId) REFERENCES dbo.Customers(Id)
);

-- Seed
INSERT INTO dbo.Customers(Name) VALUES
(N'Contoso Ltd'),
(N'Northwind Traders'),
(N'Adventure Works');

INSERT INTO dbo.Orders(CustomerId, Product, Quantity) VALUES
(1, N'Paper Reams', 5),
(1, N'Ink Cartridges', 2),
(2, N'Office Chairs', 3);
