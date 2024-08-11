CREATE DATABASE larfocinhos_db;

USE larfocinhos_db;

DROP DATABASE larfocinhos_db;

INSERT INTO clientes (nome, email, telefone, createdAt, updatedAt) VALUES ('João Silva', 'joao.silva@example.com', '11987654321', NOW(), NOW());
INSERT INTO clientes (nome, email, telefone, createdAt, updatedAt) VALUES ('Maria Souza', 'maria.souza@example.com', '21987654322', NOW(), NOW());
INSERT INTO clientes (nome, email, telefone, createdAt, updatedAt) VALUES ('Carlos Pereira', 'carlos.pereira@example.com', '31987654323', NOW(), NOW());

INSERT INTO pets (nome, raça, dataNasc, createdAt, updatedAt, clienteId) VALUES ('Rex', 'Labrador', '2020-01-15', NOW(), NOW(), 1);
INSERT INTO pets (nome, raça, dataNasc, createdAt, updatedAt, clienteId) VALUES ('Luna', 'Golden Retriever', '2019-05-20', NOW(), NOW(), 2);
INSERT INTO pets (nome, raça, dataNasc, createdAt, updatedAt, clienteId) VALUES ('Toby', 'Bulldog', '2021-07-30', NOW(), NOW(), 3);

INSERT INTO reservas (dataInicio, dataTermino, statusReserva, tipoAcomodacao, createdAt, updatedAt, petId, clienteId) VALUES ('2023-08-01', '2023-08-10', 'Confirmada', 'Standard', NOW(), NOW(), 1, 1);
INSERT INTO reservas (dataInicio, dataTermino, statusReserva, tipoAcomodacao, createdAt, updatedAt, petId, clienteId) VALUES ('2023-09-05', '2023-09-15', 'Confirmada', 'Deluxe', NOW(), NOW(), 2, 2);
INSERT INTO reservas (dataInicio, dataTermino, statusReserva, tipoAcomodacao, createdAt, updatedAt, petId, clienteId) VALUES ('2023-10-10', '2023-10-20', 'Cancelada', 'Standard', NOW(), NOW(), 3, 3);

SELECT * FROM clientes;
SELECT * FROM pets;
SELECT * FROM reservas;
