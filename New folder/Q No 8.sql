select 
case
when date between '2019-09-01' and '2019-11-01' then "Q1"
when date between '2019-12-01' and '2020-02-01' then "Q2"
when date between '2020-03-01' and '2020-05-01' then "Q3"
else "Q4"
end as Quaters,sum(sold_quantity) as tot_sold_qty
from fact_sales_monthly
where fiscal_year = "2020"
group by quaters
order by tot_sold_qty desc