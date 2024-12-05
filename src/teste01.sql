-- PARA FAZER: COLOCAR NOT NULL E AFINS

-- Tabela PRODUTO
CREATE TABLE PRODUTO ( 
	cp_id_produto SERIAL PRIMARY KEY, 
    nm_prod VARCHAR(60),
    cd_ean_prod VARCHAR(12),
    ce_rfid INT, -- CHAVE ESTRANGEIRA
    ce_categoria_principal INT, -- CHAVE ESTRANGEIRA
    ce_categoria_secundaria INT -- CHAVE ESTRANGEIRA   
); 

-- Tabela RFID
CREATE TABLE RFID ( 
    cp_id_dispositivo SERIAL PRIMARY KEY,  
    ind_venda_dispositivo BOOLEAN 
); 

-- Tabela CATEGORIA
CREATE TABLE CATEGORIA ( 
    cp_cod_categoria SERIAL PRIMARY KEY, 
    nm_categoria VARCHAR(20)
); 

-- Tabela ESTABELECIMENTO
CREATE TABLE ESTABELECIMENTO ( 
    cp_cod_estab SERIAL PRIMARY KEY, 
    nm_estab VARCHAR(60), 
    cnpj_estab  VARCHAR(60),
    localizacao_estab VARCHAR(120), 
    endereco_estab VARCHAR(5), -- DUVIDA, diz para fazer um VECTOR
    UF_estab VARCHAR(2),
    cidade_estab VARCHAR(5)
); 

-- Tabela FUNCIONARIOS
CREATE TABLE FUNCIONARIOS ( 
    cp_cod_func SERIAL PRIMARY KEY, 
    nm_func VARCHAR(200),  
    cpf_func VARCHAR(11),  
    funcao_func VARCHAR(40) 
); 

-- Tabela FORNECEDOR
CREATE TABLE FORNECEDOR ( 
    cp_cod_forn SERIAL PRIMARY KEY, 
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

-- Tabela VENDER
CREATE TABLE VENDER ( 
    ce_cod_estab INT, -- CHAVE ESTRANGEIRA 
    ce_id_produto INT -- CHAVE ESTRANGEIRA
); 

-- Adicionando CONSTRAINT para tabela PRODUTO
ALTER TABLE PRODUTO
ADD FOREIGN KEY(ce_rfid) 
REFERENCES RFID(cp_id_dispositivo);

ALTER TABLE PRODUTO
ADD FOREIGN KEY(ce_categoria_principal) 
REFERENCES CATEGORIA(cp_cod_categoria);

ALTER TABLE PRODUTO
ADD FOREIGN KEY(ce_categoria_secundaria) 
REFERENCES CATEGORIA(cp_cod_categoria);    

-- Adicionando CONSTRAINT para tabela FORNECER
ALTER TABLE FORNECER
ADD FOREIGN KEY(ce_id_produto) 
REFERENCES PRODUTO(cp_id_produto);

ALTER TABLE FORNECER
ADD FOREIGN KEY(ce_cod_forn) 
REFERENCES FORNECEDOR(cp_cod_forn);

-- Adicionando CONSTRAINT para tabela VENDER
ALTER TABLE VENDER
ADD FOREIGN KEY(ce_id_produto) 
REFERENCES PRODUTO(cp_id_produto);

ALTER TABLE VENDER
ADD FOREIGN KEY(ce_cod_estab) 
REFERENCES ESTABELECIMENTO(cp_cod_estab);