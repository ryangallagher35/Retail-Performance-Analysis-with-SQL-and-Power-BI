-- This query determines, for each customer, their total number of orders and overall expenditure.
SELECT
	Customer_Name AS Name, 
	COUNT(DISTINCT ORDER_ID) AS Order_Count,
	ROUND(SUM(Sales), 2) AS Expenditure
FROM Superstore
GROUP BY Customer_Name;

-- This query distinguishes "high-value customers," or customers whose overall expenditure is greater than $10000. 
SELECT 
	Customer_Name AS Name, 
	ROUND(SUM(Sales), 2) AS Expenditure 
FROM Superstore
GROUP BY Customer_Name
HAVING Expenditure > 10000;

-- This query distinguishes the top 20 least profitable customers, based on their profit margin. 
SELECT 
	Customer_Name AS Name, 
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Superstore 
GROUP BY Name
ORDER BY Profit_Margin_Percent
LIMIT 20;

-- This query indicates customers who tend to purchase more when discounts are applied. 
SELECT 
	Customer_Name AS Name, 
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(AVG(Discount), 2) AS Average_Discount 
FROM Superstore
GROUP BY Name
ORDER BY Sales DESC, Average_Discount DESC;

-- The following query determines which regions have the highest concentration of customers. 
SELECT 
	COUNT(Customer_ID) AS Total_Customers, 
	Region
FROM Superstore 
GROUP BY Region
ORDER BY Total_Customers DESC;