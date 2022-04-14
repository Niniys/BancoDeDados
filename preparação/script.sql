mysql -u root
use pizzaria;
show tables;
-- Todos os clientes;
select * from clientes;
-- Busca por nome os clientes "like"
-- se buscar com % ele busca todos exp: select * from clientes where nome like "Cesar Augusto %";
select * from clientes where nome like "Cesar Augusto Pascali Rago";
-- Todos os telefones do cliente "Cesar Augusto ..."
-- 1.a
select * from telefones 
where cliente_id = (select cliente_id from clientes where nome = "Cesar Augusto Pascali Rago");
-- Quantos os telefones do cliente "Cesar Augusto ..."
-- 1.b
select count(telefone) from telefones
where cliente_id = (select cliente_id from clientes where nome = "Cesar Augusto Pascali");
-- Deletar os 4 telefones e acrescentar um novo.
-- 1.c
delete from telefones where client_id = 12;
insert into telefones (cliente_id, telefone) values (12,"19991865503");
-- view é consulta salva, junta 2 tabelas ou mais n pode up,del
-- Crie uma view que mostre os clientes e telefones juntos, coloque o nome de "vw_clientes"
-- * é pra testar, então n usar ele
-- 1.d
create view vw_clientes as 
select c.cliente_id, c.nome, t.telefone from clientes c 
inner join telefones t on c.cliente_id = t.cliente_id;
-- (Leve) Acrescente um novo cliente "Joaquim Inácio Silva", um endereço qualquer, telefone 19989995511
-- 1.e
insert into Clientes (nome, logradouro, numero, complemento, bairro, referencia) values ("Joaquim Inácio Silva", "Rua pudim", 1204, "A", "11 de Setembro", "Casa branca");
insert into Telefones(cliente_id, Telefone) values(106, "19989995511");
select * from vw_clientes where nome like "Joaquim %";
-- que pediu
insert into Pedidos(cliente_id, data, hora) values(106, "2022-01-03","22:00");
select * from pedidos order by pedido_id desc limit 1;
-- 2 pizzas Baiana e uma de Atum
insert into Itens_Pedido(pedido_id, pizza_id, quantidade, valor) 
values
(28,6,2,32.13),
(28,5,1,32.29);

--Acrescente um novo cliente "Joaquim Inácio Silva", um endereço qualquer, telefone 19989995511 que pediu 2 pizzas Baiana e uma de atum
insert into Clientes (nome, logradouro, numero, complemento, bairro, referencia) values ("Joaquim Inácio Silva", "Rua pudim", 1204, "A", "11 de Setembro", "Casa branca");
insert into Telefones(cliente_id, Telefone) values(1, "19989995511");
select * from vw_clientes where nome like "Joaquim %";
-- que pediu
insert into Pedidos(cliente_id, data, hora) values(LAST_INSERT_ID(),curdate(),curtime());
select * from pedidos order by pedido_id desc limit 1;
-- 2 pizzas Baiana e uma de Atum
-- outras formas de listar
insert into Itens_Pedido(pedido_id, pizza_id, quantidade, valor) 
values
(LAST_INSERT_ID(),(select pizza_id from pizzas where nome = "Baiana"),2,(select valor from pizzas where nome = "Baiana")),
(LAST_INSERT_ID(),(select pizza_id from pizzas where nome = "Atum"),1,(select valor from pizzas where nome = "Atum"));
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.a client_id: 12/data: 2022-04-08/valor: 354.71
select data, valor from pedidos
where cliente_id = (select cliente_id from clientes where nome = "Cesar Augusto Pascali Rago")
ORDER BY data DESC LIMIT 1;
-- 2.b pedido_id: 22ultima 
-- 22 id_pizza: 5/7/8/25 quantidade: 4/5/1/1
