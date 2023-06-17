
INSERT INTO role (name)
VALUES ('ROLE_ADMIN'), ('ROLE_USER');



INSERT INTO users (email, password, name, phone_number, address)
VALUES
('admin', '$2a$12$B9fRClY/3MO1.m5.iaQvhO/8PBVpnQKsUMw7PVqqwZP/4JWKub2bK', 'User 1', '0123456789', '123 Main St'),
('user', '$2a$12$B9fRClY/3MO1.m5.iaQvhO/8PBVpnQKsUMw7PVqqwZP/4JWKub2bK', 'User 2', '0123456789', '456 Broad St'),
('user3@gmail.com', '$2a$12$B9fRClY/3MO1.m5.iaQvhO/8PBVpnQKsUMw7PVqqwZP/4JWKub2bK', 'User 3', '0123456789', '789 Oak St');


INSERT INTO user_role (user_id, role_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 2);

-- Thêm dữ liệu vào bảng product với tên sản phẩm và URL hình ảnh thực tế
INSERT INTO product (name, manufacturer, description, image_url, conditional, price, stock, supplier_id, category)
VALUES
('iPhone 13 Pro Max', 'Apple', 'Newest iPhone model', 'https://product.hstatic.net/200000348419/product/gia_iphone_13_pro_max_chinh_hang_09452d90a07e4f2c99f86e9f8c885493_master.png', 'New', 1399, 100, 1, 'Apple'),
('AirPods Pro', 'Apple', 'Wireless earbuds', 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/r/group_168_1__1.png', 'New', 249, 50, 1, 'Apple'),
('ThinkPad X1 Carbon', 'Lenovo', 'Business laptop', 'https://zshop.vn/images/thumbnails/624/460/detailed/84/ezgif-2-6b61b9eefda9_pzgm-ze_j164-tp_13sk-gs_ioxm-al_taxt-vn.png', 'New', 1299, 20, 1, 'Samsung'),
('UltraSharp U2721DE', 'Dell', '27-inch monitor', 'https://nguyencongpc.vn/media/product/17824-dell-u2721de-ultrasharp-2.JPG', 'New', 399, 30, 1, 'Samsung'),
('The Alchemist', 'Paulo Coelho', 'A bestselling novel', 'https://example.com/alchemist.jpg', 'New', 9.99, 100, 1, 'Dell'),
('Fifty Shades of Grey', 'E.L. James', 'A bestselling novel', 'https://nguyencongpc.vn/media/product/17824-dell-u2721de-ultrasharp-2.JPG', 'New', 12.99, 50, 1, 'OPPO'),
('Adidas Superstar', 'Adidas', 'Classic sneakers', 'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/a17-en/navigation/a17-427x600_Blue.png.thumb.webp', 'New', 80, 30, 1, 'OPPO'),
('Levi',' 501 Original Fit', 'Levi 1', 'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/a17-en/navigation/a17-427x600_Blue.png.thumb.webp', 'New', 59.50, 50, 1, 'OPPO'),
('H&M Hoodie', 'H&M', 'A comfortable hoodie', 'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/a17-en/navigation/a17-427x600_Blue.png.thumb.webp', 'New', 29.99, 100, 1, 'OPPO');

-- Nhập thông tin bảng Order
INSERT INTO mobilestore.order (total_money, order_date, user_id)
VALUES
(50.00, '2023-02-20 10:00:00', 1),
(100.00, '2023-02-19 15:30:00', 2),
(75.00, '2023-02-18 08:45:00', 3);

-- Nhập thông tin bảng order_detail
INSERT INTO order_detail (product_id, order_id, quantity, price)
VALUES
(1, 1, 2, 25.00),
(2, 1, 1, 15.00),
(3, 2, 3, 20.00),
(4, 2, 2, 30.00),
(5, 3, 1, 75.00);


