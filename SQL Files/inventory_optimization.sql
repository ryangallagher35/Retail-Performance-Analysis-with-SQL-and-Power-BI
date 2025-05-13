-- This query computes the five lowest-performing sub-categories to determine which ones to promote. 
SELECT 
	ROUND(SUM(Sales), 2) AS Sales, 
	Sub_Category
FROM Superstore 
GROUP BY Sub_Category
ORDER BY Sales
LIMIT 5;

-- This query computes products that are not profitable. 
SELECT 
	ROUND(SUM(Profit), 2) AS Profit, 
	Product_Name
FROM Superstore 
GROUP BY Product_Name
HAVING SUM(Profit) <= 0;

-- This query computes the profit margin percentage for each sub-category. 
SELECT 
	Sub_Category,
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Superstore 
GROUP BY Sub_Category
ORDER BY Profit_Margin_Percent DESC;

-- The following query finds the top 20 products sold in terms of quantity. 
SELECT 
	Product_Name, 
	COUNT(DISTINCT ORDER_ID)
FROM Superstore 
GROUP BY Product_Name
ORDER BY COUNT(DISTINCT ORDER_ID) DESC
LIMIT 20; 