-- QUANTAS PESSOAS TEM EM CADA DEPARTAMENTO?
SELECT departamento_id,COUNT(id) as num_funcionario
FROM funcionarios
GROUP BY departamento_id;

--QUAL A SOMA DE SALARIO POR DEPARTAMENTO?

SELECT departamento_id, SUM(salario) AS soma_salario, COUNT(id) AS numero_pessoas
FROM funcionarios
GROUP BY departamento_id;

-- Quantos homens tem por departamento e ganham mais de 3800
SELECT departamento_id, COUNT(id) AS num_funcionarios
FROM funcionarios
WHERE sexo='M' AND salario>3800
GROUP BY departamento_id;

SELECT departamento_id, MAX(salario) AS max_salario
FROM funcionarios
GROUP BY departamento_id
HAVING MAX(salario) > 4200;

--QUANTOS HOMENS TEM POR DEPARTAMENTO, GANHAM MAIS DE 3800 DESCONSIDERANDO 
--OS DEPARTAMENTOS QUE TENHAM APENAS UM HOMEM

SELECT departamento_id, COUNT(id) AS num_funcioarios 
FROM funcionarios
WHERE sexo  = 'M' AND salario > 3800
GROUP BY departamento_id
HAVING COUNT(id) > 1;

--QUANTAS MULHERES QUE TEM EMAIL @GMAIL.COM TEM MEDIA DE SALARIO MAIOR QUE 4000 POR DEPARTAMENTO

SELECT departamento_id, COUNT(id) AS quantidade_mulheres, AVG(salario) AS media_salario
FROM funcionarios
WHERE sexo = 'F' AND email LIKE '%@gmail.com'
GROUP BY departamento_id
HAVING AVG(salario) > 4000;


--=========================================================
--JOINS

CREATE TABLE categorias(
	id INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(30),
	ativa CHAR(3),
	PRIMARY KEY (id)
);

insert into categorias (nome, ativa) Values
('Informatica','[v]'),
('Telefonia','[v]'),
('Games','[v]'),
('TV, Audio e Video','[v]'),
('Impressão e imagem','[v]');

SELECT * FROM categorias;

CREATE TABLE produtos (
	id INT NOT NULL IDENTITY(1,1),
	id_categoria INT,
	descricao VARCHAR(50),
	preco INT,
	url_imagem VARCHAR(100),
	PRIMARY KEY (id)
);


insert into produtos (id_categoria, descricao, preco) values
(1,'SSD 128GB', 300),
(1,'SSD 256GB', 500),
(1,'KIT TECLADO E MOUSE', 600),
(3,'PLAYSTATION 3', 1500),
(2,'SAMSUNG A51', 2500),
(4,'TELEVISÃO LG 55"', 3000),
(3,'PLAYSTATION 3 1TB', 1500),
(2,'SAMSUNG S9', 2500),
(2,'IPHONE 8', 2500),
(2,'IPHONE 9', 3000),
(2,'IPHONE X', 4000),
(4,'TELEVISÃO SAMSUNG 32"', 1000),
(4,'TELEVISÃO SAMSUNG 48"', 3000),
(3,'PLAYSTATION 4 1TB', 2800),
(3,'PLAYSTATION 5 1TB', 5000),
(1,'Teclado Razer Gamer', 250),
(1,'Fone de ouvido Hyperx',170),
(1,'Mouse Gamer Razer', 90),
(1,'Mouse Gamer Razer 2400', 200)
insert into produtos (descricao, preco) values
('Mouse Gamer', 280),
('Teclado Gamer', 390);


SELECT * FROM produtos;

--TRAZER APENAS PRODUTOS QUE TENHAM CATEGORIA: INNER JOIN
SELECT * FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TODOS OS PRODUTOS MESMO OS QUE NAO TEM CATEGORIA E AINDA ASSIM TRAZER A LISTAGEM DE CATEGORIAS
SELECT * FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id;


--TRAZER TUDO DA TABEA DIREITA INCLUSIVE AS CATEGORIA QUE NAO TEM PRODUTO: RIGHT JOIN
SELECT * FROM produtos p
RIGHT JOIN categorias c
ON p.id_categoria = c.id;


--TRAZER TUDO DE TODOS: FULL JOIN
SELECT * FROM produtos p
FULL JOIN categorias c
ON p.id_categoria = c.id;


-- MAIOR PREÇO POR CATEGORIA, TRAZENDO QUAL CATEGORIA O PRODUTO É, APENAS PRODUTOS CATEGORIZADOS
SELECT c.nome, MAX(p.preco) AS max_preco
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;


-- MENOR E MAIOR PREÇO DO PRODUTO DA CATEGORIA GAME E TELEFONIA
SELECT c.nome, MAX(p.preco) AS max_preco, MIN(p.preco) AS min_preco
FROM produtos p
	INNER JOIN categorias c
	ON p.id_categoria = c.id
WHERE c.nome = 'GAMES' OR c.nome = 'TELEFONIA'
GROUP BY c.nome;


-- QUANTO CUSTA O MAIOR PRODUTO NÃO CATALOGADO
SELECT MAX(preco)
FROM produtos p
LEFT JOIN categorias c
ON c.id = p.id_categoria
WHERE c.nome IS NULL;


-- Media de preço de todos os produtos por categoria
SELECT c.nome, AVG(p.preco) as preco_medio
FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;


--QUAL a soma da televisão e do playstation, contudo some apenas dos produtos com preço
--maior que 1500
--traga o nome da sua categoria


--QUAL o preço do mouse mais caro, traga o nome da sua categoria

WITH aux_table AS (SELECT YEAR(data_nascimento) AS ano,
	CASE 
		WHEN YEAR(data_nascimento) >= 1993 THEN 'True'
		ELSE 'False' 
	END AS 'is_millenium',
	id
FROM funcionarios)

SELECT is_millenium, COUNT(id) AS contagem
FROM aux_table
GROUP BY is_millenium;

-- criacao de views

-- Crie uma view que traga a média salarial 
--dos homens e mulheres que nasceram nos anos 90

CREATE VIEW view_mediasalario_sexo AS (
	SELECT sexo, AVG(salario) as media_salario
	FROM funcionarios
	WHERE YEAR(data_nascimento) >= '1990'
	GROUP BY sexo
);

SELECT * FROM view_mediasalario_sexo

INSERT INTO funcionarios (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Diego', 'luana@gmail.com', 'M', '01-05-1996', 1000000, 1)

--Desafio

--Crie uma view que traga o nome do departamento, sexo dos funcionarios
-- e a contagem dos funcionarios
-- Contudo, apenas os departamentos que tenham a letra 'd' e seus respectivos funcionarios 
--sejam mulheres que usam gmail e homens que usam hotmail
--Alem disso, a contagem de funcionario por sexo e por departamento deve ser maior que 1

--QUAL a soma da televisão e do playstation, contudo some apenas dos produtos com preço
--maior que 1500
--traga o nome da sua categoria


--QUAL o preço do mouse mais caro, traga o nome da sua categoria










