SELECT 
    -- Extrai o ano e mês (YYYY-MM) para uma análise mais granular
    DATE_FORMAT(STR_TO_DATE(order_purchase_timestamp, '%Y-%m-%d'), '%Y-%m') AS ano_mes,

    -- Calcula a taxa de cancelamento no período
    ROUND(AVG(CASE 
                WHEN ood.order_status = "canceled" THEN 1  
                ELSE 0  
            END) * 100, 2) AS percentual_cancelado,

    -- Conta o total de pedidos no período
    COUNT(*) AS total_pedidos

FROM olist_orders_dataset AS ood

-- Agrupa por ano e mês para um histórico detalhado
GROUP BY ano_mes

-- Ordena cronologicamente para analisar a tendência histórica
ORDER BY percentual_cancelado ASC;
