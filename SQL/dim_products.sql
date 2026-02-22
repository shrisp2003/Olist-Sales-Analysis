CREATE VIEW dim_products as
SELECT
	p.product_id,
    pt.product_category_name_english as product_category,
	p.product_weight_g, 
	p.product_length_cm, 
	p.product_height_cm, 
	p.product_width_cm
FROM products p
LEFT JOIN product_category_name_translation pt
ON p.product_category_name = pt.product_category_name;    
