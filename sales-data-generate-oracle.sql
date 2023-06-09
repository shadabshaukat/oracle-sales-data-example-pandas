-- Sales Table --
CREATE TABLE sales (
    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    product_id NUMBER,
    quantity NUMBER,
    price NUMBER,
    sale_date DATE,
    CONSTRAINT sales_pk PRIMARY KEY (id)
);

-- Products Table --
CREATE TABLE products (
    PRODUCT_ID INTEGER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(100),
    CATEGORY VARCHAR2(50),
    BRAND VARCHAR2(50)
);

-- Create Procedure to Generate 1 Billion Rows --
CREATE OR REPLACE PROCEDURE load_sales_data (p_rows IN NUMBER DEFAULT 1000000000)
IS
BEGIN
    FOR i IN 1..p_rows
    LOOP
        INSERT INTO sales (product_id, quantity, price, sale_date)
        VALUES (TRUNC(DBMS_RANDOM.VALUE(1, 100)), -- Random product_id between 1 and 100
                TRUNC(DBMS_RANDOM.VALUE(1, 101)), -- Random quantity between 1 and 100
                ROUND(DBMS_RANDOM.VALUE(10, 1001), 2), -- Random price between 10 and 1000 with 2 decimal places
                TRUNC(SYSDATE - DBMS_RANDOM.VALUE(0, 1096)) -- Random date within the last 3 years
        );
        
        IF MOD(i, 100000) = 0 THEN
            COMMIT; -- Commit every 100000 rows
        END IF;
    END LOOP;
    
    COMMIT; -- Final commit
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END load_sales_data;
/


-- Execute Procedure --
BEGIN
    load_sales_data();
END;
/

-- Insert Sample Products in 'products' table --
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (1, 'Toothbrush', 'Personal Care', 'Oral-B');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (2, 'Shampoo', 'Personal Care', 'Pantene');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (3, 'Laptop', 'Electronics', 'Dell');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (4, 'Smartphone', 'Electronics', 'Apple');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (5, 'Microwave', 'Home Appliances', 'Samsung');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (6, 'Blender', 'Kitchen Appliances', 'Ninja');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (7, 'Television', 'Electronics', 'Sony');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (8, 'Air Conditioner', 'Home Appliances', 'LG');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (9, 'Headphones', 'Electronics', 'Bose');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (10, 'Coffee Maker', 'Kitchen Appliances', 'Keurig');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (11, 'Socks', 'Clothing', 'Hanes');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (12, 'Running Shoes', 'Footwear', 'Nike');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (13, 'Lawn Mower', 'Outdoor', 'Black and Decker');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (14, 'Grill', 'Outdoor', 'Weber');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (15, 'Jeans', 'Clothing', 'Levis');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (16, 'Vacuum Cleaner', 'Home Appliances', 'Dyson');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (17, 'Cookware Set', 'Kitchen Appliances', 'T-fal');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (18, 'Electric Toothbrush', 'Personal Care', 'Philips');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (19, 'Sunglasses', 'Accessories', 'Ray-Ban');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (20, 'Hand Sanitizer', 'Personal Care', 'Purell');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (21, 'T-Shirt', 'Clothing', 'Fruit of the Loom');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (22, 'Bicycle', 'Outdoor', 'Schwinn');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (23, 'Yoga Mat', 'Fitness', 'Gaiam');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (24, 'Dumbbells', 'Fitness', 'CAP Barbell');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (25, 'Frying Pan', 'Kitchen Appliances', 'T-fal');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (26, 'Couch', 'Furniture', 'Ashley Furniture');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (27, 'Bed Frame', 'Furniture', 'Zinus');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (28, 'Mattress', 'Furniture', 'Casper');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (29, 'Smartwatch', 'Electronics', 'Apple');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (30, 'Bluetooth Speaker', 'Electronics', 'JBL');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (31, 'Tent', 'Outdoor', 'Coleman');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (32, 'Sleeping Bag', 'Outdoor', 'Teton Sports');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (33, 'Backpack', 'Outdoor', 'Osprey');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (34, 'Laptop', 'Electronics', 'HP');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (35, 'Headphones', 'Electronics', 'Sony');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (36, 'Toothpaste', 'Personal Care', 'Colgate');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (37, 'Shampoo', 'Personal Care', 'Pantene');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (38, 'Conditioner', 'Personal Care', 'Pantene');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (39, 'Deodorant', 'Personal Care', 'Dove');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (40, 'Hair Dryer', 'Personal Care', 'Conair');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (41, 'Gaming Console', 'Electronics', 'Sony');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (42, 'Coffee Maker', 'Kitchen Appliances', 'Keurig');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (43, 'Toaster', 'Kitchen Appliances', 'Black and Decker');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (44, 'Microwave', 'Kitchen Appliances', 'Samsung');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (45, 'Dishwasher', 'Kitchen Appliances', 'Bosch');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (46, 'Washing Machine', 'Home Appliances', 'LG');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (47, 'Dryer', 'Home Appliances', 'Whirlpool');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (48, 'Air Conditioner', 'Home Appliances', 'Frigidaire');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (49, 'Vacuum Cleaner', 'Home Appliances', 'Dyson');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (50, 'Blender', 'Kitchen Appliances', 'Vitamix');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (51, 'Wireless Headphones', 'Electronics', 'Bose');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (52, 'Smart Speaker', 'Electronics', 'Amazon');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (53, 'Air Fryer', 'Kitchen Appliances', 'Ninja');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (54, 'Electric Grill', 'Kitchen Appliances', 'George Foreman');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (55, 'Slow Cooker', 'Kitchen Appliances', 'Crock-Pot');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (56, 'Blu-ray Player', 'Electronics', 'Samsung');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (57, 'Robot Vacuum', 'Home Appliances', 'iRobot');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (58, 'Air Purifier', 'Home Appliances', 'Honeywell');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (59, 'Stand Mixer', 'Kitchen Appliances', 'KitchenAid');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (60, 'Outdoor Grill', 'Outdoor Living', 'Weber');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (61, 'Smart Thermostat', 'Home Appliances', 'Nest');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (62, 'Smart Lock', 'Home Appliances', 'August');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (63, 'Smart Plug', 'Home Appliances', 'TP-Link');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (64, 'Outdoor Security Camera', 'Home Security', 'Ring');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (65, 'Smart Doorbell', 'Home Security', 'Nest');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (66, 'Smart Light Bulbs', 'Home Automation', 'Philips Hue');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (67, 'Smart TV', 'Electronics', 'LG');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (68, 'Smartwatch', 'Electronics', 'Apple');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (69, 'Fitness Tracker', 'Electronics', 'Fitbit');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (70, 'Air Fryer Toaster Oven', 'Kitchen Appliances', 'Cuisinart');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (71, 'Yogurt', 'Dairy', 'Chobani');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (72, 'Orange Juice', 'Beverages', 'Simply Orange');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (73, 'Apple Juice', 'Beverages', 'Mott''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (74, 'Chocolate Milk', 'Dairy', 'Hershey''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (75, 'Bread', 'Bakery', 'Sara Lee');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (76, 'Bagels', 'Bakery', 'Thomas''');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (77, 'English Muffins', 'Bakery', 'Bays');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (78, 'Donuts', 'Bakery', 'Entenmann''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (79, 'Cereal', 'Breakfast', 'General Mills');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (80, 'Granola Bars', 'Snacks', 'Nature Valley');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (81, 'Potato Chips', 'Snacks', 'Lays');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (82, 'Pretzels', 'Snacks', 'Snyder''s of Hanover');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (83, 'Popcorn', 'Snacks', 'Orville Redenbacher''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (84, 'Nuts', 'Snacks', 'Planters');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (85, 'Gum', 'Candy', 'Wrigley''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (86, 'Mints', 'Candy', 'Altoids');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (87, 'Chewing Candy', 'Candy', 'Starburst');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (88, 'Hard Candy', 'Candy', 'Jolly Rancher');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (89, 'Lollipops', 'Candy', 'Tootsie Roll');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (90, 'Chocolate', 'Candy', 'Hershey''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (91, 'Ice Cream', 'Dairy', 'Breyers');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (92, 'Sorbet', 'Dairy', 'Haagen-Dazs');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (93, 'Frozen Vegetables', 'Frozen Foods', 'Birds Eye');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (94, 'Frozen Pizza', 'Frozen Foods', 'DiGiorno');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (95, 'Frozen Meals', 'Frozen Foods', 'Lean Cuisine');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (96, 'Frozen Fish', 'Frozen Foods', 'Gorton''s');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (97, 'Frozen Chicken', 'Frozen Foods', 'Tyson');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (98, 'Frozen Fruit', 'Frozen Foods', 'Dole');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (99, 'Frozen Waffles', 'Frozen Foods', 'Eggo');
INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, BRAND) VALUES (100, 'Frozen French Fries', 'Frozen Foods', 'Ore-Ida');
commit;


-- Join the sales and products tables on the PRODUCT_ID column and calculates the total quantity and revenue for each product per month --
SELECT /*+ PARALLEL(sales, 4) */
    s.PRODUCT_ID,
    p.PRODUCT_NAME,
    EXTRACT(YEAR FROM s.SALE_DATE) AS "YEAR",
    EXTRACT(MONTH FROM s.SALE_DATE) AS "MONTH",
    SUM(s.QUANTITY) AS total_quantity,
    SUM(s.PRICE * s.QUANTITY) AS total_revenue
FROM
    sales s
JOIN
    products p ON s.PRODUCT_ID = p.PRODUCT_ID
GROUP BY
    s.PRODUCT_ID,
    p.PRODUCT_NAME,
    EXTRACT(YEAR FROM s.SALE_DATE),
    EXTRACT(MONTH FROM s.SALE_DATE)
ORDER BY
    s.PRODUCT_ID,
    EXTRACT(YEAR FROM s.SALE_DATE),
    EXTRACT(MONTH FROM s.SALE_DATE);
    
 
 -- Create Materialized View of Query for Pre-Aggregating the Results --
 CREATE MATERIALIZED VIEW sales_by_product AS
SELECT
  p.product_id,
  p.product_name,
  EXTRACT(YEAR FROM s.sale_date) AS year,
  EXTRACT(MONTH FROM s.sale_date) AS month,
  SUM(s.quantity) AS total_quantity,
  SUM(s.quantity * s.price) AS total_revenue
FROM
  sales s
  JOIN products p ON s.product_id = p.product_id
GROUP BY
  p.product_id,
  p.product_name,
  EXTRACT(YEAR FROM s.sale_date),
  EXTRACT(MONTH FROM s.sale_date);

 
 
-- To refresh the materialized view, you can run the following command --

EXEC DBMS_MVIEW.REFRESH('sales_by_product', 'F');
