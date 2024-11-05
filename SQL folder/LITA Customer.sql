select * from [dbo].[LITA Capstone Project1]

----------- Total Number of Customers from each Region------------------
select Region, count(CustomerID) as TotalCustomers from [dbo].[LITA Capstone Project1] group by Region

----------- Most Popular Subscription Type---------------------
SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS CustomerCount 
FROM [dbo].[LITA Capstone Project1] 
GROUP BY SubscriptionType 
ORDER BY CustomerCount DESC;

----------- Customers who canceled their Subscription within 6 Months ----------------
SELECT CustomerID
FROM [dbo].[LITA Capstone Project1]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6 AND Canceled =1;

----------- Average Subscription Duration ----------------
SELECT AVG(DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd)) AS AvgSubscriptionDuration
FROM [dbo].[LITA Capstone Project1];


----------- Customers with Subscription longer than 12 Months ----------------
SELECT CustomerID
FROM [dbo].[LITA Capstone Project1]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) < 12;


----------- Total Revenue by Subscription Type ----------------
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[LITA Capstone Project1]
GROUP BY SubscriptionType;


----------- Top 3 Regions by Subscription Cancallations ----------------
SELECT TOP 3 Region, COUNT(CustomerID) AS Cancellations
FROM [dbo].[LITA Capstone Project1]
WHERE Canceled = 0
GROUP BY Region
ORDER BY Cancellations DESC;


----------- Total number of active and canceled Subscriptions ----------------
SELECT Canceled, COUNT(CustomerID) AS TotalSubscriptions
FROM [dbo].[LITA Capstone Project1]
GROUP BY Canceled;
