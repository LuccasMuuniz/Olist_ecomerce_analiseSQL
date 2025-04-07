-- Seleciona os produtos mais vendidos que possuem avaliações baixas
SELECT 
	ooid.product_id AS produto_id, -- ID do produto (não há nome disponível no dataset)
    opd.product_category_name AS categoria, -- Nome da categoria do produto
	ROUND(COUNT(*)) AS total_vendas, -- Total de vendas por produto
    ROUND(AVG(oord.review_score), 2) AS media, -- Média das avaliações do produto, arredondada para 2 casas decimais

    -- Classifica os produtos com base nas avaliações (da pior para a melhor) e, em caso de empate, pelos mais vendidos
    RANK() OVER (
      ORDER BY AVG(oord.review_score) ASC, COUNT(*) DESC
    ) AS rank_vendas 

FROM olist_order_reviews_dataset AS oord
-- Junta com a tabela de itens dos pedidos para associar as avaliações aos produtos
JOIN olist_order_items_dataset AS ooid  
 ON oord.order_id = ooid.order_id
-- Junta com a tabela de produtos para obter a categoria de cada produto
JOIN olist_products_dataset AS opd  
 ON ooid.product_id = opd.product_id

-- Agrupa os resultados por ID do produto e categoria
GROUP BY ooid.product_id, opd.product_category_name 

-- Filtra apenas os produtos que tiveram mais de 1 venda e média de avaliação menor ou igual a 3.5
HAVING total_vendas > 1 AND media <= 3.5 

-- Ordena pelo ranking, mostrando primeiro os produtos com pior avaliação e mais vendas
ORDER BY rank_vendas; 
