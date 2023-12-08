-- analysis/company_user_stats.sql

WITH users_with_steps  AS (
  SELECT DISTINCT user_id
  FROM
    {{ ref('users_data') }}
),

final as (

SELECT
  u.company_name,
  COUNT(DISTINCT u.user_id) AS users_with_steps,
  COUNT(DISTINCT us.user_id) AS total_users,
  100.0 * COUNT(DISTINCT u.user_id) / COUNT(DISTINCT us.user_id) AS percentage_users_with_steps
FROM {{ ref('users_data') }} u
LEFT JOIN users_with_steps us ON u.user_id = us.user_id
GROUP BY u.company_name
)

select * from final
