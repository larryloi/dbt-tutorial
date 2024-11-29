SELECT
  orderNumber
  ,productCode
  ,quantityOrdered
  ,priceEach
  ,orderLineNumber
FROM
  {{ source('src','odtl') }}