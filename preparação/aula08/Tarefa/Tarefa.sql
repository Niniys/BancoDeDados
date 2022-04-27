-- 1. Desenvolva o modelo MER/DER conceitual deste banco de dados.
Feito
-- 2. Escreva um comando select para mostrar o nome do funcionário que mais fez solicitações (em Reais).
-- Então, você deverá mostrar o nome do funcionário e seu respectivo valor total, em Reais.
+-----------+------------+
|Funcionario|solicitações|
+----------+-----------+
|Gabriel| R$10.000,00|
+-------+------------+
Create table Funcionarios(
	Cod_Func  
	Nome_Func
	Sexo         
	Cidade
	Estado 
Create table Departamentos(
	Cod_Depto
	Nome_Depto
Create table Produtos(
	Cod_Produto 
	Nome_produto
Create table Solicitacao(
	Num_Sol    
	Data_sol
	Cod_Depto          
	Cod_Func 
Create table ItensSolicitacao(
	Num_Sol
	Cod_Produto
	Qtde
	Valor

SELECT c.descricao, f.nome, h.qtd
FROM (
    SELECT cod_func, qtd = count(1) over (partition by cod_func)
    from historicos
    group by cod_func
    order by qtd desc
) h
JOIN funcionario f on f.cod_func = h.cod_func
JOIN cargo c on c.cod_cargo = f.cod_cargo
-- Quando foi o último pedido do cliente "Cesar Augusto Pascali Rago"? Qual o valor deste pedido?
select * from pedidos where cliente_id = (select cliente_id from clientes where nome = "Cesar Augusto Pascali Rago")
order by pedido_id desc limit 1;
-- 3. Escreva um comando select para mostrar os nomes dos produtos vendidos em Fevereiro de 2018.
select * from pedidos where cliente_id = (select cliente_id from clientes where nome = "Cesar Augusto Pascali Rago")
order by pedido_id desc limit 1;
-- 4. Escreva um comando select para mostrar os nomes e datas dos departamentos que requisitaram Parafuso e Difusor.
Funcionario (cod_func, nome, cod_cargo)
Cargo (cod_cargo, descricao)
Historico (cod_cargo, cod_func, dataInicio, dataFim)

SELECT c.descricao, f.nome, h.qtd
FROM (
    SELECT cod_func, qtd = count(1) over (partition by cod_func)
    from historicos
    group by cod_func
    order by qtd desc
) h
JOIN funcionario f on f.cod_func = h.cod_func
JOIN cargo c on c.cod_cargo = f.cod_cargo