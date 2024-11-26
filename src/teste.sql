-- Tabela PRODUTO
CREATE TABLE PRODUTO ( 
    cp_id_produto INT SERIAL PRIMARY KEY, 
    nm_prod VARCHAR(60),
    cd_ean_prod VARCHAR(12),
    ce_rfid INT, -- CHAVE ESTRANGEIRA
    ce_categoria_principal INT, -- CHAVE ESTRANGEIRA
    ce_categoria_secundaria INT, -- CHAVE ESTRANGEIRA
    ce_id_dispositivo INT -- CHAVE ESTRANGEIRA
); 

-- Tabela RFID
CREATE TABLE RFID ( 
    cp_id_dispositivo INT SERIAL PRIMARY KEY,  
    ind_venda_dispositivo BOOLEAN 
); 

-- Tabela CATEGORIA
CREATE TABLE CATEGORIA ( 
    cp_cod_categoria INT SERIAL PRIMARY KEY, 
    nm_categoria VARCHAR(20)
); 

-- Tabela ESTABELECIMENTO
CREATE TABLE ESTABELECIAMENTO ( 
    cp_cod_estab INT SERIAL PRIMARY KEY, 
    nm_estab VARCHAR(60), 
    cnpj_estab  VARCHAR(60),
    localizacao_estab VARCHAR(), 
    endereco_estab VARCHAR(5), -- DUVIDA, diz para fazer um VECTOR
    UF_estab VARCHAR(2),
    cidade_estab VARCHAR(5)
); 

-- Tabela FUNCIONARIOS
CREATE TABLE FUNCIONARIOS ( 
    cp_cod_func INT SERIAL PRIMARY KEY, 
    nm_func VARCHAR(200),  
    cpf_func VARCHAR(11),  
    funcao_func VARCHAR(40) ce_cod_e
); 

-- Tabela FORNECEDOR
CREATE TABLE FORNECEDOR ( 
    cp_cod_forn INT SERIAL PRIMARY KEY, 
    cnpj_forn VARCHAR(14),
    localizacao_forn INT,
    endereco_forn VARCHAR(200), -- DUVIDA, diz para fazer um VECTOR
    UF_forn VARCHAR(2),
    cidade_forn VARCHAR(5)
); 

-- Tabela FORNECER
CREATE TABLE FORNECER ( 
    ce_id_produto INT, -- CHAVE ESTRANGEIRA 
    ce_cod_forn INT -- CHAVE ESTRANGEIRA
); 

-- Tabela VENER
CREATE TABLE VENDER ( 
    ce_cod_estab INT PRIMARY KEY, -- CHAVE ESTRANGEIRA 
    ce_id_produto INT PRIMARY KEY -- CHAVE ESTRANGEIRA
); 

-- Adicionando CONSTRAINT para tabela PRODUTO
ALTER TABLE PRODUTO
FOREIGN KEY(ce_id_produtor) REFERENCES (cp_id_produtor)
FOREIGN KEY(ce_rfid) REFERENCES (cp_id_dispositivo)    
FOREIGN KEY(ce_categoria_principal) REFERENCES (cp_cod_categoria)
FOREIGN KEY(ce_categoria_secundaria) REFERENCES (cp_cod_categoria)    

-- Adicionando CONSTRAINT para tabela FORNECER
ALTER TABLE FORNECER
FOREIGN KEY(ce_id_produto) REFERENCES (cp_id_produto)
FOREIGN KEY(ce_cod_forn) REFERENCES (cp_cod_forn)

-- Adicionando CONSTRAINT para tabela VENDER
ALTER TABLE VENDER
FOREIGN KEY(ce_id_produto) REFERENCES (ccp_id_produto)
FOREIGN KEY(ce_cod_estab) REFERENCES (cp_cod_estab)
