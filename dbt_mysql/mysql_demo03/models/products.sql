{{ config(materialized='table') }}

WITH product_lines AS (
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
     {{ source('src','pdt') }} t1
INNER JOIN  {{ source('src','pdtln') }} t2 
    ON t1.productline = t2.productline

)

SELECT     
    productCode,
    productName, 
    textDescription
    
     FROM product_lines