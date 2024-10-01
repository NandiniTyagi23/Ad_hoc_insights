SELECT p.product_code, product, round(manufacturing_cost,2) as manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code=m.product_code
WHERE manufacturing_cost IN 
(select max(manufacturing_cost) from fact_manufacturing_cost
UNION 
select min(manufacturing_cost) from fact_manufacturing_cost)
ORDER BY manufacturing_cost desc; 