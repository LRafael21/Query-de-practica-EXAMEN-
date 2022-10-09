use Northwind

SELECT * FROM Customers
SELECT * FROM Orders

--INNER JOIN
SELECT OrderID, C.CustomerID, CompanyName, OrderDate FROM Customers C  
JOIN Orders O ON C.CustomerID = O.CustomerID


SELECT * FROM Categories
SELECT * FROM Products

--SUBCONSULTA
SELECT C.CategoryID as 'ID', C.CategoryName as 'Nombre Categoria',
(SELECT COUNT(P.ProductID )  FROM Products P WHERE P.CategoryID = C.CategoryID)
as 'Cantidad de productos'
FROM Categories C

--2. — Obtener Empleados y la cantidad de órdenes del año 1997,
--orden descendente por cantidad de órdenes

SELECT * FROM Employees
SELECT * FROM Orders

SELECT E.EmployeeID as 'ID EMPLEADO', E.FirstName as 'Nombre Empleado',
(SELECT COUNT(O.OrderID) FROM Orders O WHERE O.EmployeeID = E.EmployeeID 
and year(O.Orderdate) = 1997) as 'Cantidad de ordenes'
FROM Employees E 
go

/*3. — Un listado de los empleados y el monto total 
 generado en las órdenes y la cantidad de órdenes de cada uno.*/ select * from  Employees
 select * from Orders


 ---------------------------------------------------------

 use AdventureWorks2014

 --SUBCONSULTAS 

--crear una consulta para encontrar empleados que tienen más vacaciones disponibles que el promedio, en la tabla HumanResources.Employee.

SELECT * FROM HumanResources.Employee

SELECT HU.BusinessEntityID as 'ID EMPLEADO', HU.LoginID as 'Nombre raro',
(SELECT AVG(H.VacationHours)  FROM HumanResources.Employee H where H.VacationHours > HU.VacationHours) as 'Vacaciones disponibles > promedio'
FROM HumanResources.Employee HU

-- Se Quiere saber cuál de los empleados tienen más horas de vacaciones que el promedio para su puesto de trabajo. Tabla HumanResources.Employee.

SELECT HU.BusinessEntityID as 'ID EMPLEADO', HU.LoginID as 'Nombre raro', HU.JobTitle as 'Nombre Trabajo',
(SELECT Avg(H.VacationHours)  FROM HumanResources.Employee H  where h.JobTitle > hu.JobTitle) as 'Vacaciones disponibles > promedio'
FROM HumanResources.Employee HU

---------------------------


-- 3. Conocer qué empleados tenían sus PAY RATES modificadas en 2010, tablas HumanResources.Employee y HumanResources.EmployeePayHistory
select * from HumanResources.Employee
select * from HumanResources.EmployeePayHistory

select e.LoginID, o.Rate from HumanResources.Employee e
inner join HumanResources.EmployeePayHistory o  on o.BusinessEntityID = e.BusinessEntityID
where Year(O.ModifiedDate) = 2010










