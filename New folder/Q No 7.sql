select monthname(s.date) as month,s.fiscal_year, 
round(sum(gross_price*sold_quantity),2) as gross_sales_amount 
from fact_sales_monthly s
join dim_customer c
on s.customer_code = c.customer_code
join fact_gross_price g
on s.product_code = g.product_code 
where c.customer = "Atliq Exclusive"
   group by month ,s.fiscal_year
   order by s.fiscal_year
  