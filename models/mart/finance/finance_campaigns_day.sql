SELECT 
    f.date_date
    , nb_transactions
    , revenue
    , average_basket
    , margin
    , operational_margin
    , ROUND((operational_margin - IFNULL(ads_cost,0)),0) AS ads_margin
FROM {{ ref('finance_days') }} as f
LEFT JOIN {{ ref('int_campaigns_day') }} as c
USING (date_date)