-- Para ver os procedimentos criados no seu BD
-- Escopo dos procedimentos armazenados BD
SHOW PROCEDURE STATUS;

-- procedimento que mostre o valor de uma pizza, recebendo como "filtro" parametro o id
drop procedure if exists ver_preco;
delimiter //
create procedure ver_preco(id integer)
begin
    declare quantos integer;
    select concat("O preço desta pizza é ",moeda(valor))
    from pizzas where pizza_id = id;
    set quantos = (select count(pizza_id) from pizzas where pizza_id = id);
    if quantos = 0 then
        select "Pizza não encontrada" as erro;
    end if;
end//
delimiter ;

-- Para executar um procedimento
call ver_preco(12);

-- Desafio: crie uma procedure que receba os dados a seguir:
-- cliente_id, pizza_id e quantidade
-- gere um pedido e coloque esta pizza como item (nome: Pedido_um_sabor)

drop procedure if exists pedido_um_sabor;
delimiter //
create procedure pedido_um_sabor(id_cliente integer, id_pizza integer, qtd integer)
begin
    insert into pedidos values (default, id_cliente,curdate(),curtime(),null);
    insert into itens_pedido values (last_insert_id(), id_pizza,qtd,(select valor from pizzas where pizza_id = id_pizza));
    select * from pedidos where pedido_id = last_insert_id();
    select * from itens_pedido where pedido_id = last_insert_id();
end//
delimiter ;

call pedido_um_sabor(1,1,2); 

-- Agora crie um gatilho que após inserir um iten no pedido
-- atualize o valor total do pedido.
-- coloque o nome de "tr_atualiza_valor_pedido"
-- novo iten no pedido muda o valor total deste pedido e chame de "tr_atualiza_valor_pedido"
preço*qtd =subt sum(preço*qtd) %juros %desconto %promoção

new pedido = new valort total

drop procedure if exists tr_atualiza_valor_pedido;
delimiter //
create procedure tr_atualiza_valor_pedido(id integer, integer);
begin
    insert into pedidos values (default, id_cliente,curdate(),curtime(),null);
    insert into itens_pedido values (last_insert_id(), id_pizza,qtd,(select valor from pizzas where pizza_id = id_pizza));
    UPDATE pizza_id SET pedido_id = quantidade + valor
    WHERE pedido_id  = valor;
    select * from pedidos where pedido_id = last_insert_id();
    select * from itens_pedido where pedido_id = last_insert_id();
end//
delimiter ;

call tr_atualiza_valor_pedido();

