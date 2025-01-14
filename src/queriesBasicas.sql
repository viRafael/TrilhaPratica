-- 1 Listar todos os produtos com preço acima de 50
SELECT nm_prod 
FROM PRODUTO 
WHERE preco_venda > 50;

-- 2 Encontrar produtos com um determinado código de barras
SELECT * 
FROM PRODUTO 
WHERE cd_ean_prod = '000000000025';

-- 3 Listar os 10 primeiros produtos por nome
SELECT * 
FROM PRODUTO 
ORDER BY nm_prod 
LIMIT 10;

-- 4 Listar todos os estabelecimentos na cidade de São Paulo
SELECT * 
FROM ESTABELECIMENTO 
WHERE cidade_estab = 'Cid19';

-- 5 Encontrar estabelecimentos do tipo depósito
SELECT * 
FROM ESTABELECIMENTO
WHERE tipo = 'Deposito';

-- 6 Listar os funcionários com a função de gerente
SELECT * 
FROM FUNCIONARIOS 
WHERE funcao_func = 'Func5';

-- 7 Encontrar funcionários com CPF começando com '123'
SELECT * 
FROM FUNCIONARIOS 
WHERE cpf_func LIKE '123%';

-- 8 Listar todas as categorias com estoque mínimo maior que 100
SELECT * 
FROM CATEGORIA 
WHERE estq_min > 100;

-- 9 Listar todos os fornecedores da cidade de Belo Horizonte
SELECT * 
FROM FORNECEDOR 
WHERE cidade_forn = 'Belo Horizonte';

-- 10 Listar todos os dispositivos com venda indicada
SELECT * 
FROM RFID 
WHERE ind_venda_dispositivo = TRUE;

-- 11 Listar todos os produtos comprados de um determinado fornecedor (por exemplo, com código 10)
SELECT * 
FROM Fornecedor_Produto 
WHERE ce_cod_forn = 10;

-- 12 Listar todos os produtos com preço superior a 100 e categoria principal 5
SELECT * 
FROM PRODUTO 
WHERE preco_venda > 100 AND ce_categoria_principal = 5;

-- 13 Listar todos os estabelecimentos localizados no estado de São Paulo e que são depósitos
SELECT * 
FROM ESTABELECIMENTO 
WHERE cidade_estab = 'São Paulo' AND tipo = 'Deposito';

-- 14 Listar todos os funcionários contratados após uma determinada data
SELECT cpf_func 
FROM FUNCIONARIOS 
WHERE data_contratacao > '2023-01-01';

-- 15 Listar todos os produtos com a categoria principal 10 e categoria secundária 15
SELECT * 
FROM PRODUTO 
WHERE ce_categoria_principal = 10 AND ce_categoria_secundaria = 15;

-- 16 Listar todos os estabelecimentos que não estão localizados em São Paulo
SELECT * 
FROM ESTABELECIMENTO 
WHERE cidade_estab != 'São Paulo';

-- 16 Listar todos os funcionarios que não são "Func1" 
SELECT * 
FROM FUNCIONARIOS 
WHERE funcao_func != 'Func1';

-- 17 Encontrar os nomes dos 10 primeiros estabelecimentos em ordem alfabética
SELECT nm_estab 
FROM ESTABELECIMENTO 
ORDER BY nm_estab LIMIT 10;

-- 18 Listar todos os produtos com data de vencimento para 2023
SELECT * 
FROM Fornecedor_Produto 
WHERE dt_vencimento = '%2023';

-- 19 Listar todas as categorias com estoque mínimo maior que o estoque máximo
SELECT * 
FROM CATEGORIA 
WHERE estq_min > estq_max;

-- 20 Listar todas as categorias com estoque mínimo menor que o estoque máximo
SELECT * 
FROM CATEGORIA 
WHERE estq_min < estq_max;