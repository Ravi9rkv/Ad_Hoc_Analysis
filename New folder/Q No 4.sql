with CTE1 as 
(select p.segment as segment,count(distinct(s.product_code)) as product_count_2020 from fact_sales_monthly s
join dim_product p
on s.product_code= p.product_code
where fiscal_year = "2020"
group by p.segment
order by  product_count_2020 desc),
CTE2 as
(select p.segment,count(distinct(s.product_code)) as  product_count_2021 from fact_sales_monthly s
join dim_product p
on s.product_code = p.product_code
where fiscal_year = "2021"
group by p.segment
order by  product_count_2021 desc)
select CTE1.segment, CTE2. product_count_2021, CTE1.product_count_2020,
CTE2.product_count_2021 - CTE1.product_count_2020 as Difference
FROM CTE1,CTE2
where CTE1.segment = CTE2.segment
group by CTE1.segment
order by Difference desc
