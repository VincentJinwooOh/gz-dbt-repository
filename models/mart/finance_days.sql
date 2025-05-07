select date_date
,      count(orders_id) as nb_transcations
,      round(sum(revenue),0) as revenue
,      round(avg(revenue),1) as avg_basket
,      round(sum(margin),0) as margin
,      round(sum(operational_margin),0) as operational_margin
,      round(sum(purchase_cost),0) as purchase_cost
,      round(sum(shipping_fee),0) as shipping_fee
,      round(sum(logcost),0) as shipping_fee
,      round(sum(ship_cost),0) as ship_cost
,      sum(quantity) as quantity
from {{ref("int_orders_operational")}}
group by date_date
order by date_date desc