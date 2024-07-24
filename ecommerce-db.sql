CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE venda(
	idVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkProduto INT NOT NULL,
    quantidade INT NOT NULL,
    dataVenda DATE NOT NULL,
    FOREIGN KEY(fkProduto) REFERENCES produto(idProduto)
);

INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Camisa", "Camisa polo, preta, masculina", 200.00, 5);
INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Calça", "Camisa jeans, preta, infantil", 250.00, 3);
INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Vestido", "Vestido florido feminino", 309.50, 4);
INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Boné", "Boné colorido tamanho único", 18.00, 10);
INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Bolsa", "Bolsa de lona", 110.00, 2);
INSERT INTO produto(nome, descricao, preco, estoque) VALUES ("Bermuda", "Bermuda jeans masculina", 80.00, 9);

INSERT INTO venda(fkProduto, quantidade, dataVenda) VALUES (1, 2, "2024-07-11");
INSERT INTO venda(fkProduto, quantidade, dataVenda) VALUES (5, 1, "2024-07-21");
INSERT INTO venda(fkProduto, quantidade, dataVenda) VALUES (1, 3, "2024-07-23");

SELECT * FROM produto;
SELECT * FROM venda;

DESC produto;

DROP TABLE venda;
