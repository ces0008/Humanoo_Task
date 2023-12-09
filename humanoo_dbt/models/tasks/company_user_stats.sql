-- models/tasks/company_user_stats.sql

WITH user_count AS (
  SELECT company_name, COUNT(DISTINCT user_id) AS total_users
  FROM
    {{ ref('users_data') }}
  GROUP BY 
    company_name
),

  users_with_steps  AS (
  SELECT u.company_name, COUNT(DISTINCT s.user_id) AS users_with_steps
  FROM
    {{ ref('users_data') }} u LEFT JOIN main.steps_data s ON u.user_id = s.user_id
  GROUP BY u.company_name
),

final as (
SELECT
  uc.company_name,
  uc.total_users,
  (uws.users_with_steps * 100) / uc.total_users AS percentage_users_with_steps
FROM
  user_count uc
JOIN users_with_steps uws ON uc.company_name = uws.company_name
)

SELECT * from final
