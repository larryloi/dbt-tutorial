with date_dim as (


    {{ dbt_date.get_date_dimension("2021-01-01", "2024-12-31") }}

)
select 
    *
from date_dim