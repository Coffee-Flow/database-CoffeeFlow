create database coffeeflow;

use coffeeflow;

create table unidadeFederativa(
	idUF int primary key,
    sigla char(2),
    nome varchar(45)
);

create table tipo(
	idTipo int primary key,
    descTipo varchar(45),
    unidadeMedida varchar(45)
);

create table coordenadas(
	idCoordenadas int primary key,
    x int,
    y int
);

create table empresa(
	idEmpresa int primary key,
    cnpj char(14),
    nomeEmpresa varchar(45),
    razaoSocial varchar(70),
    emailEmpresa varchar(45),
    telefoneEmpresa varchar(15),
    idUF int,
	foreign key (idUF) references unidadeFederativa(idUF)
);

create table usuario(
	idUsuario int primary key,
    emailUsuario varchar(45),
    nomeUsuario varchar(45),
    cpf char(11),
    senha varchar(45),
    nivel tinyint,
    idEmpresa int,
    foreign key (idEmpresa) references empresa(idEmpresa)
);

create table endereco(
	idEndereco int primary key,
    tipoEndereco varchar(45),
    logradouro varchar(45),
    numero int,
    complemento varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    cep char(8),
    idEmpresa int,
    foreign key (idEmpresa) references empresa(idEmpresa)
);

create table lavoura(
	idLavoura int primary key,
    nome varchar(45),
    cafe varchar(15),
    irrigacao varchar(20),
    sacasMedia int,
    areaha float,
    idEndereco int,
    foreign key (idEndereco) references endereco(idEndereco)
);

create table sensor(
	idLavoura int,
    idCoordenadas int,
    idTipo int,
    nome varchar(15),
    situacao varchar(10),
    primary key(idLavoura, idCoordenadas, idTipo),
    foreign key (idLavoura) references lavoura(idLavoura),
    foreign key (idCoordenadas) references coordenadas(idCoordenadas),
    foreign key (idTipo) references tipo(idTipo),
    check (situacao = 'ativo' or situacao = 'inativo')
);

create table registro(
	idRegistro int,
    idLavoura int,
    idCoordenadas int,
    idTipo int,
    valor decimal(10,2),
    dataHora datetime,
    primary key(idRegistro, idLavoura, idCoordenadas, idTipo),
	foreign key (idLavoura) references sensor(idLavoura),
    foreign key (idCoordenadas) references sensor(idCoordenadas),
    foreign key (idTipo) references sensor(idTipo)
);