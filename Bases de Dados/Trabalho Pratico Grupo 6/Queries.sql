USE Yamazon;

DELIMITER $$
CREATE PROCEDURE Total_de_pedidos_entreges()
BEGIN
SELECT COUNT(idPedido) AS entregues, DATE(Data_que_foi_Entregue) AS 'data' FROM pedido
        WHERE Estado_da_Entrega = 'Entrege' AND DATE (Data_que_foi_Entregue) = DATE ( Curdate() );

END $$

CALL Total_de_pedidos_entreges();

DELIMITER $$
CREATE PROCEDURE Despesa_items_mensal()
BEGIN
SELECT SUM(Custo_ao_Fornecedor) AS Custo  FROM item
	   WHERE MONTH(Data_de_Aquisição) = MONTH (Curdate()) AND YEAR(Data_de_Aquisição) = YEAR (Curdate());
END $$

CALL Despesa_items_mensal();

DELIMITER $$
CREATE PROCEDURE Despesa_funcionários_mensal ()

BEGIN
	SELECT SUM(Salário) FROM funcionário;
END $$

CALL Despesa_funcionários_mensal();

-- Lucro de todos os pedidos
DELIMITER $$
CREATE PROCEDURE Receitas_Mensais(IN datas date)
BEGIN
SELECT SUM(Custo_ao_Cliente) AS Custo FROM Item AS I, Pedido_Item AS P_I, Pedido AS P
		WHERE P_I.idPedido = P.idPedido  AND I.idItem = P_I.idItem AND 
		MONTH(P.Data_Emissão) = MONTH (datas) AND YEAR(P.Data_Emissão) = YEAR (datas);
END $$

CALL Receitas_Mensais ('2021-02-11');

DELIMITER $$
CREATE PROCEDURE Receita_Jogos(IN datas date)
BEGIN
	
SELECT SUM(Custo_ao_Cliente) AS Custo FROM Item AS I, Pedido_Item AS P_I, Pedido AS P
		WHERE P_I.idPedido = P.idPedido  AND I.idItem = P_I.idItem AND I.Categoria = 'Jogo' 
        AND MONTH(P.Data_Emissão) = MONTH (datas) AND YEAR(P.Data_Emissão) = YEAR (datas);
END $$
CALL Receita_Jogos('2021-02-11');
 
 DELIMITER $$
CREATE PROCEDURE Receita_Consolas(IN datas date)
BEGIN
	
SELECT SUM(Custo_ao_Cliente) AS Custo FROM Item AS I, Pedido_Item AS P_I, Pedido AS P
		WHERE P_I.idPedido = P.idPedido  AND I.idItem = P_I.idItem AND I.Categoria = 'Consola' 
        AND MONTH(P.Data_Emissão) = MONTH (datas) AND YEAR(P.Data_Emissão) = YEAR (datas);
END $$
CALL Receita_Jogos('2021-02-11');

-- Preço de cada pedido
DELIMITER $$
CREATE PROCEDURE Preço_de_cada_pedidos( IN n_pedido INT)
BEGIN
	DECLARE Custo decimal;
	SELECT SUM(Custo_ao_Cliente) + (SUM(Custo_ao_Cliente) * 0.23) INTO Custo FROM Item AS I, Pedido_Item AS P_I
	WHERE P_I.idPedido = n_pedido AND P_I.idItem = I.idItem;
    UPDATE Pedido
		SET Preço = Custo
         WHERE idPedido = n_pedido;
END $$
 
CALL Preço_de_cada_pedidos(1);

DELIMITER $$
CREATE PROCEDURE jogos_por_genero(datas DATE)
BEGIN
  SELECT COUNT(G.idGeneros) AS "Quantidade", G.Tipo AS "gênero"
  FROM Pedido P, Pedido_Item P_I, Item I, Generos G
  where P_I.idPedido = P.idPedido AND P_I.idItem = I.idItem AND I.Categoria = "Jogo" 
        AND G.idJogo = I.idItem AND MONTH(P.Data_Emissão) = MONTH(datas) AND YEAR(P.Data_Emissão) = YEAR(datas)
  GROUP BY G.Tipo
  ORDER BY COUNT(G.idGeneros) DESC;
END $$

CALL jogos_por_genero('2021-02-11');

DELIMITER $$
CREATE PROCEDURE  itemscount (in D date)
BEGIN
	 Select  I.Nome, count(I.idItem) as Quantidade
	 FROM Pedido as P, Item as I, Pedido_Item as P_I  
	 Where P_I.idItem = I.idItem AND P_I.idPedido = P.idPedido AND Month(D) = Month(P.Data_Emissão)
	       AND Year(D) = Year(P.Data_Emissão)
	 Group by I.Nome
	 Order by count(I.idItem) DESC;
END $$

CALL itemscount('2021-02-11');

 -- Ao final de cada mês é gerado um relatório com as despesas de cada veículo.
 DELIMITER $$
 CREATE PROCEDURE Despesa_Mensal_Veiculo(idV INT, dt date) -- fazer para cada veículo e só dps para todos
 BEGIN
    SELECT sum(G.Gasto) FROM (
      SELECT M.Gasto FROM Manutenção M, Veículo V WHERE V.idVeículo = idV AND MONTH(dt) = MONTH(M.Data_de_Manutenção) AND YEAR(dt) = YEAR(M.Data_de_Manutenção)
      UNION
      SELECT Gastos FROM Veículo WHERE MONTH(dt) = MONTH(Data_de_Aquisição) AND YEAR(dt) = YEAR(Data_de_Aquisição) AND idVeículo = idV
    ) AS G;
END $$

CALL Despesa_Mensal_Veiculo(1, '2009-09-28');

DELIMITER $$
CREATE PROCEDURE Despesa_Mensal_Veiculos(dt date)
BEGIN
	SELECT sum(G.Gasto) FROM (
		SELECT M.Gasto FROM Manutenção M, Veículo V WHERE MONTH(dt) = MONTH(M.Data_de_Manutenção) AND YEAR(dt) = YEAR(M.Data_de_Manutenção) AND M.idVeículo = V.idVeículo
		UNION
		SELECT Gastos FROM Veículo WHERE MONTH(dt) = MONTH(Data_de_Aquisição) AND YEAR(dt) = YEAR(Data_de_Aquisição) ) AS G;

END $$
    
CALL Despesa_Mensal_Veiculos('2009-09-28');

DELIMITER $$
CREATE PROCEDURE updateTelémovel(id int, numero varchar(15) )
BEGIN
UPDATE Utilizador AS U
		SET U.Telémovel = numero
			WHERE idUtilizador = id;
END $$

CALL updateTelémovel(1,'253 371 115');

DELIMITER $$
CREATE PROCEDURE updateEndereço(idU int, idend int, Rua varchar(100), CodP varchar(45) )
BEGIN
UPDATE Endereço AS E
		SET E.Rua = Rua, E.Código_Postal = CodP
			WHERE 
				idUtilizador = idU
			And idEndereço   = idend;
END $$

CALL updateEndereço(1,'1','Rua Doutor Horlandino Busio de Damasco','4566-007');


DELIMITER $$
CREATE PROCEDURE updateNome(idU int, Nome varchar(100) )
BEGIN
UPDATE Utilizador AS U
		SET U.Nome = Nome
			WHERE 
				idUtilizador = idU;
END $$

CALL updateNome(1,'Avó Penicas Canticas Barbosa');

DELIMITER $$
CREATE PROCEDURE updateMail(idU int, Mail varchar(100) )
BEGIN
UPDATE Utilizador AS U
		SET U.Correio_Eletrónico = Mail
			WHERE 
				idUtilizador = idU;
END $$

CALL updateMail(1,'LeoAdrMar@Zémail.pt');

DELIMITER $$
CREATE PROCEDURE updateSenha(idU int, Senha varchar(45) )
BEGIN
UPDATE Utilizador AS U
		SET U.Senha = Senha
			WHERE 
				idUtilizador = idU;
END $$

CALL updateSenha(1,'Adriano_é_o_melhor');

DELIMITER $$
CREATE PROCEDURE updateEstadoPedido(idP int, Estado_da_Entrega varchar(45) )
BEGIN

UPDATE Pedido AS P 
SET P.Data_que_foi_Entregue = CASE
                WHEN Estado_da_Entrega = 'Entregue' THEN now()
                ELSE null
				END
WHERE idPedido = idP;

UPDATE Pedido AS P
	SET P.Estado_da_Entrega = Estado_da_Entrega
		WHERE 
			idPedido = idP;

END $$

CALL updateEstadoPedido(4,'Entregue');