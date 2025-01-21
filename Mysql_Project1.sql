-- SQL RETAIL SALES ANALYSIS PROJECT -
USE sql_project_1;
-- Create Table
CREATE TABLE retail_sales
(
	    transactions_id INT PRIMARY KEY,
        sale_date DATE,
        sale_time TIME,
		customer_id INT,
		gender VARCHAR(15),
		age INT,
        category VARCHAR(15),
		quantiy	INT,
		price_per_unit	FLOAT,
		cogs FLOAT,	
		total_sale FLOAT
	);
    show tables in SQL_PROJECT_1;
    SELECT * FROM RETAIL_SALES;
    SELECT COUNT(*) FROM RETAIL_SALES;
-- Data cleaning-
    SELECT * FROM RETAIL_SALES
    WHERE transactions_iD IS NULL
          OR
          SALE_DATE IS NULL
          OR
          SALE_TIME IS NULL
          OR
          CUSTOMER_ID IS NULL
          OR
          GENDER IS NULL
          OR
          AGE IS NULL
          OR
          CATEGORY IS NULL
          OR
          QUANTIY IS NULL
          OR
          PRICE_PER_UNIT IS NULL
          OR
          COGS IS NULL
          OR
          TOTAL_SALE IS NULL;
          
DELETE  FROM RETAIL_SALES
WHERE transactions_iD IS NULL
          OR
          SALE_DATE IS NULL
          OR
          SALE_TIME IS NULL
          OR
          CUSTOMER_ID IS NULL
          OR
          GENDER IS NULL
          OR
          AGE IS NULL
          OR
          CATEGORY IS NULL
          OR
          QUANTIY IS NULL
          OR
          PRICE_PER_UNIT IS NULL
          OR
          COGS IS NULL
          OR
          TOTAL_SALE IS NULL;
          
	-- Total sales
    SELECT COUNT(*) AS TOTAL_SALE FROM RETAIL_SALES;



-- Data Analysis & business key problems 
-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * from retail_sales
where sale_date = '2022-11-05';
-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select * from retail_sales
where category = 'Clothing' 
and sale_date like'%2022-11%' 
and quantiy >=4;

-- 3.Write a SQL query to calculate the total sales (total_sale) for each category.:

select sum(total_sale) as gross , category from retail_sales
group by category;

-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

Select ROUND(avg(age),2)as AVERAGE_AGE,CATEGORY FROM RETAIL_SALES
WHERE CATEGORY = 'BEAUTY';

-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:alter
SELECT * FROM RETAIL_SALES
WHERE TOTAL_SALE>1000;

-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT CATEGORY,GENDER,COUNT(*) AS TOTAL_TRANSACTIONS FROM RETAIL_SALES
GROUP BY GENDER, CATEGORY
order by 1;

-- 7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select 
	year,
    month,
    average_sale
    from
(
select
    year(sale_date) as year,
    month(sale_date) as month,
    avg(total_sale) as average_sale,
    rank() Over(PARTITION BY year(sale_date)ORDER BY AVG(total_sale) desc) as highest
 from retail_sales
 group by 1, 2
 )as t1
 where highest = 1;
 
 -- 8.Write a SQL query to find the top 5 customers based on the highest total sales 
 select customer_id,sum(total_sales) as highest_sales from retail_sales
 group by 1 
 order by 2 desc
 limit 5;
 
 
 -- 9.Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct(customer_id)),category from retail_sales
group by 2

-- End Of Project

