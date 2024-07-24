USE loja_db;

-- 1) Filtrar os produtos com preço maior que 500.
SELECT *
FROM produto
WHERE preco > 500;

-- 2) Filtrar os produtos com preço entre 500 e 1000.
SELECT *
FROM produto
WHERE preco BETWEEN 500 AND 1000;

-- 3) Filtrar os produtos do vendedor com ID = 7.
SELECT *
FROM produto
WHERE fkVendedor = 7;

-- 4) Filtrar os vendedores com email (hotmail ou yahoo).
SELECT *
FROM vendedor
WHERE email LIKE "%hotmail%" OR email LIKE "%yahoo%";

-- 5) Filtrar os produtos do vendedor com ID = 1 e calcular o preço final do produto com desconto.
SELECT
	nome, 
    preco, 
    percentualDesconto, 
    ROUND(COALESCE(preco - (preco * percentualDesconto), preco), 2) AS precoFinal
FROM produto
WHERE fkVendedor = 1;

-- 6) Filtrar os produtos das categorias Roupas(2), Alimentos(3) e Acessórios(4).
SELECT *
FROM produto
WHERE fkCategoria IN(2, 3, 4);

-- 7) Listar o id dos vendedores do CE.
SELECT fkVendedor AS idVendedor
FROM endereco
WHERE uf = "CE";

-- 8) Listar os vendedores que nasceram após 2000. Tente utilizar a função YEAR(data).
UPDATE vendedor
SET dataNascimento = "2001-01-01"
WHERE idVendedor = 1;

SELECT *
FROM vendedor
WHERE YEAR(dataNascimento) > 2000;

-- 9) Listar os vendedores que nasceram no mês atual (em que a consulta é feita). Tente utilizar MONTH (data) e CURDATE() para pegar a data atual.
SELECT * 
FROM vendedor
WHERE MONTH(dataNascimento) = MONTH(CURDATE());

-- 10) Filtre os produtos cujo estoque está entre 200 e 800. Ordene por preco decrescente, e limite a 5 registros.
SELECT *
FROM produto
WHERE estoque BETWEEN 200 AND 800
ORDER BY preco DESC
LIMIT 5;

-- 11) Exiba nome, sobrenome e data de nascimento dos vendedores (renomear para aniversario), apenas os que nasceram entre 1993 e 1995, 
-- ordene por nome (ordem crescente) e limite a 20.
SELECT 
	nome,
    sobrenome,
    dataNascimento AS aniversario
FROM vendedor
WHERE YEAR(dataNascimento) BETWEEN 1993 AND 1995
ORDER BY nome
LIMIT 20;

-- 12) Exiba nome, preco, lucro total (preco * estoque) da tabela produto. 
-- Apenas os produtos com categoria 1, 2, 3 E com preço menor que 100. Ordene por nome crescente. Limite a 100.
SELECT
	nome, 
    preco,
    preco * estoque AS lucroTotal
FROM produto
WHERE fkCategoria IN(1, 2, 3) AND preco < 100
ORDER BY nome
LIMIT 100;

-- 13) Liste os produtos que possuem percentualDesconto maior que 0. Exiba as colunas nome, e uma chamada 'precoFinal' com o preco descontado.
-- Ordene pelo maior percentual de desconto.
SELECT 
	nome,
    preco - (preco * percentualDesconto) AS precoFinal
FROM produto
WHERE percentualDesconto > 0
ORDER BY percentualDesconto DESC;

-- 14) Liste os produtos que a data de validade do desconto já expirou. Ordene por data crescente.
SELECT * FROM produto;

UPDATE produto
set validadeDesconto = "2025-01-01"
WHERE idProduto IN (1, 2, 3);

SELECT *
FROM produto
WHERE validadeDesconto < CURDATE()
ORDER BY validadeDesconto;

-- EXTRA) Aplique operações de UPDATE e DELETE nos dados caso necessário para testar os filtros.