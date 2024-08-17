-- Finding the average rating for each category

SELECT category, AVG(rating)
FROM amazon
GROUP BY category
ORDER BY AVG(rating) DESC
;

-- Finding the average rating for all products

SELECT AVG(rating)
FROM amazon
;

-- Finding all categories with an average rating higher than the overall average rating

SELECT category, AVG(rating)
FROM amazon
GROUP BY category
HAVING AVG(rating) > (SELECT AVG(rating) FROM amazon)
;

-- Finding the most expensive items in USD (mainly electronics)

SELECT product_name, category, CONCAT('$', (discounted_price/12)) AS discounted_usd, rating
FROM amazon
ORDER BY discounted_price DESC
; (most expensive has 4.7 rating)

-- Finding the least expensive items in USD (mainly accessories)

SELECT product_name, category, CONCAT('$', (discounted_price/12)) AS discounted_usd, rating
FROM amazon
ORDER BY discounted_price
; (tend to have ratings lower than average)

-- Finding the top rated products (little correlation to price

SELECT product_name, category, CONCAT('$', (discounted_price/12)) AS discounted_usd, discount_percentage, rating
FROM amazon
WHERE rating >=4.7
ORDER BY rating DESC
;

-- Finding the average discount percentage

SELECT AVG(discount_percentage)
FROM amazon
;

-- Finding the lowest rated products (every product rated 3 or lower is above the average discount percentage)

SELECT product_name, category, CONCAT('$', (discounted_price/12)) AS discounted_usd, discount_percentage, rating
FROM amazon
ORDER BY rating
;

-- Finding the lowest rated product

SELECT product_name, category, CONCAT('$', (discounted_price/12)) AS discounted_usd, discount_percentage, rating, rating_count
FROM amazon
ORDER BY rating_count
;

-- Finding the average length of reviews for the entire dataset

SELECT AVG(LENGTH(review_content))
FROM amazon
;

-- Finding the average rating for the length of a review if it was greater than the average length

SELECT AVG(LENGTH(review_content)), AVG(rating)
FROM amazon
HAVING LENGTH(review_content) < (SELECT AVG(LENGTH(review_content)) FROM amazon)
;

-- Average length of reviews greater than than the average review length and the average rating

SELECT AVG(LENGTH(review_content)), AVG(rating)
FROM amazon
WHERE LENGTH(review_content) > 1393.93
;

-- Separated length into 3 segments (each containing 400-600 rows)

SELECT COUNT(LENGTH(review_content))
FROM amazon
WHERE LENGTH(review_content) < 650
; 
SELECT COUNT(LENGTH(review_content))
FROM amazon
WHERE LENGTH(review_content) BETWEEN 650 AND 1250
;
SELECT COUNT(LENGTH(review_content))
FROM amazon
WHERE LENGTH(review_content) > 1250
;

-- Testing the length of the review and the effect on rating
SELECT AVG(LENGTH(review_content)), AVG(rating)
FROM amazon
WHERE LENGTH(review_content) < 650
;
SELECT AVG(LENGTH(review_content)), AVG(rating)
FROM amazon
WHERE LENGTH(review_content) BETWEEN 650 AND 1250
;
SELECT AVG(LENGTH(review_content)), AVG(rating)
FROM amazon
WHERE LENGTH(review_content) > 1250
;
