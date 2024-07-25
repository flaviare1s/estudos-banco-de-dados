-- Aula 25.07.2014

-- JUNÇÃO 

-- Junção => combina linhas de duas ou mais tabelas com base numa condição de relacionamento

USE loja_db;

SELECT produto.nome AS nomeProduto, categoria.nome AS nomeCategoria -- usamos desta forma para diferenciar as colunas com mesmo nome
FROM produto, categoria -- produto cartesiano (combina todas as possibilidades de linhas)
WHERE produto.fkCategoria = categoria.idCategoria;

-- OBS.: A sintaxe acima faz a junção entre produto e categoria, PORÉM É BASTANTE INEFICIENTE!!!

-- Utilizamos o JOIN para fazer consultas eficientes


