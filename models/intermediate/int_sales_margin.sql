WITH tce as
(SELECT *,
    quantity*purchase_price AS purchase_cost,
FROM {{ref("stg_raw__product")}}
JOIN {{ref("stg_raw__sales")}}
USING (products_id))
SELECT *, ROUND(revenue - purchase_cost,2) AS margin, {{ margin_percent(revenue,purchase_cost)}} AS margin_percent
FROM tce