select m.product_code,p.product,m.manufacturing_cost from fact_manufacturing_cost m
join dim_product p
on m.product_code = p.product_code
where manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost) 
union all
select m.product_code,p.product,m.manufacturing_cost from fact_manufacturing_cost m
join dim_product p
on m.product_code = p.product_code
where manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost) 