{{ config(materialized='table') }}  -- This line ensures the table is materialized

-- Name of the model file (replace with your desired name)
source: dbt_example.sql

-- Define the dimension table name
name: dim_user

-- Define the columns of the table
columns:
  - message_id: int -- Unique identifier for each user (primary key)
  - operation: string -- User's email address
  - publish_time: string (nullable) -- User's country code
  - amount: int -- Timestamp of user creation

-- SQL statement to select and transform data
with raw_events as (
  select
    message_id,
    operation,
    publish_time,
    amount
  from
    streaming.raw_events 
)

select *
from raw_events;
