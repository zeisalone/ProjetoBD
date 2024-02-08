use Yamazon;

INSERT INTO Utilizador
 
(Nome, Correio_eletrónico, Senha, Telémovel )
VALUES
	  ('Avó Micas', 'restaurante_avó_migas@gmail.com','bolo_Rei','910 300 456'),
      ('Jorge Silvas', 'jorgeSilvas22@gmail.com','1234567','916 330 746'),
      ('Maria Monteiro', 'mMonteiro@gmail.com','password10','936 750 442'), 
      ('Dolores Coimbra', 'dolCoi7@gmail.com','SUUUUUUUUUUUUUUUUUI','907 107 142'),
      ('Luis Matos', 'LuisMatos1893@gmail.com','uMa_Naçã0','931 407 192'),
      ('Miguel Fonseca', 'breakingBadn1fan@hotmail.com','WalTer_WhItE', null);

INSERT INTO Endereço

(idUtilizador, Rua, Código_Postal)
VALUE
	 ('1','Rua Doutor Paixão','4720-788'),
     ('2','Rua Travessa Barros Bernardo','4700-684'),
     ('3','Travessa Pascoal Fernandes','4700-682'),
     ('4','Rua Demonio Margarida','4700-688'),
     ('5','Rua do Pico','4700-698'),
	 ('6','Avenida do alucinado', '4720-124');

INSERT INTO Categoria

(idCategoria,Descrição,Tipo)
VALUES
      ('1','Responsavel por manutenção e utilização da Cozinha', 'Cozinheiro'),
      ('2','Responsavel por fazer as entregas', 'Estefeta');
      
INSERT INTO Funcionário

(Nome, Salário, idCategoria)
VALUES
      ('Gonçalo Alvilez', '780', 1),
      ('Benjamin "Kirby" Fernandes', '750', 2),
      ('João Silva', '750', 2);

INSERT INTO Veículo

(Matricula, Gastos, Data_de_Aquisição)
VALUES
      ('DP-69-SM','20000.00','2009-09-02'),
      ('BE-NE-10','10000.00','2010-08-01');

INSERT INTO Manutenção
(idVeículo, Data_de_Manutenção, Descrição, Gasto)
VALUES
      ('1','2009-09-28','pôr gasolina','60.98'),
      ('2','2016-08-19','pôr gasolina','70.77');

INSERT INTO Estafetas_Veículo
(idVeículo, idEstafetas, Data_de_Utilização)
VALUES
	  ('1','2','2011-10-11'),
      ('2','3','2018-11-12');
      
INSERT INTO Armazens
(Endereço, Código_postal)
VALUES
      ('Rua da pandora','4720-121');

INSERT INTO Item
(Custo_ao_fornecedor, Custo_ao_cliente, Nome, Categoria, Descrição, Data_de_Aquisição, idArmazens)
VALUES
      ('30', '100', 'Paranoia', 'Jogo', 'Um RPG caótico onde apenas todos querem matar todos', '2022-05-05', 1),
      ('10', '29.99', 'Super Fish Boy', 'Jogo', 'Jogo de plataforma por niveis', '2022-08-07', '1'),
      ('10', '69.99', 'The Sams 4', 'Jogo', 'Life Simulator, mas com gajos chamado Sam. Só', '2022-12-17', '1'),
      ('15', '19.99', 'Four Nights at Frankies', 'Jogo', 'Jogo totalmente de horror totalmente original', '2012-12-08', '1'),
      ('10', '69.99', 'FAROFA 23', 'Jogo', 'Jogo 50% Futebol, 50% Culinaria', '2022-12-17', '1'),
      ('5', '100', 'Bro I am sick the tunel!!!!!', 'Jogo', 'Tunel', '2012-12-07', '1');

INSERT INTO Consolas
(idJogo, Nome_Consola)
VALUES
      ('1','Lucena'),
      ('2','Draw step'),
      ('3','Teste'),
      ('4','GameStation 5'),
      ('5','MicroBox 1620'),
      ('6','Nantendo 4DS');
      
INSERT INTO Generos
(idJogo, Tipo)
VALUES
      ('1','RPG'),
      ('2','Comédia'),
      ('3','Plataforma'),
      ('4','Simulação'),
      ('5','Desporto'),
      ('6','Terror');
      
UPDATE Generos
SET Tipo = 'Terror'
WHERE idJogo IN ('4');
UPDATE Generos
SET Tipo = 'Simulação'
WHERE idJogo IN ('3');
UPDATE Generos
SET Tipo = 'Plataforma'
WHERE idJogo IN ('2'); 
UPDATE Generos
SET Tipo = 'Comédia'
WHERE idJogo IN ('6'); 

  
      
INSERT INTO Pedido
(Estado_da_entrega, Data_Limite, Data_Emissão, Data_que_foi_Entregue, Preço, Rua, Código_postal, idUtilizador, idFuncionário)
VALUES
      ('Entregue', '2020-02-11 14:38:12','2019-12-31 14:38:12', '2020-02-01 12:37:09', '0.00','Rua Doutor Paixão','4720-788','1','2'),
      ('Entregue', '2020-06-11 21:32:12','2020-06-07 14:21:12', '2020-06-11 12:37:09', '0.00','Rua Doutor Paixão','4720-788','1','2'),
      ('Entregue', '2020-02-11 14:38:12','2019-12-29 14:38:12', '2019-12-31 09:38:12', '0.00','Rua do Pico','4700-698','4','2'),
      ('Em_espera', '2020-01-27 13:19:03', '2020-01-20 10:17:13', null, '0.00', 'Travessa Pascoal Fernandes','4700-682','2', null);
      
INSERT INTO Pedido_Item
(idPedido, idItem)
VALUES
      ('1','1'),
	  ('2','6'),
	  ('3','4'),
      ('4','2');

Insert into Utilizador
(Nome, Correio_eletrónico, Senha, Telémovel)
values
	('Jefferson Beijos', 'jeffersonbeijos@gmail.com', 'M0tSl3294mD@F','965664522');
    
INSERT INTO Veículo

(Matricula, Gastos, Data_de_Aquisição)
VALUES
      ('DP-62-AM','5000.00','2016-03-02'),
      ('SI-UU-07','15000.00','2019-01-06');
      
INSERT INTO Manutenção
(idVeículo, Data_de_Manutenção, Descrição, Gasto)
VALUES
      ('3','2015-02-28','pôr gasolina','85.98'),
	  ('3','2018-03-02','REVISÃO','185.00'),
      ('4','2019-08-19','pôr gasolina','61.37');
      
INSERT INTO Funcionário

(Nome, Salário, idCategoria)
VALUES
      ('João Barroso', '750', 2),
      ('Miguel Silva', '950', 2);

INSERT INTO Estafetas_Veículo
(idVeículo, idEstafetas, Data_de_Utilização)
VALUES
	  ('3','5','2016-03-08'),
      ('4','4','2019-11-12');
      
INSERT INTO Estafetas_Veículo
(idVeículo, idEstafetas, Data_de_Utilização)
VALUES
	  ('3','5','2016-03-09'),
      ('4','4','2019-11-13');


INSERT INTO Categoria

(idCategoria,Descrição,Tipo)
VALUES
      ('3','Funcionario de Apoio ao Cliente', 'Apoio ao Cliente'),
      ('4','Presidente Executivo', 'CEO');
      
INSERT INTO Funcionário

(Nome, Salário, idCategoria)
VALUES
	  ('Balget Al-Amed', '700', '3'),
      ('Paulo Silva', '700', '3'),
      ('Tiago Monteiro', '700', '3'),
      ('Jefferson Beijos', '10000', '4');
      
drop database yamazon;

select * from Funcionário