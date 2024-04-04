 --Assignment
  --1. Average sales in the 1980s, 1990s, 2000s, 2010
  SELECT 
		AVG (CASE WHEN Year BETWEEN 1980 AND 1989 THEN Global_Sales ELSE 0 END) AS '80s_Sales',
		AVG (CASE WHEN Year BETWEEN 1990 AND 1999 THEN Global_Sales ELSE 0 END) AS '90s_Sales',
		AVG (CASE WHEN Year BETWEEN 2000 AND 2009 THEN Global_Sales ELSE 0 END) AS '2000s_Sales',
		AVG (CASE WHEN Year BETWEEN 2010 AND 2019 THEN Global_Sales ELSE 0 END) AS '2010s_Sales'
	FROM vgsales
	--The average sales in the 1980s is 0.02, in 1990s is 0.08, in the 2000s is 0.27 and for 2010s is 0.15

  -- Which publisher made more sales in Japan?
 SELECT Publisher, SUM (JP_Sales) AS JAPAN
 FROM vgsales
 GROUP BY Publisher
 ORDER BY JAPAN DESC

 SELECT *
 FROM vgsales

 --What's the minimum sales in EU and what genre is it?
 SELECT Genre, MIN (EU_Sales)
 FROM vgsales
 GROUP BY Genre

 --From which place did we record most sales?
 SELECT ROUND(SUM (NA_Sales), 1) AS NA, ROUND(SUM (EU_Sales), 1) AS EU, ROUND(SUM (JP_Sales), 1) AS JP, ROUND(SUM (Other_Sales), 1) AS OTHERS
 FROM vgsales

 --Whats the percentage of racing games sales of the global sales?
 SELECT ROUND (SUM (Global_Sales)/8920*100, 0)
 FROM (SELECT *
 FROM vgsales
 WHERE Genre = 'Racing') AS Sub

 -- Which genre is averaging more sales?
 SELECT Genre , AVG (Global_Sales) AS AVGERAGE
  FROM vgsales
  GROUP BY Genre 
  ORDER BY Genre DESC

  -- Which year did we record more sales?
  SELECT Year, SUM (Global_Sales) as Sales
  FROM vgsales
  GROUP BY Year
  ORDER BY Sales DESC

 --Whats the difference in sales of puzzle games in the 1990s and 2000s above?
  SELECT (Sum_Of_Puzzle_Sales - 38.99) AS Difference_in_Puzzle_Game_Sales
 FROM (SELECT SUM (Global_Sales) AS Sum_Of_Puzzle_Sales
  FROM 
  (SELECT Genre, Year, Global_Sales
	FROM vgsales
	WHERE Genre = 'Puzzle' AND Year BETWEEN 2000 AND 2020) AS Bill) AS Win
	--therefore, the difference in the puzzle sales in the 1990s and 2000s above is 101.51