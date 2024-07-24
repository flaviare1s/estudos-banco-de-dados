-- 24.07.2024
-- UPDATE, DELETE E SELECT

USE empresa_db;

SHOW TABLES;

SELECT * FROM colaborador;
SELECT * FROM departamento;
SELECT * FROM endereco;
SELECT * FROM dependente;

-- UPDATE sem WHERE => atualiza todas as linhas da tabela! (NÃO FAÇA NUNCA!!!!)
UPDATE colaborador
SET salario = 8500; -- modifica TODOS os salários

UPDATE colaborador
SET salario = 9000
WHERE idColaborador = 1;

UPDATE colaborador
SET salario = 9000
WHERE idColaborador = 3; -- WHERE indica uma condição para aplicar o UPDATE

UPDATE colaborador 
SET nome = "João Carlos de Almeida",
	salario = 9000,
    fkDepartamento = 4
WHERE idColaborador = 2;
	
UPDATE endereco
SET complemento = "Bloco C - quadra 2"
WHERE fkColaborador = 4;

-- ACRESENTAR 50 REAIS NO SALÁRIO DO PESSOAL DA TI:
UPDATE colaborador
SET salario = salario + 50
WHERE fkDepartamento = 4;

-- Remover dados das tabelas
DELETE FROM endereco; -- apaga TODOS os dados da tabela!!!

DELETE FROM dependente
WHERE fkColaborador = 1;