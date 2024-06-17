use TechShop
--1
SELECT CONCAT(FirstName,' ',LastName) AS Name,EMail 
FROM Customers;

--2 
SELECT OrderID,OrderDate,CONCAT(FirstName,' ',LastName) AS Name 
FROM Orders
JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

--3 

INSERT INTO Customers 
VALUES (107,'Rakesh','Ankam','rakesh@gmail.com',8898233726,'LB nagar',NULL);

--4
UPDATE Products
SET Price=Price*1.1;

SELECT * FROM Products
--5 
DELETE OrderDetails
FROM OrderDetails
WHERE OrderDetails.OrderID = 305;

DELETE Orders
FROM Orders
WHERE Orders.OrderID = 305;

DECLARE @ip INT
SET @ip=302

DELETE FROM Orders
WHERE OrderID=@ip;

DELETE FROM OrderDetails
WHERE OrderID=@ip;
SELECT * FROM Orders
SELECT * FROM OrderDetails
--6
INSERT INTO Orders 
VALUES (306,106,'2024-06-09',2000);
SELECT * FROM Orders
--7
UPDATE Customers
SET Email='pothu@gmail.com',Address='hyderabad'
WHERE CustomerID=101;
SELECT * FROM Customers
--8
select * from orders;
select * from Products;
select * from OrderDetails;
UPDATE Orders 
SET  Orders.TotalAmount = test.new 
from Orders
inner join (
    SELECT od.OrderID,SUM(p.Price * od.Quantity) as new
    FROM OrderDetails od
	join products as p on od.ProductID = p.ProductID
	join orders as o on o.OrderID = od.orderID
    WHERE od.ProductID = p.ProductID
	group by od.OrderID) 
	as test on Orders.OrderID = test.OrderID
--9

DELETE FROM Orders
WHERE OrderID = 301;
DELETE FROM OrderDetails
WHERE OrderID = 301;
SELECT * FROM Orders
SELECT * FROM OrderDetails
--10
INSERT INTO Products 
VALUES (206,'camera','24MP resolution',9000);
SELECT * FROM Products
--11
ALTER TABLE Orders
ADD Status VARCHAR(255);

UPDATE Orders SET Status = 'shipped'
WHERE OrderID=301;
select * from Orders;

--12
alter table customers add Count_of_Orders int default 0 ;

update Customers
set Customers.Orders_Count=new.No_Of_Orders 
from Customers c
JOIN (select CustomerID,count(OrderID) as No_Of_Orders 
	  from Orders 
	  group by CustomerID) as new
	  ON c.CustomerID = new.CustomerID
	  
	  
	  SELECT * FROM customers;


--13
SELECT * 
FROM  Orders as Ord 
LEFT JOIN Customers as Cus on Cus.CustomerID =Ord.CustomerID;
--14
SELECT ProductName,SUM(Pro.Price*Od.Quantity) as Total_Income 
FROM Products AS Pro
JOIN  OrderDetails AS Od ON  Pro.ProductID = Od.ProductID
GROUP BY ProductName;
--15
SELECT DISTINCT c.CustomerID, OrderID,CONCAT(FirstName,' ',LastName) as NAME,Email,Phone,Address
FROM Customers as c
JOIN Orders as o on c.CustomerID = o.CustomerID

