/* 1. */

SELECT O.OrderID, O.OrderDate, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Orders AS O, `Order Details` AS OD 
	WHERE  O.OrderID = OD.OrderID 
	AND O.OrderDate BETWEEN '1998-05-01%' AND '1998-05-31%'
		GROUP BY OD.OrderID

/* 2. */

SELECT YEAR(O.OrderDate) AS OrderYear, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Orders AS O, `Order Details` AS OD 
	WHERE  O.OrderID = OD.OrderID 
		GROUP BY OrderYear

/* 3. */

SELECT O.ShipCountry, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Orders AS O, `Order Details` AS OD 
	WHERE  O.OrderID = OD.OrderID 
		GROUP BY O.ShipCountry

/* 4. */

SELECT E.LastName, E.FirstName, E.EmployeeID, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Orders AS O, `Order Details` AS OD, Employees AS E
	WHERE  O.OrderID = OD.OrderID
    AND E.EmployeeID = O.EmployeeID
		GROUP BY E.EmployeeID
		ORDER BY Subtotal DESC

/* 5. */

SELECT E.LastName, E.FirstName, E.EmployeeID, O.ShipCountry, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Orders AS O, `Order Details` AS OD, Employees AS E
	WHERE  O.OrderID = OD.OrderID
    AND E.EmployeeID = O.EmployeeID
    	GROUP BY E.EmployeeID, O.ShipCountry
		ORDER BY O.ShipCountry ASC, Subtotal DESC 

/* 6. */

SELECT C.CategoryID, C.CategoryName, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Subtotal 
	FROM Categories AS C, `Order Details` AS OD, Products as P
	WHERE  P.ProductID = OD.ProductID
    AND P.CategoryID = C.CategoryID
    	GROUP BY C.CategoryID

/* 7. */

SELECT C.CategoryID, C.CategoryName, COUNT(P.CategoryID) AS Number
	FROM Categories AS C, Products as P
	WHERE P.CategoryID = C.CategoryID
    	GROUP BY C.CategoryID

/* 8. */

SELECT OD.OrderID, OD.ProductID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.Discount, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS ExtentedPrice 
	FROM `Order Details` AS OD, Products AS P 
	WHERE OD.ProductID = P.ProductID AND OD.OrderID = "10248" 
		GROUP BY OD.ProductID

/* 9. */

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalPrice 
	FROM `Order Details` AS OD 
	WHERE  OD.OrderID = "10248" 

/* 10. */



/* 11. */



/* 12. */



/* 13. */



/* 14. */



/* 15. */



/* 16. */



/* 17. */



/* 18. */



/* 19. */



/* 20. */



/* 21. */



/* 22. */



/* 23. */



/* 24. */



/* 25. */



/* 26. */



/* 27. */



