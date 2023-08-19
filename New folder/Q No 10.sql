with cte1 as
(SELECT p.division as division,s.product_code as product_code,sum(sold_quantity) as total_sold_qty,
 p.product as product from gdb023.fact_sales_monthly s
join dim_product p 
on s.product_code=p.product_code
where s.fiscal_year = "2021"
group by division,product_code,product),
cte2 as
(select division,total_sold_qty ,product_code,
rank() over(partition by division order by total_sold_qty desc) as 'order_rank' 
from cte1
 )
select cte1.division,cte1.product_code,cte1.product,cte2.order_rank from cte1
join cte2
on cte1.product_code = cte2.product_code
where cte2.order_rank in (1,2,3)