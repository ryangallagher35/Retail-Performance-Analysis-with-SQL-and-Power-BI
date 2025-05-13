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

-- The query below identifies items that are sometimes purchased together, illuminating opportunities for bundling. 
SELECT 
    a.Product_Name AS Product_1,
    b.Product_Name AS Product_2,
    COUNT(*) AS Times_Bundled
FROM Superstore a
JOIN Superstore b 
    ON a.Order_ID = b.Order_ID 
    AND a.Product_Name < b.Product_Name
GROUP BY a.Product_Name, b.Product_Name
ORDER BY Times_Bundled DESC;
