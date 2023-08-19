with CTE1 as
(select c.channel as channel,round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sale_amt
from fact_sales_monthly s
join dim_customer c
on s.customer_code=c.customer_code
join fact_gross_price g
on s.product_code=g.product_code
where s.fiscal_year = "2021"
group by  c.channel),
CTE2 as 
(SELECT 
round(sum(gross_price*sold_quantity)/1000000,2) as tot FROM gdb023.fact_gross_price g
join fact_sales_monthly s
on g.product_code= s.product_code
where s.fiscal_year = "2021")
select cte1.channel,cte1.gross_sale_amt,
concat(round(cte1.gross_sale_amt*100/cte2.tot,2), "%") as pct 
from cte1,cte2
order by pct desc



