WITH user_steps AS (
  SELECT
    s.user_id,
    u.user_name,
    SUM(s.value) AS total_steps
  FROM {{ ref('steps_data') }} s
  JOIN {{ ref('users_data') }} u ON s.user_id = u.user_id
  GROUP BY s.user_id, u.user_name
),

final AS (
SELECT
  user_name,
  total_steps
FROM (
  SELECT
    user_name,
    total_steps,
    ROW_NUMBER() OVER (ORDER BY total_steps DESC) AS top_rank,
    ROW_NUMBER() OVER (ORDER BY total_steps ASC) AS bottom_rank
  FROM user_steps
) ranked_users
WHERE top_rank <= 10 OR bottom_rank <= 10
ORDER BY top_rank, bottom_rank
)

SELECT * from final