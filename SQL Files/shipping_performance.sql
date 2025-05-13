-- This query displays sales and profit per each shipping mode. 
SELECT 
	ROUND((Sales), 2) AS Sales, 
	ROUND((Profit), 2) AS Profit,
	Ship_Mode 
FROM Superstore 
GROUP BY Ship_Mode;

-- This query computes the profit margin percentage for each sub-category. 
SELECT 
	Ship_Mode,
	ROUND(SUM(Sales), 2) AS Sales, 
	ROUND(SUM(Profit), 2) AS Profit, 
	ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Superstore 
GROUP BY Ship_Mode
ORDER BY Profit_Margin_Percent DESC;

-- This query computes products that are not profitable given expedited shipping mechanisms. 
SELECT 
	ROUND(SUM(Profit), 2) AS Profit, 
	Ship_Mode, Product_Name
FROM Superstore 
WHERE Ship_Mode = 'Same Day' OR Ship_Mode = 'First Class'
GROUP BY Ship_Mode, Product_Name
HAVING SUM(Profit) <= 0
ORDER BY SUM(Profit) ASC;

-- The following query computes the number of orders per shipping mode. 
SELECT 
	Ship_Mode, 
	COUNT(DISTINCT ORDER_ID)
FROM Superstore 
GROUP BY Ship_Mode
ORDER BY COUNT(DISTINCT ORDER_ID) DESC;

