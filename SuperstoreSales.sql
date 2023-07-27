USE Superstore
SELECT *
FROM dbo.Superstore_Sales
ORDER BY Row_ID;

-- How many items were sold, what was the total sales and profit in each year? (2015, 2016, 2017, 2018)

SELECT DATETRUNC(year, Order_Date) AS Year,
SUM(Quantity) AS Number_of_Items_Sold,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY DATETRUNC(year, Order_Date)
ORDER BY DATETRUNC(year, Order_Date);

-- How many items were sold, what was the total sales and profit in all 4 quarters in each year? (2015, 2016, 2017, 2018)

SELECT
    YEAR(Order_Date) AS Year,
    CONCAT('Q', DATEPART(QUARTER, Order_Date)) AS Quarter,
    SUM(Quantity) AS Number_of_Items_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY YEAR(Order_Date), DATEPART(QUARTER, Order_Date)
ORDER BY YEAR(Order_Date), DATEPART(QUARTER, Order_Date);


-- Sales and profit in each City within United States and gross revenue

SELECT City,
SUM(Quantity) AS Number_of_Items_Sold,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Sales * Quantity) AS Gross_Revenue
FROM dbo.Superstore_Sales
GROUP BY City
ORDER BY City;

-- Region with the most sales, profit and gross revenue

SELECT Region,
SUM(Quantity) AS Number_of_Items_Sold,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Sales * Quantity) AS Gross_Revenue
FROM dbo.Superstore_Sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Are there more sales with or without discounts

SELECT Discount,
AVG(Sales) AS Total_Sales
FROM dbo.Superstore_Sales
GROUP BY Discount
ORDER BY Total_Sales DESC;

-- sub-categories with most sales and profit margin

SELECT Category,
[Sub-Category],
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
ROUND(SUM(profit)/SUM(sales)*100, 2) AS Profit_Margin
FROM dbo.Superstore_Sales
GROUP BY Category, [Sub-Category]
ORDER BY Total_Profit DESC;

-- most profitable products

SELECT Product_Name,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

-- least profitable products

SELECT Product_Name,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY Product_Name
ORDER BY Total_Profit ASC;
