select * from pizza_sales

-- KPI REQUIREMENT

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price) / count(distinct order_id) as Avg_order_Value from pizza_sales

select sum(quantity) as Total_pizza_sold from pizza_sales

select count(distinct order_id) as Total_Orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Avg_Pizzas_per_order from pizza_sales


-- CHARTS REQUIREMENT

select DATENAME(DW, order_date) as order_day , count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(DW, order_date)
-- DW - Day of Week

select DATENAME(MONTH , order_date) as Month_Name , count(distinct order_id) as Total_orders from pizza_sales
group by DATENAME(MONTH , order_date) 

select pizza_category , cast(sum(total_price) as decimal(10,2)) as total_revenue , 
cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales ) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category


select pizza_size , cast(sum(total_price) as decimal(10,2)) as total_revenue , cast( sum(total_price)*100 / (select sum(total_price) 
from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

select pizza_category, SUM(quantity) as Total_Quantity_Sold
from pizza_sales
group by pizza_category
order by Total_Quantity_Sold desc


select top 5 pizza_name , sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name , sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc

select top 5 pizza_name , sum(quantity) as Total_Pizza_Sold  from pizza_sales
group by pizza_name
order by Total_Pizza_Sold  desc

select top 5 pizza_name , sum(quantity) as Total_Pizza_Sold  from pizza_sales
group by pizza_name
order by Total_Pizza_Sold  asc

select top 5 pizza_name , count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders desc


select top 5 pizza_name , count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders asc
