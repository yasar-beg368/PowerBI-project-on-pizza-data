 USE pizza_db
 SELECT * FROM pizza_sales
--Total Revanue--

SELECT SUM(total_price) AS Total_Revanue FROM pizza_sales

--Average order value--

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales

--Total pizzas sold--

SELECT SUM(quantity) AS Total_pizzas_sold FROM pizza_sales

--Total orders--

SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales


--Average pizzas per order--

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizzas_per_order
FROM pizza_sales


--Total sales by pizza category--


SELECT pizza_category, 
SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS PCT_sales_category_wise 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT_sales_category_wise 


--Total percentage by pizzasize--

SELECT pizza_size, 
CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT_size_wise 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT_size_wise DESC 

SELECT * FROM pizza_sales

--BEST SALLER--

SELECT TOP 5 pizza_name, SUM(total_price) AS top_saller FROM pizza_sales
GROUP BY pizza_name
ORDER BY top_saller DESC

--TOP SALLER BY QUANTITY--

SELECT TOP 5 pizza_name, SUM(quantity) AS top_quantity_saller FROM pizza_sales
GROUP BY pizza_name
ORDER BY top_quantity_saller DESC