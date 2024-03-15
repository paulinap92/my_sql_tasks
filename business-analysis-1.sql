USE BIOSHOP

-- Select all customers who have placed orders.

SELECT DISTINCT 
	c.id, c.name, c.surname
FROM 
	Customers c 
JOIN 
	Orders o on c.id = o.CustomerId

-- Find the total quantity sold for each product.

SELECT p.ProductName, p.ProductId, SUM(od.Quantity) as sum_quant
FROM Products p join OrderDetails od on p.ProductId = od.ProductId
GROUP BY p.ProductName, p.ProductId
ORDER BY p.ProductId

-- Find the total amount spent by each customer.

SELECT c.name, c.surname, sum(od.Quantity*pd.Price) as totalSpent
FROM Customers c 
LEFT join Orders o on c.id = o.CustomerId 
LEFT join OrderDetails od on o.OrderId = od.OrderId 
LEFT JOIN Products pd on od.ProductId = pd.ProductId
GROUP BY c.name, c.surname, c.id

-- List all suppliers for each product.

SELECT p.ProductName, p.ProductId, s.SupplierName
FROM Products p 
JOIN SupplierProducts sp  on p.ProductId = sp.ProductId 
JOIN Suppliers s on sp.SupplierId = s.SupplierId
ORDER BY p.ProductId

-- List all products that have not been ordered yet.

SELECT p.ProductName, p.ProductId, od.ProductId
FROM OrderDetails od right join Products p on p.ProductId = od.ProductId
WHERE od.ProductId is NULL

-- Show the most expensive product.
-- Show the cheapest product.

SELECT top 1 ProductId, ProductName, Price
FROM Products
ORDER BY Price DESC

SELECT top 1 ProductId, ProductName, Price
FROM Products
ORDER BY Price ASC

/*
SELECT ProductId, ProductName, Price
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT ProductId, ProductName, Price
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
*/

-- Show the total revenue from all orders.

SELECT SUM(od.Quantity*pd.Price) as totalIncome
FROM OrderDetails od 
LEFT JOIN Products pd on od.ProductId = pd.ProductId

-- Show all products supplied by a specific supplier.

SELECT s.SupplierName, p.ProductName, p.ProductId
FROM Suppliers s 
LEFT JOIN SupplierProducts sp on s.SupplierId = sp.SupplierId 
LEFT JOIN Products p on p.ProductId = sp.ProductId

-- Show all orders placed within the last 7 days.

SELECT o.OrderDate, o.OrderId, od.ProductId
FROM Orders o 
LEFT JOIN OrderDetails od ON o.OrderId = od.OrderId
WHERE o.OrderDate >= DATEADD(day, -7, GETDATE())
