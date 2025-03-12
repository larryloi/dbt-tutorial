-- macros/load_from_duckdb_to_mysql.sql
{% macro load_from_duckdb_to_mysql() %}
{% set query %}
    -- ATTACH 'host=rdb1.kaskade.local user=dbt port=3306 password=Abcd1234 database=test' AS target (TYPE MYSQL);
    ATTACH 'host=rdb1.kaskade.local user=dbt port=3030 password=Abcd1234 database=test' AS target (TYPE MYSQL);
    
    DROP TABLE IF EXISTS target.test.fact_table_xxx;
    CREATE TABLE target.test.fact_table_xxx AS 
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
{% endset %}
{% do run_query(query) %}
{% endmacro %}
