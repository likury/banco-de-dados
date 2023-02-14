SELECT *
FROM categorias;

DROP PROCEDURE busca_categoria_teste

CREATE PROCEDURE busca_categoria_teste
	@nome_categoria VARCHAR(20)
	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

	SELECT * FROM categorias
	WHERE nome LIKe @nome_categoria;
EXEC busca_categoria_teste 'TI'



CREATE PROCEDURE busca_contagem_produtos
	@nome_categoria VARCHAR(20)

	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

	SELECT 
	COUNT(p.id) AS contagem_produto,
	c.nome
	FROM produtos AS p
	JOIN categorias as c
	ON p.id_categoria = c.id
	WHERE c.nome LIKE @nome_categoria
	GROUP BY c.nome;


EXEC busca_contagem_produtos 'Games'

DROP TRIGGER tr_log

CREATE TRIGGER tr_log
ON categorias 
AFTER UPDATE, INSERT, DELETE
AS
SELECT * FROM categorias
PRINT('Item inserido')

CREATE PROCEDURE inserir_categoria
	@nome_categoria VARCHAR(50),
	@ativo CHAR(3)
AS
	BEGIN
		INSERT INTO categorias (nome, ativa)
		VALUES (@nome_categoria, @ativo);
	END;


EXEC inserir_categoria 'Carros', '[v]'









