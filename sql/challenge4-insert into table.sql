INSERT INTO shipping_summary(
shipping_date, seller_name, buyer_name, buyer_address,
buyer_city, buyer_zipcode, kode_resi
)
SELECT shpt.shipping_date, slrt.seller_name, byt.buyer_name, 
byt.address AS buyer_address, byt.city AS buyer_city, byt.zipcode AS buyer_zipcode,
(CONCAT(shpt.shipping_id, '-', TO_CHAR(shpt.purchase_date,'YYYYMMDD'), '-',
		TO_CHAR(shpt.shipping_date,'YYYYMMDD'), '–', byt.buyer_id, '–',
		slrt.seller_id)) AS kode_resi
FROM shipping_table AS shpt
LEFT JOIN seller_table AS slrt
ON shpt.seller_id = slrt.seller_id
LEFT JOIN buyer_table AS byt
ON shpt.buyer_id = byt.buyer_id
ORDER BY shpt.shipping_date ASC


SELECT *
FROM shipping_summary
