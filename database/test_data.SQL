--Users Table
INSERT INTO Users (name, email, password, user_type)
VALUES ('John Doe', 'john.doe@email.com', 'password123', 'customer');

INSERT INTO Users (name, email, password, user_type)
VALUES ('Jane Smith', 'jane.smith@email.com', 'password456', 'restaurant_owner');

--Restaurant Table
INSERT INTO Restaurants (user_id, name, address, cuisine_type)
VALUES (1, 'Pizza Palace', '123 Main St', 'Italian');


--Promotions Table
INSERT INTO Promotions (restaurant_id, name, description, start_date, end_date, discount_type, discount_value)
VALUES (1, 'Summer Special', '20% off all pizzas', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 'percentage', 0.20);

--Menu_Items Table
INSERT INTO Menu_Items (restaurant_id, name, base_price, is_available)
VALUES (1, 'Margherita Pizza', 12.99, TRUE);

INSERT INTO Menu_Items (restaurant_id, name, base_price, is_available)
VALUES (1, 'Pepperoni Pizza', 14.99, TRUE);

--Categories Table
INSERT INTO Categories (name)
VALUES ('Pizzas');

--Orders_Table
INSERT INTO Orders (customer_id, restaurant_id, order_placed_at, total_amount, order_status, payment_method)
VALUES (1, 1, NOW(), 27.98, 'pending', 'cash_on_delivery');

--Order_Items Table
INSERT INTO Order_Items (order_id, menu_item_id, quantity)
VALUES (1, 1, 1);

INSERT INTO Order_Items (order_id, menu_item_id, quantity)
VALUES (1, 2, 1);

--Reviews
INSERT INTO Reviews (customer_id, restaurant_id, menu_item_id, rating, review_text)
VALUES (1, 1, 1, 5, 'Great pizza!');
