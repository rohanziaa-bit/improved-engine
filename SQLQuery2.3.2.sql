use Bikestores
select top 10
product_name,list_price
from production.products
order by list_price DESC

select first_name,
last_name 
from sales.customers
where last_name like 'A%Z'

select top 5 product_name,
model_year, list_price
from production.products
where model_year = 2018
order by list_price ASC
