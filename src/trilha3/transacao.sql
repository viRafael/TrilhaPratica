-- 1 Registrar a compra de um novo produto
    BEGIN TRANSACTION;

    -- Insere um novo fornecedor (se necessário, ajuste os valores)
    INSERT INTO FORNECEDOR (cnpj_forn, cidade_forn, endereco_forn, UF_forn, localizacao_forn)
    VALUES ('12345678901234', 'São Paulo', 'Rua ABC, 123', 'SP', '{123.456, -78.901}');

    -- Insere um novo produto (se necessário, ajuste os valores)
    INSERT INTO PRODUTO (nm_prod, cd_ean_prod, ce_cod_estab, ce_cod_func, ce_id_dispositivo, ce_categoria_principal, ce_categoria_secundaria)
    VALUES ('Smartphone XI', '123456789000', 1, 1, 1, 1, 2);

    -- Insere um registro na tabela Fornecedor_Produto
    INSERT INTO Fornecedor_Produto (dt_compra, preco_compra, dt_venda, preco_venda, dt_vencimento, ce_id_produto, ce_cod_forn)
    VALUES ('2023-11-20', 1500.00, NULL, NULL, '2024-11-20', 
            (SELECT cp_id_produto FROM PRODUTO WHERE nm_prod = 'Smartphone XI'),
            (SELECT cp_cod_forn FROM FORNECEDOR WHERE cnpj_forn = '123456789000'));

    COMMIT;

-- 2 Registrar a entrada de um novo produto no estoque
    BEGIN TRANSACTION;

    -- Insere um novo registro na tabela PRODUTO
    INSERT INTO PRODUTO (nm_prod, cd_ean_prod, ce_cod_estab, ce_cod_func, ce_id_dispositivo, ce_categoria_principal, ce_categoria_secundaria)
    VALUES ('Tablet Y', '987654321098', 1, 1, 2, 3, 4);

    -- Insere um novo registro na tabela Fornecedor_Produto
    INSERT INTO Fornecedor_Produto (dt_compra, preco_compra, dt_venda, preco_venda, dt_vencimento, ce_id_produto, ce_cod_forn)
    VALUES ('2023-11-22', 800.00, NULL, NULL, '2024-11-22', 
            (SELECT cp_id_produto FROM PRODUTO WHERE nm_prod = 'Tablet Y'),
            (SELECT cp_cod_forn FROM FORNECEDOR WHERE cnpj_forn = '12345678901234'));

    COMMIT;