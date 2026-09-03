use Bikestores

select count(p.product_id) as total_product_of_each_category,
c.category_name
from production.products as p
inner join production.categories as c
on p.category_id = c.category_id
group by category_name

select avg(p.list_price) as avg_list_price_per_brand,
b.brand_name
from production.products as p
inner join production.brands as b
on p.brand_id = b.brand_id
group by brand_name

select sum(o.order_id) as total_order,
s.store_name
from sales.orders as o
inner join sales.stores as s
on o.store_id = s.store_id
group by store_name

select * from sales.order_items 

select order_id,
sum(quantity * list_price * (1 - discount)) as total_revenue
from sales.order_items
group by order_id

select count(o.order_id) as total_count,
c.customer_id
from sales.customers as c
inner join sales.orders as o
on c.customer_id = o.customer_id
group by c.customer_id
order by total_count DESC

select avg(p.list_price) as avg_price,
b.brand_name 
from production.products as p
inner join production.brands as b
on p.brand_id = b.brand_id
group by brand_name
order by avg_price desc

select count(p.product_id) as total_product,
c.category_name
from production.products as p
inner join production.categories as c
on p.category_id = c.category_id
group by c.category_name
having count(p.product_id) > 50

select * from sales.orders
select * from sales.staffs
select * from sales.order_items
select * from sales.stores
select * from sales.customers

select  s.store_name,
sum(o.quantity * o.list_price * ( 1 - o.discount)) as total_revenue
from sales.orders as l
inner join sales.stores as s
on s.store_id = l.store_id
inner join sales.order_items as o
on o.order_id = l.order_id
group by s.store_id,s.store_name
order by total_revenue DESC

select 
s.first_name + ' ' + last_name as full_name, 
s.staff_id,
count(o.order_id) as total_number_of_order
from sales.orders as o
inner join sales.staffs as s
on s.staff_id = o.staff_id
group by 
s.first_name,
s.last_name,
s.staff_id
having count(order_id) > 50

