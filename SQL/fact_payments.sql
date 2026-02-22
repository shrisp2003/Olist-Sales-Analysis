Create table fact_payments
SELECT
	  row_number() over() as payment_key,
    p.order_id,
    d.payment_type_key,
    p.payment_type,
    p.payment_installments,
    p.payment_value
from order_payments p
left join dim_payment_type d
on d.payment_type = p.payment_type;    
