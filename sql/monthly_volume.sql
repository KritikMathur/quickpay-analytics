SELECT
  strftime('%Y-%m', timestamp) AS month,
  COUNT(*)             AS txn_count,
  ROUND(AVG(amount),2) AS avg_amount,
  ROUND(SUM(amount),2) AS total_amount
FROM transactions
GROUP BY month
ORDER BY month;
