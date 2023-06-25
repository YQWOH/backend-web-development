CREATE DATABASE IF NOT EXISTS shop_app;
-- DROP DATABASE shopee_clone;
-- DROP TABLE `shop_app`.`user`;
CREATE TABLE IF NOT EXISTS `shop_app`.`user` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(90) NOT NULL,
    `username` CHAR(12) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `type` CHAR(45) NULL,
    `created_by` INT NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by` INT NULL,
	`updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);

CREATE TABLE IF NOT EXISTS `shop_app`.`store` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(90) NOT NULL,
    `owner_id` INT NOT NULL,
    `address` VARCHAR(255) DEFAULT NULL,
	`created_by` INT NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by` INT DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `store_user_owner_id_idx` (`owner_id`),
    CONSTRAINT `store_user_owner_id` 
		FOREIGN KEY (`owner_id`)
        REFERENCES `shop_app`.`user` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `shop_app`.`product_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  `variant` CHAR(45) NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `shop_app`.`product` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `product_detail_id` INT NOT NULL,
    `store_id` INT NOT NULL,
    `price` DOUBLE NOT NULL,
    `quantity` INT NULL,
    `status` CHAR(45) NULL,
    `created_by` INT NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_by` INT NULL,
	`updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `product_store_store_id_idx` (`store_id` ASC) VISIBLE,
    CONSTRAINT `product_store_store_id` 
		FOREIGN KEY (`store_id`) 
        REFERENCES `shop_app`.`store` (`id`) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    INDEX `product_product_detail_product_detail_id_idx` (`product_detail_id` ASC) VISIBLE,
	CONSTRAINT `product_product_detail_product_detail_id`
		FOREIGN KEY (`product_detail_id`)
		REFERENCES `shop_app`.`product_detail` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE `shop_app`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `buyer_id` INT NOT NULL,
  `store_id` INT NULL,
  `delivery_date` DATETIME NULL,
  `status` CHAR(45) NULL DEFAULT 'created',
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `order_store_store_id_idx` (`store_id` ASC) VISIBLE,
  INDEX `order_user_buyer_id_idx` (`buyer_id` ASC) VISIBLE,
  CONSTRAINT `order_store_store_id` 
	FOREIGN KEY (`store_id`) 
    REFERENCES `shop_app`.`store` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,
  CONSTRAINT `order_user_buyer_id` 
	FOREIGN KEY (`buyer_id`) 
    REFERENCES `shop_app`.`user` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
);

CREATE TABLE `shop_app`.`product_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT 1,
  `review` VARCHAR(255) NULL,
  `rating` TINYINT(4) NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `product_order_product_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `product_order_order_order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `product_order_product_product_id` 
	FOREIGN KEY (`product_id`) 
    REFERENCES `shop_app`.`product` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,
  CONSTRAINT `product_order_order_order_id` 
	FOREIGN KEY (`order_id`) 
    REFERENCES `shop_app`.`order` (`id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE `shop_app`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `payment_method` CHAR(45) NOT NULL,
  `amount_paid` DOUBLE NOT NULL,
  `status` CHAR(45) NULL DEFAULT 'unpaid',
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `payment_order_order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `payment_order_order_id` 
	FOREIGN KEY (`order_id`) 
    REFERENCES `shop_app`.`order` (`id`) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

INSERT INTO
  `shop_app`.`user` (`first_name`, `last_name`, `email`, `username`, `password`, `type`, `created_by`)
VALUES
  (
    'John',
    'Doe',
    'john.doe@example.com',
    'john_doe',
    'pass123',
    'customer',
    '1'
  );
  
INSERT INTO
  `shop_app`.`user` (`first_name`, `last_name`, `email`, `username`, `password`, `type`, `created_by`)
VALUES
  (
    'Jane',
    'Smith',
    'jane.smith@example.com',
    'jane_smith',
    'pwd456',
    'admin',
    '2'
  );

INSERT INTO
  `shop_app`.`user` (`first_name`, `last_name`, `email`, `username`, `password`, `type`, `created_by`)
VALUES
  (
    'Samantha',
    'Lee',
    'samantha.lee@example.com',
    'samantha_lee',
    'abc123',
    'owner',
    '2'
  );
  
INSERT INTO
  `shop_app`.`user` (`first_name`, `last_name`, `email`, `username`, `password`, `type`, `created_by`)
VALUES
  (
    'Alex',
    'Wong',
    'alex.wong@example.com',
    'alex_wong',
    'passw0rd',
    'customer',
    '3'
  );
  
INSERT INTO 
	`shop_app`.`store` (`id`, `name`, `owner_id`, `address`, `created_by`) 
VALUES 
  (
	'1', 
    'A Convient Store', 
    '4', 
    'Online Shop', 
    '2'
  );
  
-- Insert script for productDetail table  
INSERT INTO
  `shop_app`.`product_detail` (`name`, `description`, `variant`, `created_by`)
VALUES
  (
    'Shirt',
    'A comfortable and stylish shirt for everyday wear',
    'Clothing',
    '4'
  ),
  (
    'Jeans',
    'A durable pair of jeans for casual wear',
    'Clothing',
    '4'
  ),
  (
    'Sneakers',
    'A stylish and comfortable pair of sneakers',
    'Shoes',
    '4'
  ),
  (
    'Sunglasses',
    'Stylish sunglasses for sunny days',
    'Glasses',
    '4'
  ),
  (
    'Tennis Racket',
    'A high-quality tennis racket, weighed at 300g',
    'Sports Equipment',
    '4'
  ),
  (
    'Backpack',
    'A durable and stylish backpack for everyday use',
    'Storage/Suitcase',
    '4'
  );
  
-- Insert script for product table
INSERT INTO
  `shop_app`.`product` (
    `id`,
    `product_detail_id`,
    `store_id`,
    `price`,
    `quantity`,
    `status`,
    `created_by`
  )
VALUES
  (1, 1, 1, 29.99, 100, 'In stock', '4'),
  (2, 2, 1, 49.99, 50, 'Out of stock', '4'),
  (3, 3, 1, 79.99, 75, 'In stock', '4'),
  (4, 4, 1, 99.99, 25, 'In stock', '4'),
  (5, 5, 1, 199.99, 10, 'In stock', '4'),
  (6, 6, 1, 149.99, 20, 'Out of stock', '4');

-- Get all the Products that are “Out of Stock”
SELECT * FROM shop_app.product WHERE status LIKE 'Out Of Stock' OR quantity = 0;

-- Get all Payments that have the status “payment_failed”
SELECT * FROM shop_app.payment WHERE status LIKE 'payment_failed';

-- Get all Products with their respective Product descriptions
SELECT p.*, pd.name, pd.description
FROM shop_app.product p
INNER JOIN shop_app.product_detail pd 
ON pd.id = p.product_detail_id;

-- Get all Users that have bought products
SELECT DISTINCT u.* FROM shop_app.user u
INNER JOIN shop_app.order o
ON u.id = o.buyer_id;

 -- Get the number of Products bought per User
SELECT u.id, COUNT(po.product_id) AS total_products_bought
FROM shop_app.user u
INNER JOIN shop_app.order o ON o.buyer_id = u.id
INNER JOIN shop_app.product_order po ON po.order_id = o.id
GROUP BY u.id;

-- Get the amount sold per Product
SELECT p.id, SUM(po.quantity) AS total_sold
FROM shop_app.product p
INNER JOIN shop_app.product_order po 
ON po.product_id = p.id
GROUP BY p.id;

-- Get the number of Products per Store
SELECT s.id, s.name, COUNT(p.id) AS total_sold
FROM shop_app.store s
INNER JOIN shop_app.product p ON p.store_id = s.id
GROUP BY s.id, s.name;

-- Get the number of unique Products bought by User
-- Get the number of Products bought per User
SELECT DISTINCT u.id, po.product_id, COUNT(po.product_id) AS total_products_bought
FROM shop_app.user u
INNER JOIN shop_app.order o ON o.buyer_id = u.id
INNER JOIN shop_app.product_order po ON po.order_id = o.id
GROUP BY u.id, po.product_id;

-- Get the number of Products bought by other Store Owner
SELECT u.id, COUNT(po.product_id) AS total_products_bought
FROM shop_app.user u
INNER JOIN shop_app.order o ON o.buyer_id = u.id
INNER JOIN shop_app.product_order po ON po.order_id = o.id
WHERE u.type LIKE 'StoreOwner'
GROUP BY u.id, po.product_id;





