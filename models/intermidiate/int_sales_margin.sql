select sales.quantity * pro.purchase_price as purchase_cost
,      sales.revenue - sales.quantity * pro.purchase_price as margin
from {{ ref("stg_raw__sales") }} as sales
join {{ ref("stg_raw__product") }} as pro
using(products_id)