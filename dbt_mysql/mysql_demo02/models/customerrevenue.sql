
SELECT
  sc.customerNumber
  , sc.customerFullName
  , SUM(fo.orderCount) AS orderCount
  , SUM(fo.Revenue) AS Revenue
FROM {{ ref('fact_orders') }} fo
JOIN
  {{ ref('stg_customers') }} sc ON fo.customerNumber = sc.customerNumber
GROUP BY 
    sc.customerNumber
  , sc.customerFullName