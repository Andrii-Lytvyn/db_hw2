--В рамках БД "онлайн-магазин" напишите след/запросы:

--Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
    Products.ProductName,
    Products.Price * 1.1 AS Price_usd
FROM Products
JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
ORDER BY Price_usd DESC
LIMIT 1

--Вывести два самых дорогих товара из категории Beverages из USA
SELECT
 Products.ProductName,
    Products.Price,
    Categories.CategoryName,
    Suppliers.Country
FROM Products

JOIN
    Categories ON Products.CategoryID=Categories.CategoryID
    JOIN
    Suppliers ON Suppliers.SupplierID=Products.SupplierID
WHERE
    CategoryName LIKE 'Beverages' AND Country LIKE 'USA'
ORDER BY Price DESC
 LIMIT 2
--Удалить товары с ценой от 5 до 25 EUR
DELETE FROM
    Products
WHERE
	Price BETWEEN 5 AND 25

--Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
    Suppliers.Country
FROM [Products]

JOIN
    Suppliers
ON
    Products.SupplierID=Suppliers.SupplierID
WHERE
    CategoryID = 8

--Очистить поле ContactName у всех клиентов не из China

UPDATE Customers
SET ContactName = ''
WHERE NOT Country = 'China'

------------------------------


--Вывести информацию о товарах с ценой от 10 до 150 EUR, которые были поставлены из Japan:
--название_товара
--цена_товара
--цена_со_скидкой_15_процентов
--название_поставщика

SELECT
Products.ProductName,
Products.Price,
Products.Price*0.85 AS Price_Vs_Disc_15,
Suppliers.SupplierName

FROM [Products]
JOIN
	Suppliers
ON
    Products.SupplierID=Suppliers.SupplierID
WHERE Price BETWEEN 10 AND 150 AND Country = 'Japan'


--Вывести заказы клиентов из USA, Germany, UK:
--номер_заказа
--полное_имя_клиента
--страна_клиента
--имя_менеджера
--фамилия_менеджера

SELECT
    Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.FirstName,
    Employees.LastName
FROM
    Customers
JOIN Orders ON Orders.CustomerID=Customers.CustomerID
JOIN Employees ON Employees.EmployeeID=Orders.EmployeeID
WHERE
    Country IN ('USA','Germany','UK')