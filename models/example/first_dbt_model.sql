
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with raw_events as (

    select 
        * 
    from 
        streaming.raw_events
    limit 100

)

select *
from raw_events

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
