-- Feature Engineering 
SELECT * FROM sales;

-- --------------------------------------------------
-- time_of_day
-- --------------------------------------------------
SELECT 
	CASE
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	ELSE
		'Evening'
	END AS time
FROM sales;

-- change column type
ALTER TABLE sales
ALTER COLUMN time_of_day TYPE VARCHAR(20);

-- update column data 
UPDATE sales 
SET time_of_day = (
	CASE
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	ELSE
		'Evening'
	END);

-- --------------------------------------------------
-- day_name
-- --------------------------------------------------
SELECT
	date,
	TO_CHAR(date, 'DAY')
FROM sales;

-- update column data 
UPDATE sales
set day_name = TO_CHAR(date, 'DAY');

-- --------------------------------------------------
-- month_name
-- --------------------------------------------------
SELECT
	date,
	TO_CHAR(date, 'month')
FROM sales;

-- update column data 
UPDATE sales
set month_name = TO_CHAR(date, 'month');