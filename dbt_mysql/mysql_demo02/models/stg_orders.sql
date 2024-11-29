

SELECT 
  orderNumber
  , orderDate
  , requiredDate
  , shippedDate
  , status
  , comments
  , customerNumber
FROM {{ source('src','ord') }}