-- Tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    Primeiro_Nome VARCHAR(50) NOT NULL,
    Nome_meio VARCHAR(50),
    Ultimo_nome VARCHAR(50) NOT NULL,
    Cpf CHAR(11),
    Data_nascimento DATE,
    Endereco VARCHAR(100),
    Sexo CHAR(1),
    Salario DECIMAL(10, 2),
    Cpf_supervisor CHAR(11),
    Numero_departamento INT
);

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Nome_departamento VARCHAR(50) NOT NULL,
    Numero_departamento INT,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE
);

-- Tabela LOCALIZACOES_DEPARTAMENTO
CREATE TABLE LOCALIZACOES_DEPARTAMENTO (
    Numero_departamento INT,
    Local VARCHAR(50)
);

-- Tabela DEPENDENTE
CREATE TABLE DEPENDENTE (
    Cpf_funcionario CHAR(11),
    Nome_dependente VARCHAR(50),
    Sexo CHAR(1),
    Data_nascimento DATE,
    Parentesco VARCHAR(50)
);

-- Tabela PROJETO
CREATE TABLE PROJETO (
    Nome_projeto VARCHAR(50),
    Numero_projeto INT,
    Local_projeto VARCHAR(50),
    Numero_departamento INT
);

-- Tabela TRABALHA_EM
CREATE TABLE TRABALHA_EM (
    Cpf_funcionario CHAR(11),
    Numero_projeto INT,
    Horas DECIMAL(4, 1)
);

-- Adicionando Constraints para FUNCIONARIO
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT PK_Funcionario PRIMARY KEY (Cpf);

ALTER TABLE FUNCIONARIO
ADD CONSTRAINT FK_Funcionario_Supervisor FOREIGN KEY (Cpf_supervisor)
REFERENCES FUNCIONARIO(Cpf);

-- Adicionando Constraints para DEPARTAMENTO
ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT PK_Departamento PRIMARY KEY (Numero_departamento);

-- Para executar esta constraint, a primary key de "departamento" deve ter sido estabelecida
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT FK_Funcionario_Departamento FOREIGN KEY (Numero_departamento)
REFERENCES DEPARTAMENTO(Numero_departamento);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_Departamento_Gerente FOREIGN KEY (Cpf_gerente)
REFERENCES FUNCIONARIO(Cpf);

-- Adicionando Constraints para LOCALIZACOES_DEPARTAMENTO
ALTER TABLE LOCALIZACOES_DEPARTAMENTO
ADD CONSTRAINT FK_Localizacoes_Departamento FOREIGN KEY (Numero_departamento)
REFERENCES DEPARTAMENTO(Numero_departamento);

-- Adicionando Constraints para DEPENDENTE
ALTER TABLE DEPENDENTE
ADD CONSTRAINT FK_Dependente_Funcionario FOREIGN KEY (Cpf_funcionario)
REFERENCES FUNCIONARIO(Cpf);

-- Adicionando Constraints para PROJETO
ALTER TABLE PROJETO
ADD CONSTRAINT PK_Projeto PRIMARY KEY (Numero_projeto);

ALTER TABLE PROJETO
ADD CONSTRAINT FK_Projeto_Departamento FOREIGN KEY (Numero_departamento)
REFERENCES DEPARTAMENTO(Numero_departamento);

-- Adicionando Constraints para TRABALHA_EM
ALTER TABLE TRABALHA_EM
ADD CONSTRAINT PK_Trabalha_Em PRIMARY KEY (Cpf_funcionario, Numero_projeto);

ALTER TABLE TRABALHA_EM
ADD CONSTRAINT FK_TrabalhaEm_Funcionario FOREIGN KEY (Cpf_funcionario)
REFERENCES FUNCIONARIO(Cpf);

ALTER TABLE TRABALHA_EM
ADD CONSTRAINT FK_TrabalhaEm_Projeto FOREIGN KEY (Numero_projeto)
REFERENCES PROJETO(Numero_projeto);