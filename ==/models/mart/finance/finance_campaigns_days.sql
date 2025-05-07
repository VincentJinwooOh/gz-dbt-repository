select date_date
,      round(operational_margin - icd.ads_cost,0) as ads_margin
,      avg_basket
,      operational_margin
,      icd.ads_cost as ads_cost
,      icd.ads_impression as ads_impression
,      icd.ads_clicks as ads_clicks
,      quantity
,      revenue
,      purchase_cost
,      margin
,      shipping_fee
,      logcost
,      ship_cost
from {{ref('finance_days')}} 
join {{ref('int_campaigns_day')}} as icd
using (date_date)
order by date_date asc