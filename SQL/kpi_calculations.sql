-- TOTAL ORDERS
SELECT
	COUNT(DISTINCT order_id) as Total_orders
FROM fact_orders;    

-- TOTAL QUANTITIES SOLD
SELECT
	COUNT(order_item_id) as Total_Quantities
FROM fact_order_items;

-- TOTAL REVENUE
SELECT 
		SUM(payment_total_value) as Total_Revenue
FROM fact_order_items;        

-- Average Order value
SELECT
	 total_revenue / total_orders as AVG_ORDER_VALUE
FROM ( 
		SELECT
			SUM(payment_total_value) as total_revenue,
			COUNT(DISTINCT order_id) as total_orders
		FROM fact_order_items
	) t;    
    
-- AVERAGE SELLING PRICE
SELECT
		total_revenue/ total_quantities as AVG_Selling_price
FROM (
		SELECT
			SUM(payment_total_value) as total_revenue,
            COUNT(order_item_id) as total_quantities
        FROM fact_order_items
       ) t;

-- MONTHLY TREND       
  SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(oi.price) AS monthly_revenue
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;     
        
-- Top 10 Revenue by Product Category
SELECT 
    p.product_category,
    SUM(o.payment_total_value) AS category_revenue
FROM dim_products p 
JOIN  fact_order_items o
    ON o.product_id = p.product_id
GROUP BY p.product_category
ORDER BY category_revenue DESC
LIMIT 10;

-- Shipping Cost % of Revenue
SELECT
	shipping_cost / total_revenue *100 as shipping_percentage
FROM (
	SELECT
		SUM(total_shipping_cost) as shipping_cost,
		SUM(payment_total_value) as total_revenue
	FROM fact_order_items
   ) t;

-- Average Delivery Days
SELECT 
	AVG(no_of_delivery_days) as avg_delivey_days
FROM dim_delivery_days;    
