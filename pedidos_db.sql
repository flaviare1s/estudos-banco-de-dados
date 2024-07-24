CREATE DATABASE pedidos_db;

USE pedidos_db;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE pedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE NOT NULL,
    statusPedido VARCHAR(15) NOT NULL,
    fkUsuario INT NOT NULL,
    FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario)
);

INSERT INTO usuario (nome, cpf, telefone) VALUES ("Ana Cristina Almeida", "99999999999", "85999999999");
INSERT INTO usuario (nome, cpf, telefone) VALUES ("Marcos Souza", "99999999998", "85967890532");
INSERT INTO usuario (nome, cpf, telefone) VALUES ("Paulo Henrique Andrade", "99999999977", "85999768905");
INSERT INTO usuario (nome, cpf, telefone) VALUES ("Camila da Silva", "99657897532", "85991146087");

INSERT INTO pedido (dataPedido, StatusPedido, fkUsuario) VALUES ("2024-07-22", "Pendente", 1);
INSERT INTO pedido (dataPedido, StatusPedido, fkUsuario) VALUES ("2024-07-23", "Concluído", 3);

SELECT * FROM usuario;

SELECT * FROM pedido;

DESC usuario;

DROP DATABASE pedidos_db;