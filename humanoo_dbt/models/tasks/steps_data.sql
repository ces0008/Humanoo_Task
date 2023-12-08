-- steps_data.sql

{{ config(
    materialized='table',
    label='steps'
) }}


WITH steps_cte AS (
SELECT
    activity_date,
    user_id,
    value
FROM {{ source('external_source', 'steps') }} 
WHERE activity_date != '0000-00-00'

)

SELECT * FROM steps_cte
