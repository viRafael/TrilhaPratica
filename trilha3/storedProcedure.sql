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

-- 2 Como posso calcular o valor total de um pedido em um sistema de loja online?
CREATE OR REPLACE PROCEDURE calcular_valor_total_pedido(
    p_id_pedido INTEGER,
    OUT p_valor_total NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT SUM(item.quantidade * produto.preco)
    INTO p_valor_total
    FROM itens_pedido item
    INNER JOIN produtos produto ON item.id_produto = produto.id_produto
    WHERE item.id_pedido = p_id_pedido;
END;
$$;