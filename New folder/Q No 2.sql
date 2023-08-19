select A.P as unique_product_2020, B.Q as unique_product_2021, round((Q-P)*100/P,2) as Percentage_change from
((select count(distinct(product_code)) as P from fact_sales_monthly 
where fiscal_year = "2020") A
,
(select count(distinct(product_code)) as Q from fact_sales_monthly 
where fiscal_year = "2021") B)