-- Створення бази даних
CREATE DATABASE OnlineStore;

-- Використання бази даних
USE OnlineStore;

-- Створення таблиці для користувачів
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Створення таблиці для товарів
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Створення таблиці для кошика (зв'язок між користувачами і товарами)
CREATE TABLE Cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Створення таблиці для відгуків
CREATE TABLE Reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
INSERT INTO Users (username, password, email)
VALUES ('exampleUser', 'examplePasswordHash', 'user@example.com');
INSERT INTO Products (name, description, price)
VALUES ('Товар 1', 'Опис товару 1', 10.00);
INSERT INTO Cart (user_id, product_id, quantity)
VALUES (1, 1, 2);  -- де 1 це id користувача і id товару, а 2 це кількість
INSERT INTO Reviews (product_id, user_id, rating, review)
VALUES (1, 1, 5, 'Чудовий товар!');  -- де 1 це id товару і id користувача, 5 це рейтинг, а 'Чудовий товар!' це текст відгуку
-- Оновлення таблиці для відгуків з додаванням рейтингу і коментарів
CREATE TABLE Reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
