## Creating Tables and Adding my own data to Database Tables

### Customers

```sql
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	EMail VARCHAR(255),
	Phone BIGINT,
	Address VARCHAR(300));
INSERT INTO Customers (CustomerID,FirstName,LastName,EMail,Phone,Address)
VALUES
(101,'Srujan','Pothu','srujan@gmail.com',7997037993,'123 Jhansi Road'),
(102,'Vivek','Komma','vivek@gmail.com',9440584444,'kukatpally'),
(103,'Rahul','Samalla','rahul@gmail.com',9398955692,'chaitanyapuri'),
(104,'Manogna','Pothu','manogna@gmail.com',7989603224,'korutla'),
(105,'Ranjith','Ankam','ranjith@gmail.com',8885911162,'kphb');

SELECT * FROM Customers;
```

### Products

```sql
CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255),
	Description VARCHAR(255),
	Price DECIMAL(10,2) ,
);

INSERT INTO Products (ProductID, ProductName,Description,Price)
VALUES
(201,'Backpack','bag for laptop',5000),
(202,'Mouse','good-rated mouse',2000),
(203,'Keyboard','high efficiency',3000),
(204,'Monitor','4k display',4000),
(205,'Pendrive','best class transfer',6000);

SELECT * FROM Products;
```

### Orders

```sql
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	TotalAmount DECIMAL(10,2) ,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES
(301,101,'2024-06-05',5000),
(302,102,'2024-06-06',2000),
(303,103,'2024-06-07',3000),
(304,104,'2024-06-08',4000),
(305,105,'2024-06-09',6000);

SELECT * FROM Orders;
```

### OrderDetails

```sql
CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	Quantity INT ,
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID,OrderID,ProductID,Quantity)
VALUES
(401,301,201,1),
(402,302,202,1),
(403,303,203,1),
(404,304,204,1),
(405,305,205,1);

SELECT * FROM OrderDetails;
```

### Inventory

```sql
CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY,
	ProductID INT,
	QuantityInStock INT ,
	LastStockUpdate DATE,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory (InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES
(501,201,10,'2024-06-10'),
(502,202,20,'2024-06-10'),
(503,203,30,'2024-06-10'),
(504,204,40,'2024-06-10'),
(505,205,50,'2024-06-10');

SELECT * FROM Inventory;
```
