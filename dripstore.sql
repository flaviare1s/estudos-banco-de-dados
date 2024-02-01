CREATE DATABASE dripstore
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE dripstore;

CREATE TABLE produto (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 categoria VARCHAR(30) NOT NULL,
 nome VARCHAR(50) NOT NULL,
 imagem VARCHAR(300),
 preço DECIMAL(10,2) NOT NULL,
 desconto DECIMAL,
 estoque INT
) DEFAULT CHARSET = utf8;

CREATE TABLE marca (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30) NOT NULL
);

CREATE TABLE tamanho (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(2)
) DEFAULT CHARSET = utf8;

CREATE TABLE cor (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30)
) DEFAULT CHARSET = utf8;

CREATE TABLE genero (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(10)
) DEFAULT CHARSET = utf8;

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
data_de_cadastro DATE DEFAULT CURRENT_DATE
) DEFAULT CHARSET = utf8;

CREATE TABLE cupom (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
valor_minimo DECIMAL
) DEFAULT CHARSET = utf8;

CREATE TABLE venda (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    data_venda DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(20,2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    status_da_venda VARCHAR(20),
    valor_do_frete FLOAT
) DEFAULT CHARSET = utf8;

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
ADD COLUMN marca_id INT,
ADD COLUMN tamanho_id INT,
ADD COLUMN cor_id INT,
ADD COLUMN genero_id INT,
ADD FOREIGN KEY (marca_id) REFERENCES marca(id),
ADD FOREIGN KEY (tamanho_id) REFERENCES tamanho(id),
ADD FOREIGN KEY (cor_id) REFERENCES cor(id),
ADD FOREIGN KEY (genero_id) REFERENCES genero(id);

ALTER TABLE venda
ADD COLUMN cliente_id INT,
ADD FOREIGN KEY (cliente_id) REFERENCES cliente(id);

INSERT INTO genero (nome) VALUES
('Masculino'),
('Feminino'),
('Unissex');

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

INSERT INTO cor (nome) VALUES
('Preto'),
('Branco'),
('Branco / Vermelho'),
('Branco / Azul'),
('Branco / Laranja'),
('Branco / Verde'),
('Cinza'),
('Amarelo'),
('Beje');

INSERT INTO produto (categoria, nome, preço, desconto, estoque, marca_id, tamanho_id, genero_id, cor_id)
VALUES
('Tênis', 'Air Max', 250, 30, 10, 1, 8, 1, 1),
('Tênis', 'Ultraboost', 120, NULL, 10, 2, 7, 1, 2),
('Tênis', 'RS-X', 110, 20, 15, 3, 6, 1, 3),
('Tênis', '990', 130, NULL, 5, 6, 7, 1, 4),
('Tênis', 'Old Skool', 90, NULL, 20, 7, 7, 1, 5),
('Tênis', 'Classic', 280, NULL, 8, 4, 9, 1, 6),
('Tênis', 'Chuck Taylor', 320, NULL, 12, 8, 7, 1, 7),
('Tênis', 'Gel-Kayano', 300, NULL, 6, 5, 10, 1, 8),
('Tênis', 'Air Max', 250, 30, 10, 1, 8, 2, 3),
('Tênis', 'Ultraboost', 120, NULL, 10, 2, 6, 2, 6),
('Tênis', 'RS-X ', 110, 20, 15, 3, 7, 2, 4),
('Tênis', '990 ', 130, NULL, 5, 6, 5, 2, 4),
('Tênis', 'Old Skool', 90, NULL, 20, 7, 2, 2, 3),
('Tênis', 'Classic ', 280, NULL, 8, 4, 7, 3, 1),
('Tênis', 'Chuck Taylor', 320, NULL, 12, 8, 7, 2, 5),
('Tênis', 'Gel-Kayano', 300, NULL, 6, 5, 1, 2, 8);

SELECT * FROM produto;

SELECT 
    p.nome AS produto,
    m.nome AS marca,
    c.nome AS cor,
    g.nome AS genero,
    t.nome AS tamanho
FROM 
    produto p
JOIN 
    marca m ON p.marca_id = m.id
JOIN 
    cor c ON p.cor_id = c.id
JOIN 
    genero g ON p.genero_id = g.id
JOIN 
    tamanho t ON p.tamanho_id = t.id;

INSERT INTO cliente (nome, cpf, email, celular, logradouro, numero_residencial, bairro, cidade, cep, complemento)
VALUES 
('Maria de Souza', '985.678.234-90', 'mariazinha@gmail.com', '(85)9956.08904', 'Rua das Margaridas', '2589', 'Beira Mar', 'Fortaleza', '60.672-046', 'Apto 302'),
('João da Silva', '805.451.789-33', 'joao45@gmail.com', '(44)98678-0923', 'Rua Principal', '106', 'Centro', 'Maringá', '60.345-678', 'Apto 101'),
('Andreson Moura', '996.091.719-20', 'and_mou@hotmail.com', '(11)99876-0478', 'Avenida Paulista', '80', 'Bela Vista', 'São Paulo', '60.960-120', 'Casa'),
('Ana Lúcia de Souza Andrade', '870.409.152-00', 'anitta@yahoo.com.br', '(85)98867-3041', 'Rua Central', '106', 'Dunas', 'Fortaleza', '60.850-321', 'Apto 2010'),
('Daniel dos Santos Nóbrega', '340.091.404-09', 'daniel19@gmail.com', '(11)98998-5971', 'Avenida Leblon', '5556', 'Socorro', 'São Paulo', '60.891-778', 'Apto 1001'),
('José Maria do Nasciemnto', '555.459.702-70', 'zemaria@yahoo.com', '(21)98468-5689', 'Avenida América', '106', 'Centro', 'Rio de Janeiro', '60.560-185', 'Casa'),
('Milena Rodrigues da Silva', '900.307.089-42', 'milena@gmail.com', '(85)99734-9210', 'Rua Principal', '106', 'Praia do Futuro', 'Fortaleza', '60.490-803', 'Perto da Barraca do João');

SELECT id, estoque, preço
FROM produto
WHERE marca_id = (SELECT id FROM marca WHERE nome = 'Nike')
AND estoque > 0;

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

SELECT p.nome
FROM produto p
JOIN produto_vendido pv ON p.id = pv.produto_id
JOIN venda v ON pv.venda_id = v.id
WHERE MONTH(v.data_venda) = 2
AND p.estoque = 0;