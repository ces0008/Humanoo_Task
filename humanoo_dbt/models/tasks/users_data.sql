{{ config(
    materialized='table',
    label='users'
) }}


WITH USERS_CTE AS 
(
SELECT
    user_id,
    user_name,
    company_id,
    company_name,
    CASE WHEN company_size = 'unknown' THEN NULL ELSE CAST(company_size AS DOUBLE) END AS company_size
FROM
    {{ source('external_source', 'users') }}
)

SELECT * FROM USERS_CTE
