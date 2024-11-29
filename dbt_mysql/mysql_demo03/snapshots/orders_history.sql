{% snapshot orders_history %}

{{
    config(
      target_schema='demo03_dwd',
      unique_key='orderNumber',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ source('src', 'ord') }}

{% endsnapshot %}