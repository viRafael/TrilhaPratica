-- 1 Quais são os 10 produtos mais vendidos em um determinado período?
CREATE VIEW vw_produtos_mais_vendidos AS
SELECT 
    p.nm_prod, 
    COUNT(*) AS quantidade_vendida
FROM 
    PRODUTO p
INNER JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto
WHERE
    fp.dt_venda BETWEEN '2023-01-01' AND '2023-12-31'  -- Ajustar o período conforme necessário
GROUP BY 
    p.nm_prod
ORDER BY 
    quantidade_vendida DESC
LIMIT 10;

-- 2 Quais categorias estão com estoque abaixo do mínimo?
CREATE VIEW vw_estoque_baixo_por_categoria AS
SELECT 
    c.nm_categoria, 
    c.estq_min,
    SUM(CASE WHEN p.ce_categoria_principal = c.cp_cod_categoria THEN 1 ELSE 0 END) AS quantidade_em_estoque
FROM 
    CATEGORIA c
LEFT JOIN PRODUTO p ON c.cp_cod_categoria = p.ce_categoria_principal
GROUP BY 
    c.nm_categoria, c.estq_min
HAVING 
    SUM(CASE WHEN p.ce_categoria_principal = c.cp_cod_categoria THEN 1 ELSE 0 END) < c.estq_min;