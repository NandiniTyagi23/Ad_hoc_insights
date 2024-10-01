SELECT count(DISTINCT (product_code)) as product_count, segment 
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC 