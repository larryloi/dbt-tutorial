-- macros/load_from_mysql_to_duckdb.sql
{% macro load_from_mysql_to_duckdb() %}
{% set query %}
    ATTACH 'host=rdb1.kaskade.local user=dbt port=3306 password=Abcd1234 database=classicmodels' AS classicmodels (TYPE MYSQL);

    DROP TABLE IF EXISTS stg_orderdetails;
    CREATE TABLE stg_orderdetails AS
    SELECT
      orderNumber
      ,productCode
      ,quantityOrdered
      ,priceEach
      ,orderLineNumber
    FROM classicmodels.classicmodels.orderdetails;

    DROP TABLE IF EXISTS stg_orders;
    CREATE TABLE stg_orders AS
    SELECT 
      orderNumber
      , orderDate
      , requiredDate
      , shippedDate
      , status
      , comments
      , customerNumber
      , updated_at
      , CURRENT_TIMESTAMP as updated_at_ods
    FROM classicmodels.classicmodels.orders;

{% endset %}
{% do run_query(query) %}
{% endmacro %}
