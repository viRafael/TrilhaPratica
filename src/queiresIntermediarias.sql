-- 1 Encontrar os 5 produtos mais caros
SELECT * 
FROM PRODUTO ORDER BY preco_venda DESC 
LIMIT 5;

-- 2 Listar todos os produtos que possuem um dispositivo associado com venda indicada
SELECT p.* 
FROM PRODUTO p
WHERE 
    EXISTS (SELECT 1 
            FROM RFID r 
            WHERE r.cp_id_dispositivo = p.ce_id_dispositivo AND r.ind_venda_dispositivo = TRUE);

-- 3Encontrar todos os funcionários com a função de gerente e que trabalham em um determinado estabelecimento
SELECT * 
FROM FUNCIONARIOS 
WHERE funcao_func = 'Gerente' AND cp_cod_func IN 
    (SELECT ce_cod_func 
    FROM PRODUTO 
    WHERE ce_cod_estab = 5);