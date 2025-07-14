CREATE OR REPLACE VIEW monthly_reports AS
SELECT
  user_id,
  TO_CHAR(created_at, 'YYYY-MM') AS month,
  type,
  SUM(amount) AS total
FROM transactions
GROUP BY user_id, month, type
ORDER BY user_id, month;
