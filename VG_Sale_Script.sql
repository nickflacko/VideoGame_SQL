SELECT 
	xs.Name, 
	xs.Year, 
	xs.Genre, 
	xs.Publisher, 
	xs.NA_Sales, 
	xs.EU_Sales, 
	xs.JP_Sales, 
	ps.NA_Sales,
	ps.EU_Sales,
	ps.JP_Sales
FROM Xbox_Sales xs
JOIN PS_Sales ps ON xs.Name = ps.Name 

SELECT	
	Genre,
	SUM(NA_Sales) AS Total_NA_Sales,
	SUM(JP_Sales) AS Total_JP_Sales,
	SUM(EU_Sales) AS Total_EU_Sales
FROM Xbox_Sales 
GROUP BY Genre

SELECT 
	Genre,
	SUM(NA_Sales) AS Total_NA_Sales
FROM Xbox_Sales
GROUP BY Genre 
ORDER BY Total_NA_Sales DESC
LIMIT 3


