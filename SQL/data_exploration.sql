-- TOTAL ORDERS
SELECT
	COUNT(DISTINCT order_id) as Total_orders
FROM fact_orders;    

-- TOTAL QUANTITIES
SELECT
	COUNT(order_item_id) as Total_Quantities
FROM fact_order_items;

-- TOTAL REVENUE
SELECT 
		SUM(payment_total_value) as Total_Revenue
FROM fact_order_items;        
