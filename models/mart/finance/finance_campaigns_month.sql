SELECT 
    CONCAT('2021-0',EXTRACT(MONTH FROM date_date)) AS months
    , SUM(nb_transactions) AS nb_transaction
    , SUM(revenue) AS revenue
    , ROUND(AVG(average_basket),1) AS average_basket
    , SUM(margin) AS margin
    , SUM(operational_margin) AS operational_margin
    , SUM(ads_margin) AS ads_margin 
FROM {{ ref('finance_campaigns_day') }}
GROUP BY months
ORDER BY months