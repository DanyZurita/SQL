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



/* 7. */



/* 8. */



/* 9. */



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



