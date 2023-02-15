-- Qual a fração do valor vendido por cada vendedor em relação ao valor total de vendas?
WITH vendas_por_vendedor AS (SELECT 
emp.FirstName AS vendedor,
SUM(ode.Quantity*UnitPrice*(1 - ode.Discount)) AS valor_individual,
COUNT(DISTINCT(ord.OrderID)) AS quantidade_pedidos
FROM Employees AS emp
JOIN Orders AS ord ON ord.EmployeeID = emp.EmployeeID
JOIN [Order Details] AS ode ON ode.OrderID = ord.OrderID
GROUP BY emp.FirstName) SELECT
vendedor,
ROUND(valor_individual, 2),
ROUND(valor_individual/(SELECT SUM(valor_individual) FROM vendas_por_vendedor),4)*100 AS proporcao,
ROUND(valor_individual/quantidade_pedidos, 2) AS media_vendedor
FROM vendas_por_vendedor




