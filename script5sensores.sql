create database metricas;
use metricas;
create table sensores(
	registro int primary key auto_increment,
	dht11_umidade decimal,
    dht11_temperatura decimal,
    luminosidade decimal,
    lm35_temperatura decimal,
    chave int,
    dataHora datetime default current_timestamp
);
select * from sensores;