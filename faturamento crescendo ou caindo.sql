-- CTE (Common Table Expression) para calcular o total de vendas por mês
WITH vendas_mensais AS (
    SELECT 
        -- Formata a data da entrega para o padrão 'YYYY-MM' (ano-mês)
        DATE_FORMAT(STR_TO_DATE(order_delivered_carrier_date, '%Y-%m-%d'), '%Y-%m') AS datas,
        
        -- Soma o valor total das vendas por mês e arredonda para 2 casas decimais
        ROUND(SUM(ooid.price), 2) AS total_vendas
    FROM olist_orders_dataset AS ood
    JOIN olist_order_items_dataset AS ooid
        ON ooid.order_id = ood.order_id  -- Junta os pedidos com os itens
    WHERE ood.order_status = "delivered" -- Considera apenas pedidos entregues
    GROUP BY datas                        -- Agrupa os resultados por mês
),

-- CTE para pegar apenas os últimos 12 meses distintos (mais recentes)
ultimos_12_meses AS (
    SELECT DISTINCT datas
    FROM vendas_mensais
    ORDER BY datas DESC
    LIMIT 12
)

-- Consulta final que junta as duas CTEs e faz as comparações mensais
SELECT 
    v.datas,                         -- Mês/ano da venda
    v.total_vendas,                 -- Total de vendas no mês
    LAG(v.total_vendas) OVER (ORDER BY v.datas) AS venda_mes_passado, -- Total de vendas no mês anterior

    -- Diferença absoluta entre o mês atual e o anterior
    ROUND(v.total_vendas - COALESCE(LAG(v.total_vendas) OVER (ORDER BY v.datas), 0), 2) AS comparacao_venda,

    -- Variação percentual entre o mês atual e o anterior
    ROUND(
        (v.total_vendas - COALESCE(LAG(v.total_vendas) OVER (ORDER BY v.datas), v.total_vendas)) 
        / NULLIF(COALESCE(LAG(v.total_vendas) OVER (ORDER BY v.datas), 0), 0) * 100, 
        2
    ) AS variacao_percentual
FROM vendas_mensais v
JOIN ultimos_12_meses u 
    ON v.datas = u.datas              -- Garante que só os últimos 12 meses sejam exibidos
ORDER BY v.datas;                     -- Ordena os resultados em ordem cronológica
