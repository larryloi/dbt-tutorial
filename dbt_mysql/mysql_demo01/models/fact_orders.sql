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
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_orderdetails') }}  od ON o.orderNumber = od.orderNumber
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
