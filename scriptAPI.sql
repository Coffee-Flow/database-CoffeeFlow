create database metricas;

use metricas;

CREATE TABLE lavoura(
	idLavoura int primary key auto_increment,
    nomeLavoura varchar(45),
    idEmpresa int
    -- constraint fkEmpresaLav foreign key (idEmpresa) references empresa(idEmpresa)
);

CREATE TABLE sensor(
	idSensor int primary key auto_increment,
    nomeSensor varchar(45),
    idLavoura int,
    pos_x int,
    pos_y int,
    constraint fkLavSensor foreign key (idLavoura) references lavoura(idLavoura)
);

CREATE TABLE dados(
	registro int auto_increment primary key,
    idSensor int,
    valor decimal(10,2),
    dataHora datetime default current_timestamp
);

insert into lavoura values
(null, 'lavoura Seu Zé', 1);

insert into sensor values
(1, 'DHT11 Umidade', 1, 0, 0),
(2, 'DHT11 Temperatura', 1, 0, 0),
(3, 'LDR (Luz)', 1, 0, 0),
(4, 'LM35 Temperatura', 1, 0, 0),
(5, 'Proximidade', 1, 0, 0);

select * from sensor;
select * from dados;

-- select para todos histórico de registros
select * from lavoura join sensor on lavoura.idLavoura = sensor.idLavoura join dados on dados.idSensor = sensor.idSensor;

-- histórico de um sensor específico
select * from lavoura join sensor on lavoura.idLavoura = sensor.idLavoura join dados on dados.idSensor = sensor.idSensor where sensor.idSensor = '2';

select * from dados where idSensor = 4 order by valor asc;
select * from dados where idSensor = 2 order by valor asc;
select * from dados where idSensor = 1 order by valor asc;