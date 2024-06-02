
-- Use the `ref` function to select from other models

select id, type, payload
from {{ ref('first_dbt_model') }}
limit 5
