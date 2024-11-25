CREATE TABLE DEPARTAMENTO (
    Nome_departamento VARCHAR(50) NOT NULL,
    Numero_departamento INT PRIMARY KEY,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE,
    FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf)
);


CREATE TABLE FUNCIONARIO (
    Primeiro_Nome VARCHAR(50) NOT NULL,
    Nome_meio VARCHAR(50),
    Ultimo_nome VARCHAR(50) NOT NULL,
    Cpf CHAR(11) PRIMARY KEY,
    Data_nascimento DATE,
    Endereco VARCHAR(100),
    Sexo CHAR(1),
    Salario DECIMAL(10, 2),
    Cpf_supervisor CHAR(11),
    Numero_departamento INT,
    FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf),
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);


CREATE TABLE LOCALIZACOES_DEPARTAMENTO (
    Numero_departamento INT,
    Local VARCHAR(50),
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);

CREATE TABLE DEPENDENTE (
    Cpf_funcionario CHAR(11),
    Nome_dependente VARCHAR(50),
    Sexo CHAR(1),
    Data_nascimento DATE,
    Parentesco VARCHAR(50),
    FOREIGN KEY (Cpf_funcionario) REFERENCES FUNCIONARIO(Cpf)
);

CREATE TABLE PROJETO (
    Nome_projeto VARCHAR(50),
    Numero_projeto INT PRIMARY KEY,
    Local_projeto VARCHAR(50),
    Numero_departamento INT,
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);

CREATE TABLE TRABALHA_EM (
    Cpf_funcionario CHAR(11),
    Numero_projeto INT,
    Horas DECIMAL(4, 1),
    FOREIGN KEY (Cpf_funcionario) REFERENCES FUNCIONARIO(Cpf),
    FOREIGN KEY (Numero_projeto) REFERENCES PROJETO(Numero_projeto),
    PRIMARY KEY (Cpf_funcionario, Numero_projeto)
);
