-- channel_breakdown.sql
SELECT
  channel,
  COUNT(*)             AS txn_count,
  ROUND(SUM(amount),2) AS total_amount
FROM transactions
GROUP BY channel
ORDER BY total_amount DESC;
