create table fact_order_items
select
	f.order_id,
    f.payment_total_value,
    f.total_shipping_cost,
    
    o.product_id,
    o.order_item_id,
    o.seller_id,
    o.total_item_value
   
from fact_orders f
left join (
	select
		order_id,
        order_item_id,
		product_id,
        seller_id,
        (price+freight_value) as total_item_value
    from order_items
) o on f.order_id = o.order_id;    
    
