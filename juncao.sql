-- Aula 25.07.2014

-- JUNÇÃO 

-- Junção => combina linhas de duas ou mais tabelas com base numa condição de relacionamento

USE loja_db;

SELECT produto.nome AS nomeProduto, categoria.nome AS nomeCategoria -- usamos desta forma para diferenciar as colunas com mesmo nome
FROM produto, categoria -- produto cartesiano (combina todas as possibilidades de linhas)
WHERE produto.fkCategoria = categoria.idCategoria;

-- OBS.: A sintaxe acima faz a junção entre produto e categoria, PORÉM É BASTANTE INEFICIENTE!!!

-- Utilizamos o JOIN para fazer consultas eficientes

-- Produto + Categoria (fkCategoria - idCategoria)

SELECT *
FROM produto
	JOIN categoria -- combina as linhas de produto com categoria
    ON produto.fkCategoria = categoria.idCategoria; -- indica quando ocorrerá a combinação das linhas
    
-- Quando as colunas tiverem o mesmo nome, faça tabela.coluna
SELECT P.nome AS nomeProduto, C.nome AS nomeCategoria
FROM produto P
	JOIN categoria C
    ON P.fkCategoria = C.idCategoria;
    
SELECT P.nome AS nomeProduto, C.nome AS nomeCategoria, P.preco
FROM produto P
	JOIN categoria C
    ON P.fkCategoria = C.idCategoria
WHERE C.nome = "Brinquedos" AND P.preco > 20;
    
-- Vendedor + Endereço (idVendedor = fkVendedor)
SELECT CONCAT(nome, " ", sobrenome) AS vendedoresCearenses
FROM vendedor V 
	JOIN endereco E 
    ON V.idVendedor = E.fkVendedor
WHERE E.uf = "CE";

-- Exemplo 01: Listar o nome dos vendedores com produtos acima de 0.20 de desconto.
SELECT DISTINCT V.idVendedor, V.nome
FROM vendedor V
	JOIN produto P
    ON V.idVendedor = P.fkVendedor
WHERE P.percentualDesconto > 0.20;

-- 02. Liste o nome dos produtos e a sua respectiva categoria. Filtre por preço entre 100 e 300 reais.
SELECT P.nome, C.nome
FROM produto P 
	JOIN categoria C 
    ON P.fkCategoria = C.idCategoria
WHERE P.preco BETWEEN 100 AND 300;
    
-- 03. Liste os produtos dos vendedores que nasceram entre 1995 e 1999.
SELECT P.nome
FROM produto P
	JOIN vendedor V 
    ON P.fkVendedor = V.idVendedor
WHERE YEAR(V.dataNascimento) BETWEEN 1995 AND 1999;

-- 04. Liste todos os produtos juntamente com o nome completo do vendedor responsável.
SELECT P.*, CONCAT(V.nome, " ", V.sobrenome) AS nomeCompleto
FROM produto P
    JOIN vendedor V
    ON P.fkVendedor = V.idVendedor;
    
-- 05. Liste os produtos que são vendidos no Ceará (Produto + Vendedor + Endereço):
SELECT *
FROM produto P
	JOIN vendedor V 
    ON V.idVendedor = P.fkVendedor
    JOIN endereco E 
    ON V.idVendedor = E.fkVendedor
WHERE E.uf = "CE";

-- Listar os estados que possuem os produtos mais caros:

SELECT E.uf, P.preco
FROM produto P
	JOIN vendedor V 
    ON V.idVendedor = P.fkVendedor
    JOIN endereco E 
    ON V.idVendedor = E.fkVendedor
ORDER BY preco DESC;

SELECT E.uf AS Estado, MAX(p.preco) AS PrecoMaisCaro
FROM produto P
	JOIN vendedor V
    ON P.fkVendedor = V.idVendedor
	JOIN 
    endereco E
    ON V.idVendedor = E.fkVendedor
GROUP BY e.uf
ORDER BY PrecoMaisCaro DESC;