CREATE TABLE PRODUTO ( 
    cp_id_produto SERIAL PRIMARY KEY,
    nm_prod varchar(60),  
    cd_ean_prod varchar(12) UNIQUE,    
    ce_cod_estab INT, -- CHAVE ESTRANGEIRA
    ce_cod_func INT, -- CHAVE ESTRANGEIRA
    ce_id_dispositivo INT, -- CHAVE ESTRANGEIRA
    ce_categoria_principal INT, -- CHAVE ESTRANGEIRA  
    ce_categoria_secundaria INT -- CHAVE ESTRANGEIRA 
); 

CREATE TABLE RFID ( 
    cp_id_dispositivo SERIAL PRIMARY KEY,  
    ind_venda_dispositivo BOOLEAN 
); 

CREATE TABLE CATEGORIA ( 
    cp_cod_categoria SERIAL PRIMARY KEY,  
    nm_categoria varchar(20), 
    conteiner_max INT,  
    conteiner_min INT,  
    estq_min INT,   
    estq_max INT 
); 

CREATE TABLE ESTABELECIMENTO ( 
    cp_cod_estab SERIAL PRIMARY KEY, 
    nm_estab varchar(60),  
    cnpj_estab varchar(60),             
    cidade_estab varchar(5), 
    endereco_estab varchar(200), 
    UF_estab varchar(2),
    localizacao_estab float[8],
    tipo varchar(20)    -- Deposito ou Loja
);                      

CREATE TABLE FUNCIONARIOS ( 
    cp_cod_func SERIAL PRIMARY KEY,
    nm_func varchar(200),  
    cpf_func varchar(11),  
    funcao_func varchar(40)  
); 

CREATE TABLE FORNECEDOR ( 
    cp_cod_forn SERIAL PRIMARY KEY, 
    cnpj_forn varchar(60), 
    cidade_forn varchar(60), 
    endereco_forn varchar(60), 
    UF_forn varchar(60),  
    localizacao_forn float[8] 
); 

CREATE TABLE Fornecedor_Produto ( 
    cp_cod_forn SERIAL PRIMARY KEY,  
    dt_compra varchar(10),
    preco_compra float, 
    dt_venda varchar(10),  
    preco_venda float,  
    dt_vencimento varchar(10),  
    ce_id_produto INT, -- CHAVE ESTRANGEIRA 
    ce_cod_forn INT -- CHAVE ESTRANGEIRA
);

-- Adicionando Constrains
-- ADD para PRODUTO
ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_cod_estab) 
REFERENCES ESTABELECIMENTO (cp_cod_estab);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_cod_func) 
REFERENCES FUNCIONARIOS (cp_cod_func);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_id_dispositivo) 
REFERENCES RFID (cp_id_dispositivo);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_categoria_principal) 
REFERENCES CATEGORIA (cp_cod_categoria);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_categoria_secundaria) 
REFERENCES CATEGORIA (cp_cod_categoria);

-- ADD para Fornecedor_Produto
ALTER TABLE Fornecedor_Produto 
ADD FOREIGN KEY(ce_id_produto) 
REFERENCES PRODUTO (cp_id_produto);

ALTER TABLE Fornecedor_Produto
ADD FOREIGN KEY(ce_cod_forn) 
REFERENCES FORNECEDOR (cp_cod_forn);