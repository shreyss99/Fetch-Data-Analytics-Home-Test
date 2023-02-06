-- 1) Which brand saw the most dollars spent in the month of June?


-- 2) Which user spent the most money in the month of August?

SELECT USER_ID, SUM(TOTAL_SPENT) as total_spent
FROM receipts
WHERE EXTRACT(MONTH FROM receipts.PURCHASE_DATE) = 8
GROUP BY USER_ID 
ORDER BY SUM(TOTAL_SPENT) DESC
LIMIT 1;


-- 3) What user bought the most expensive item?

SELECT DISTINCT(r.user_id) FROM receipts r 
INNER JOIN receipt_items ri 
ON r.ID = ri.REWARDS_RECEIPT_ID
WHERE rewards_receipt_item_id IN (SELECT rewards_receipt_item_id
FROM receipt_items 
WHERE quantity_purchased != 0 
AND total_final_price / quantity_purchased IS NOT NULL
ORDER BY total_final_price / quantity_purchased DESC
LIMIT 1);


-- 4) What is the name of the most expensive item purchased?

SELECT 
DISTINCT(original_receipt_item_text)
FROM receipt_items
WHERE rewards_receipt_item_id IN (SELECT rewards_receipt_item_id
FROM receipt_items 
WHERE quantity_purchased != 0 
AND total_final_price / quantity_purchased IS NOT NULL
ORDER BY total_final_price / quantity_purchased DESC
LIMIT 1);


-- 5) How many users scanned in each month?

-- Count of distinct users
SELECT EXTRACT(MONTH FROM receipts.DATE_SCANNED) AS month_number, 
COUNT(DISTINCT(USER_ID)) AS user_count_by_month
FROM receipts
GROUP BY EXTRACT(MONTH FROM receipts.DATE_SCANNED);

-- Count of users 
SELECT EXTRACT(MONTH FROM receipts.DATE_SCANNED) AS month_number, 
COUNT(USER_ID) AS user_count_by_month
FROM receipts
GROUP BY EXTRACT(MONTH FROM receipts.DATE_SCANNED);
























