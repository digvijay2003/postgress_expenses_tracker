CREATE TABLE category_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL CHECK (name IN ('income', 'expense'))
);

CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    type_id INT REFERENCES category_types(id),
    description TEXT,
    user_id UUID REFERENCES users(id), 
    UNIQUE(name, user_id)
);