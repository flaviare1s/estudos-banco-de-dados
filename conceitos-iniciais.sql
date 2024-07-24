-- Comentário de uma linha
-- Para o SQL tanto faz caixa baixa e CAIXA ALTA -> BATATA = batata

SHOW databases; -- mostra os bancos de dados

CREATE DATABASE empresa_db; -- cria o banco com o nome especificado

USE empresa_db; -- seleciona o banco para aplicar os comandos

DROP DATABASE empresa_db; -- apaga o banco de dados (TUDO)

-- Tabelas: departamento, colaborador, endereço

-- PRIMARY KEY = define a coluna como chave primária
-- AUTO_INCREMENT = insere o ID automaticamente quando for inserido um novo dado

CREATE TABLE departamento(
	idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

DESCRIBE departamento; -- descreve a tabela

SHOW TABLES; -- lista todas as tabelas

DROP TABLE departamento; -- apaga a tabela do banco de dados (com todos os dados que tiver dentro)

-- TIPOS
	-- INT/INTEGER => até 2 bilhões
	-- BIGINT => até 9 quintilhões
    -- DECIMAL => precisão fixa
    -- FLOAT => até 7 casas de precisão
    -- DOUBLE => até 15 casas de precisão
    -- VARCHAR => textos simples
    -- TEXT => textos muito longos
    -- DATE => formato YYYY-mm-dd
    -- TIME => formato hh:mm:ss
    -- DATETIME => formato YYYY-mm-dd hh:mm:ss
    -- BLOB => arquivos (Binary Large Objects)
    
    CREATE TABLE colaborador(
		idColaborador INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(20) NOT NULL,
        cpf VARCHAR(11) UNIQUE NOT NULL,
		salario DECIMAL(8, 2) NOT NULL,
        telefone VARCHAR(20) UNIQUE NOT NULL,
        dataNascimento DATE NOT NULL,
        fkDepartamento INT NOT NULL,
        FOREIGN KEY(fkDepartamento) REFERENCES departamento(idDepartamento)
    );
    
    CREATE TABLE endereco(
		idEndereco INT PRIMARY KEY AUTO_INCREMENT,
        cidade VARCHAR(30) NOT NULL,
        uf VARCHAR(2) NOT NULL,
        rua VARCHAR(40) NOT NULL,
        numero VARCHAR(20) NOT NULL,
        complemento VARCHAR(40) DEFAULT("Sem complemento"),
        fkColaborador INT NOT NULL,
        FOREIGN KEY(fkColaborador) REFERENCES colaborador(idColaborador)
    );
    
    -- Constraints
		-- NOT NULL => torna a coluna obrigatória
        -- 	UNIQUE => impede a rpetição de valores na coluna
        -- DEFALT => aplica o valor padrão, caso o dado não seja preenchido

DESC colaborador;

-- Inserção de dados:
INSERT INTO departamento (nome) VALUES ("Recursos Humanos");
INSERT INTO departamento (nome) VALUES ("Marketing");
INSERT INTO departamento (nome) VALUES ("Financeiro");
INSERT INTO departamento (nome) VALUES ("TI");

SELECT * FROM departamento;

INSERT INTO colaborador (nome, cpf, salario, telefone, dataNascimento, fkDepartamento) values ("José Ferreira", "11111111111", 5500.00, "+5599999999999", "1980-01-25", 4);
INSERT INTO colaborador (nome, cpf, salario, telefone, dataNascimento, fkDepartamento) values ("João Carlos", "11111111112", 6000.00, "+5599999999991", "1980-01-30", 2);
INSERT INTO colaborador (nome, cpf, salario, telefone, dataNascimento, fkDepartamento) values ("Maria da Silva", "11111111113", 5500.00, "+5599999999993", "1980-01-25", 4);
INSERT INTO colaborador (nome, cpf, salario, telefone, dataNascimento, fkDepartamento) values ("Ana Cristina Gomes", "11111111114", 7500.00, "+5599999999994", "1982-11-27", 3);

INSERT INTO endereco (cidade, uf, rua, numero, fkColaborador) VALUES ("Ubajara", "CE", "Rua X", "200", 1);
INSERT INTO endereco (cidade, uf, rua, numero, complemento, fkColaborador) VALUES ("Fortaleza", "CE", "Rua Central", "2010", "bairro das Flores", 2);
INSERT INTO endereco (cidade, uf, rua, numero, fkColaborador) VALUES ("Fortaleza", "CE", "Rua do Beco", "3000", 3);
INSERT INTO endereco (cidade, uf, rua, numero, fkColaborador) VALUES ("Fortaleza", "CE", "Rua Mariana", "1520", 4);

SELECT * FROM colaborador;
SELECT * FROM endereco;