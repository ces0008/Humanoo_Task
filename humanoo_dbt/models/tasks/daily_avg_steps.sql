-- analysis/daily_avg_steps.sql

WITH daily_avg AS (
  SELECT
    activity_date,
    user_id,
    value
  FROM
   {{ ref('steps_data') }}
),
final AS (
SELECT
  activity_date,
  AVG(value) AS avg_steps
FROM
  daily_avg
GROUP BY
  activity_date
)

SELECT * FROM final
