WITH cte1 as (SELECT count(distinct (p.product_code)) as product_count2020, p.segment, s.fiscal_year 
FROM dim_product p
JOIN fact_sales_monthly s 
ON p.product_code=s.product_code
GROUP BY p.segment, s.fiscal_year 
HAVING fiscal_year=2020
ORDER BY product_count2020 desc),

cte2 as (SELECT count(distinct (p.product_code)) as product_count2021, p.segment, s.fiscal_year 
FROM dim_product p
JOIN fact_sales_monthly s 
ON p.product_code=s.product_code
GROUP BY p.segment, s.fiscal_year 
HAVING fiscal_year=2021
ORDER BY product_count2021 desc)

SELECT cte1.segment, cte1.product_count2020, cte2.product_count2021,
 (product_count2021-product_count2020) as difference 
 FROM cte1
 JOIN cte2
 ON cte1.segment=cte2.segment ;
