WITH cte1 as 
(SELECT fs.product_code, p.product, p.division, sum(sold_quantity) as total_sold_quantity,
 DENSE_RANK() OVER( partition by division order by sum(sold_quantity) desc) as ranking
FROM fact_sales_monthly fs
JOIN dim_product p
ON fs.product_code=p.product_code
WHERE fiscal_year=2021
GROUP BY division, product_code)

SELECT * FROM cte1 WHERE ranking <4




