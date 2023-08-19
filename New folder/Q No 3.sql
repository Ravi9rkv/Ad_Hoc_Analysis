SELECT segment, count(product) as product_count FROM gdb023.dim_product
group by segment
order by product_count desc;