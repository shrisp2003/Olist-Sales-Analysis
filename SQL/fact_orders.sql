create table fact_orders as
select
	o.order_id,
	o.customer_id,
	DATE(o.order_purchase_timestamp) as order_date,
	o.order_status,

	p.payment_total_value,
	p.payment_count,

	i.total_product_cost,
	i.total_shipping_cost,
	i.total_items

from orders o
left Join (
	select 
		order_id,
        SUM(payment_value) as payment_total_value,
        COUNT(payment_sequential) as payment_count
        from order_payments
        group by order_id
) p on o.order_id = p.order_id

left join (
	select
		order_id,
		SUM(price) as total_product_cost,
        SUM(freight_value) as total_shipping_cost,
        COUNT(order_item_id) as total_items
        from order_items
        group by order_id
) i on o.order_id = i.order_id;
