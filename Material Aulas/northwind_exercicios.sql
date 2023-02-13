-- Qual o custo total de cada tipo de frete?

SELECT ShipVia, SUM(Freight) AS FreteTotal
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia;

--Mostre quantos produtos cada fornecedor disponibiliza em cada categoria
SELECT SupplierID, CategoryId, COUNT(DISTINCT(ProductId)) AS QuantidadeProduto
FROM Products
WHERE Discontinued=0
GROUP BY SupplierID, CategoryId
ORDER BY SupplierID, CategoryId;

-- O gerente de vendas da Northwind pede uma série temporal (mensal) com volume 
-- de pedidos e o valor de venda


SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS Mes,
COUNT(DISTINCT(o.OrderId)) AS NumeroPedidos,
ROUND(SUM(od.Quantity*UnitPrice*(1-od.Discount)), 2) AS ValorTotalPedidos
FROM Orders AS o
JOIN [Order Details] AS od ON od.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM');

CREATE FUNCTION EmpregadoNome(@empregadoId int)
RETURNS TABLE
RETURN (
	SELECT FirstName, LastName, HomePhone
	
	FROM Employees
	WHERE EmployeeID = @empregadoId
)


SELECT * FROM EmpregadoNome(5)

CREATE FUNCTION funcao_teste(@valor int)
RETURNS INT
AS 
BEGIN
	SET @valor = @valor + 5
	RETURN @valor
END
GO 
SELECT dbo.funcao_teste(45)

-- TRIGGER 










SELECT funcao_teste(5)