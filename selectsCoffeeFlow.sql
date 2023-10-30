use coffeeflow;

-- SELECT UNIDADE FEDERATIVA
select * from unidadeFederativa;

-- SELECT EMPRESA
select * from empresa;
-- SELECT EMPRESA - SEM OS ID's
select e.cnpj, e.nomeEmpresa, e.razaoSocial, e.emailEmpresa, e.telefoneEmpresa, u.sigla
	from empresa as e join endereco as a on a.idEmpresa = e.idEmpresa join unidadeFederativa as u on u.idUF = a.idUF;
        
-- SELECT USUARIO        
select * from usuario;
select u.emailUsuario, u.nomeUsuario, u.cpf, u.senha, u.nivel, e.cnpj as cnpjEmpresa, e.nomeEmpresa, e.razaoSocial, e.emailEmpresa, e.telefoneEmpresa
	from usuario as u join empresa as e 
		on u.idEmpresa = e.idEmpresa; 
-- SELECT USUARIO - PARA LOGIN (email e senha dos usuarios)
select u.emailUsuario, u.senha from usuario as u join empresa as e
	on u.idEmpresa = e.idEmpresa;
-- SELECT USUARIO - PARA LOGIN (email e senha dos users de uma empresa especifica)
select u.emailUsuario, u.senha from usuario as u join empresa as e
	on u.idEmpresa = e.idEmpresa WHERE e.idEmpresa = 101;
    
-- SELECT ENDEREÇO
select * from endereco;
-- SELECT ENDEREÇO - DOS NOMES DAS EMPRESAS E SEUS RESPECTIVOS ENDEREÇOS
select em.nomeEmpresa, em.telefoneEmpresa, en.tipoEndereco, en.logradouro, en.numero, en.complemento, en.bairro, en.cidade, en.cep
	from empresa as em join endereco as en 
		on em.idEmpresa = en.idEmpresa;
-- SELECT ENDEREÇO - DOS NOMES DAS EMPRESAS, SEUS RESPECTIVOS ENDEREÇOS E UF's
select em.nomeEmpresa, em.telefoneEmpresa, en.tipoEndereco, en.logradouro, en.numero, en.complemento, en.bairro, en.cidade, en.cep, u.sigla
	from empresa as em join endereco as en 
		on em.idEmpresa = en.idEmpresa
        join unidadeFederativa as u
			on en.idUF = u.idUF;

-- SELECT LAVOURA
select * from lavoura;
-- SELECT LAVOURA - DAS LAVOURAS E SEUS ENDEREÇOS
select l.nome, l.cafe, l.irrigacao, l.sacasMedia, l.areaha, e.tipoEndereco, e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep from lavoura as l join endereco as e 
	on l.idEndereco = e.idEndereco;
-- SELECT LAVOURA - DAS LAVOURAS E SUAS RESPECTIVAS EMPRESAS
select em.nomeEmpresa, em.telefoneEmpresa, l.nome, l.cafe, l.irrigacao, l.sacasMedia, l.areaha 
	from lavoura as l join endereco as en 
		on l.idEndereco = en.idEndereco
			join empresa as em on en.idEmpresa = em.idEmpresa;
-- SELECT LAVOURA - DAS LAVOURAS DE UMA EMPRESA
select em.nomeEmpresa, em.telefoneEmpresa, l.nome, l.cafe, l.irrigacao, l.sacasMedia, l.areaha 
	from lavoura as l join endereco as en on l.idEndereco = en.idEndereco
		join empresa as em on en.idEmpresa = em.idEmpresa
			WHERE l.idEndereco = 3;

-- SELECT TIPO            
select * from tipo;

-- SELECT COORDENADAS
select * from coordenadas;

-- SELECT SENSOR 
select * from sensor;
-- SELECT SENSOR - DOS SENSORES E SEUS RESPECTIVOS TIPOS
select s.nome, s.situacao, t.descTipo, t.unidadeMedida from sensor as s 
	join tipo as t on s.idTipo = t.idTipo;
-- SELECT SENSOR - TODOS OS SENSORES E SUAS RESPECTIVAS LAVOURAS
select s.nome as nomeSensor, s.situacao, l.nome as nomeLavoura, l.cafe, l.irrigacao
	from sensor as s left join lavoura as l
		on s.idLavoura = l.idLavoura;
-- SELECT SENSOR - SENSORES DE UMA LAVOURA
select s.nome as nomeSensor, s.situacao, l.nome as nomeLavoura, l.cafe, l.irrigacao
	from sensor as s join lavoura as l
		on s.idLavoura = l.idLavoura WHERE l.idLavoura = 3;
-- SELECT SENSOR - TODAS AS LAVOURAS, SEUS SENSORES E SEUS RESPECTIVOS TIPOS
select l.nome as nomeLavoura, l.cafe, l.irrigacao, s.nome as nomeSensor, s.situacao, t.descTipo, t.unidadeMedida
	from lavoura as l left join sensor as s on l.idLavoura = s.idLavoura
		left join tipo as t on t.idTipo = s.idTipo;
-- SELECT SENSOR - TODAS AS LAVOURAS, SEUS SENSORES, SEUS RESPECTIVOS TIPOS E COORDENADAS
select l.nome as nomeLavoura, l.cafe, l.irrigacao, l.areaha, s.nome as nomeSensor, s.situacao, t.descTipo, t.unidadeMedida, c.x, c.y
	from lavoura as l left join sensor as s on l.idLavoura = s.idLavoura
		left join tipo as t on t.idTipo = s.idTipo
			left join coordenadas as c on s.idCoordenadas = c.idCoordenadas;

-- SELECT REGISTRO            
select * from registro;
-- SELECT REGISTRO - DA TABELA REGISTRO COM A TABELA SENSOR
select r.idLavoura, r.idCoordenadas, r.idTipo, r.valor, r.dataHora, s.nome, s.situacao from registro as r join sensor as s 
	on r.idLavoura = s.idLavoura AND r.idCoordenadas = s.idCoordenadas AND r.idTipo = s.idTipo;
-- SELECT REGISTRO - DA LAVOURA, O TIPO DO SENSOR, OS REGISTROS E SUAS COORDENADAS
select l.nome, l.cafe, t.descTipo, t.unidadeMedida, r.valor, r.dataHora, s.situacao, c.x, c.y 
	from registro as r left join sensor as s on r.idLavoura = s.idLavoura AND r.idCoordenadas = s.idCoordenadas AND r.idTipo = s.idTipo
		left join tipo as t on s.idTipo = t.idTipo
			left join coordenadas as c on s.idCoordenadas = c.idCoordenadas
				left join lavoura as l on s.idLavoura = l.idLavoura;