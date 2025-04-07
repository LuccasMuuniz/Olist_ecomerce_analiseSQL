-- Seleciona a categoria do produto e o faturamento total de cada categoria
SELECT 	
	TRIM(opd.product_category_name) AS categoria, -- Remove espaços extras e renomeia a coluna para "categoria"
    ROUND(SUM(ooid.price), 2) AS faturamento_produto -- Soma os preços dos produtos e arredonda para 2 casas decimais
FROM olist_orders_dataset AS ood
-- Junta a tabela de pedidos com os itens dos pedidos através do ID do pedido
JOIN olist_order_items_dataset AS ooid  
 ON ood.order_id = ooid.order_id
-- Junta a tabela de produtos para obter a categoria do produto através do ID do produto
JOIN olist_products_dataset AS opd  
 ON ooid.product_id = opd.product_id
-- Agrupa os resultados por categoria do produto, somando o faturamento de cada categoria
GROUP BY opd.product_category_name;
