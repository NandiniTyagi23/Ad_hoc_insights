SELECT CONCAT(MONTHNAME(fs.date), ' (', YEAR(fs.date),')') AS Month,
 fs.fiscal_year, Round(Sum(fs.sold_quantity*fg.gross_price),2) AS Gross_Sales_Amount
 FROM fact_sales_monthly fs
 JOIN fact_gross_price fg ON fs.product_code=fg.product_code
 JOIN dim_customer cu ON fs.customer_code=cu.customer_code
 WHERE cu.customer="Atliq Exclusive"
 GROUP BY Month, fiscal_year