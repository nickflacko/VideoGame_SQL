-- Inner join Xbox and PS4 tables to give a sales comparison for the 2 consoles
-- Only shows games that were released on both consoles
SELECT 
	DISTINCT xs.Name, 
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

-- Which console has sold more games in total globally?
SELECT 
	SUM(DISTINCT xs.Global_Sales) AS total_xbox_sales,
	SUM(DISTINCT ps.Global_Sales) AS total_ps4_sales
FROM Xbox_Sales xs
INNER JOIN PS_Sales ps ON xs.Name = ps.Name 

-- What are the total sales for each genre in North America, Japan, and Europe for Xbox One?
SELECT	
	Genre,
	SUM(NA_Sales) AS Total_NA_Sales,
	SUM(JP_Sales) AS Total_JP_Sales,
	SUM(EU_Sales) AS Total_EU_Sales
FROM Xbox_Sales xs 
GROUP BY Genre

-- What are the top 3 selling genres in North America for PS4?
SELECT 
	Genre,
	SUM(NA_Sales) AS Total_NA_Sales
FROM PS_Sales ps
GROUP BY Genre 
ORDER BY Total_NA_Sales DESC
LIMIT 3

-- Who were the top 5 publishers in global sales for Xbox One in 2015?
SELECT
	Publisher,
	SUM(Global_Sales) as Total_Global_Sales
FROM Xbox_Sales xs 
WHERE Year = 2015
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC
LIMIT 5

-- What are the top 3 years in games sold globally for PS4?
SELECT 
	Year,
	SUM(Global_Sales) as Total_Global_Sales
FROM PS_Sales ps
GROUP BY Year
ORDER BY Total_Global_Sales DESC 
LIMIT 3




