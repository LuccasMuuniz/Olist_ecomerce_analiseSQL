-- Consulta para analisar a sazonalidade das vendas no e-commerce Olist
SELECT
    -- Extrai o mês da data de compra para agrupar as vendas por período
    MONTH(STR_TO_DATE(ood.order_purchase_timestamp, '%Y-%m-%d')) AS MESES, 
    
    -- Conta o número total de pedidos entregues em cada mês
    COUNT(*) AS qnt_venda, 
    
    -- Calcula o valor total das vendas em cada mês
    ROUND(SUM(ooid.price), 2) AS valor_venda, 
    -- Calcula o ticket médio (valor médio por pedido) de cada mês
    ROUND(SUM(ooid.price) / COUNT(*), 2) AS tiket_medio  

FROM olist_orders_dataset AS ood

-- Faz o join com a tabela de itens de pedidos para obter os valores das vendas
JOIN olist_order_items_dataset AS ooid 
    ON ood.order_id = ooid.order_id  

-- Filtra apenas os pedidos que foram entregues
WHERE order_status = "delivered"  

-- Agrupa os resultados por mês de compra
GROUP BY MESES 

-- Ordena os meses pelo valor total de vendas, do maior para o menor
ORDER BY valor_venda DESC;