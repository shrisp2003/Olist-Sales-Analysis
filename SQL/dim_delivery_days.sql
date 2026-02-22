Create view dim_delivery_days as
select 
	order_purchase_timestamp,
    order_delivered_customer_date,
 	datediff(order_delivered_customer_date,order_purchase_timestamp) as no_of_delivery_days
from orders;    
