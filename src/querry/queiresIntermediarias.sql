-- 1 Listar o nome do produto e o nome da categoria principal a que ele pertence, ordenado pelo nome do produto:
SELECT p.nm_prod, c.nm_categoria
FROM PRODUTO p
JOIN CATEGORIA c ON p.ce_categoria_principal = c.cp_cod_categoria
ORDER BY p.nm_prod;

-- 2 Listar todos os produtos que possuem um dispositivo associado com venda indicada
SELECT p.* 
FROM PRODUTO p
WHERE 
    EXISTS (SELECT 1 
            FROM RFID r 
            WHERE r.cp_id_dispositivo = p.ce_id_dispositivo AND r.ind_venda_dispositivo = TRUE);

-- 3 Encontrar todos os funcionários com a função de gerente e que trabalham em um determinado estabelecimento
SELECT * 
FROM FUNCIONARIOS 
WHERE funcao_func = 'Função 4' AND cp_cod_func IN 
    (SELECT ce_cod_func 
    FROM PRODUTO 
    WHERE ce_cod_estab = 15);

-- 4 Encontrar o número total de produtos cadastrados por categoria principal:
SELECT c.nm_categoria, COUNT(p.cp_id_produto) AS total_produtos
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.cp_cod_categoria = p.ce_categoria_principal
GROUP BY c.nm_categoria
ORDER BY total_produtos DESC;

-- 5 Listar os fornecedores que fornecem produtos para um determinado estabelecimento:
SELECT DISTINCT f.*
FROM FORNECEDOR f
JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn
JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto
WHERE p.ce_cod_estab = 15;

-- 6 Listar o nome do fornecedor e o número total de produtos diferentes que ele fornece:
SELECT f.cnpj_forn, COUNT(DISTINCT fp.ce_id_produto) AS total_produtos_fornecidos
FROM FORNECEDOR f
JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn
GROUP BY f.cnpj_forn
ORDER BY total_produtos_fornecidos DESC; 

-- 7 Listar os funcionários que trabalham em estabelecimentos de um determinado tipo (ex: 'Loja'):
SELECT f.*
FROM FUNCIONARIOS f
JOIN PRODUTO p ON f.cp_cod_func = p.ce_cod_func
JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab
WHERE e.tipo = 'Loja';

-- 8 Encontrar o fornecedor que forneceu o produto mais caro:
SELECT f.*
FROM FORNECEDOR f
JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn
ORDER BY fp.preco_venda DESC
LIMIT 1;

-- 9 Listar o nome do produto, o nome do fornecedor e o preço de compra mais recente desse produto:
SELECT p.nm_prod, f.cnpj_forn, fp.preco_compra
FROM PRODUTO p
JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto
JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn -- Adicionando o JOIN com FORNECEDOR
WHERE fp.dt_compra = (SELECT MAX(dt_compra) FROM Fornecedor_Produto fp2 WHERE fp2.ce_id_produto = p.cp_id_produto)
ORDER BY p.nm_prod;

-- 10 Encontrar o fornecedor que forneceu produtos para o maior número de estabelecimentos diferentes:
SELECT f.cnpj_forn, COUNT(DISTINCT p.ce_cod_estab) AS total_estabelecimentos
FROM FORNECEDOR f
JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn
JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto
GROUP BY f.cnpj_forn
ORDER BY total_estabelecimentos DESC
LIMIT 1;

-- 11 Classificar os produtos por faixa de preço:
SELECT p.nm_prod,
    CASE
        WHEN fp.preco_venda < 50 THEN 'Baixo'
        WHEN fp.preco_venda BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Alto'
    END AS faixa_de_preco
FROM PRODUTO p
LEFT JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto;

-- 12 Listar todos os estabelecimentos e fornecedores em uma única lista (com tipo):
SELECT nm_estab AS nome, 'Estabelecimento' AS tipo
FROM ESTABELECIMENTO
UNION ALL -- Use UNION para remover duplicatas, UNION ALL para manter todas as linhas
SELECT cnpj_forn AS nome, 'Fornecedor' AS tipo
FROM FORNECEDOR;

-- 13 Encontrar o fornecedor que forneceu produtos para o maior número de estabelecimentos diferentes:
SELECT f.cnpj_forn, COUNT(DISTINCT p.ce_cod_estab) AS total_estabelecimentos
FROM FORNECEDOR f
JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn
JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto
GROUP BY f.cnpj_forn
ORDER BY total_estabelecimentos DESC
LIMIT 1;

-- 14 Encontrar todos os funcionários com a função TAL e que trabalham em um determinado estabelecimento
SELECT * 
FROM FUNCIONARIOS 
WHERE funcao_func = 'Função 5' AND cp_cod_func IN 
    (SELECT ce_cod_func 
    FROM PRODUTO 
    WHERE ce_cod_estab = 15);

-- 15 Listar os funcionários que trabalham em estabelecimentos de um determinado tipo:
SELECT f.*
FROM FUNCIONARIOS f
JOIN PRODUTO p ON f.cp_cod_func = p.ce_cod_func
JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab
WHERE e.tipo = 'Deposito';