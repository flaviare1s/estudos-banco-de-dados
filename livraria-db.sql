CREATE DATABASE livraria_db;

USE livraria_db;

-- PARTE 1:

CREATE TABLE autor(
	idAutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

CREATE TABLE editora(
	idEditora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL
);

CREATE TABLE livro(
	idLivro INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(13) NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    anoPublicacao INT NOT NULL,
    genero VARCHAR(50),
    fkEditora INT NOT NULL,
    FOREIGN KEY (fkEditora) REFERENCES editora(idEditora)
);

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE compra(
	idCompra INT PRIMARY KEY AUTO_INCREMENT,
    dataCompra DATE NOT NULL,
    fkCliente INT NOT NULL,
    fkLivro INT NOT NULL,
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (fkLivro) REFERENCES livro(idLivro)
);

CREATE TABLE autor_livro(
	id INT PRIMARY KEY NOT NULL,
    fkLivro INT NOT NULL,
    fkAutor INT NOT NULL,
    FOREIGN KEY (fkLivro) REFERENCES livro(idLivro),
    FOREIGN KEY (fkAutor) REFERENCES autor(idAutor)
);

SHOW TABLES;

-- PARTE 2:

INSERT INTO autor (nome, nacionalidade) VALUES ('Gabriel García Márquez', 'Colombiana');
INSERT INTO autor (nome, nacionalidade) VALUES ('J.K. Rowling', 'Britânica');
INSERT INTO autor (nome, nacionalidade) VALUES ('Haruki Murakami', 'Japonesa');

INSERT INTO editora (nome, endereco) VALUES ('Penguin Random House', 'Nova York, EUA');
INSERT INTO editora (nome, endereco) VALUES ('Bloomsbury', 'Londres, Reino Unido');
INSERT INTO editora (nome, endereco) VALUES ('Kodansha', 'Tóquio, Japão');

INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, fkEditora) VALUES ('9780141032436', 'Cem Anos de Solidão', 1967, 'Ficção', 1);
INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, fkEditora) VALUES ('9780747532743', 'Harry Potter e a Pedra Filosofal', 1997, 'Fantasia', 2);
INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, fkEditora) VALUES ('9784805316000', 'Norwegian Wood', 1987, 'Ficção', 3);
INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, fkEditora) VALUES ('9781408855652', 'Harry Potter e o Prisioneiro de Azkaban', 1999, 'Fantasia', 2);
INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, fkEditora) VALUES ('9780141032450', 'O Amor nos Tempos do Cólera', 1985, 'Romance', 1);

INSERT INTO cliente (nome, email, telefone) VALUES ('Ana Souza', 'ana.souza@example.com', '123456789');
INSERT INTO cliente (nome, email, telefone) VALUES ('Carlos Silva', 'carlos.silva@example.com', '987654321');
INSERT INTO cliente (nome, email, telefone) VALUES ('Maria Oliveira', 'maria.oliveira@example.com', '1122334455');
INSERT INTO cliente (nome, email, telefone) VALUES ('João Pereira', 'joao.pereira@example.com', '5566778899');

INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-01', 1, 1);
INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-02', 2, 2);
INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-03', 3, 3);
INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-04', 4, 2);
INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-05', 1, 5);
INSERT INTO compra (dataCompra, fkCliente, fkLivro) VALUES ('2024-07-06', 2, 1);

INSERT INTO autor_livro (id, fkLivro, fkAutor) VALUES (1, 1, 1); -- Cem Anos de Solidão por Gabriel García Márquez
INSERT INTO autor_livro (id, fkLivro, fkAutor) VALUES (2, 2, 2); -- Harry Potter e a Pedra Filosofal por J.K. Rowling
INSERT INTO autor_livro (id, fkLivro, fkAutor) VALUES (3, 3, 3); -- Norwegian Wood por Haruki Murakami
INSERT INTO autor_livro (id, fkLivro, fkAutor) VALUES (4, 4, 2); -- Harry Potter e o Prisioneiro de Azkaban por J.K. Rowling
INSERT INTO autor_livro (id, fkLivro, fkAutor) VALUES (5, 5, 1); -- O Amor nos Tempos do Cólera por Gabriel García Márquez

-- PARTE 3:
-- Atualize o endereço de uma editora específica
SELECT *
FROM editora;

UPDATE editora 
SET endereco = "Nova Iorque, Estados Unidos"
WHERE idEditora = 1;

-- PARTE 4:
-- Exclua um livro específico da tabela livro
SELECT * FROM livro;
SELECT * FROM autor_livro;

DELETE FROM autor_livro
WHERE fkLivro = 4;

DELETE FROM livro
WHERE idLivro = 4;

-- PARTE 5: 
-- Consultas e Ordenação:
-- Liste todos os livros publicados por uma determinada editora
SELECT L.titulo
FROM livro L 
	JOIN editora E 
    ON L.fkEditora = E.idEditora
WHERE E.nome = "Kodansha";

-- Liste todos os livros de um autor específico
SELECT L.titulo
FROM livro L
	JOIN autor_livro AL
    ON AL.fkLivro = L.idLivro
WHERE fkAutor = 2; 

-- Liste todos os clientes que compraram um livro específico
SELECT CLI.nome
FROM cliente CLI
	JOIN compra COM
    ON COM.fkCliente = CLI.idCliente
WHERE COM.fkLivro = 1;

-- Liste todas as compras realizadas em uma data específica
SELECT COM.idCompra AS compra, L.titulo, CLI.nome 
FROM compra COM
	JOIN livro L 
    ON COM.fkLivro = L.idLivro
    JOIN cliente CLI
    ON COM.fkCliente = CLI.idCliente
WHERE COM.dataCompra = "2024-07-01";

-- Faça uma consulta que retorne os nomes dos clientes e os títulos dos livros que eles compraram
SELECT CLI.nome, L.titulo
FROM compra COM
	JOIN livro L 
    ON COM.fkLivro = L.idLivro
    JOIN cliente CLI
    ON COM.fkCliente = CLI.idCliente;

-- Realize uma consulta que liste todos os livros em ordem alfabética pelo título
SELECT titulo
FROM livro
ORDER BY titulo;

-- Liste todas as compras com informações dos clientes e dos livros comprados
SELECT COM.idCompra AS compra, CLI.nome AS comprador, L.titulo
FROM compra COM
	JOIN livro L 
    ON COM.fkLivro = L.idLivro
    JOIN cliente CLI
    ON COM.fkCliente = CLI.idCliente;

-- PARTE 6: 
-- Adicione uma nova coluna preco na tabela ‘livro’ e atualize os preços dos livros já inseridos.
ALTER TABLE livro
ADD COLUMN preco DECIMAL(10,2) NOT NULL DEFAULT(1);

UPDATE livro
SET preco = 29.90
WHERE idLivro = 1;

UPDATE livro
SET preco = 50
WHERE idLivro = 2;


UPDATE livro
SET preco = 30
WHERE idLivro = 3;


UPDATE livro
SET preco = 45.50
WHERE idLivro = 5;

SELECT * FROM livro;
