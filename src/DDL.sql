-- DUVIDAS:
-- 1, eu crio um atributo que depois eu informo que ela é chave estrangeira, nesse sentido, 
-- que tipo de dado tem que ser a chave, do mesmo que é a chave ou tanto faz?

-- Tabela PRODUTO
CREATE TABLE PRODUTO ( 
    cp_id_produto SERIAL PRIMARY KEY,
    nm_prod VARCHAR(60) NOT NULL,        
    cd_ean_prod VARCHAR(12) NOT NULL,   
    ce_id_dispositivo INT, -- CHAVE ESTRANGEIRA
    ce_categoria_principal INT, -- CHAVE ESTRANGEIRA
    ce_categoria_secundaria INT, -- CHAVE ESTRANGEIRA 
    ce_cod_estab INT -- CHAVE ESTRANGEIRA 
); 

-- Tabela RFID
CREATE TABLE RFID ( 
    cp_id_dispositivo SERIAL PRIMARY KEY, 
    ind_venda_dispositivo BOOLEAN NOT NULL 
); 

-- Tabela CATEGORIA
CREATE TABLE CATEGORIA ( 
    cp_cod_categoria SERIAL PRIMARY KEY,  
    nm_categoria VARCHAR(20) NOT NULL,  
    conteiner_min INT NOT NULL, 
    conteiner_max INT NOT NULL, 
    estq_min INT NOT NULL,    
    estq_max INT NOT NULL
); 

-- Tabela ESTABELECIMENTO
CREATE TABLE ESTABELECIMENTO ( 
    cp_cod_estab SERIAL PRIMARY KEY, 
    nm_estab VARCHAR(60) NOT NULL, 
    cnpj_estab VARCHAR(60) NOT NULL,  
    UF_estab VARCHAR(2) NOT NULL, 
    cidade_estab VARCHAR(5) NOT NULL, 
    endereco_estab VARCHAR(200) NOT NULL,     
    localizacao_estab INT, -- DUVIDA, AQ É UM FLOAT VECTOR  
    tipo BOOLEAN -- tipo, 0 se for conteiner e 1 se for fornecedor  
); 

-- Tabela FUNCIONARIOS
CREATE TABLE FUNCIONARIOS ( 
    cp_cod_func SERIAL PRIMARY KEY,  
    nm_func VARCHAR(200) NOT NULL,  
    cpf_func VARCHAR(11) NOT NULL UNIQUE,  
    funcao_func VARCHAR(40) NOT NULL    
); 

-- Tabela FORNECEDOR
CREATE TABLE FORNECEDOR (
    cp_cod_forn SERIAL PRIMARY KEY, 
    cnpj_forn VARCHAR(14),   
    UF_forn VARCHAR(2),  
    cidade_forn VARCHAR(5),
    endereco_forn VARCHAR(200),   
    localizacao_forn INT, -- DUVIDA, AQ É UM FLOAT VECTOR       
    dt_ultima_compra INT  -- PENSEI Q PODERIA TER UM VALOR QUE INCREMENTA POR DIA, AUTOMATICO
); 

-- Tabela FORNECER
CREATE TABLE Fornecer ( 
    ce_id_produto INT, -- CHAVE ESTRANGEIRA 
    ce_cod_forn INT   -- CHAVE ESTRANGEIRA
); 

-- Adicionando CONSTRAINS para PRODUTO
ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_id_dispositivo) 
REFERENCES RFID(cp_id_dispositivo);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_categoria_principal) 
REFERENCES CATEGORIA(cp_cod_categoria);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_categoria_secundaria) 
REFERENCES CATEGORIA(cp_cod_categoria);

ALTER TABLE PRODUTO 
ADD FOREIGN KEY(ce_cod_estab) 
REFERENCES ESTABELECIMENTO(cp_cod_estab);

-- Adicionando CONSTRAINS para FORNECER
ALTER TABLE FORNECER
ADD FOREIGN KEY(ce_id_produto) 
REFERENCES PRODUTO(cp_id_produto);

ALTER TABLE FORNECER
ADD FOREIGN KEY(ce_cod_forn) 
REFERENCES FORNECEDOR(cp_cod_forn);