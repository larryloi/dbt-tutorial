{{ config(materialized='table') }}

WITH product_lines AS (
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
     {{ source('src','products') }} t1
INNER JOIN  {{ source('src','productlines') }} t2 
    ON t1.productline = t2.productline

)

select 
    productCode, 
    productName, 
    textDescription from product_lines