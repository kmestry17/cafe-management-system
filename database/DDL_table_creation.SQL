--Users Table
CREATE TABLE Users (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  user_type ENUM('customer', 'restaurant_owner') NOT NULL
);


--Restaurant Table
CREATE TABLE Restaurants (
  restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  cuisine_type VARCHAR(255),
  image_url VARCHAR(255),
  description TEXT,
  opening_hours JSON,
  minimum_order_amount DECIMAL(10,2),
  delivery_fee DECIMAL(10,2),
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (user_id) REFERENCES Users(customer_id)
);

--Promotions Table
CREATE TABLE Promotions (
  promotion_id INT PRIMARY KEY AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  discount_type ENUM('percentage', 'fixed_amount') NOT NULL,
  discount_value DECIMAL(10,2) NOT NULL,
  minimum_order_amount DECIMAL(10,2),
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

--Menu Items Table
CREATE TABLE Menu_Items (
  menu_item_id INT PRIMARY KEY AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  category_id INT DEFAULT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  base_price DECIMAL(10,2) NOT NULL,
  image_url VARCHAR(255),
  is_available BOOLEAN DEFAULT TRUE,
  variations JSON,
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

--Categories Table
CREATE TABLE Categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

--Orders Table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  restaurant_id INT NOT NULL,
  order_placed_at DATETIME NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  order_status ENUM('pending', 'preparing', 'delivered', 'cancelled') NOT NULL,
  payment_method ENUM('cash_on_delivery', 'online_payment'),
  payment_transaction_id VARCHAR(255),
  delivery_address TEXT,
  delivery_instructions TEXT,
  estimated_delivery_time DATETIME,
  FOREIGN KEY (customer_id) REFERENCES Users(customer_id),
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

--Order Items Table
CREATE TABLE Order_Items (
  order_id INT NOT NULL,
  menu_item_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, menu_item_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (menu_item_id) REFERENCES Menu_Items(menu_item_id)
);

--Review Table
CREATE TABLE Reviews (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  restaurant_id INT DEFAULT NULL,
  menu_item_id INT DEFAULT NULL,
  rating INT NOT NULL,
  review_text TEXT,
  FOREIGN KEY (customer_id) REFERENCES Users(customer_id),
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
  FOREIGN KEY (menu_item_id) REFERENCES Menu_Items(menu_item_id)
);
