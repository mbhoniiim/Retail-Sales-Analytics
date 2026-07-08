-- Customer Lifetime Value

SELECT
	c.CustomerID,
	c.FirstName,
	c.LastName,
	SUM(p.Price * od.Quantity) AS LifetimeValue
	FROM Customers c
	JOIN Orders o ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	JOIN Products p ON od.ProductID = p.ProductID
	GROUP BY
	c.CustomerID,
	c.FirstName,
	c.LastName
	ORDER BY LifetimeValue DESC;

-- Best Performing Cities

SELECT
	c.City,
	SUM(p.Price * od.Quantity) AS Revenue
	FROM Customers c
	JOIN Orders o ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	JOIN Products p ON od.ProductID = p.ProductID
	GROUP BY c.City
	ORDER BY Revenue DESC;

-- Monthly Revenue

SELECT 
	EXTRACT(MONTH FROM o.OrderDate) AS Month,
	SUM(p.Price * od.Quantity) AS Revenue
	FROM Orders o
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	JOIN Products p ON od.ProductID = p.ProductID
	GROUP BY Month
	ORDER BY Month;

-- Revenue by Category

SELECT 
	p.Category,
	SUM(p.Price * od.Quantity) AS Revenue
	FROM Products p
	JOIN OrderDetails od ON p.ProductID = od.ProductID
	GROUP BY p.Category
	ORDER BY Revenue DESC;

-- Top selling products

SELECT 
	p.ProductName,
	SUM(od.Quantity) AS UnitsSold
	FROM Products p
	JOIN OrderDetails od ON p.ProductID = od.ProductID
	GROUP BY p.ProductName
	ORDER BY UnitsSold DESC;

-- Top 10 customers by spending

SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	SUM(p.Price * od.Quantity) AS TotalSpent
	FROM Customers c
	JOIN Orders o ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	JOIN Products p ON od.ProductID = p.ProductID
	GROUP BY 
	c.CustomerID,
	c.FirstName,
	c.LastName
	ORDER BY TotalSpent DESC
	LIMIT 10;