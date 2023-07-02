INSERT INTO q3_q4_review(
purchase_date, item_id, item_name, quantity, total_price,
promo_id, promo_name, price_deduction, price_after_promo
)
SELECT slst.purchase_date, mt.item_id, mt.item_name, slst.quantity,
(slst.quantity * mt.price) AS total_price,
pc.promo_id, pc.promo_name, pc.price_deduction,
(
CASE
	WHEN ((slst.quantity * mt.price) - pc.price_deduction) < 0
	THEN 0
	ELSE ((slst.quantity * mt.price) - pc.price_deduction)
END
) AS price_after_promo
FROM sales_table AS slst
LEFT JOIN marketplace_table AS mt
ON slst.item_id = mt.item_id
LEFT JOIN promo_code AS pc
ON slst.promo_id = pc.promo_id
WHERE slst.purchase_date BETWEEN '20220701' AND '20221231'
ORDER BY slst.purchase_date ASC

SELECT purchase_date, item_id, item_name, quantity, total_price,
promo_id, promo_name, price_deduction, price_after_promo
FROM q3_q4_review