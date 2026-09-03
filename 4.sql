use Bikestores

select p.product_name,
b.brand_name, c.category_name,
s.quantity
from production.products as p
inner join production.brands as b
on p.brand_id = b.brand_id
inner join production.categories as c
on p.category_id = c.category_id
inner join production.stocks as s
on s.product_id = p.product_id

select * from sales.orders
select * from sales.customers

select c.first_name + last_name as full_name,
o.order_date,o.order_status
from sales.customers as c
inner join sales.orders as o
on c.customer_id = o.customer_id

select * from sales.order_items
select * from production.products
select * from production.stocks

select p.product_name,
o.quantity, o.list_price,o.discount,
o.item_id
from sales.order_items as o
inner join production.products as p
on o.product_id = p.product_id

select * from sales.staffs
select * from sales.stores
select * from sales.orders

select s.first_name + last_name as full_name,
i.store_name
from sales.staffs as s
inner join sales.stores as i
on s.store_id = i.store_id

SELECT
    s.first_name + ' ' + s.last_name AS staff_name,
    m.first_name + ' ' + m.last_name AS manager_name
FROM sales.staffs AS s
LEFT JOIN sales.staffs AS m
    ON s.manager_id = m.staff_id;
SELECT * FROM production.stocks
select * from production.products

select i.store_id,
p.product_name,I.quantity
from production.products as p
inner join production.stocks as i
on p.product_id = i.product_id

select * from sales.customers
select * from sales.orders

select c.first_name + ' ' + last_name as full_name,
o.order_date,o.shipped_date
from sales.orders as o
inner join sales.customers as c
on c.customer_id = o.customer_id






