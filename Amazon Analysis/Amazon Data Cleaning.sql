-- Create new table including headers from csv file to import data into SQL

CREATE TABLE amazon (
	product_id VARCHAR(255),
	product_name VARCHAR(60000),
	category VARCHAR(255),
	discounted_price NUMERIC,
	actual_price NUMERIC,
	discount_percentage	DECIMAL,
	rating NUMERIC,
	rating_count INT, 
	about_product VARCHAR(60000),
	user_id VARCHAR(60000),
	user_name VARCHAR(255),
	review_id VARCHAR(255),
	review_title VARCHAR(60000),
	review_content VARCHAR(60000)
	);

-- Shortening the categories to only include main categories, resulting in 8 distinct categories

UPDATE amazon
SET category = 'Computers & Accessories'
WHERE category LIKE 'Computers%'
;
UPDATE amazon
SET category = 'Car & Motorbike'
WHERE category LIKE 'Car%'
;
UPDATE amazon
SET category = 'Electronics'
WHERE category LIKE 'Electronics%'
;
UPDATE amazon
SET category = 'Health & Personal Care'
WHERE category LIKE 'Health%'
;
UPDATE amazon
SET category = 'Home & Kitchen'
WHERE category LIKE 'Home%'
;
UPDATE amazon
SET category = 'Office Products'
WHERE category LIKE 'Office%'
;
UPDATE amazon
SET category = 'Toys & Games'
WHERE category LIKE 'Toys%'
;
UPDATE amazon
SET category = 'Musical Instruments'
WHERE category LIKE 'Musical%'
;

-- Created two new columns to show the USD price, the original columns were in rupees

UPDATE amazon 
SET discounted_usd = ROUND((discounted_price/12), 2);

UPDATE amazon 
SET actual_usd = ROUND((actual_price/12), 2); 