-- 1 Como atualizar o preço de venda de um produto específico?
CREATE OR REPLACE PROCEDURE atualizar_preco_venda(
    p_id_produto INT,
    p_novo_preco FLOAT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Fornecedor_Produto
    SET preco_venda = p_novo_preco
    WHERE ce_id_produto = p_id_produto;
END;
$$;

-- 2 Retorna os fornecedores mais frequentes
CREATE OR REPLACE PROCEDURE sp_fornecedores_mais_frequentes_menor_custo()
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT  
        f.cp_cod_forn AS codigo_fornecedor,
        f.cnpj_forn AS cnpj_fornecedor,
        p.ce_categoria_principal AS categoria_principal,
        COUNT(*) AS quantidade_compras,
        AVG(fp.preco_compra) AS custo_medio
    FROM Fornecedor_Produto fp
    INNER JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn
    INNER JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto
    GROUP BY f.cp_cod_forn, f.cnpj_forn, p.ce_categoria_principal
    ORDER BY p.ce_categoria_principal, quantidade_compras DESC, custo_medio ASC;
END;
$$;