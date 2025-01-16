-- Populando a tabela FORNECEDOR
INSERT INTO FORNECEDOR (cnpj_forn, cidade_forn, endereco_forn, UF_forn, localizacao_forn)
SELECT
    to_char(random() * 10000000000000, 'FM00000000000000'), -- CNPJ com 14 dígitos
    'Cidade ' || (random() * 20)::int,
    'Rua ' || (random() * 100)::int || ', Número ' || (random() * 1000)::int,
    'SP', -- Substitua por um array de estados se quiser mais variedade
    ARRAY[(random() * -90)::float, (random() * 180)::float] -- Coordenadas aleatórias (latitude, longitude)
FROM generate_series(1, 100)
LIMIT 100;

-- Populando a tabela ESTABELECIMENTO
INSERT INTO ESTABELECIMENTO (nm_estab, cnpj_estab, cidade_estab, endereco_estab, UF_estab, localizacao_estab, tipo)
SELECT
    'Estabelecimento ' || generate_series(1, 100),
    to_char(random() * 10000000000000, 'FM00000000000000'), -- CNPJ com 14 dígitos
    'Cid' || (random() * 20)::int,
    'Rua dos Numeros, ' || (random() * 1000)::int,
    'SP', -- Substitua por um array de estados se quiser mais variedade
    ARRAY[(random() * -90)::float, (random() * 180)::float], -- Coordenadas aleatórias (latitude, longitude)
    CASE WHEN random() > 0.5 THEN 'Deposito' ELSE 'Loja' END
FROM generate_series(1, 100)
LIMIT 200;

-- Populando a tabela FUNCIONARIO
INSERT INTO FUNCIONARIOS (nm_func, cpf_func, funcao_func)
SELECT
    'Funcionário ' || generate_series(1, 100),
    to_char(random() * 10000000000, 'FM00000000000'), -- CPF com 11 dígitos
    'Função ' || (random() * 5)::int
FROM generate_series(1, 100)
LIMIT 100;

-- Populando a tabela CATEGORIA
INSERT INTO CATEGORIA (nm_categoria, conteiner_max, conteiner_min, estq_min, estq_max)
SELECT
    'Categoria ' || generate_series(1, 100),
    (random() * 100)::int + 1,
    (random() * 50)::int + 1,
    (random() * 20)::int + 1,
    (random() * 100)::int + 20
FROM generate_series(1, 100)
LIMIT 100;

-- Inserindo 200 registros em RFID
INSERT INTO RFID (ind_venda_dispositivo)
SELECT random() > 0.5 -- 50% de chance de ser TRUE, 50% de ser FALSE
FROM generate_series(1, 200);

INSERT INTO PRODUTO (nm_prod, cd_ean_prod, ce_cod_estab, ce_cod_func, ce_id_dispositivo, ce_categoria_principal, ce_categoria_secundaria) VALUES
('Produto 1', 000000000001, 89, 39, 1, 14, 15),
('Produto 2', 000000000002, 60, 10, 2, 89, 10),
('Produto 3', 000000000003, 14, 30, 3, 14, 75),
('Produto 4', 000000000004, 168, 94, 4, 17, 01),
('Produto 5', 000000000005, 139, 45, 5, 33, 67),
('Produto 6', 000000000006, 45, 78, 6, 14, 49),
('Produto 7', 000000000007, 199, 12, 7, 56, 83),
('Produto 8', 000000000008, 32, 65, 8, 28, 61),
('Produto 9', 000000000009, 150, 23, 9, 77, 34),
('Produto 10', 000000000010, 128, 56, 10, 65, 25),
('Produto 11', 000000000011, 88, 94, 11, 47, 53),
('Produto 12', 000000000012, 13, 41, 12, 89, 72),
('Produto 13', 000000000013, 74, 15, 13, 33, 40),
('Produto 14', 000000000014, 56, 59, 14, 92, 19),
('Produto 15', 000000000015, 120, 36, 15, 14, 59),
('Produto 16', 000000000016, 85, 13, 16, 50, 71),
('Produto 17', 000000000017, 163, 50, 17, 65, 18),
('Produto 18', 000000000018, 91, 38, 18, 60, 49),
('Produto 19', 000000000019, 37, 27, 19, 11, 77),
('Produto 20', 000000000020, 102, 11, 20, 30, 87),
('Produto 21', 000000000021, 69, 97, 21, 25, 10),
('Produto 22', 000000000022, 154, 21, 22, 53, 42),
('Produto 23', 000000000023, 181, 68, 23, 92, 57),
('Produto 24', 000000000024, 128, 44, 24, 74, 29),
('Produto 25', 000000000025, 18, 77, 25, 85, 8),
('Produto 26', 000000000026, 119, 33, 26, 22, 66),
('Produto 27', 000000000027, 67, 9, 27, 99, 54),
('Produto 28', 000000000028, 33, 62, 28, 91, 17),
('Produto 29', 000000000029, 102, 60, 29, 57, 90),
('Produto 30', 000000000030, 41, 22, 30, 39, 76),
('Produto 31', 000000000031, 64, 70, 31, 46, 72),
('Produto 32', 000000000032, 92, 54, 32, 73, 50),
('Produto 33', 000000000033, 123, 20, 33, 63, 92),
('Produto 34', 000000000034, 29, 75, 34, 89, 18),
('Produto 35', 000000000035, 15, 63, 35, 82, 56),
('Produto 36', 000000000036, 139, 81, 36, 75, 80),
('Produto 37', 000000000037, 161, 47, 37, 28, 31),
('Produto 38', 000000000038, 43, 19, 38, 33, 95),
('Produto 39', 000000000039, 178, 1, 39, 23, 58),
('Produto 40', 000000000040, 153, 62, 40, 5, 78),
('Produto 41', 000000000041, 93, 42, 41, 91, 16),
('Produto 42', 000000000042, 70, 60, 42, 40, 72),
('Produto 43', 000000000043, 121, 48, 43, 64, 39),
('Produto 44', 000000000044, 187, 64, 44, 37, 8),
('Produto 45', 000000000045, 25, 29, 45, 48, 52),
('Produto 46', 000000000046, 34, 91, 46, 50, 41),
('Produto 47', 000000000047, 109, 3, 47, 76, 44),
('Produto 48', 000000000048, 58, 58, 48, 83, 47),
('Produto 49', 000000000049, 159, 79, 49, 52, 17),
('Produto 50', 000000000050, 113, 40, 50, 60, 99),
('Produto 51', 000000000051, 84, 18, 51, 31, 41),
('Produto 52', 000000000052, 48, 14, 52, 26, 71),
('Produto 53', 000000000053, 177, 26, 53, 60, 55),
('Produto 54', 000000000054, 35, 2, 54, 16, 50),
('Produto 55', 000000000055, 62, 67, 55, 41, 22),
('Produto 56', 000000000056, 66, 57, 56, 58, 53),
('Produto 57', 000000000057, 146, 30, 57, 10, 73),
('Produto 58', 000000000058, 101, 80, 58, 59, 98),
('Produto 59', 000000000059, 161, 55, 59, 15, 60),
('Produto 60', 000000000060, 23, 84, 60, 11, 94),
('Produto 61', 000000000061, 42, 51, 61, 44, 11),
('Produto 62', 000000000062, 75, 66, 62, 18, 47),
('Produto 63', 000000000063, 82, 45, 63, 92, 83),
('Produto 64', 000000000064, 119, 67, 64, 14, 28),
('Produto 65', 000000000065, 179, 35, 65, 80, 55),
('Produto 66', 000000000066, 37, 82, 66, 72, 79),
('Produto 67', 000000000067, 57, 73, 67, 61, 6),
('Produto 68', 000000000068, 145, 64, 68, 94, 46),
('Produto 69', 000000000069, 28, 31, 69, 48, 56),
('Produto 70', 000000000070, 99, 25, 70, 82, 95),
('Produto 71', 000000000071, 127, 69, 71, 19, 32),
('Produto 72', 000000000072, 87, 74, 72, 71, 64),
('Produto 73', 000000000073, 163, 11, 73, 8, 80),
('Produto 74', 000000000074, 100, 83, 74, 40, 17),
('Produto 75', 000000000075, 149, 10, 75, 73, 53),
('Produto 76', 000000000076, 154, 65, 76, 21, 47),
('Produto 77', 000000000077, 178, 2, 77, 22, 92),
('Produto 78', 000000000078, 54, 78, 78, 94, 5),
('Produto 79', 000000000079, 60, 90, 79, 56, 30),
('Produto 80', 000000000080, 16, 36, 80, 61, 11),
('Produto 81', 000000000081, 72, 39, 81, 79, 27),
('Produto 82', 000000000082, 124, 18, 82, 38, 16),
('Produto 83', 000000000083, 12, 53, 83, 99, 70),
('Produto 84', 000000000084, 51, 27, 84, 24, 3),
('Produto 85', 000000000085, 64, 59, 85, 81, 45),
('Produto 86', 000000000086, 97, 74, 86, 61, 2),
('Produto 87', 000000000087, 147, 50, 87, 17, 77),
('Produto 88', 000000000088, 180, 61, 88, 50, 83),
('Produto 89', 000000000089, 142, 79, 89, 65, 28),
('Produto 90', 000000000090, 118, 29, 90, 62, 35),
('Produto 91', 000000000091, 123, 22, 91, 78, 55),
('Produto 92', 000000000092, 106, 44, 92, 43, 20),
('Produto 93', 000000000093, 163, 41, 93, 72, 15),
('Produto 94', 000000000094, 27, 95, 94, 56, 92),
('Produto 95', 000000000095, 78, 9, 95, 82, 9),
('Produto 96', 000000000096, 88, 20, 96, 68, 50),
('Produto 97', 000000000097, 108, 83, 97, 49, 65),
('Produto 98', 000000000098, 32, 14, 98, 37, 81),
('Produto 99', 000000000099, 126, 50, 99, 16, 60),
('Produto 100', 000000000100, 55, 68, 100, 45, 74);

-- Populando tabela fornecedor_produto
DO $$
DECLARE
    v_produto_id PRODUTO.cp_id_produto%TYPE;
    v_fornecedor_id FORNECEDOR.cp_cod_forn%TYPE;
    v_data_compra VARCHAR(10);
    v_data_venda VARCHAR(10);
    v_data_vencimento VARCHAR(10);
    v_preco_compra FLOAT;
    v_preco_venda FLOAT;
BEGIN
    FOR i IN 1..200 LOOP -- Loop para inserir 200 instâncias
        -- Seleciona um produto e um fornecedor aleatórios, evitando combinações duplicadas
        SELECT p.cp_id_produto, f.cp_cod_forn INTO v_produto_id, v_fornecedor_id
        FROM PRODUTO p, FORNECEDOR f
        WHERE NOT EXISTS (
            SELECT 1
            FROM Fornecedor_Produto fp
            WHERE fp.ce_id_produto = p.cp_id_produto AND fp.ce_cod_forn = f.cp_cod_forn
        )
        ORDER BY random()
        LIMIT 1;

        -- Verifica se um produto e fornecedor foram encontrados (importante para evitar erros)
        IF v_produto_id IS NOT NULL AND v_fornecedor_id IS NOT NULL THEN
            -- Gera datas aleatórias nos últimos 2 anos
            v_data_compra := (CURRENT_DATE - (random() * 730)::INTEGER)::TEXT; -- Aproximadamente 2 anos em dias
            v_data_vencimento := (CURRENT_DATE + (random() * 365)::INTEGER)::TEXT; -- Aproximadamente 1 ano a frente
            v_data_venda := (CURRENT_DATE + (random() * 180)::INTEGER)::TEXT;-- Aproximadamente 6 meses a frente

            -- Gera preços aleatórios, garantindo que o preço de venda seja maior que o de compra
            v_preco_compra := (random() * 100) + 10; -- Preço de compra entre 10 e 110
            v_preco_venda := v_preco_compra * (1 + random() * 0.5); -- Preço de venda entre 100% e 150% do preço de compra

            -- Insere o registro na tabela Fornecedor_Produto
            INSERT INTO Fornecedor_Produto (dt_compra, preco_compra, dt_venda, preco_venda, dt_vencimento, ce_id_produto, ce_cod_forn)
            VALUES (v_data_compra, v_preco_compra, v_data_venda, v_preco_venda, v_data_vencimento, v_produto_id, v_fornecedor_id);
        END IF;

    END LOOP;
END $$;