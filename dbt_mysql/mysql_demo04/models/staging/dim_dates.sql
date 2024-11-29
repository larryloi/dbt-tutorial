{{
  config(
    materialized='incremental',
    unique_key=['date']
  )
}}

WITH RECURSIVE date_spine AS (
  SELECT '2019-01-01' AS date_day
  UNION ALL
  SELECT DATE_ADD(date_day, INTERVAL 1 DAY)
  FROM date_spine
  WHERE date_day < '2020-01-01'
)

SELECT
  date_day AS date,
  EXTRACT(DAY FROM date_day) AS day_of_year,
  EXTRACT(MONTH FROM date_day) AS month_of_year,
  EXTRACT(YEAR FROM date_day) AS year,
  DAYNAME(date_day) AS day_name,
  MONTHNAME(date_day) AS month_name
FROM date_spine