-- Insert user
INSERT INTO users (id, name, email)
VALUES (uuid_generate_v4(), 'Digvijay Singh', 'digvijay@example.com');

-- Add category types safely
INSERT INTO category_types (name)
SELECT 'income' WHERE NOT EXISTS (SELECT 1 FROM category_types WHERE name = 'income');

INSERT INTO category_types (name)
SELECT 'expense' WHERE NOT EXISTS (SELECT 1 FROM category_types WHERE name = 'expense');

-- Add categories
INSERT INTO categories (id, name, type_id, user_id)
VALUES
  (uuid_generate_v4(), 'Salary', 1, (SELECT id FROM users LIMIT 1)),
  (uuid_generate_v4(), 'Food', 2, (SELECT id FROM users LIMIT 1));

-- Add wallet
INSERT INTO wallets (id, user_id, name, balance)
VALUES (
  uuid_generate_v4(),
  (SELECT id FROM users LIMIT 1),
  'HDFC Wallet',
  7500
);

INSERT INTO transactions (id, user_id, wallet_id, category_id, amount, type, status, note)
VALUES (
  uuid_generate_v4(),
  '63578d16-4dc6-45c8-b5de-1dd3a0266afc',
  (SELECT id FROM wallets LIMIT 1),
  (SELECT id FROM categories WHERE name = 'Food' LIMIT 1),
  250.00,
  'expense',
  'completed',
  'Dinner with friends'
);