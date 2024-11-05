-------Total sale for each Product------
SELECT Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM [dbo].[LitaCapCSV]
GROUP BY Product;

--------- Number of sales Transactions per Region-----------------
SELECT Region, COUNT(OrderID) AS TransactionsCount
FROM [dbo].[LitaCapCSV]
GROUP BY Region;

---------------- Highest Selling Product by Total Sales Value -------------------
SELECT TOP 1 Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM [dbo].[LitaCapCSV]
GROUP BY Product
ORDER BY TotalSales DESC;

------------ Total Revenue Per Product---------------------------
SELECT Product, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM [dbo].[LitaCapCSV]
GROUP BY Product;

--------------Monthly Sales Totals for the current year-------------
SELECT MONTH(OrderDate) AS Month, SUM(Quantity * UnitPrice) AS TotalSales
FROM [dbo].[LitaCapCSV]
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate);

----------- Top 5 Customer by Total Purchase Amount------------------
SELECT TOP 5 Customer_Id, SUM(Quantity * UnitPrice) AS TotalSpent
FROM [dbo].[LitaCapCSV]
GROUP BY Customer_Id
ORDER BY TotalSpent DESC;

------------Precentage of Total Sales by each Region-----------------
SELECT Region, SUM(Quantity * UnitPrice) * 100.0 / (SELECT SUM(Quantity * UnitPrice) FROM [dbo].[LitaCapCSV]) AS SalesPercentage
FROM [dbo].[LitaCapCSV]
GROUP BY Region;

-------------- Products with no Sales in the last Quarter---------------
SELECT Product
FROM [dbo].[LitaCapCSV]
WHERE OrderDate >= DATEADD(QUARTER, -1, GETDATE())
GROUP BY Product
HAVING SUM(Quantity) = 0;


