create schema if not exists `Yamazon`;

create table if not exists `Yamazon`.`Utilizador`(
`idUtilizador` int not null auto_increment,
`Nome` varchar(100) not null,
`Correio_Eletrónico` varchar(100) not null unique,
`Senha` varchar(45) not null,
`Telémovel` varchar(15) null,
primary key (`idUtilizador`)
);

create table if not exists `Yamazon`.`Endereço`(
`idUtilizador` int not null,
`idEndereço` int not null auto_increment,
`Rua` varchar(100) null,
`Código_Postal` varchar(45) null,
primary key(`idEndereço`),
constraint `fk_Utilizador_Endereço` foreign key(`idUtilizador`) references `Yamazon`.`Utilizador`(`idUtilizador`)
);

create table if not exists `Yamazon`.`Categoria`(
`idCategoria` int not null,
`Descrição` text not null,
`Tipo` varchar(45) not null unique,
primary key (`idCategoria`)
);

create table if not exists `Yamazon`.`Funcionário`(
`idFuncionário` int not null auto_increment,
`Nome`  varchar(100) not null,
`Salário` decimal(10,2) not null default 0.00,
`idCategoria` int not null,
primary key(`idFuncionário`),
constraint `fk_Funcionário_Categoria` foreign key(`idCategoria`) references `Yamazon`.`Categoria`(`idCategoria`)
);

create table if not exists `Yamazon`.`Veículo`(
`idVeículo` int not null auto_increment,
`Matricula` varchar(45) not null unique,
`Gastos` decimal(10,2) not null default 0.00,
`Data_de_Aquisição` date not null,
primary key(`idVeículo`)
);

create table if not exists `Yamazon`.`Manutenção`(
`idManutenção` int not null auto_increment,
`idVeículo` int not null,
`Data_de_Manutenção` date not null, 
`Descrição` text not null,
`Gasto` decimal(5,2) not null default 0.00,
primary key(`idManutenção`),
constraint `Veículo_Manutenção` foreign key(`idVeículo`) references `Yamazon`.`Veículo`(`idVeículo`)
);

create table if not exists `Yamazon`.`Estafetas_Veículo`(
`idVeículo` int not null,
`idEstafetas` int not null,
`Data_de_Utilização` date not null,
primary key(`idVeículo`,`idEstafetas`,`Data_de_Utilização`),
constraint `fk_Funcionário_Veículo_Veículo` foreign key(`idVeículo`) references `Yamazon`.`Veículo`(`idVeículo`),
constraint `fk_Estafetas_Veículo_Funcionário` foreign key(`idEstafetas`) references `Yamazon`.`Funcionário`(`idFuncionário`)
);

create table if not exists `Yamazon`.`Armazens`(
`idArmazens` int not null auto_increment,
`Endereço` varchar(100) not null unique,
`Código_Postal` varchar(45) not null unique,
primary key(`idArmazens`)
);

create table if not exists `Yamazon`.`Item`(
`idItem` int not null auto_increment,
`Custo_ao_Fornecedor` decimal(5,2) not null,
`Custo_ao_Cliente` decimal(5,2) not null,
`Nome` varchar(100) not null,
`Categoria` varchar(100) not null,
`Descrição` text null,
`Data_de_Aquisição` datetime not null,
`idArmazens` int not null,
primary key(`idItem`),
constraint `fk_Item_Armazens` foreign key(`idArmazens`) references `Yamazon`.`Armazens`(`idArmazens`)
);

create table if not exists `Yamazon`.`Consolas`(
`idConsolas` int not null auto_increment,
`idJogo` int not null,
`Nome_Consola` varchar(45) not null,
primary key(`idConsolas`),
constraint `fk_Consolas_Jogo` foreign key(`idJogo`) references `Yamazon`.`Item`(`idItem`)
);

create table if not exists `Yamazon`.`Generos`(
`idGeneros` int not null auto_increment,
`idJogo` int not null,
`Tipo` varchar(45) not null,
primary key(`idGeneros`),
constraint `fk_Generos_Jogo` foreign key(`idJogo`) references `Yamazon`.`Item`(`idItem`)
);

create table if not exists `Yamazon`.`Pedido`(
`idPedido` int not null auto_increment,
`Estado_da_Entrega` varchar(45) null default 'Em_espera' check(`Estado_da_entrega` in('Em_espera', 'A_caminho' ,'Entregue') ),
`Data_Limite` datetime not null,
`Data_Emissão` datetime not null,
`Data_que_foi_Entregue` datetime null,
`Preço` decimal(5,2) not null default 0.00,
`Rua` varchar(100) not null,
`Código_Postal` varchar(45) not null,
`idUtilizador` int not null,
`idFuncionário` int null,
primary key(`idPedido`),
constraint `fk_Pedido_Utilizador` foreign key(`idUtilizador`) references `Yamazon`.`Utilizador`(`idUtilizador`),
constraint `fk_Pedido_Funcionário` foreign key(`idFuncionário`) references `Yamazon`.`Funcionário`(`idFuncionário`)
);

create table if not exists `Yamazon`.`Pedido_Item`(
`idPedido` int not null,
`idItem` int not null,
primary key(`idPedido`,`idItem`),
constraint `fk_Pedido_Item_Pedido` foreign key(`idPedido`) references `Yamazon`.`Pedido`(`idPedido`),
constraint `fk_Pedido_Item_Item` foreign key(`idItem`) references `Yamazon`.`Item`(`idItem`)
)
