CREATE VIEW dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    LOWER(TRIM(customer_city)) AS customer_city,
    UPPER(TRIM(customer_state)) AS customer_state
FROM customers;
