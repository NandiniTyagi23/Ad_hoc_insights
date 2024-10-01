SELECT pre.customer_code, customer, round(avg(pre_invoice_discount_pct),4) as avg_discount_pct
FROM fact_pre_invoice_deductions pre
JOIN dim_customer c
ON pre.customer_code=c.customer_code
WHERE fiscal_year=2021 and market="india"
GROUP BY customer_code
ORDER BY avg_discount_pct desc limit 5 
