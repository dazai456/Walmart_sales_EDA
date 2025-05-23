-- Exploratory Data Analysis
SELECT * FROM sales;

-- --------------------------------------------------
-- Generic
-- --------------------------------------------------

-- How many unique cities does the data have?
SELECT 
	DISTINCT(city) 
FROM sales;

-- In which city is each branch?
SELECT 
	DISTINCT(city),
	branch
FROM sales;

-- --------------------------------------------------
-- Product
-- --------------------------------------------------

-- How many unique product lines does the data have?
SELECT 
	COUNT(DISTINCT(product_line))
FROM sales;

-- What is the most common payment method?
SELECT 
	COUNT(payment)
FROM sales
GROUP BY
	payment;

-- What is the most selling product line?
SELECT 
	product_line,
	SUM(quantity) AS qty
FROM sales
GROUP BY
	product_line
ORDER BY qty DESC;

-- What is the total revenue by month?
SELECT 
	month_name AS Month,
	ROUND(SUM(total),2) AS Revenue
FROM sales
GROUP BY month_name
ORDER BY Revenue DESC;

-- What month had the largest COGS?
SELECT 
	month_name AS Month,
	SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?
SELECT
	product_line,
	ROUND(SUM(total),2) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT
	city,
	branch,
	ROUND(SUM(total),2) as total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) AS avg_tax
FROM sales
GROUP BY
	product_line
ORDER BY avg_tax DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT
	product_line,
	CASE 
		WHEN AVG(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good' 
		ELSE 'Bad'
	END
FROM sales
GROUP BY
	product_line
ORDER BY AVG(quantity) DESC;

-- Which branch sold more products than average product sold?
SELECT 
	branch,
	SUM(quantity) AS qnty
FROM sales 
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender?
SELECT
	gender,
	product_line,
	count(product_line)
FROM Sales
GROUP BY gender, product_line
ORDER BY count(product_line) DESC;

-- What is the average rating of each product line?
SELECT 
	product_line,
	ROUND(AVG(rating), 2)
FROM Sales
GROUP BY product_line;

