-- Creating a database
create database AndrewPizza_DB;

-- Initializing....
use AndrewPizza_DB;

-- Creating the customers table
CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    cust_lastname VARCHAR(255),
    cust_firstname VARCHAR(255)
);

-- Creating address table
CREATE TABLE address (
    add_id INT PRIMARY KEY,
    delivery_address_1 varchar(200),
    delivery_address_2 varchar(200) null,
    delivery_city varchar(100),
    delivery_zipcode varchar(100)
);

-- ctreating item table
CREATE TABLE items (
    item_id INT PRIMARY KEY,
    recipe_id varchar(200),
    item_name varchar(200) null,
    item_cat varchar(100),
    item_size varchar(100),
    item_price decimal(10,2)
);

-- Creating the orders table
CREATE TABLE orders (
    row_id INT PRIMARY KEY,
    order_id INT,
    created_at DATE,
    cust_id INT,
    item_id INT,
    quantity INT,
    delivery BOOLEAN,
    add_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (add_id) REFERENCES address(add_id)
); 

ALTER TABLE rotation DROP FOREIGN KEY rotation_ibfk_2;
drop table orders;

ALTER TABLE items CHANGE COLUMN sku recipe_id varchar(200);
ALTER TABLE items ADD INDEX idx_recipe_id (recipe_id) ;
-- creating recipe table
CREATE TABLE recipe (
    row_id INT PRIMARY KEY,
    recipe_id varchar(200),
    ing_id varchar(200) ,
    quantity INT,
    foreign key(recipe_id) references items (recipe_id),
    foreign key(ing_id) references ingredient (ing_id)
);

-- creating ingredient table
CREATE TABLE ingredient (
    ing_id varchar(200) PRIMARY KEY,
    ing_name varchar(200),
    ing_weight int ,
    ing_meas varchar (20),
    ing_price decimal(5,2)
);

-- creating inventory table
CREATE TABLE inventory (
    inv_id int PRIMARY KEY,
    item_id varchar(200),
    quantity int ,
    foreign key(item_id) references recipe (ing_id)
);

ALTER TABLE orders ADD INDEX idx_created_at (created_at) ;
-- creating rotation table
CREATE TABLE rotation (
    row_id int PRIMARY KEY,
    rota_id varchar(200),
    date datetime ,
    shift_id varchar (20),
    staff_id varchar(20),
    foreign key(shift_id) references shift (shift_id),
    foreign key (date) references orders(created_at),
    foreign key(staff_id) references staff(staff_id)
);

-- creatinmg shift table
CREATE TABLE shift (
    shift_id varchar(20) PRIMARY KEY,
    day_of_week varchar(200),
    starttime time ,
    endtime time
);

-- creating staff table
CREATE TABLE staff (
    staff_id varchar(20) PRIMARY KEY,
    first_name varchar(200),
    last_name varchar (200) ,
    Position varchar (200),
    hourly_rate decimal(5,2)
); 


-- Be very careful when inserting the values so you don't foreign key constraints errors as we have already set the foreign keys constraints above

INSERT INTO customers (cust_id, cust_lastname, cust_firstname)
VALUES
    (1, 'Johnson', 'Michael'),
    (2, 'Smith', 'Jennifer'),
    (3, 'Williams', 'Christopher'),
    (4, 'Brown', 'Jessica'),
    (5, 'Jones', 'Emily'),
    (6, 'Miller', 'Matthew'),
    (7, 'Davis', 'Ashley'),
    (8, 'Garcia', 'David'),
    (9, 'Rodriguez', 'Sarah'),
    (10, 'Martinez', 'Daniel'),
    (11, 'Lopez', 'Jessica'),
    (12, 'Jackson', 'Kevin'),
    (13, 'White', 'Maria'),
    (14, 'Harris', 'John'),
    (15, 'Clark', 'Laura'),
    (16, 'Lewis', 'Robert'),
    (17, 'Robinson', 'Elizabeth'),
    (18, 'Walker', 'Joseph'),
    (19, 'Young', 'Amy'),
    (20, 'Hall', 'William'),
    (21, 'Cooper', 'Olivia'),
    (22, 'Moore', 'Ethan'),
    (23, 'Lee', 'Isabella'),
    (24, 'Gonzalez', 'Aiden'),
    (25, 'Nelson', 'Mia'),
    (26, 'Adams', 'Alexander'),
    (27, 'Perez', 'Sophia'),
    (28, 'Rivera', 'Elijah'),
    (29, 'Bell', 'Ava'),
    (30, 'Morris', 'James'),
    (31, 'Turner', 'Emma'),
    (32, 'Collins', 'Logan'),
    (33, 'Wright', 'Grace'),
    (34, 'King', 'Benjamin'),
    (35, 'Baker', 'Natalie'),
    (36, 'Ross', 'Lucas'),
    (37, 'Carter', 'Lily'),
    (38, 'Anderson', 'Jackson'),
    (39, 'Campbell', 'Avery'),
    (40, 'Hill', 'Charlotte'),
    (41, 'Ward', 'Evelyn'),
    (42, 'Bailey', 'Liam'),
    (43, 'Phillips', 'Abigail'),
    (44, 'Reed', 'Noah'),
    (45, 'Turner', 'Sophia'),
    (46, 'Cook', 'Aiden'),
    (47, 'Powell', 'Olivia'),
    (48, 'Bennett', 'Ethan'),
    (49, 'Bryant', 'Emma'),
    (50, 'Foster', 'Mia'),
    (51, 'Cruz', 'Liam'),
    (52, 'Simmons', 'Ava'),
    (53, 'Ramirez', 'Elijah'),
    (54, 'Griffin', 'Isabella'),
    (55, 'Ward', 'Lucas'),
    (56, 'Jordan', 'Charlotte'),
    (57, 'Taylor', 'Amelia'),
    (58, 'Diaz', 'Lily'),
    (59, 'Price', 'Layla'),
    (60, 'Russell', 'Harper');
    
INSERT INTO address (add_id, delivery_address_1, delivery_address_2, delivery_city, delivery_zipcode)
VALUES
    (1, '123 Main St', NULL, 'Cityville', '12345'),
    (2, '456 Elm St', 'Apt 202', 'Townsville', '67890'),
    (3, '789 Oak Rd', NULL, 'Villageville', '34567'),
    (4, '555 Pine Ave', 'Suite 101', 'Hamletown', '45678'),
    (5, '987 Maple Ct', NULL, 'Countryside', '56789'),
	(6, '123 Elmwood Ave', 'Suite 303', 'Citytown', '23456'),
    (7, '456 Oak St', NULL, 'Townsville', '34507'),
    (8, '789 Pine Rd', NULL, 'Villagetown', '45678'),
    (9, '555 Birch Ave', 'Unit 101', 'Hamletville', '56789'),
    (10, '987 Willow Ct', NULL, 'Suburbia', '67890'),
    (11, '321 Cedar Ln', NULL, 'Metropolis', '78901');
    
INSERT INTO items (item_id, recipe_id, item_name, item_cat, item_size, item_price)
VALUES
    (1, 'SKU001', 'Margherita', 'Pizza', 'Medium', 10.99),
    (2, 'SKU002', 'Pepperoni', 'Pizza', 'Large', 12.19),
    (3, 'SKU003', 'Vegetarian', 'Pizza', 'Medium', 11.49),
    (4, 'SKU004', 'Supreme', 'Pizza', 'Large', 14.99),
    (5, 'SKU005', 'Hawaiian', 'Pizza', 'Medium', 10.99),
    (6, 'SKU006', 'BBQ Chicken', 'Pizza', 'Large', 13.49),
    (7, 'SKU007', 'Cheeseburger', 'Pizza', 'Medium', 11.99),
    (8, 'SKU008', 'Buffalo Chicken', 'Pizza', 'Large', 12.99),
    (9, 'SKU009', 'Mushroom', 'Pizza', 'Medium', 9.99),
    (10, 'SKU010', 'Meat Lovers', 'Pizza', 'Large', 14.49),
    (11, 'SKU011', 'Veggie Supreme', 'Pizza', 'Medium', 11.99),
    (12, 'SKU012', 'Chicken Alfredo', 'Pizza', 'Large', 13.99),
    (13, 'SKU013', 'Pepperoni Calzone', 'Calzone', 'Small', 8.99),
    (14, 'SKU014', 'Vegetable Calzone', 'Calzone', 'Small', 8.49),
    (15, 'SKU015', 'Ham & Cheese Calzone', 'Calzone', 'Small', 19.49),
    (16, 'SKU016', 'Spinach & Ricotta Calzone', 'Calzone', 'Small', 9.99),
    (17, 'SKU0017', 'Margherita', 'Pizza', 'Large', 14.99),
    (18, 'SKU001', 'Margherita', 'Pizza', 'Small', 8.99); 
    
DELETE FROM items
WHERE item_id = 18; 
    
INSERT INTO orders (row_id, order_id, created_at, cust_id, item_id, quantity, delivery, add_id)
VALUES
    (1, 1001, '2022-02-07', 1, 1, 2, 1, 1),
    (2, 1002, '2022-02-07', 5, 17, 1, 0, 3),
    (3, 1003, '2022-02-07', 10, 2, 3, 1, 2),
    (4, 1004, '2022-02-07', 2, 18, 2, 1, 5),
    (5, 1005, '2022-02-07', 8, 5, 1, 0, 4),
    (6, 1006, '2022-02-07', 15, 1, 2, 1, 9),
    (7, 1007, '2022-02-07', 12, 11, 3, 0, 2),
    (8, 1008, '2022-02-07', 20, 2, 1, 1, 8),
    (9, 1009, '2022-02-07', 3, 1, 2, 1, 5),
    (10, 1010, '2022-02-07', 18, 12, 1, 0, 10),
    (11, 1011, '2022-02-07', 7, 2, 3, 1, 2),
    (12, 1012, '2022-02-08', 9, 5, 2, 1, 6),
    (13, 1013, '2022-02-08', 6, 9, 1, 0, 7),
    (14, 1014, '2022-02-08', 13, 15, 2, 1, 8),
    (15, 1015, '2022-02-08', 16, 2, 3, 0, 9),
    (16, 1016, '2022-02-08', 19, 7, 1, 1, 10),
    (17, 1017, '2022-02-08', 11, 10, 2, 1, 11),
    (18, 1018, '2022-02-08', 4, 5, 1, 0, 1),
    (19, 1019, '2022-02-08', 17, 8, 3, 1, 2),
    (20, 1020, '2022-02-08', 14, 2, 2, 1, 3),
    (21, 1021, '2022-02-08', 8, 9, 1, 0, 4),
    (22, 1022, '2022-02-08', 15, 6, 2, 1, 5),
    (23, 1023, '2022-02-08', 20, 3, 1, 1, 6),
    (24, 1024, '2022-02-08', 1, 13, 3, 0, 7),
    (25, 1025, '2022-02-08', 11, 5, 2, 1, 8),
    (26, 1026, '2022-02-08', 9, 2, 1, 0, 9),
    (27, 1027, '2022-02-08', 7, 4, 3, 1, 10),
    (28, 1028, '2022-02-08', 3, 14, 1, 0, 1),
    (29, 1029, '2022-02-08', 12, 3, 2, 1, 2),
    (30, 1030, '2022-02-08', 14, 2, 1, 0, 3),
    (31, 1031, '2022-02-08', 6, 15, 3, 1, 4),
    (32, 1032, '2022-02-08', 17, 5, 2, 0, 5),
    (33, 1033, '2022-02-09', 19, 4, 1, 1, 8),
    (34, 1034, '2022-02-09', 13, 3, 2, 0, 1),
    (35, 1035, '2022-02-09', 10, 2, 1, 1, 5),
    (36, 1036, '2022-02-09', 5, 16, 3, 0, 4),
    (37, 1037, '2022-02-09', 4, 14, 2, 1, 3),
    (38, 1038, '2022-02-09', 16, 5, 1, 0, 2),
    (39, 1039, '2022-02-09', 2, 8, 2, 1, 1),
    (40, 1040, '2022-02-09', 18, 2, 1, 0, 5),
    (41, 1041, '2022-02-09', 8, 11, 3, 1, 4),
    (42, 1042, '2022-02-09', 15, 4, 2, 0, 3),
    (43, 1043, '2022-02-09', 20, 3, 1, 1, 2),
    (44, 1044, '2022-02-09', 1, 2, 2, 0, 1),
    (45, 1045, '2022-02-09', 11, 15, 1, 1, 5),
    (46, 1046, '2022-02-09', 9, 3, 3, 0, 10),
    (47, 1047, '2022-02-09', 10, 12, 2, 0, 4),
    (48, 1048, '2022-02-09', 16, 13, 1, 1, 7),
    (49, 1049, '2022-02-09', 4, 15, 3, 0, 2),
    (50, 1050, '2022-02-09', 8, 11, 2, 1, 1),
    (51, 1051, '2022-02-09', 14, 14, 1, 0, 11),
    (52, 1052, '2022-02-09', 18, 12, 3, 1, 4),
    (53, 1053, '2022-02-09', 3, 13, 2, 0, 3),
    (54, 1054, '2022-02-09', 19, 11, 1, 1, 2),
    (55, 1055, '2022-02-10', 6, 15, 2, 0, 1),
    (56, 1056, '2022-02-10', 9, 14, 3, 1, 8),
    (57, 1057, '2022-02-10', 13, 13, 1, 0, 4),
    (58, 1058, '2022-02-10', 15, 9, 2, 1, 3),
    (59, 1059, '2022-02-10', 5, 6, 1, 0, 2),
    (60, 1060, '2022-02-10', 12, 7, 2, 1, 1),
    (61, 1061, '2022-02-10', 20, 13, 3, 0, 5),
    (62, 1062, '2022-02-10', 2, 2, 1, 1, 4),
    (63, 1063, '2022-02-10', 7, 11, 1, 0, 3),
    (64, 1064, '2022-02-10', 11, 5, 3, 1, 6),
    (65, 1065, '2022-02-10', 17, 14, 1, 0, 1),
    (66, 1066, '2022-02-10', 1, 3, 2, 1, 5),
    (67, 1067, '2022-02-10', 10, 8, 1, 0, 4),
    (68, 1068, '2022-02-10', 16, 1, 3, 1, 3),
    (69, 1069, '2022-02-10', 4, 5, 2, 0, 2),
    (70, 1070, '2022-02-10', 8, 9, 1, 1, 1),
    (71, 1071, '2022-02-10', 14, 3, 3, 0, 9),
    (72, 1072, '2022-02-10', 18, 2, 2, 1, 4),
    (73, 1073, '2022-02-11', 15, 2, 2, 0, 2),
    (74, 1074, '2022-02-11', 5, 6, 1, 0, 1),
    (75, 1075, '2022-02-11', 12, 7, 2, 1, 5),
    (76, 1076, '2022-02-11', 20, 13, 3, 0, 6),
    (77, 1077, '2022-02-11', 2, 2, 1, 1, 7),
    (78, 1078, '2022-02-11', 7, 11, 2, 0, 8),
    (79, 1079, '2022-02-11', 11, 5, 3, 1, 9),
    (80, 1080, '2022-02-11', 17, 14, 1, 0, 10),
    (81, 1081, '2022-02-11', 1, 3, 2, 1, 11),
    (82, 1082, '2022-02-11', 10, 8, 1, 0, 2),
    (83, 1083, '2022-02-11', 16, 1, 3, 1, 3),
    (84, 1084, '2022-02-11', 4, 5, 2, 0, 4),
    (85, 1085, '2022-02-11', 8, 9, 1, 1, 5),
    (86, 1086, '2022-02-11', 14, 3, 3, 0, 6),
    (87, 1087, '2022-02-11', 18, 2, 2, 1, 7),
    (88, 1088, '2022-02-12', 13, 1, 1, 0, 8),
    (89, 1089, '2022-02-12', 16, 5, 3, 1, 9),
    (90, 1090, '2022-02-12', 2, 17, 1, 0, 10),
    (91, 1091, '2022-02-12', 18, 3, 2, 1, 11),
    (92, 1092, '2022-02-12', 3, 2, 2, 0, 2),
    (93, 1093, '2022-02-12', 9, 18, 1, 1, 3),
    (94, 1094, '2022-02-12', 7, 5, 3, 0, 4),
    (95, 1095, '2022-02-12', 12, 14, 2, 1, 5),
    (96, 1096, '2022-02-12', 15, 3, 1, 0, 6),
    (97, 1097, '2022-02-12', 4, 2, 2, 1, 7),
    (98, 1098, '2022-02-12', 10, 10, 1, 0, 8),
    (99, 1099, '2022-02-12', 16, 15, 3, 1, 9),
    (100, 1100, '2022-02-12', 8, 14, 1, 0, 10),
    (101, 1101, '2022-02-12', 18, 13, 2, 1, 11),
    (102, 1102, '2022-02-12', 5, 6, 1, 0, 1),
    (103, 1103, '2022-02-13', 1, 3, 2, 1, 2),
    (104, 1104, '2022-02-13', 14, 2, 1, 0, 3),
    (105, 1105, '2022-02-13', 6, 15, 3, 1, 4),
    (106, 1106, '2022-02-13', 17, 5, 2, 0, 5),
    (107, 1107, '2022-02-13', 19, 4, 1, 1, 6),
    (108, 1108, '2022-02-13', 13, 3, 2, 0, 7),
    (109, 1109, '2022-02-13', 10, 2, 1, 1, 8),
    (110, 1110, '2022-02-13', 5, 16, 3, 0, 9),
    (111, 1111, '2022-02-13', 4, 14, 2, 1, 10),
    (112, 1112, '2022-02-13', 9, 1, 1, 0, 11),
    (113, 1113, '2022-02-13', 12, 2, 2, 1, 1),
    (114, 1114, '2022-02-13', 15, 17, 3, 0, 2),
    (115, 1115, '2022-02-13', 8, 15, 1, 1, 3),
    (116, 1116, '2022-02-13', 11, 18, 2, 0, 4),
    (117, 1117, '2022-02-13', 16, 11, 1, 1, 5),
    (118, 1118, '2022-02-13', 7, 10, 3, 0, 6),
    (119, 1119, '2022-02-13', 3, 9, 2, 1, 7),
    (120, 1120, '2022-02-13', 2, 8, 1, 0, 8),
    (121, 1121, '2022-02-14', 6, 15, 3, 1, 4),
    (122, 1122, '2022-02-14', 17, 5, 2, 0, 5),
    (123, 1123, '2022-02-14', 19, 4, 1, 1, 6),
    (124, 1124, '2022-02-14', 13, 3, 2, 0, 7),
    (125, 1125, '2022-02-14', 10, 2, 1, 1, 8),
    (126, 1126, '2022-02-14', 5, 16, 3, 0, 9),
    (127, 1127, '2022-02-14', 4, 14, 2, 1, 10),
    (128, 1128, '2022-02-14', 9, 1, 1, 0, 11),
    (129, 1129, '2022-02-14', 12, 2, 2, 1, 1),
    (130, 1130, '2022-02-14', 15, 17, 3, 0, 2),
    (131, 1131, '2022-02-14', 8, 15, 1, 1, 3),
    (132, 1132, '2022-02-14', 11, 18, 2, 0, 4),
    (133, 1133, '2022-02-14', 16, 11, 1, 1, 5),
    (134, 1134, '2022-02-14', 7, 10, 3, 0, 6),
    (135, 1135, '2022-02-14', 3, 9, 2, 1, 7),
    (136, 1136, '2022-02-14', 2, 8, 1, 0, 8),
    (137, 1137, '2022-02-14', 1, 7, 3, 1, 9),
    (138, 1138, '2022-02-14', 14, 6, 2, 0, 10),
    (139, 1139, '2022-02-14', 18, 5, 1, 1, 11),
    (140, 1140, '2022-02-14', 10, 4, 3, 0, 1),
    (141, 1141, '2022-02-14', 9, 3, 2, 1, 2),
    (142, 1142, '2022-02-14', 5, 2, 1, 0, 3);



INSERT INTO ingredient (ing_id, ing_name, ing_weight, ing_meas, ing_price)
VALUES
    ('ING001', 'Tomato Sauce', 200, 'grams', 2.50),
    ('ING002', 'Mozzarella Cheese', 150, 'grams', 3.00),
    ('ING003', 'Pepperoni', 50, 'grams', 2.50),
    ('ING004', 'Green Peppers', 30, 'grams', 1.50),
    ('ING005', 'Onions', 30, 'grams', 1.25),
    ('ING006', 'Mushrooms', 30, 'grams', 1.75),
    ('ING007', 'Ham', 50, 'grams', 2.00),
    ('ING008', 'Pineapple', 50, 'grams', 1.50),
    ('ING009', 'Chicken', 60, 'grams', 2.50),
    ('ING010', 'Bacon', 40, 'grams', 2.00),
    ('ING011', 'Sausage', 40, 'grams', 2.25),
    ('ING012', 'Red Onion', 30, 'grams', 1.50),
    ('ING013', 'Black Olives', 20, 'grams', 1.25),
    ('ING014', 'Jalapenos', 20, 'grams', 1.50),
    ('ING015', 'Ground Beef', 60, 'grams', 2.50),
    ('ING016', 'Cheddar Cheese', 100, 'grams', 2.75),
    ('ING017', 'Barbecue Sauce', 30, 'grams', 1.75),
    ('ING018', 'Alfredo Sauce', 30, 'grams', 1.75),
    ('ING019', 'Spinach', 20, 'grams', 1.50),
    ('ING020', 'Ricotta Cheese', 100, 'grams', 2.75),
    ('ING021', 'Sliced Tomatoes', 30, 'grams', 1.50),
    ('ING022', 'Parmesan Cheese', 20, 'grams', 1.50),
    ('ING023', 'Oregano', 2, 'grams', 0.50),
    ('ING024', 'Basil', 2, 'grams', 0.50),
    ('ING025', 'Garlic Powder', 2, 'grams', 0.50),
    ('ING026', 'Salt', 2, 'grams', 0.25),
    ('ING027', 'Pepper', 2, 'grams', 0.25),
    ('ING028', 'Flour', 200, 'grams', 1.00),
    ('ING029', 'Yeast', 5, 'grams', 1.50),
    ('ING030', 'Sugar', 5, 'grams', 0.50);

INSERT INTO recipe (row_id, recipe_id, ing_id, quantity)
VALUES
    -- SKU001: Margherita
    (1, 'SKU001', 'ING001', 2),
    (2, 'SKU001', 'ING002', 1),
    (3, 'SKU001', 'ING023', 1),
    (4, 'SKU001', 'ING024', 1),
    -- SKU002: Pepperoni
    (5, 'SKU002', 'ING001', 2),
    (6, 'SKU002', 'ING002', 1),
    (7, 'SKU002', 'ING003', 1),
    (8, 'SKU002', 'ING023', 1),
    -- SKU003: Vegetarian
    (9, 'SKU003', 'ING001', 2),
    (10, 'SKU003', 'ING002', 1),
    (11, 'SKU003', 'ING004', 1),
    (12, 'SKU003', 'ING005', 1),
    (13, 'SKU003', 'ING006', 1),
    (14, 'SKU003', 'ING026', 1),
    -- SKU004: Supreme
    (15, 'SKU004', 'ING001', 2),
    (16, 'SKU004', 'ING002', 1),
    (17, 'SKU004', 'ING003', 1),
    (18, 'SKU004', 'ING007', 1),
    (19, 'SKU004', 'ING008', 1),
    (20, 'SKU004', 'ING011', 1),
    -- SKU005: Hawaiian
    (21, 'SKU005', 'ING001', 2),
    (22, 'SKU005', 'ING002', 1),
    (23, 'SKU005', 'ING008', 1),
    (24, 'SKU005', 'ING009', 1),
    -- SKU006: BBQ Chicken
    (25, 'SKU006', 'ING001', 2),
    (26, 'SKU006', 'ING002', 1),
    (27, 'SKU006', 'ING009', 1),
    (28, 'SKU006', 'ING010', 1),
    -- SKU007: Cheeseburger
    (29, 'SKU007', 'ING001', 2),
    (30, 'SKU007', 'ING002', 1),
    (31, 'SKU007', 'ING011', 1),
    (32, 'SKU007', 'ING012', 1),
    -- SKU008: Buffalo Chicken
    (33, 'SKU008', 'ING001', 2),
    (34, 'SKU008', 'ING002', 1),
    (35, 'SKU008', 'ING013', 1),
    (36, 'SKU008', 'ING014', 1),
    -- SKU009: Mushroom
    (37, 'SKU009', 'ING001', 2),
    (38, 'SKU009', 'ING002', 1);
    
    
    
    -- ING001: Tomato Sauce
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (1, 'ING001', 2000);

-- ING002: Mozzarella Cheese
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (2, 'ING002', 1500);

-- ING003: Pepperoni
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (3, 'ING003', 800);

-- ING004: Green Peppers
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (4, 'ING004', 500);

-- ING005: Onions
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (5, 'ING005', 400);

-- ING006: Mushrooms
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (6, 'ING006', 300);

-- ING007: Ham
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (7, 'ING007', 700);

-- ING008: Pineapple
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (8, 'ING008', 400);

-- ING009: Chicken
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (9, 'ING009', 600);
-- ING010: Bacon
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (10, 'ING010', 300);

-- ING011: Sausage
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (11, 'ING011', 400);

-- ING012: Red Onion
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (12, 'ING012', 250);

-- ING013: Black Olives
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (13, 'ING013', 200);

-- ING014: Jalapenos
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (14, 'ING014', 150);

-- ING015: Ground Beef
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (15, 'ING015', 350);

-- ING016: Cheddar Cheese
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (16, 'ING016', 1200);

-- ING017: Barbecue Sauce
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (17, 'ING017', 300);

-- ING018: Alfredo Sauce
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (18, 'ING018', 300);

-- ING019: Spinach
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (19, 'ING019', 150);

-- ING020: Ricotta Cheese
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (20, 'ING020', 800);

-- ING021: Sliced Tomatoes
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (21, 'ING021', 200);

-- ING022: Parmesan Cheese
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (22, 'ING022', 100);

-- ING023: Oregano
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (23, 'ING023', 50);

-- ING024: Basil
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (24, 'ING024', 50);

-- ING025: Garlic Powder
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (25, 'ING025', 50);

-- ING026: Salt
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (26, 'ING026', 50);

-- ING027: Pepper
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (27, 'ING027', 50);

-- ING028: Flour
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (28, 'ING028', 1000);

-- ING029: Yeast
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (29, 'ING029', 100);

-- ING030: Sugar
INSERT INTO inventory (inv_id, item_id, quantity) VALUES (30, 'ING030', 100);


INSERT INTO shift (shift_id, day_of_week, starttime, endtime)
VALUES
    ('SHIFT001', 'Monday', '10:30:00', '14:00:00'),
    ('SHIFT002', 'Monday', '18:30:00', '23:00:00'),
    ('SHIFT003', 'Tuesday', '10:30:00', '14:00:00'),
    ('SHIFT004', 'Tuesday', '18:30:00', '23:00:00'),
    ('SHIFT005', 'Wednesday', '10:30:00', '14:00:00'),
    ('SHIFT006', 'Wednesday', '18:30:00', '23:00:00'),
    ('SHIFT007', 'Thursday', '10:30:00', '14:00:00'),
    ('SHIFT008', 'Thursday', '18:30:00', '23:00:00'),
    ('SHIFT009', 'Friday', '10:30:00', '14:00:00'),
    ('SHIFT010', 'Friday', '18:30:00', '23:00:00'),
    ('SHIFT011', 'Saturday', '10:30:00', '14:00:00'),
    ('SHIFT012', 'Saturday', '18:30:00', '23:00:00'),
    ('SHIFT013', 'Sunday', '10:30:00', '14:00:00'),
    ('SHIFT014', 'Sunday', '18:30:00', '23:00:00');
    
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF001', 'John', 'Doe', 'Manager', 20.00),
    ('STAFF002', 'Jane', 'Smith', 'Chef', 18.00),
    ('STAFF003', 'Michael', 'Johnson', 'Waiter', 12.50),
    ('STAFF004', 'Emily', 'Williams', 'Cashier', 11.00),
    ('STAFF005', 'David', 'Brown', 'Delivery Driver', 13.00),
    ('STAFF006', 'Sarah', 'Jones', 'Cook', 15.00),
    ('STAFF007', 'Christopher', 'Davis', 'Dishwasher', 10.00),
    ('STAFF008', 'Jessica', 'Miller', 'Waiter', 12.50),
    ('STAFF009', 'Daniel', 'Wilson', 'Host', 11.50),
    ('STAFF010', 'Amanda', 'Martinez', 'Busser', 10.50);

INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF011', 'Alex', 'Taylor', 'Manager', 21.50),
    ('STAFF012', 'Olivia', 'Anderson', 'Manager', 20.50);
    -- ... Continue with more manager entries

-- Chef
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF013', 'William', 'Hernandez', 'Chef', 18.50),
    ('STAFF014', 'Samantha', 'Garcia', 'Chef', 17.50);
    -- ... Continue with more chef entries

-- Waiter
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF015', 'Matthew', 'Lopez', 'Waiter', 12.75),
    ('STAFF016', 'Isabella', 'Rodriguez', 'Waiter', 12.25);
    -- ... Continue with more waiter entries

-- Cashier
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF017', 'James', 'Perez', 'Cashier', 11.25),
    ('STAFF018', 'Sophia', 'Lee', 'Cashier', 11.75);
    -- ... Continue with more cashier entries

-- Delivery Driver
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF019', 'Benjamin', 'King', 'Delivery Driver', 13.50),
    ('STAFF020', 'Mia', 'Wright', 'Delivery Driver', 12.75);
    -- ... Continue with more delivery driver entries

-- Cook
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF021', 'Ethan', 'Lopez', 'Cook', 15.25),
    ('STAFF022', 'Ava', 'Hernandez', 'Cook', 15.75);
    -- ... Continue with more cook entries

-- Dishwasher
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF023', 'Liam', 'Clark', 'Dishwasher', 10.25),
    ('STAFF024', 'Harper', 'Young', 'Dishwasher', 9.75);
    -- ... Continue with more dishwasher entries

-- Host
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF025', 'Noah', 'Hall', 'Host', 11.75),
    ('STAFF026', 'Ella', 'Baker', 'Host', 11.25);
    -- ... Continue with more host entries

-- Busser
INSERT INTO staff (staff_id, first_name, last_name, Position, hourly_rate)
VALUES
    ('STAFF027', 'Logan', 'Rogers', 'Busser', 10.50),
    ('STAFF028', 'Lily', 'Gonzalez', 'Busser', 10.25);
    
 -- attempted tom use window function to insert records into rotation table but couldn't get the results as wanted, so I wouldn't recommend it   
    
/*INSERT INTO rotation (row_id, rota_id, date, shift_id, staff_id)
SELECT
    ROW_NUMBER() OVER (ORDER BY s.staff_id, sh.shift_id) AS row_id,
    CONCAT('ROTA', ROW_NUMBER() OVER (ORDER BY s.staff_id, sh.shift_id)) AS rota_id,
    '2022-02-07' AS date,
    sh.shift_id,
    s.staff_id
FROM staff s
CROSS JOIN shift sh;*/

set sql_safe_updates=0;
delete from rotation; 

INSERT INTO rotation (row_id, rota_id, date, shift_id, staff_id)
VALUES
    (1, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF001'),
    (2, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF013'),
    (3, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF008'),
    (4, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF017'),
    (5, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF005'),
    (6, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF022'),
    (7, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF023'),
    (8, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF026'),
    (9, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF010');


INSERT INTO rotation (row_id, rota_id, date, shift_id, staff_id)
VALUES
    (10, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF002'),
    (11, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF021'),
    (12, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF019'),
    (13, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF015'),
    (14, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF018'),
    (15, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF024'),
    (16, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF028'),
    (17, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF026'),
    (18, 'R002', '2022-02-08 00:00:00', 'SHIFT002', 'STAFF012');
    
INSERT INTO rotation (row_id, rota_id, date, shift_id, staff_id)
VALUES
    (19, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF011'),
    (20, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF007'),
    (21, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF027'),
    (22, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF014'),
    (23, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF006'),
    (24, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF016'),
    (25, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF004'),
    (26, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF009'),
    (27, 'R003', '2022-02-09 00:00:00', 'SHIFT003', 'STAFF020');