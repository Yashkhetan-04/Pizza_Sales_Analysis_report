select * from pizza_sales

-- KPI REQUIREMENT

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_pizza_sold from pizza_sales

select count(distinct order_id) as Total_Orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Avg_pizza_per_order from pizza_sales


-- CHARTS REQUIREMENT

select DATENAME(DW, order_date) as order_day , count(distinct order_id) as total_order from pizza_sales
group by DATENAME(DW, order_date)
-- DW - Day of Week

select DATENAME(MONTH , order_date) as order_month , count(distinct order_id) as total_order from pizza_sales
group by DATENAME(MONTH , order_date)
order by total_order desc

select pizza_category , cast(sum(total_price) as decimal(10,2)) as Total_price , sum(total_price)*100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as Total_sales_Percentage
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category


select pizza_size , cast(sum(total_price) as decimal(10,2)) as Total_price , cast( sum(total_price)*100 / (select sum(total_price) 
from pizza_sales where DATEPART(quarter , order_date) = 1) as decimal(10,2)) as Total_sales_Percentage
from pizza_sales
where DATEPART(quarter , order_date) = 1
group by pizza_size
order by Total_sales_Percentage desc


select top 5 pizza_name , sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name , sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc

select top 5 pizza_name , sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc

select top 5 pizza_name , sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity asc

select top 5 pizza_name , count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders desc


select top 5 pizza_name , count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders asc
