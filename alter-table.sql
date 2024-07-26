USE loja_db;

-- Schema = estrutura do banco de dados

DESC produto; -- nos ajuda a enteder o schema da tabela

ALTER TABLE produto
ADD COLUMN precoMinimo DECIMAL(10,2) NOT NULL DEFAULT(1) AFTER preco; -- adiciona uma nova coluna e aplica o valor padrão nos dados já existentes depois de preco

ALTER TABLE produto
CHANGE precoMinimo preco_Minimo DECIMAL(8,2) NOT NULL DEFAULT(2);

ALTER TABLE produto
DROP COLUMN preco_minimo; -- a coluna é removida e seus dados também

ALTER TABLE produto
MODIFY descricao TEXT NOT NULL AFTER nome;

SELECT * FROM produto;
