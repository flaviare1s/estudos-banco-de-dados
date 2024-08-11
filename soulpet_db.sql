CREATE DATABASE soulpet_db;

USE soulpet_db;

SELECT * FROM pets;

INSERT INTO clientes (`nome`, `email`, `telefone`, `createdAt`, `updatedAt`) VALUES
('João da Silva', 'joao.silva@example.com', '(11) 91234-5678', NOW(), NOW()),
('Maria Oliveira', 'maria.oliveira@example.com', '(21) 98765-4321', NOW(), NOW()),
('Carlos Pereira', 'carlos.pereira@example.com', '(31) 99876-5432', NOW(), NOW()),
('Ana Souza', 'ana.souza@example.com', '(41) 91234-5678', NOW(), NOW()),
('Luiz Santos', 'luiz.santos@example.com', '(51) 98765-4321', NOW(), NOW());

INSERT INTO enderecos (`uf`, `cidade`, `cep`, `rua`, `numero`, `createdAt`, `updatedAt`, `clienteId`) VALUES
('SP', 'São Paulo', '0100-000', 'Rua das Flores', '123', NOW(), NOW(), 1),
('RJ', 'Rio de Janeiro', '20010000', 'Avenida Atlântica', '456', NOW(), NOW(), 2),
('MG', 'Belo Horizonte', '30130000', 'Praça da Liberdade', '789', NOW(), NOW(), 3),
('PR', 'Curitiba', '80010000', 'Rua XV de Novembro', '101', NOW(), NOW(), 4),
('RS', 'Porto Alegre', '90010000', 'Avenida Borges de Medeiros', '202', NOW(), NOW(), 5);

INSERT INTO pets (`nome`, `tipo`, `porte`, `dataNasc`, `createdAt`, `updatedAt`, `clienteId`) VALUES
('Rex', 'Cachorro', 'Grande', '2015-06-01', NOW(), NOW(), 1),
('Mimi', 'Gato', 'Pequeno', '2018-04-15', NOW(), NOW(), 2),
('Bobby', 'Cachorro', 'Médio', '2017-11-23', NOW(), NOW(), 3),
('Luna', 'Gato', 'Pequeno', '2019-09-05', NOW(), NOW(), 4),
('Thor', 'Cachorro', 'Grande', '2016-02-29', NOW(), NOW(), 5);

INSERT INTO pets (`nome`, `tipo`, `porte`, `dataNasc`, `createdAt`, `updatedAt`, `clienteId`) VALUES
('Seila', 'bichodementira', 'Grande', '2016-02-29', NOW(), NOW(), 5);

SELECT *
FROM clientes C 
	JOIN enderecos E 
	ON C.id = E.clienteId;
    
SELECT * FROM pets;


