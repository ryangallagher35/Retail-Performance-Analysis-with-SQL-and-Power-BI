-- The following query displays total sales and profit for the superstore. 
SELECT 
	ROUND(SUM(Sales), 2) AS Total_Sales,
	ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore;
	
-- The following query displays monthly sales trends. 
SELECT
	STRFTIME('%Y-%m', DATE(SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 1, 2) || '-' || SUBSTR(Order_Date, 4, 2))) AS Month,
	ROUND(SUM(Sales), 2) AS Montly_Sales
FROM Superstore
WHERE Month IS NOT NULL
GROUP BY Month
ORDER BY Month;

-- The following query displays the top 10 products by sales generated. 
SELECT 
	Product_Name AS Product, 
	ROUND(SUM(Sales), 2) AS Product_Sales
FROM Superstore
GROUP BY Product_ID
ORDER BY Product_Sales DESC
LIMIT 10;

-- This query computes the profit margin percentage for each category type. 
SELECT 
	Category,
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Superstore 
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

