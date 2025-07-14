CREATE OR REPLACE VIEW user_summary AS
SELECT
  u.id AS user_id,
  u.name,
  SUM(CASE WHEN t.type = 'income' THEN t.amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN t.type = 'expense' THEN t.amount ELSE 0 END) AS total_expense
FROM users u
JOIN transactions t ON u.id = t.user_id
GROUP BY u.id, u.name;
