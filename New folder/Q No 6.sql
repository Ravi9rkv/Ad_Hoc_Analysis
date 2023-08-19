

with cte1 as 
              (select customer_code as x, avg(pre_invoice_discount_pct) as y  from fact_pre_invoice_deductions
              where fiscal_year="2021"
              group by customer_code),
     cte2 as 
              (select customer_code as z, customer as a from dim_customer
              where market = "india")
   select cte1.x as customer_code,cte2.a as customer_name, round(cte1.y,4) as average_discount_percentage    
   from cte1
   join cte2
   on cte1.x = cte2.z
   order by average_discount_percentage desc
   limit 5