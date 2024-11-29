SELECT 
  o.orderNumber
  , o.orderDate
  , o.requiredDate
  , o.shippedDate
  , o.status
  , o.comments
  , o.customerNumber
  , od.productCode
  , od.orderLineNumber
  , od.priceEach
  , od.quantityOrdered
  , COUNT(o.orderNumber) AS orderCount
  , SUM(od.priceEach * od.quantityOrdered) AS Revenue
FROM {{ source('ods','ord') }} o
JOIN {{ source('ods','odtl') }}  od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber
  , o.orderDate
  , o.requiredDate
  , o.shippedDate
  , o.status
  , o.comments
  , o.customerNumber
  , od.productCode
  , od.orderLineNumber
  , od.priceEach
  , od.quantityOrdered
