-- user_retention.sql
WITH first_txn AS (
  SELECT user_id,
         MIN(date(timestamp)) AS first_date
  FROM transactions
  GROUP BY user_id
)
SELECT
  strftime('%Y-%m', t.timestamp)               AS month,
  SUM(CASE WHEN date(t.timestamp)=f.first_date
           THEN 1 ELSE 0 END)                 AS new_users,
  COUNT(DISTINCT t.user_id) -
    SUM(CASE WHEN date(t.timestamp)=f.first_date
             THEN 1 ELSE 0 END)               AS returning_users
FROM transactions t
JOIN first_txn f ON t.user_id = f.user_id
GROUP BY month
ORDER BY month;
