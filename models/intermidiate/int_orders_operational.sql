

select orders_id
,      date_date
,      round(margin+ship.shipping_fee-ship.logcost-ship.ship_cost,2) as operational_margin
,      revenue
,      quantity
,      purchase_cost
,      margin
,      ship.shipping_fee
,      ship.logcost
,      ship.ship_cost
from {{ref('int_orders_margin')}}
left join {{ ref("stg_raw__ship")}} As ship
using(orders_id)

