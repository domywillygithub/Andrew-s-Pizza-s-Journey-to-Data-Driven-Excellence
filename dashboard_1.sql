/*For the first dashboard we need to write a SQL Query that will help us get data in order to retrieve insights for:
1. Total orders
2. Total sales
3. Total orders Quantity
4. Average order value
5. Sales by pizza's name
6. Sales by location city
7.Sales by product category
8. Sales by day
*/

SELECT 
o.order_id,
i.item_price,
o.quantity,
i.item_cat,
i.item_name,
o.created_at,
a.delivery_address_1,
a.delivery_address_2,
a.delivery_city,
a.delivery_zipcode
from orders o 
left join items i on o.item_id=i.item_id
left join address a on o.add_id = a.add_id; 