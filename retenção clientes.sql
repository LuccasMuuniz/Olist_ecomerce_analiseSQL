-- "Os clientes' estão voltando para comprar novamente?"
SELECT 
	ocd.customer_id,
	count(*) as qnt_compras
FROM olist_orders_dataset as ood
GROUP BY ood.customer_id
having qnt_compras >1