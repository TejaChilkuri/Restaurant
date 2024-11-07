-- combining the menu_items and order_details into one table
select * from menu_items;
select * from order_details;

select *
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id;

-- least and most ordered items and what categories they belong to
select item_name, category, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc;

select item_name, category, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases;

-- top 5 orders that spent most money
select order_id, sum(price) as total_spend
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;

-- details of the highest spend order
select category, count(item_id) as num_items
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- details of top 5 highest spend orders
select order_id,  category, count(item_id) as num_items
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;

