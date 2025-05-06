with orders_margin as (select sales.orders_id
,      sales.date_date
,      sum(sales.revenue) as total_revenue
,      sum(sales.quantity) as total_quantity
,      sum(sales.quantity * pro.purchase_price) as total_purchase_cost
,      sum(sales.revenue - sales.quantity * pro.purchase_price) as total_margin
from {{ ref("stg_raw__sales") }} as sales
join {{ ref("stg_raw__product") }} as pro
using(products_id)
group by sales.orders_id
,      sales.date_date)

select *
,      total_margin+ship.shipping_fee-ship.logcost-ship.ship_cost operational_margin
from orders_margin
join {{ ref("stg_raw__ship")}} As ship
using(orders_id)
order by orders_id desc
