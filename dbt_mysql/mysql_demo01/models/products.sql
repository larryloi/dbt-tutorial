{{ config(materialized='table') }}

WITH product_lines AS (
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    classicmodels.products t1
INNER JOIN classicmodels.productlines t2 
    ON t1.productline = t2.productline

)

SELECT     
    productCode,
    productName, 
    textDescription
    
     FROM product_lines