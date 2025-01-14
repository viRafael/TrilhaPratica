-- Índices para a tabela PRODUTO
CREATE INDEX idx_produto_cd_ean_prod ON PRODUTO (cd_ean_prod);
CREATE INDEX idx_produto_nm_prod ON PRODUTO (nm_prod);
CREATE INDEX idx_produto_ce_id_dispositivo ON PRODUTO (ce_id_dispositivo);
CREATE INDEX idx_produto_ce_categoria_principal ON PRODUTO (ce_categoria_principal);
CREATE INDEX idx_produto_ce_cod_estab ON PRODUTO (ce_cod_estab);
CREATE INDEX idx_produto_ce_cod_func ON PRODUTO (ce_cod_func);

-- Índice para a tabela RFID
CREATE INDEX idx_rfid_ind_venda_dispositivo ON RFID (ind_venda_dispositivo);

-- Índices para a tabela CATEGORIA
CREATE INDEX idx_categoria_cp_cod_categoria ON CATEGORIA (cp_cod_categoria);

-- Índices para a tabela ESTABELECIMENTO
CREATE INDEX idx_estabelecimento_cp_cod_estab ON ESTABELECIMENTO (cp_cod_estab);
CREATE INDEX idx_estabelecimento_tipo ON ESTABELECIMENTO (tipo);

-- Índices para a tabela FUNCIONARIOS
CREATE INDEX idx_funcionarios_cpf_func ON FUNCIONARIOS (cpf_func);

-- Índices para a tabela FORNECEDOR
CREATE INDEX idx_fornecedor_cnpj_forn ON FORNECEDOR (cnpj_forn);