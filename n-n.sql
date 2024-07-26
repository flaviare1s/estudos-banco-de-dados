USE empresa_db;

SHOW TABLES;

SELECT * FROM colaborador;

-- Colaborador - Projeto (N:N)

CREATE TABLE projeto(
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    orcamento DECIMAL(8,2) NOT NULL,
    prazo DATE NOT NULL
);

INSERT INTO projeto(nome, orcamento, prazo)
VALUES ("Landing page", 4500, "2024-01-20"), 
       ("Ticket system", 50000, "2028-01-15"),
       ("Plataforma finanças", 1500, "2023-05-25");
       
SELECT * FROM projeto;

-- Criar uma tabela que interligue colaborador e projeto (participacao)
-- Essa tabela deve possuir uma chave estrangeira para colaborador e outra para projeto

-- A seguinte tabela irá atuar como uma tabela relacionamento:
CREATE TABLE participacao(
	idParticipacao INT PRIMARY KEY AUTO_INCREMENT,
    dataEntrada DATE NOT NULL,
    fkColaborador INT NOT NULL,
    fkProjeto INT NOT NULL,
    FOREIGN KEY (fkColaborador) REFERENCES colaborador(idColaborador),
    FOREIGN KEY (fkProjeto) REFERENCES projeto(idProjeto)
);

SELECT * FROM colaborador;
SELECT * FROM projeto;
SELECT * FROM participacao;

INSERT INTO participacao (fkColaborador, fkProjeto, dataEntrada)
VALUES (1, 2, "2024-07-01");

INSERT INTO participacao (fkColaborador, fkProjeto, dataEntrada)
VALUES 
	(1, 3, "2023-01-20"),
    (3, 2, "2024-05-12"),
    (4, 1, "2024-01-19");
    
INSERT INTO participacao (fkColaborador, fkProjeto, dataEntrada)
VALUES 
	(2, 3, "2023-01-20"),
    (2, 2, "2024-06-22"),
    (2, 1, "2024-02-19");
    
-- Inserção de novos colaboradores:
INSERT INTO colaborador (nome, cpf, salario, telefone, dataNascimento, fkDepartamento)
VALUES ("Maria", "11111111115", 7300, "+55999992", "1990-07-07", 1),
	   ("Pedro", "11111111116", 9000, "+55999993", "1987-01-13", 3);
       
INSERT INTO participacao (fkColaborador, fkProjeto, dataEntrada)
VALUES 
	(7, 3, "2023-01-20"),
    (7, 2, "2024-06-22"),
    (8, 1, "2024-02-19");
    
DELETE FROM participacao
WHERE fkColaborador = 2 AND fkProjeto = 1;

-- Listar o nome do projeto e os nomes dos participantes do projeto ID = 1;
SELECT C.nome, P.nome
FROM colaborador C
	JOIN participacao PR 
    ON C.idColaborador = PR.fkColaborador
    JOIN projeto P
    ON P.idProjeto = PR.fkProjeto
WHERE idProjeto = 1;

-- Listar os projetos do participante de ID = 2;
SELECT PR.nome AS nomeProjeto
FROM projeto PR
    JOIN participacao P
    ON PR.idProjeto = P.fkProjeto
WHERE P.fkColaborador = 2;

-- Listar o nome dos colaboradores, o nome do projeto e a data de entrada + filtrar quem entrou no ano atual
SELECT C.nome AS participante, PR.nome AS projeto, P.dataEntrada
FROM colaborador C
	JOIN participacao P
    ON C.idColaborador = P.fkColaborador
    JOIN projeto PR
    ON PR.idProjeto = P.fkProjeto
WHERE YEAR(P.dataEntrada) = YEAR(CURDATE())
ORDER BY PR.nome;

-- Regras para modelar as tabelas:

-- 1:1 -> Escolha a tabela mais dependente para colocar a FOREIGN KEY
-- 1:N -> Escolha a tabela do lado N para colocar a FOREIGN KEY
-- N:N -> Crie uma nova tabela com as FOREIGN KEY

