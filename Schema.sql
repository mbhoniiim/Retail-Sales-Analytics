CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(20),
	City VARCHAR(50)
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(100),
	Category VARCHAR(50),
	Price DECIMAL(10, 2)
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	QuantityID INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);