-- Aula 24.07
-- Consultas

CREATE DATABASE loja_db;
USE loja_db;

-- Tabelas: vendedor, endereço, categoria, produto
-- vendedor-endereco (1:N), categoria-produto (1:N), vendedor-produto (1:N)

CREATE TABLE vendedor(
	idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(120) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    dataNascimento DATE
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    fkVendedor INT NOT NULL,
    FOREIGN KEY(fkVendedor) REFERENCES vendedor(IdVendedor)
);

CREATE TABLE categoria(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT NOT NULL,
    percentualDesconto DECIMAL(4, 2) DEFAULT(0.0),
    validadeDesconto DATE,
    estoque INT NOT NULL,
    fkVendedor INT NOT NULL,
    fkCategoria INT NOT NULL,
    FOREIGN KEY (fkVendedor) REFERENCES vendedor(idVendedor),
    FOREIGN KEY (fkCategoria) REFERENCES categoria(idCategoria)
);

INSERT INTO vendedor (nome, sobrenome, email, dataNascimento)
VALUES 
    ('João', 'Silva', 'joao.silva@gmail.com', '1990-01-01'),
    ('Maria', 'Santos', 'maria.santos@hotmail.com', '1991-02-02'),
    ('Pedro', 'Ferreira', 'pedro.ferreira@yahoo.com', '1992-03-03'),
    ('Ana', 'Gomes', 'ana.gomes@outlook.com', '1993-04-04'),
    ('Lucas', 'Rodrigues', 'lucas.rodrigues@domain.com', '1994-05-05'),
    ('Laura', 'Almeida', 'laura.almeida@gmail.com', NULL),
    ('Carlos', 'Mendes', 'carlos.mendes@outlook.com', '1996-07-07'),
    ('Mariana', 'Fernandes', 'mariana.fernandes@yahoo.com', '1997-08-08'),
    ('Rafael', 'Pereira', 'rafael.pereira@domain.com', '1998-09-09'),
    ('Juliana', 'Lima', 'juliana.lima@gmail.com', NULL);

INSERT INTO endereco (uf, cidade, rua, cep, numero, fkVendedor)
VALUES 
    ('SP', 'São Paulo', 'Avenida Paulista', '01310100', '1000', 1),
    ('RJ', 'Rio de Janeiro', 'Rua Copacabana', '22020001', '500', 2),
    ('MG', 'Belo Horizonte', 'Avenida Afonso Pena', '30130001', '200', 3),
    ('RS', 'Porto Alegre', 'Rua da Praia', '90010001', '300', 4),
    ('BA', 'Salvador', 'Avenida Oceânica', '40140130', '400', 5),
    ('SC', 'Florianópolis', 'Rua das Flores', '88010000', '100', 6),
    ('CE', 'Fortaleza', 'Avenida Beira Mar', '60170001', '200', 7),
    ('PR', 'Curitiba', 'Rua das Araucárias', '80010001', '300', 8),
    ('PE', 'Recife', 'Avenida Boa Viagem', '51011000', '400', 9),
    ('DF', 'Brasília', 'Rua das Palmeiras', '70070001', '500', 10);

INSERT INTO categoria (nome)
VALUES 
    ('Eletrônicos'),
    ('Roupas'),
    ('Alimentos'),
    ('Acessórios'),
    ('Móveis'),
    ('Beleza'),
    ('Livros'),
    ('Esportes'),
    ('Jogos'),
    ('Brinquedos');

INSERT INTO produto (nome, preco, descricao, percentualDesconto, validadeDesconto, estoque, fkVendedor, fkCategoria)
VALUES 
    ('Celular', 1500.00, 'Smartphone avançado', 0.0, NULL, 100, 1, 1),
    ('Camiseta', 29.99, 'Camiseta estampada', 0.2, '2023-07-13', 200, 2, 2),
    ('Arroz', 5.99, 'Arroz integral, pacote de 1kg', 0.1, '2023-07-12', 150, 3, 3),
    ('Colar', 49.99, 'Colar de pérolas', 0.3, '2023-07-08', 50, 4, 4),
    ('Sofá', 999.99, 'Sofá reclinável de couro', 0.4, '2023-07-11', 300, 5, 5),
    ('Perfume', 79.99, 'Perfume masculino', 0.1, '2023-07-09', 250, 6, 6),
    ('Livro', 19.99, 'Livro de fantasia', 0.2, '2023-07-07', 75, 7, 7),
    ('Bola', 9.99, 'Bola de basquete', 0.0, NULL, 125, 8, 8),
    ('PlayStation', 1999.99, 'Console de videogame', 0.4, '2023-07-06', 175, 9, 9),
    ('Quebra-Cabeça', 14.99, 'Quebra-Cabeça 1000 peças', 0.5, '2023-07-05', 225, 10, 10),
    ('Headphone', 99.99, 'Fone de ouvido sem fio', 0.3, '2023-07-15', 100, 1, 1),
    ('Vestido', 49.99, 'Vestido de festa longo', 0.2, '2023-07-15', 150, 2, 2),
    ('Chocolate', 4.99, 'Chocolate ao leite, barra de 100g', 0.1, '2023-07-15', 200, 3, 3),
    ('Relógio', 89.99, 'Relógio de pulso masculino', 0.0, NULL, 50, 4, 4),
    ('Cama', 799.99, 'Cama de casal com colchão', 0.4, '2023-07-15', 300, 5, 5),
    ('Maquiagem', 59.99, 'Kit de maquiagem profissional', 0.1, '2023-07-15', 250, 6, 6),
    ('Romance', 14.99, 'Livro de romance', 0.2, '2023-07-15', 75, 7, 7),
    ('Bicicleta', 149.99, 'Bicicleta urbana', 0.3, '2023-07-15', 125, 8, 8),
    ('Xbox', 1799.99, 'Console de videogame', 0.4, '2023-07-15', 175, 9, 9),
    ('Lego', 24.99, 'Kit de montar Lego', 0.5, '2023-07-15', 225, 10, 10);

-- Projeção
-- Seleção
-- Junção 

-- PROJEÇÃO:
-- Projeção = definir o que vai ser exibido
SELECT 1 + 1; -- calcula a expressão e o resultado será exibido

SELECT curdate(); -- retorna e exibe a data atual

SELECT 50/3 AS resultado1, 10/3 AS resultado2; -- cria as colunas resultado1 e resultado2 e exibe com os respoectivos resultados

SELECT * FROM vendedor; -- exibe TUDO de vendedor
SELECT nome FROM vendedor; -- exibe apenas a coluna nome
SELECT nome, email FROM vendedor; -- exibe as colunas nome e email
SELECT concat(nome, " ", sobrenome) AS nomeCompleto FROM vendedor; -- concatena nome com sobrenome e exibe em uma coluna apelidada nomeCompleto
SELECT nome, dataNascimento AS aniversario FROM vendedor; -- exibe o nome e a data de nascimento (em uma coluna apelidada anoversário)

-- AS => apelida as colunas na hora de exibir

-- SELEÇÃO 
-- Seleção = buscar porções dos dados
SELECT *
FROM vendedor
WHERE idVendedor = 5; -- exibe todas as colunas da tabela vendedor onde o idVendedor é 5

SELECT *
FROM vendedor
WHERE idVendedor != 5;

SELECT nome, sobrenome, dataNascimento AS aniversario
FROM vendedor
WHERE idVendedor = 3;

SELECT nome, preco
FROM produto
WHERE preco < 100;

SELECT nome, preco
FROM produto
WHERE preco >= 500;

SELECT *
FROM produto
WHERE nome = "colar";

SELECT *
FROM produto
WHERE validadeDesconto IS NULL;

SELECT *
FROM vendedor
WHERE dataNascimento IS NOT NULL;

SELECT *
FROM produto
WHERE preco >= 100 AND preco <= 1000;

SELECT *
FROM produto
WHERE estoque <= 500 AND percentualDesconto > 0.20;

SELECT *
FROM endereco
WHERE uf = "CE" OR uf = "SP" OR uf = "MG" OR uf = "BA";

-- Operador IN => ajuda no uso  do OR (para não ficar repetindo o OR)
SELECT *
FROM endereco
WHERE uf IN("CE", "SP", "MG", "BA");

SELECT *
FROM endereco
WHERE uf NOT IN("CE", "SP", "MG", "BA");

SELECT *
FROM produto
WHERE estoque BETWEEN 10 AND 50;

SELECT *
FROM vendedor
WHERE dataNascimento BETWEEN "1995-01-01" AND "2000-01-01";

SELECT *
FROM vendedor
WHERE dataNascimento < "2000-01-01";

-- Operador LIKE:
-- % indica o que está faltando no texto

SELECT *
FROM vendedor
WHERE nome LIKE "j%"; -- exibe os vendedores cujos nomes começam com J

SELECT *
FROM vendedor
WHERE sobrenome LIKE "%va";

SELECT *
FROM vendedor
WHERE nome LIKE "l%a"; -- nome começa com L e termina com A

SELECT *
FROM produto
WHERE descricao LIKE "%livro%";

SELECT *
FROM produto
WHERE descricao LIKE "%masculino%";

-- Ordenação:
SELECT *
FROM produto
ORDER BY preco; -- Padrão: ASC = crescente

SELECT *
FROM produto
ORDER BY preco DESC; -- DESC = ordem decrescente

SELECT nome, preco, estoque
FROM produto
WHERE estoque BETWEEN 50 AND 200
ORDER BY estoque;

UPDATE vendedor
SET nome = "Maria"
WHERE idVendedor = 8;

SELECT idVendedor, nome, sobrenome
FROM vendedor
ORDER BY nome, sobrenome; -- caso o nome seja igual, utiliza o sobrenome para ordernar

SELECT *
FROM produto
LIMIT 3; -- limita a quantidade de dados exibida

SELECT *
FROM produto
LIMIT 3 OFFSET 3; -- limita a quantidade de dados exibida a partir de 3

SELECT *
FROM produto
LIMIT 3 OFFSET 6;

SELECT *
FROM produto
LIMIT 3 OFFSET 9;

-- Ordem da query: FROM > WHERE > ORDER BY > LIMIT > OFFSET
SELECT nome, preco, percentualDesconto*100 AS porcentagem
FROM produto
WHERE percentualDesconto >= 0.5
ORDER BY preco DESC
LIMIT 5;
