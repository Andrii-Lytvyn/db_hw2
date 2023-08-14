--Найти мин/стоимость товаров для каждой категории
SELECT ProductName,CategoryID,Price,
MIN(Price) AS MinimumPrice
FROM Products
GROUP BY CategoryID
--Вывести ТОП-3 стран по количеству доставленных заказов
SELECT COUNT(OrderID) AS ORDERS_COUND,Customers.Country
FROM [Customers]
JOIN Orders USING(CustomerID)
GROUP BY Country
ORDER BY ORDERS_COUNT DESC
LIMIT 3
--Вывести названия категорий, в которых более 10 товаров
SELECT COUNT(CategoryID) AS CATEGORY_QUANTITY, Categories.CategoryName FROM [Products]
JOIN Categories USING (CategoryID)
GROUP BY CategoryID
HAVING CATEGORY_QUANTITY>=10
ORDER BY CATEGORY_QUANTITY DESC
--Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET
	Phone=''
WHERE
	Country LIKE ('USA')
--Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT COUNT(OrderID) AS Orders_QUANTITY, Employees.LastName, Employees.FirstName
FROM [Orders]
JOIN Employees USING (EmployeeID)
GROUP BY EmployeeID
HAVING Orders_QUANTITY<=15
ORDER BY Orders_QUANTITY DESC
--Вывести товар, который находится на втором месте по ко-ву заказов
По кол заказов SELECT COUNT(OrderID) AS ORDER_QUANTITY,CategoryID,ProductName
FROM
    [OrderDetails]
JOIN Products USING(ProductID)
GROUP BY CategoryID
ORDER BY ORDER_QUANTITY DESC
LIMIT 1 OFFSET 1