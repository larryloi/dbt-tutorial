-- models/transform_model.sql
{{ load_from_mysql_to_duckdb() }}

{{ config(materialized='table') }}

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
FROM stg_orders o
JOIN stg_orderdetails od ON o.orderNumber = od.orderNumber
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

{{ load_from_duckdb_to_mysql() }}
