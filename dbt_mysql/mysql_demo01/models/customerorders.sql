{{ config(materialized='table') }}
WITH customer_orders AS (

SELECT 
  c.customerNumber,
  CONCAT(c.contactFirstName, ', ', c.contactLastName) AS customerFullName,
  COUNT(o.orderNumber) AS noOfOrders
FROM classicmodels.customers c
JOIN classicmodels.orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber
  , CONCAT(c.contactFirstName, ', ', c.contactLastName)

)

SELECT 
  customerNumber
  , customerFullName
  , noOfOrders
  FROM customer_orders
 