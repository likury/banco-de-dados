CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(200) NOT NULL,
    CONSTRAINT Cliente_PK PRIMARY KEY (Id)
)

DECLARE @Contador INT = 1000000
WHILE @Contador > 0
BEGIN

    INSERT INTO Cliente(Nome, Sobrenome, Email)
    VALUES (
        SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,15),
        SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,15),
        LOWER(SUBSTRING(REPLACE(CONVERT(VARCHAR(250),NEWID()), '-', ''),1,30)) + '@email.com'
    )

    SET @Contador = @Contador - 1

END

UPDATE Cliente
    SET Nome = 'Vinicius',
        Sobrenome = 'Mussak',
        Email = 'vinicius.mussak@outlook.com'
    WHERE Id = 333123


SELECT  Id,
    Nome,
    Sobrenome,
    Email
FROM Cliente
WHERE Email = 'vinicius.mussak@outlook.com'

Select SERVERPROPERTY('MachineName') as 'MachineName'


CREATE INDEX IDX_Cliente ON Cliente(Email)