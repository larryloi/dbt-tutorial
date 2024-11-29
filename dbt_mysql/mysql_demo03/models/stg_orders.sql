{{ 
  config(materialized='incremental',
         unique_key=['orderNumber','status']
         )
}}

SELECT 
  orderNumber
  , orderDate
  , requiredDate
  , shippedDate
  , status
  , comments
  , customerNumber
  , updated_at
  , CURRENT_TIMESTAMP as updated_at_ods
FROM {{ source('src','ord') }}
WHERE 1=1
{% if is_incremental() %}
  AND updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
