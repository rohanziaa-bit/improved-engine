use Bikestores

-- List all products with their name,model_year,and list price
select model_year,list_price,
product_name from production.products


select product_name, list_price
from production.products
where list_price > 1000

select * from sales.customers

select *
from sales.customers
where state like 'NY'

select * from sales.orders

select *
from sales.orders
where YEAR(order_date) = 2017

select *
from production.products
where product_name like 'Trek%'

select * 
from production.products
where list_price between 500 and 1500

select * from sales.customers

select distinct 
city from sales.customers

select *
from sales.orders
where shipped_date is  null
