CREATE OR REPLACE VIEW top_expense_categories AS
SELECT 
  c.name AS category,
  SUM(t.amount) AS total_spent
FROM transactions t
JOIN categories c ON t.category_id = c.id
WHERE t.type = 'expense'
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;
