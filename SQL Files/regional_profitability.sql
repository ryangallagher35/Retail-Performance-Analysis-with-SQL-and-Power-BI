-- This query computes profit and sales by region. 
SELECT 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Sales), 2) AS Sales, 
	Region 
FROM Superstore 
GROUP BY Region;

-- This query computes states whose profit is negative.
SELECT 
	ROUND(SUM(Profit), 2) AS Profit, 
	State
FROM Superstore 
GROUP BY State 
HAVING Profit < 0;

-- The following query computes the top 10 states with the highest-valued customers. 
SELECT 
	State,
	ROUND(SUM(Profit), 2) AS Profit, 
	COUNT(DISTINCT Customer_ID) AS Total_Customers, 
	ROUND(SUM(Profit) / COUNT(DISTINCT Customer_ID), 2) AS Profit_Per_Customer
FROM Superstore
GROUP BY State 
ORDER BY Profit_Per_Customer DESC
LIMIT 10;

-- The following query computes the product of various product categories by region. 
SELECT 
	Region, 
	Category,
	ROUND(SUM(Profit), 2) AS Profit
FROM Superstore 
GROUP BY Region, Category;

-- The query below identifies "high-sales (greater than $10,000) and low-profit margin (less than 5%) states."
SELECT 
	State, 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Superstore 
GROUP BY State
HAVING SUM(Sales) > 10000 AND (SUM(Profit) / SUM(Sales) * 100) < 5;

-- The following query finds the top 10 states with the most customers. 
SELECT 
	State, 
	COUNT(DISTINCT Customer_ID)
FROM Superstore
GROUP BY State
ORDER BY COUNT(DISTINCT CUSTOMER_ID) DESC
LIMIT 10;



	