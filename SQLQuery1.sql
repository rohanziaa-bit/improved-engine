Use Bikestores

select * from production.products

select product_name,
list_price
from production.products
where  list_price > (
 
 select AVG(list_price) from 
 production.products 




)

 order by list_price DESC

 

select  count(*)
 from sales.customers

 select count(distinct customer_id)
 from sales.orders


select
product_name,
category_id,
list_price
from production.products as p
where list_price = (

  select max(list_price)
  from production.products as p2
  where p2.category_id = p.category_id


)

select * from production.products

select * from sales.order_items

select 
o.store_id,
sum(
oi.quantity * oi.list_price * (1 - oi.discount)
) as total_revenue
from sales.orders as o
inner join sales.order_items as oi
  on o.order_id = oi.order_id
group by o.store_id
having Sum(

    oi.quantity * oi.list_price * (1 - discount) 

) = (
     select max(total_revenue)
     from (
        select 
         o2.store_id,
        sum(
         
          oi2.quantity * oi2.list_price * (1 - oi2.discount)

        
        ) as total_revenue
    from sales.orders as o2
    inner join sales.order_items as oi2
      on o2.order_id = oi2.order_id
    group by o2.store_id
     ) as total_revenue
);

with ranked_products as (
select
    product_name,
    list_price,
    category_id,
    ROW_NUMBER () over(
    partition by category_id
    order by list_price desc
    
    ) as rn
from production.products

)

select 
     product_name,
     list_price,
     category_id 
from ranked_products 
where rn = 1


SELECT *
FROM sales.orders
WHERE order_id IN (
    SELECT order_id
    FROM sales.order_items
    GROUP BY order_id
    HAVING SUM(quantity * list_price * (1 - discount)) > 5000
);
select * from sales.order_items

SELECT *
FROM sales.orders
WHERE order_id IN (
    SELECT order_id
    FROM sales.order_items
    GROUP BY order_id
    HAVING SUM(
        quantity * list_price * (1 - discount)
    ) > 5000
);

SELECT 
    order_id,
    total_order_value
FROM (
    SELECT 
        order_id,
        SUM(quantity * list_price * (1 - discount)) AS total_order_value
    FROM sales.order_items
    GROUP BY order_id
) AS OrderTotals
WHERE total_order_value > 5000;

SELECT 
    p.product_id,
    p.product_name
FROM production.products p
WHERE NOT EXISTS (
    SELECT 1
    FROM sales.order_items i
    JOIN sales.orders o 
        ON i.order_id = o.order_id
    WHERE i.product_id = p.product_id
);


SELECT TOP 5
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.quantity * i.list_price * (1 - i.discount)) AS total_spent
FROM sales.customers c
JOIN sales.orders o 
    ON c.customer_id = o.customer_id
JOIN sales.order_items i 
    ON o.order_id = i.order_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;
