-- 1 Listar os fornecedores que não forneceram nenhum produto com data de vencimento anterior a hoje:
SELECT f.*
FROM FORNECEDOR f
WHERE NOT EXISTS (
    SELECT 1
    FROM Fornecedor_Produto fp
    WHERE fp.ce_cod_forn = f.cp_cod_forn AND fp.dt_vencimento < CURRENT_DATE::TEXT
);

-- 2 Listar os estabelecimentos que possuem pelo menos um produto com preço de venda acima de 100:
SELECT e.*
FROM ESTABELECIMENTO e
WHERE EXISTS (
    SELECT 1
    FROM PRODUTO p
    JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto -- Adicionando o JOIN com Fornecedor_Produto
    WHERE p.ce_cod_estab = e.cp_cod_estab AND fp.preco_venda > 100 -- Usando fp.preco_venda
);

-- 3 Listar os produtos cujo preço de venda é maior que a média de preço de venda de todos os produtos da sua categoria principal:
SELECT p.*
FROM PRODUTO p
JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto
WHERE fp.preco_venda > (
    SELECT AVG(fp2.preco_venda)
    FROM PRODUTO p2
    JOIN Fornecedor_Produto fp2 ON p2.cp_id_produto = fp2.ce_id_produto
    WHERE p2.ce_categoria_principal = p.ce_categoria_principal
);

-- 4 Listar os produtos que foram comprados do mesmo fornecedor mais de uma vez em datas diferentes:
SELECT p.*
FROM PRODUTO p
WHERE EXISTS (
    SELECT 1
    FROM Fornecedor_Produto fp1
    JOIN Fornecedor_Produto fp2 ON fp1.ce_id_produto = fp2.ce_id_produto AND fp1.ce_cod_forn = fp2.ce_cod_forn
    WHERE p.cp_id_produto = fp1.ce_id_produto AND fp1.dt_compra <> fp2.dt_compra
);

-- 5 Listar as categorias que não possuem produtos fornecidos por nenhum fornecedor da cidade 'São Paulo':
SELECT c.*
FROM CATEGORIA c
WHERE NOT EXISTS (
    SELECT 1
    FROM PRODUTO p
    JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto
    JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn
    WHERE p.ce_categoria_principal = c.cp_cod_categoria AND f.cidade_forn = 'São Paulo'
);

-- 6 Listar os funcionários que trabalham em estabelecimentos localizados na mesma UF que o fornecedor que fornece o produto mais caro:
SELECT f.*
FROM FUNCIONARIOS f
WHERE EXISTS (
    SELECT 1
    FROM PRODUTO p
    JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab
    WHERE p.ce_cod_func = f.cp_cod_func AND e.UF_estab = (
        SELECT forn.UF_forn
        FROM FORNECEDOR forn
        JOIN Fornecedor_Produto fp ON forn.cp_cod_forn = fp.ce_cod_forn
        ORDER BY fp.preco_venda DESC
        LIMIT 1
    )
);

-- 7 Listar os funcionários que trabalham no estabelecimento que tem o maior número de produtos cadastrados:
SELECT f.*
FROM FUNCIONARIOS f
WHERE f.cp_cod_func IN (
    SELECT p.ce_cod_func
    FROM PRODUTO p
    WHERE p.ce_cod_estab = (
        SELECT e.cp_cod_estab
        FROM ESTABELECIMENTO e
        JOIN PRODUTO p2 ON e.cp_cod_estab = p2.ce_cod_estab
        GROUP BY e.cp_cod_estab
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);

-- 8  Listar os produtos que pertencem a uma categoria cujo estoque mínimo é maior que a quantidade de 
-- fornecedores que fornecem produtos para o estabelecimento que vende esse produto:
SELECT p.*
FROM PRODUTO p
WHERE EXISTS (
    SELECT 1
    FROM CATEGORIA c
    WHERE p.ce_categoria_principal = c.cp_cod_categoria AND c.estq_min > (
        SELECT COUNT(DISTINCT fp.ce_cod_forn)
        FROM Fornecedor_Produto fp
        JOIN PRODUTO p2 ON fp.ce_id_produto = p2.cp_id_produto
        WHERE p2.ce_cod_estab = p.ce_cod_estab
    )
);

-- 9 Listar as categorias principais que possuem produtos fornecidos por fornecedores do mesmo estado (UF) do estabelecimento que vende o produto:
SELECT c.*
FROM CATEGORIA c
WHERE EXISTS (
    SELECT 1
    FROM PRODUTO p
    JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab
    WHERE p.ce_categoria_principal = c.cp_cod_categoria AND EXISTS (
        SELECT 1
        FROM Fornecedor_Produto fp
        JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn
        WHERE fp.ce_id_produto = p.cp_id_produto AND f.UF_forn = e.UF_estab
    )
);

-- 10 Listar os produtos que foram fornecidos por todos os fornecedores que fornecem produtos 
-- da mesma categoria principal.
SELECT p1.*
FROM PRODUTO p1
WHERE NOT EXISTS (
    SELECT 1
    FROM FORNECEDOR f
    WHERE EXISTS (
        SELECT 1
        FROM Fornecedor_Produto fp_categoria
        JOIN PRODUTO p_categoria ON fp_categoria.ce_id_produto = p_categoria.cp_id_produto
        WHERE p_categoria.ce_categoria_principal = p1.ce_categoria_principal AND fp_categoria.ce_cod_forn = f.cp_cod_forn
    )
    AND NOT EXISTS (
        SELECT 1
        FROM Fornecedor_Produto fp_produto
        WHERE fp_produto.ce_id_produto = p1.cp_id_produto AND fp_produto.ce_cod_forn = f.cp_cod_forn
    )
);