WITH tce as
(SELECT *
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('stg_raw__ship') }}
USING (orders_id))
SELECT orders_id, date_date, ROUND(margin + shipping_fee - ship_cost - log_cost,2) AS operational_margin, quantity, revenue, margin
FROM tce
ORDER BY orders_id DESC