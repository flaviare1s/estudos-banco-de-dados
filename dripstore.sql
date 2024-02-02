CREATE DATABASE dripstore;

USE dripstore;

CREATE TABLE produto (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 produto_base_id INT,
 imagem VARCHAR(300),
 preco DECIMAL(10,2) NOT NULL,
 desconto DECIMAL,
 estoque INT
);

CREATE TABLE produto_base (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 categoria VARCHAR(30) NOT NULL,
 nome VARCHAR(50) NOT NULL,
 marca_id INT
);

CREATE TABLE marca (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30) NOT NULL
);

CREATE TABLE tamanho (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(2)
);

CREATE TABLE cor (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30),
hexadecimal VARCHAR(7)
);

CREATE TABLE genero (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(20)
);

CREATE TABLE cliente (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(40) NOT NULL,
cpf VARCHAR(14) NOT NULL,
email VARCHAR(30),
celular VARCHAR(14),
logradouro VARCHAR(40),
numero_residencial VARCHAR(5),
bairro VARCHAR(15),
cidade VARCHAR(15),
cep VARCHAR(10),
complemento VARCHAR(30),
data_de_cadastro DATE
);

CREATE TABLE cupom (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
valor_minimo DECIMAL
);

CREATE TABLE venda (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    data_venda DATE,
    valor_total DECIMAL(20,2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    status_da_venda VARCHAR(20),
    valor_do_frete FLOAT
);

CREATE TABLE produto_vendido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (venda_id) REFERENCES venda(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

ALTER TABLE produto
ADD COLUMN tamanho_id INT,
ADD COLUMN cor_id INT,
ADD COLUMN genero_id INT,
ADD FOREIGN KEY (tamanho_id) REFERENCES tamanho(id),
ADD FOREIGN KEY (cor_id) REFERENCES cor(id),
ADD FOREIGN KEY (genero_id) REFERENCES genero(id),
ADD FOREIGN KEY (produto_base_id) REFERENCES produto_base(id);

ALTER TABLE produto_base
ADD FOREIGN KEY (marca_id) REFERENCES marca(id);

ALTER TABLE venda
ADD COLUMN cliente_id INT,
ADD FOREIGN KEY (cliente_id) REFERENCES cliente(id);

ALTER TABLE venda
ADD COLUMN cupom_id INT,
ADD FOREIGN KEY (cupom_id) REFERENCES cupom(id);

ALTER TABLE cupom
ADD COLUMN nome VARCHAR(20) FIRST,
ADD COLUMN valor_desconto FLOAT,
ADD COLUMN quantidade_de_utilizacoes INT;

ALTER TABLE cupom DROP valor_minimo;

INSERT INTO genero (nome) VALUES
('Masculino'),
('Feminino'),
('Unissex'),
('Infantil Masculino'),
('Infantil Feminino');

INSERT INTO tamanho (nome) VALUES
('35'),
('36'),
('37'),
('38'),
('39'),
('40'),
('41'),
('42'),
('43'),
('44');

INSERT INTO marca (nome) VALUES
('Nike'),
('Adidas'),
('Asics'),
('Rebook'),
('Puma'),
('New Balance'),
('Vans'),
('Converse');

INSERT INTO cor (nome, hexadecimal) VALUES
('Preto', '#000000' ),
('Branco', '#FFFFFF'),
('Branco / Vermelho', NULL),
('Branco / Azul', NULL),
('Branco / Laranja', NULL),
('Branco / Verde', NULL),
('Cinza', NULL),
('Amarelo', NULL),
('Beje', NULL);

INSERT INTO produto_base (categoria, nome)
VALUES
('Tênis', 'Air Max'),
('Tênis', 'Ultraboost'),
('Tênis', 'RS-X'),
('Tênis', '990'),
('Tênis', 'Old Skool'),
('Tênis', 'Classic'),
('Tênis', 'Chuck Taylor'),
('Tênis', 'Gel-Kayano'),
('Tênis', 'Air Max'),
('Tênis', 'Ultraboost'),
('Tênis', 'RS-X'),
('Tênis', '990'),
('Tênis', 'Old Skool'),
('Tênis', 'Classic'),
('Tênis', 'Chuck Taylor'),
('Tênis', 'Gel-Kayano');

INSERT INTO produto (produto_base_id, preco, desconto, estoque, tamanho_id, genero_id, cor_id)
VALUES
(1, 250, 30, 10, 8, 1, 1),
(2, 120, NULL, 10, 7, 1, 2),
(3, 110, 20, 15, 6, 1, 3),
(4, 130, NULL, 5, 7, 1, 4),
(5, 90, NULL, 20, 7, 1, 5),
(6, 280, NULL, 8, 9, 1, 6),
(7, 320, NULL, 12, 7, 1, 7),
(8, 300, NULL, 6, 10, 1, 8),
(9, 250, 30, 10, 8, 2, 3),
(10, 120, NULL, 10, 6, 2, 6),
(11, 110, 20, 15, 7, 2, 4),
(12, 130, NULL, 5, 5, 2, 4),
(13, 90, NULL, 20, 2, 2, 3),
(14, 280, NULL, 8, 7, 3, 1),
(15, 320, NULL, 12, 7, 2, 5),
(16, 300, NULL, 6, 1, 2, 8);

INSERT INTO cliente (nome, cpf, email, celular, logradouro, numero_residencial, bairro, cidade, cep, complemento, data_de_cadastro)
VALUES 
('Maria de Souza', '985.678.234-90', 'mariazinha@gmail.com', '(85)9956.08904', 'Rua das Margaridas', '2589', 'Beira Mar', 'Fortaleza', '60.672-046', 'Apto 302', '2023-10-17'),
('João da Silva', '805.451.789-33', 'joao45@gmail.com', '(44)98678-0923', 'Rua Principal', '106', 'Centro', 'Maringá', '60.345-678', 'Apto 101', '2023-10-30'),
('Andreson Moura', '996.091.719-20', 'and_mou@hotmail.com', '(11)99876-0478', 'Avenida Paulista', '80', 'Bela Vista', 'São Paulo', '60.960-120', 'Casa', '2023-11-07'),
('Ana Lúcia de Souza Andrade', '870.409.152-00', 'anitta@yahoo.com.br', '(85)98867-3041', 'Rua Central', '106', 'Dunas', 'Fortaleza', '60.850-321', 'Apto 2010', '2023-12-29'),
('Daniel dos Santos Nóbrega', '340.091.404-09', 'daniel19@gmail.com', '(11)98998-5971', 'Avenida Leblon', '5556', 'Socorro', 'São Paulo', '60.891-778', 'Apto 1001', '2024-01-22'),
('José Maria do Nasciemnto', '555.459.702-70', 'zemaria@yahoo.com', '(21)98468-5689', 'Avenida América', '106', 'Centro', 'Rio de Janeiro', '60.560-185', 'Casa', '2024-01-22'),
('Milena Rodrigues da Silva', '900.307.089-42', 'milena@gmail.com', '(85)99734-9210', 'Rua Principal', '106', 'Praia do Futuro', 'Fortaleza', '60.490-803', 'Perto da Barraca do João', '2024-02-01');

INSERT INTO venda (valor_total, metodo_pagamento, status_da_venda, valor_do_frete, cliente_id)
VALUES 
('5000.00', 'Dinheiro', 'Concluída', '0.00', (SELECT id FROM cliente WHERE nome = 'Andreson Moura'));

INSERT INTO produto_vendido (venda_id, produto_id, quantidade, preco_unitario)
VALUES 
(1, 1, 10, 250.00),
(1, 9, 10, 250.00);

INSERT INTO venda (valor_total, metodo_pagamento, status_da_venda, valor_do_frete, cliente_id)
VALUES 
('120.00', 'Débito', 'Concluída', '0.00', (SELECT id FROM cliente WHERE nome = 'Maria de Souza'));

INSERT INTO produto_vendido (venda_id, produto_id, quantidade, preco_unitario)
VALUES 
(2, 2, 1, 120.00);

UPDATE produto
SET estoque = estoque - 10
WHERE id = 1;

UPDATE produto
SET estoque = estoque - 10
WHERE id = 9;

UPDATE produto
SET estoque = estoque - 1
WHERE id = 2;

UPDATE venda SET data_venda= '2023-12-30' where id = 1;