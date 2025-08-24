-- task_2.sql
-- Create tables for alx_book_store

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- =====================
-- TABLE: AUTHORS
-- =====================
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    country VARCHAR(100)
);

-- =====================
-- TABLE: BOOKS
-- =====================
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    published_year YEAR,
    price DECIMAL(10,2) NOT NULL,
    genre VARCHAR(100),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- =====================
-- TABLE: CUSTOMERS
-- =====================
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(200) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    address VARCHAR(255)
);

-- =====================
-- TABLE: ORDERS
-- =====================
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- =====================
-- TABLE: ORDER_DETAILS
-- =====================
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);



