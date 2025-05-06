select orders_id
,      date_date
,      sum(revenue) as total_revenue
,      sum(quantity) as total_quantity
,      total_purchase_cost
,      total_margin
from {{ ref("int_sales_margin") }} 
group by orders_id
,      date_date
,      total_purchase_cost
,      total_margin

