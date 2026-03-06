-- Indian Union Budget 2026-27 Analysis
-- By Ashish Tyagi

-- Setting up the table to hold the cleaned CSV data
CREATE TABLE budget_tracker (
    Ministry TEXT,
    Scheme TEXT,
    Actuals_2024_2025 NUMERIC,
    Budget_Estimates_2025_2026 NUMERIC,
    Revised_Estimates_2025_2026 NUMERIC,
    Budget_Estimates_2026_2027 NUMERIC 
);

-- Q1: Which ministries are getting the biggest piece of the pie?
SELECT 
    Ministry, 
    SUM(Budget_Estimates_2026_2027) AS Total_BE_26_27_Cr
FROM budget_tracker
GROUP BY Ministry
ORDER BY Total_BE_26_27_Cr DESC
LIMIT 10;

-- Q2: Calculating YoY growth to see which schemes are getting pushed or cut
WITH TimeSeries AS (
    SELECT Scheme, '2025-2026' AS Fiscal_Year, Budget_Estimates_2025_2026 AS Allocation
    FROM budget_tracker
    UNION ALL
    SELECT Scheme, '2026-2027' AS Fiscal_Year, Budget_Estimates_2026_2027 AS Allocation
    FROM budget_tracker
),
YoY_Calc AS (
    SELECT 
        Scheme,
        Fiscal_Year,
        Allocation,
        LAG(Allocation) OVER (PARTITION BY Scheme ORDER BY Fiscal_Year) AS Prev_Allocation
    FROM TimeSeries
)
SELECT 
    Scheme,
    Fiscal_Year,
    Allocation,
    Prev_Allocation,
    ROUND(
        ((Allocation - Prev_Allocation) / NULLIF(Prev_Allocation, 0)) * 100, 2
    ) AS YoY_Growth_Pct
FROM YoY_Calc
WHERE Prev_Allocation > 0 AND Scheme NOT LIKE '%Others%'
ORDER BY YoY_Growth_Pct DESC NULLS LAST
LIMIT 10;

-- Q3: Quick check on the top 5 highest-funded schemes overall
SELECT 
    Scheme, 
    Ministry, 
    Budget_Estimates_2026_2027 AS Allocation_26_27_Cr
FROM budget_tracker
ORDER BY Budget_Estimates_2026_2027 DESC
LIMIT 5;
