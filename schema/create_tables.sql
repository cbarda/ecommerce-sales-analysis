CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50) UNIQUE NOT NULL,
    customer_zip_code_prefix VARCHAR(50) NOT NULL,
    customer_city VARCHAR(100) NOT NULL,
    customer_state VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
order_id VARCHAR(50) PRIMARY KEY,
customer_id VARCHAR(50) NOT NULL,
order_status VARCHAR(50) NOT NULL,
order_purchase_timestamp DATETIME NOT NULL,
order_approved_at DATETIME NULL,
order_delivered_carrier_date DATETIME NULL,
order_delivered_customer_date DATETIME NULL,
order_estimated_delivery_date DATETIME NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS orders_items (
order_id VARCHAR(50) NOT NULL,
order_item_id VARCHAR(50) NOT NULL,
product_id VARCHAR(50) NOT NULL,
seller_id VARCHAR(50) NOT NULL,
shipping_limit_date DATETIME NOT NULL,
price  DECIMAL(10,2) DEFAULT 0.00,
freight_value  DECIMAL(10,2) DEFAULT 0.00,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
PRIMARY KEY (order_id, order_item_id)
);
