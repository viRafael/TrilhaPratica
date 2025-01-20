-- Criação de tabela temporária para armazenar os resultados
CREATE TEMP TABLE ConsultaTempos (
    QueryNumero INT,
    ExecucaoNumero INT,
    TempoExecucao DECIMAL(18, 6)
);

-- Definir as queries a serem executadas
-- Insira suas 45 queries aqui na tabela
CREATE TEMP TABLE Queries (
    QueryNumero INT,
    QueryTexto TEXT
);

INSERT INTO Queries (QueryNumero, QueryTexto) VALUES
    (1, 'SELECT ce_id_produto FROM fornecedor_produto WHERE preco_venda > 50;'),
    (2, 'SELECT * FROM PRODUTO WHERE cd_ean_prod = ''25'';'),
    (3, 'SELECT * FROM PRODUTO ORDER BY nm_prod LIMIT 10;'),
    (4, 'SELECT * FROM ESTABELECIMENTO WHERE cidade_estab = ''Cid19'';'),
    (5, 'SELECT * FROM ESTABELECIMENTO WHERE tipo = ''Deposito'';'),
    (6, 'SELECT * FROM FUNCIONARIOS WHERE funcao_func = ''Func5'';'),
    (7, 'SELECT * FROM FUNCIONARIOS WHERE cpf_func LIKE ''1%'';'),
    (8, 'SELECT * FROM CATEGORIA WHERE estq_min > 100;'),
    (9, 'SELECT * FROM FORNECEDOR WHERE cidade_forn = ''Belo Horizonte'';'),
    (10, 'SELECT * FROM RFID WHERE ind_venda_dispositivo = TRUE;'),
    (11, 'SELECT * FROM Fornecedor_Produto WHERE ce_cod_forn = 10;'),
    (12, 'SELECT * FROM PRODUTO WHERE preco_venda > 100 AND ce_categoria_principal = 5;'),
    (13, 'SELECT * FROM ESTABELECIMENTO WHERE cidade_estab = ''São Paulo'' AND tipo = ''Deposito'';'),
    (14, 'SELECT cpf_func FROM FUNCIONARIOS WHERE data_contratacao > ''2023-01-01'';'),
    (15, 'SELECT * FROM PRODUTO WHERE ce_categoria_principal = 10 AND ce_categoria_secundaria = 15;'),
    (16, 'SELECT * FROM ESTABELECIMENTO WHERE cidade_estab != ''São Paulo'';'),
    (17, 'SELECT * FROM FUNCIONARIOS WHERE funcao_func != ''Func1'';'),
    (18, 'SELECT nm_estab FROM ESTABELECIMENTO ORDER BY nm_estab LIMIT 10;'),
    (19, 'SELECT * FROM Fornecedor_Produto WHERE dt_vencimento = ''%2023'';'),
    (20, 'SELECT * FROM CATEGORIA WHERE estq_min > estq_max;'),
    (21, 'SELECT * FROM CATEGORIA WHERE estq_min < estq_max;'),
    (22, 'SELECT p.nm_prod, c.nm_categoria FROM PRODUTO p JOIN CATEGORIA c ON p.ce_categoria_principal = c.cp_cod_categoria ORDER BY p.nm_prod;'),
    (23, 'SELECT p.* FROM PRODUTO p WHERE EXISTS (SELECT 1 FROM RFID r WHERE r.cp_id_dispositivo = p.ce_id_dispositivo AND r.ind_venda_dispositivo = TRUE);'),
    (24, 'SELECT * FROM FUNCIONARIOS WHERE funcao_func = ''Função 4'' AND cp_cod_func IN (SELECT ce_cod_func FROM PRODUTO WHERE ce_cod_estab = 15);'),
    (25, 'SELECT c.nm_categoria, COUNT(p.cp_id_produto) AS total_produtos FROM CATEGORIA c LEFT JOIN PRODUTO p ON c.cp_cod_categoria = p.ce_categoria_principal GROUP BY c.nm_categoria ORDER BY total_produtos DESC;'),
    (26, 'SELECT DISTINCT f.* FROM FORNECEDOR f JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto WHERE p.ce_cod_estab = 15;'),
    (27, 'SELECT f.cnpj_forn, COUNT(DISTINCT fp.ce_id_produto) AS total_produtos_fornecidos FROM FORNECEDOR f JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn GROUP BY f.cnpj_forn ORDER BY total_produtos_fornecidos DESC;'),
    (28, 'SELECT f.* FROM FUNCIONARIOS f JOIN PRODUTO p ON f.cp_cod_func = p.ce_cod_func JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab WHERE e.tipo = ''Loja'';'),
    (29, 'SELECT f.* FROM FORNECEDOR f JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn ORDER BY fp.preco_venda DESC LIMIT 1;'),
    (30, 'SELECT p.nm_prod, f.cnpj_forn, fp.preco_compra FROM PRODUTO p JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn WHERE fp.dt_compra = (SELECT MAX(dt_compra) FROM Fornecedor_Produto fp2 WHERE fp2.ce_id_produto = p.cp_id_produto) ORDER BY p.nm_prod;'),
    (31, 'SELECT f.cnpj_forn, COUNT(DISTINCT p.ce_cod_estab) AS total_estabelecimentos FROM FORNECEDOR f JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto GROUP BY f.cnpj_forn ORDER BY total_estabelecimentos DESC LIMIT 1;'),
    (32, 'SELECT p.nm_prod, CASE WHEN fp.preco_venda < 50 THEN ''Baixo'' WHEN fp.preco_venda BETWEEN 50 AND 100 THEN ''Médio'' ELSE ''Alto'' END AS faixa_de_preco FROM PRODUTO p LEFT JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto;'),
    (33, 'SELECT nm_estab AS nome, ''Estabelecimento'' AS tipo FROM ESTABELECIMENTO UNION ALL SELECT cnpj_forn AS nome, ''Fornecedor'' AS tipo FROM FORNECEDOR;'),
    (34, 'SELECT f.cnpj_forn, COUNT(DISTINCT p.ce_cod_estab) AS total_estabelecimentos FROM FORNECEDOR f JOIN Fornecedor_Produto fp ON f.cp_cod_forn = fp.ce_cod_forn JOIN PRODUTO p ON fp.ce_id_produto = p.cp_id_produto GROUP BY f.cnpj_forn ORDER BY total_estabelecimentos DESC LIMIT 1;'),
    (35, 'SELECT * FROM FUNCIONARIOS WHERE funcao_func = ''Função 5'' AND cp_cod_func IN (SELECT ce_cod_func FROM PRODUTO WHERE ce_cod_estab = 15);'),
    (36, 'SELECT f.* FROM FUNCIONARIOS f JOIN PRODUTO p ON f.cp_cod_func = p.ce_cod_func JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab WHERE e.tipo = ''Deposito'';'),
    (37, 'SELECT f.* FROM FORNECEDOR f WHERE NOT EXISTS (SELECT 1 FROM Fornecedor_Produto fp WHERE fp.ce_cod_forn = f.cp_cod_forn AND fp.dt_vencimento < CURRENT_DATE::TEXT);'),
    (38, 'SELECT e.* FROM ESTABELECIMENTO e WHERE EXISTS (SELECT 1 FROM PRODUTO p JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto WHERE p.ce_cod_estab = e.cp_cod_estab AND fp.preco_venda > 100);'),
    (39, 'SELECT p.* FROM PRODUTO p JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto WHERE fp.preco_venda > (SELECT AVG(fp2.preco_venda) FROM PRODUTO p2 JOIN Fornecedor_Produto fp2 ON p2.cp_id_produto = fp2.ce_id_produto WHERE p2.ce_categoria_principal = p.ce_categoria_principal);'),
    (40, 'SELECT p.* FROM PRODUTO p WHERE EXISTS (SELECT 1 FROM Fornecedor_Produto fp1 JOIN Fornecedor_Produto fp2 ON fp1.ce_id_produto = fp2.ce_id_produto AND fp1.ce_cod_forn = fp2.ce_cod_forn WHERE p.cp_id_produto = fp1.ce_id_produto AND fp1.dt_compra <> fp2.dt_compra);'),
    (41, 'SELECT c.* FROM CATEGORIA c WHERE NOT EXISTS (SELECT 1 FROM PRODUTO p JOIN Fornecedor_Produto fp ON p.cp_id_produto = fp.ce_id_produto JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn WHERE p.ce_categoria_principal = c.cp_cod_categoria AND f.cidade_forn = ''São Paulo'');'),
    (42, 'SELECT f.* FROM FUNCIONARIOS f WHERE EXISTS (SELECT 1 FROM PRODUTO p JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab WHERE p.ce_cod_func = f.cp_cod_func AND e.UF_estab = (SELECT forn.UF_forn FROM FORNECEDOR forn JOIN Fornecedor_Produto fp ON forn.cp_cod_forn = fp.ce_cod_forn ORDER BY fp.preco_venda DESC LIMIT 1));'),
    (43, 'SELECT f.* FROM FUNCIONARIOS f WHERE f.cp_cod_func IN (SELECT p.ce_cod_func FROM PRODUTO p WHERE p.ce_cod_estab = (SELECT e.cp_cod_estab FROM ESTABELECIMENTO e JOIN PRODUTO p2 ON e.cp_cod_estab = p2.ce_cod_estab GROUP BY e.cp_cod_estab ORDER BY COUNT(*) DESC LIMIT 1));'),
    (44, 'SELECT p.* FROM PRODUTO p WHERE EXISTS (SELECT 1 FROM CATEGORIA c WHERE p.ce_categoria_principal = c.cp_cod_categoria AND c.estq_min > (SELECT COUNT(DISTINCT fp.ce_cod_forn) FROM Fornecedor_Produto fp JOIN PRODUTO p2 ON fp.ce_id_produto = p2.cp_id_produto WHERE p2.ce_cod_estab = p.ce_cod_estab));'),
    (45, 'SELECT c.* FROM CATEGORIA c WHERE EXISTS (SELECT 1 FROM PRODUTO p JOIN ESTABELECIMENTO e ON p.ce_cod_estab = e.cp_cod_estab WHERE p.ce_categoria_principal = c.cp_cod_categoria AND EXISTS (SELECT 1 FROM Fornecedor_Produto fp JOIN FORNECEDOR f ON fp.ce_cod_forn = f.cp_cod_forn WHERE fp.ce_id_produto = p.cp_id_produto AND f.UF_forn = e.UF_estab));'),
    (46, 'SELECT p1.* FROM PRODUTO p1 WHERE NOT EXISTS (SELECT 1 FROM FORNECEDOR f WHERE EXISTS (SELECT 1 FROM Fornecedor_Produto fp_categoria JOIN PRODUTO p_categoria ON fp_categoria.ce_id_produto = p_categoria.cp_id_produto WHERE p_categoria.ce_categoria_principal = p1.ce_categoria_principal AND fp_categoria.ce_cod_forn = f.cp_cod_forn) AND NOT EXISTS (SELECT 1 FROM Fornecedor_Produto fp_produto WHERE fp_produto.ce_id_produto = p1.cp_id_produto AND fp_produto.ce_cod_forn = f.cp_cod_forn));');


-- Laço para rodar cada query 50 vezes
DO $$
DECLARE
    rec RECORD;
    tempo_inicio TIMESTAMP;
    tempo_fim TIMESTAMP;
    tempo_execucao INTERVAL;
    i INT;
BEGIN
    -- Loop para cada query
    FOR rec IN SELECT * FROM Queries ORDER BY QueryNumero
    LOOP
        -- Executar a query 50 vezes
        FOR i IN 1..50 LOOP
            -- Marca o tempo de início
            tempo_inicio := clock_timestamp();

            -- Executa a query usando EXECUTE dinâmico
            EXECUTE rec.QueryTexto;

            -- Marca o tempo de fim
            tempo_fim := clock_timestamp();

            -- Calcula o tempo de execução
            tempo_execucao := tempo_fim - tempo_inicio;

            -- Armazena o resultado na tabela de tempos
            INSERT INTO ConsultaTempos (QueryNumero, ExecucaoNumero, TempoExecucao)
            VALUES (rec.QueryNumero, i, EXTRACT(EPOCH FROM tempo_execucao));
        END LOOP;
    END LOOP;
END $$;

-- Exibe os resultados
SELECT * FROM ConsultaTempos ORDER BY QueryNumero, ExecucaoNumero;
