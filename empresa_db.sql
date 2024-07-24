CREATE DATABASE empresa_db; 

USE empresa_db; 

CREATE TABLE departamento(
	idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

DESCRIBE departamento; 

SHOW TABLES; 

CREATE TABLE colaborador(
		idColaborador INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL,
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
    
DESC colaborador;

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

CREATE TABLE dependente(
	idDependente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    idade INT NOT NULL,
    fkColaborador INT NOT NULL,
    FOREIGN KEY(fkColaborador) REFERENCES colaborador(idColaborador)
);

INSERT INTO dependente (nome, idade, fkColaborador) VALUES ("Rosa Ferreira", 16, 1);
INSERT INTO dependente (nome, idade, fkColaborador) VALUES ("Mario Ferreira", 14, 1);
INSERT INTO dependente (nome, idade, fkColaborador) VALUES ("Ana Silva", 16, 3);
INSERT INTO dependente (nome, idade, fkColaborador) VALUES ("José Gomes", 2, 4);

SELECT * FROM dependente;