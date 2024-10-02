WITH cte1 AS
 (SELECT cu.channel, round(sum(gross_price*sold_quantity)/1000000,2) AS Gross_Sales_mln
FROM fact_sales_monthly fs
JOIN dim_customer cu ON fs.customer_code=cu.customer_code
JOIN fact_gross_price fg ON fs.product_code=fg.product_code
WHERE fs.fiscal_year=2021
GROUP BY channel)

SELECT channel, CONCAT(Gross_Sales_mln, 'M') AS Gross_sales_mln, 
 CONCAT(Round(Gross_Sales_mln*100/total,2),'%') AS pct_contribution
FROM (select sum(Gross_Sales_mln) as total from cte1) A,
(select * from cte1) B
ORDER BY pct_contribution DESC
