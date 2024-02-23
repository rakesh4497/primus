CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Populate products table
INSERT INTO products (name, price) VALUES
    ('Wheat Bread', 2.00),
    ('Rye Bread', 3.10),
    ('Sugar Cookies', 1.50),
    ('Oatmeal Cookies', 2.10),
    ('Chocolate Chip Cookies', 2.30),
    ('Apples', 2.20),
    ('Oranges', 3.10),
    ('Celery', 1.60);

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    parent_id INTEGER REFERENCES categories(id)
);

-- Populate categories table
INSERT INTO categories (name, parent_id) VALUES
    ('All Products', NULL), -- Top-level category
    ('Bakery', 1),          -- Child of 'All Products'
    ('Produce', 1),         -- Child of 'All Products'
    ('Bread', 2),           -- Child of 'Bakery'
    ('Cookies', 2),         -- Child of 'Bakery'
    ('Fruits', 3),          -- Child of 'Produce'
    ('Vegetables', 3);      -- Child of 'Produce'

-- Create product_categories table
CREATE TABLE IF NOT EXISTS product_categories (
    product_id INTEGER REFERENCES products(id),
    category_id INTEGER REFERENCES categories(id),
    PRIMARY KEY (product_id, category_id)
);