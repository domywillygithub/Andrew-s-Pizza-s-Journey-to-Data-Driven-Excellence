/*For the second dashboard we need to write a SQL Query that will help us get data in order to retrieve insights for:
1. Total Ingredient cost
2. Average Ingredient Cost
3. Total orders by Ingredient
4. Total Ingredient count
5. Pizza sales by size
6. Pizza cost by name
7.Total order by Ingredient
*/

-- we need to create a view first in order to store our data temporary before reusing it for another query

create or replace view stock
as
select 
s.item_name,
s.ing_id,
s.ing_name,
s.ing_weight,
s.ing_price,
s.order_quantity,
s.recipe_quantity,
s.order_quantity * s.recipe_quantity as ordered_weight,
s.ing_price/s.ing_weight as unit_cost,
(s.order_quantity * s.recipe_quantity)*(s.ing_price/s.ing_weight) as ingredient_cost
 from (select 
o.item_id,
i.recipe_id,
i.item_name,
r.ing_id,
ing.ing_name,
r.quantity as recipe_quantity,
sum(o.quantity) as order_quantity,
ing.ing_weight,
ing.ing_price
from orders o
left join items i on o.item_id = i.item_id
left join recipe r on i.recipe_id = r.recipe_id
left join ingredient ing on ing.ing_id = r.ing_id
group by o.item_id,
i.recipe_id,
i.item_name,
r.ing_id,
r.quantity,
ing.ing_name,
ing.ing_weight,
ing.ing_price) s;


select 
s2.ing_id,
s2.item_name,
s2.ing_name,
s2.ing_weight,
s2.ing_price,
s2.order_quantity,
s2.recipe_quantity,
s2.unit_cost,
s2.ordered_weight,
s2.ingredient_cost,
inv.quantity,
ing.ing_weight * inv.quantity as total_iv_weight,
ing.ing_weight * inv.quantity-s2.ordered_weight as remaining_weight
 from (select 
ing_id,
item_name,
ing_name,
ing_weight,
ing_price,
order_quantity,
recipe_quantity,
unit_cost,ingredient_cost,
sum(ordered_weight) as ordered_weight
from stock
group by ing_name,ing_id,item_name,ing_weight,
ing_price,order_quantity,
recipe_quantity,unit_cost,
ingredient_cost)s2

left join inventory inv on inv.item_id = s2.ing_id
left join ingredient ing on ing.ing_id = s2.ing_id;
