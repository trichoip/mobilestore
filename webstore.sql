use savesave
go

create database [MobileStore]
go

use [MobileStore]
go


CREATE TABLE shopping_carts (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_id BIGINT,
    product_id BIGINT ,
	price DECIMAL(18,2),
    quantity INT ,
    FOREIGN KEY (user_id) REFERENCES [users](id),
    FOREIGN KEY (product_id) REFERENCES product(id)
)

-- Tạo bảng User
CREATE TABLE [users] (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) ,
    phone_number VARCHAR(20),
    address VARCHAR(255),
)



-- Tạo bảng role
CREATE TABLE role (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)

-- Tạo bảng product
CREATE TABLE product (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) ,
	manufacturer VARCHAR(255),
    description VARCHAR(255),
    image_url VARCHAR(255),
	condition VARCHAR(255),
    price DECIMAL(18,2) ,
    stock INT,
    supplier_id BIGINT ,
	category VARCHAR(255) ,
    FOREIGN KEY (supplier_id) REFERENCES [users](id)
)



-- Tạo bảng Order
CREATE TABLE [order] (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
	total_money DECIMAL(18,2),
    order_date DATETIME ,
    user_id BIGINT ,
    FOREIGN KEY (user_id) REFERENCES [users](id)
)

-- Tạo bảng order_detail
CREATE TABLE order_detail (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    product_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    quantity INT ,
    price DECIMAL(18,2),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (order_id) REFERENCES [order](id)
)




-- Tạo bảng user_role
CREATE TABLE user_role (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES [users](id),
    FOREIGN KEY (role_id) REFERENCES role(id)
)


-- Thêm dữ liệu vào bảng role
INSERT INTO role (name)
VALUES ('role_ADMIN'), ('role_USER')



-- Thêm dữ liệu vào bảng Users
INSERT INTO users (email, password, name, phone_number, address)
VALUES
('admin', 'admin', 'User 1', '0123456789', '123 Main St'),
('user', 'user', 'User 2', '0123456789', '456 Broad St'),
('user3@gmail.com', '123456', 'User 3', '0123456789', '789 Oak St')

-- Nhập thông tin bảng user_role
INSERT INTO user_role (user_id, role_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 2)

-- Thêm dữ liệu vào bảng product với tên sản phẩm và URL hình ảnh thực tế
INSERT INTO product (name, manufacturer, description, image_url, condition, price, stock, supplier_id, category)
VALUES
('iPhone 13 Pro Max', 'Apple', 'Newest iPhone model', 'https://example.com/iphone13.jpg', 'New', 1399, 100, 1, 'Apple'),
('AirPods Pro', 'Apple', 'Wireless earbuds', 'https://example.com/airpodspro.jpg', 'New', 249, 50, 1, 'Apple'),
('ThinkPad X1 Carbon', 'Lenovo', 'Business laptop', 'https://example.com/thinkpad.jpg', 'New', 1299, 20, 1, 'Samsung'),
('UltraSharp U2721DE', 'Dell', '27-inch monitor', 'https://example.com/dellmonitor.jpg', 'New', 399, 30, 1, 'Samsung'),
('The Alchemist', 'Paulo Coelho', 'A bestselling novel', 'https://example.com/alchemist.jpg', 'New', 9.99, 100, 1, 'Dell'),
('Fifty Shades of Grey', 'E.L. James', 'A bestselling novel', 'https://example.com/fiftyshades.jpg', 'New', 12.99, 50, 1, 'OPPO'),
('Adidas Superstar', 'Adidas', 'Classic sneakers', 'https://example.com/superstar.jpg', 'New', 80, 30, 1, 'OPPO'),
('Levi',' 501 Original Fit', 'Levi 1', 'https://example.com/501jeans.jpg', 'New', 59.50, 50, 1, 'OPPO'),
('H&M Hoodie', 'H&M', 'A comfortable hoodie', 'https://example.com/hmhoodie.jpg', 'New', 29.99, 100, 1, 'OPPO')

-- Nhập thông tin bảng Order
INSERT INTO [order] (total_money, order_date, user_id)
VALUES
(50.00, '2023-02-20 10:00:00', 1),
(100.00, '2023-02-19 15:30:00', 2),
(75.00, '2023-02-18 08:45:00', 3)

-- Nhập thông tin bảng order_detail
INSERT INTO order_detail (product_id, order_id, quantity, price)
VALUES
(1, 1, 2, 25.00),
(2, 1, 1, 15.00),
(3, 2, 3, 20.00),
(4, 2, 2, 30.00),
(5, 3, 1, 75.00)


