WITH cte1 AS (SELECT count(DISTINCT(product_code)) AS unique_products_2020 , fiscal_year
 FROM fact_sales_monthly
WHERE fiscal_year=2020),

cte2 AS (SELECT count(DISTINCT(product_code)) AS unique_products_2021, fiscal_year
FROM fact_sales_monthly
WHERE fiscal_year=2021)

SELECT unique_products_2020, unique_products_2021, 
round(((unique_products_2021-unique_products_2020)/unique_products_2020)*100,2) AS pct_chg 
FROM cte1
CROSS JOIN  cte2 


