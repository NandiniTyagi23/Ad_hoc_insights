SELECT 
CASE 
when quarter((adddate((date),interval 4 month)))=1 then "Q1"
when quarter((adddate((date),interval 4 month)))=2 then "Q2"
when quarter((adddate((date),interval 4 month)))=3 then "Q3"
else "Q4"
END as Quarter, sum(sold_quantity) as total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year=2020
 GROUP BY Quarter
 ORDER BY total_sold_quantity desc