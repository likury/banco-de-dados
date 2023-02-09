CREATE DATABASE clientes_db;

USE clientes_db;

CREATE TABLE clientes (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255),
	idade INT,
	sexo CHAR(1),
	cpf CHAR(11)
);

INSERT INTO clientes (nome, idade, sexo, cpf) VALUES ('Robson', 40,'M', '12312312312');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Denise', 35,'F', '18989888812');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Madalena', 55,'F', '34534534545');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Jorge', 60, 'M', '89089089090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Ana', 18, 'F','90909009090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Bruna', 26, 'F','8568945239');


SELECT * FROM clientes;

/*Se eu quero apenas os clientes do sexo masculinos?*/

SELECT * 
FROM clientes
WHERE sexo = 'M';


/*Indo mais andiante, e se seu chefe pede um relatorio dos clientes do 
sexo faminino acima de 30 anos que seja ordenado da pessoa mais velha a mais nova.*/

SELECT *
FROM clientes
WHERE sexo = 'F' AND idade > 30
ORDER BY idade DESC;

CREATE TABLE departamentos (
	id INT NOT NULL IDENTITY(1,1),
	departamento VARCHAR(20),
	PRIMARY KEY(id)
);

INSERT INTO departamentos (departamento) VALUES
('Vendas'),
('Marketing'),
('RH'),
('Ti'),
('Administrativo'),
('Desenvolvimento');

SELECT * FROM departamentos;


CREATE TABLE funcionarios (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	sexo CHAR(1),
	data_nascimento DATE,
	salario INT,
	departamento_id INT
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);





INSERT INTO funcionarios (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Luana', 'luana@gmail.com', 'F', '01-05-1996', 3000, 1),
('Marilia', 'marilia@hotmail.com', 'F', '03-05-1995', 3100, 2),
('Raquel', 'raquel@gmail.com', 'F', '15-07-1994', 3050, 3),
('Joana', 'joana@gmail.com', 'F', '03-07-1995', 3000, 4),
('Fabricio', 'fabricio@gmail.com', 'M', '01-05-1993', 4700, 5),
('Everaldo', 'everaldo@hotmail.com', 'M', '07-05-1993', 4600, 6),
('Ricardo', 'ricardo@gmail.com', 'M', '15-05-1998', 3500, 1),
('Cleber', 'cleber@hotmail.com', 'M', '01-05-1997', 3300, 3),
('Fernando', 'fernando@hotmail.com', 'M', '03-05-1989', 3000, 2),
('Felipe', 'felipe@hotmail.com', 'M', '03-05-1996', 3070, 4),
('Matheus', 'matheus@hotmail.com', 'M', '15-05-1989', 4060, 5),
('Rodrigo', 'rodrigo@hotmail.com', 'M', '01-05-1996', 3060, 6),
('Luma', 'luma@gmail.com', 'F', '01-05-1996', 3700, 1),
('Rafael', 'rafael@gmail.com', 'M', '15-03-1991', 3500, 4),
('Mariana', 'mariana@gmail.com', 'F', '01-07-1998', 3900, 4),
('Monique', 'monique@gmail.com', 'F', '15-07-1993', 4100, 2),
('Joaquim', 'joaquim@hotmail.com', 'M', '01-05-1994', 3300, 3),
('Sandro', 'sandro@gmail.com', 'M', '01-05-1996', 4700, 5),
('Henrique', 'henrique@gmail.com', 'M', '07-07-1995', 3500, 6),
('Maria', 'maria@gmail.com', 'F', '07-07-1995', 4100, 3),
('Penha', 'penha@gmail.com', 'F', '07-07-1988', 5000, 5),
('Laura', 'laura@gmail.com', 'F', '07-07-1990', 5500, 5);


SELECT * FROM funcionarios;

/* Quantos funcionários são do sexo masculino?*/

SELECT COUNT(*) AS contagem_funcionario
FROM funcionarios
WHERE sexo = 'M';

/*Ordenarem os funcionarios por ordem de nascimento*/
SELECT *
FROM funcionarios
ORDER BY data_nascimento DESC;




/*Qual a média salarial da empresa?*/

SELECT AVG(salario) AS media_salario
FROM funcionarios;

SELECT departamento_id, MIN(salario) AS menor_salario, MAX(salario) AS maior_salario
FROM funcionarios
GROUP BY departamento_id;

/*Qual sexo ganha mais em media e quantas pessoas tem por sexo?*/

SELECT sexo, AVG(salario) AS media_salario, COUNT(sexo) AS quantidade
FROM funcionarios
GROUP BY sexo;