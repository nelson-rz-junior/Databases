﻿
create view "ProductSalesFor1997" AS
SELECT Categories.CategoryName, Products.ProductName, 
Sum(CONVERT(money,("OrderDetails".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	INNER JOIN (Orders 
		INNER JOIN "OrderDetails" ON Orders.OrderID = "OrderDetails".OrderID) 
	ON Products.ProductID = "OrderDetails".ProductID
WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
GROUP BY Categories.CategoryName, Products.ProductName
