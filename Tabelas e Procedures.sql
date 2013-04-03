# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: trabalho_final
# Generation Time: 2013-04-01 17:27:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Ambiente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ambiente`;

CREATE TABLE `Ambiente` (
  `idAmbiente` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Ambiente` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAmbiente`),
  KEY `fk_Ambiente_Tipo_Ambiente1` (`idTipo_Ambiente`),
  CONSTRAINT `fk_Ambiente_Tipo_Ambiente1` FOREIGN KEY (`idTipo_Ambiente`) REFERENCES `Tipo_Ambiente` (`idTipo_Ambiente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Ambiente` WRITE;
/*!40000 ALTER TABLE `Ambiente` DISABLE KEYS */;

INSERT INTO `Ambiente` (`idAmbiente`, `idTipo_Ambiente`, `descricao`, `nome`, `referencia`, `capacidade`)
VALUES
	(1,1,'lorem ipsum','Jockey sao paulo',NULL,2000);

/*!40000 ALTER TABLE `Ambiente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ambiente_has_setor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ambiente_has_setor`;

CREATE TABLE `Ambiente_has_setor` (
  `idAmbiente` int(11) DEFAULT NULL,
  `idSetor` int(11) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  KEY `idAmbiente` (`idAmbiente`),
  KEY `idSetor` (`idSetor`),
  CONSTRAINT `Ambiente_has_setor_ibfk_2` FOREIGN KEY (`idSetor`) REFERENCES `Setor` (`idSetor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Ambiente_has_setor_ibfk_1` FOREIGN KEY (`idAmbiente`) REFERENCES `Ambiente` (`idAmbiente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Ambiente_has_setor` WRITE;
/*!40000 ALTER TABLE `Ambiente_has_setor` DISABLE KEYS */;

INSERT INTO `Ambiente_has_setor` (`idAmbiente`, `idSetor`, `capacidade`)
VALUES
	(1,1,100);

/*!40000 ALTER TABLE `Ambiente_has_setor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;

INSERT INTO `categoria` (`idcategoria`, `nome`)
VALUES
	(1,'festival');

/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Compra
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Compra`;

CREATE TABLE `Compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `tipo` int(1) DEFAULT '0' COMMENT '0=compra 1= reserva',
  PRIMARY KEY (`idCompra`),
  KEY `fk_Compra_Usuario` (`idUsuario`),
  CONSTRAINT `fk_Compra_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;

INSERT INTO `Compra` (`idCompra`, `idUsuario`, `data`, `total`, `qtd`, `tipo`)
VALUES
	(12,1,'2013-03-26',800,1,0),
	(13,1,'2013-03-26',800,1,0),
	(14,2,'2013-03-26',400,1,0),
	(15,2,'2013-03-26',400,1,0),
	(16,2,'2013-03-26',400,1,0);

/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Compra_has_ingresso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Compra_has_ingresso`;

CREATE TABLE `Compra_has_ingresso` (
  `idCompra` int(11) DEFAULT NULL,
  `idIngresso` int(11) DEFAULT NULL,
  KEY `idCompra` (`idCompra`),
  KEY `idIngresso` (`idIngresso`),
  CONSTRAINT `Compra_has_ingresso_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `Compra` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Compra_has_ingresso_ibfk_2` FOREIGN KEY (`idIngresso`) REFERENCES `Ingresso` (`idIngresso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Compra_has_ingresso` WRITE;
/*!40000 ALTER TABLE `Compra_has_ingresso` DISABLE KEYS */;

INSERT INTO `Compra_has_ingresso` (`idCompra`, `idIngresso`)
VALUES
	(12,6),
	(13,7),
	(14,4),
	(15,5),
	(16,8);

/*!40000 ALTER TABLE `Compra_has_ingresso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Evento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Evento`;

CREATE TABLE `Evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `idAmbiente` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `fk_Evento_categoria1` (`idcategoria`),
  CONSTRAINT `fk_Evento_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

LOCK TABLES `Evento` WRITE;
/*!40000 ALTER TABLE `Evento` DISABLE KEYS */;

INSERT INTO `Evento` (`idEvento`, `idcategoria`, `idAmbiente`, `nome`, `descricao`, `data`)
VALUES
	(1,1,1,'Lollapalooza','aiuedhiauehdiaudh','2013-12-25'),
	(7,1,1,'planeta terra 2013','O maior evento hipster do brasil','2013-05-25'),
	(17,1,1,'Planeta Terra 2014','O maior evento hipster do brasil','2013-05-25'),
	(18,1,1,'Planeta Terra 2015','O maior evento hipster do brasil','2013-03-27');

/*!40000 ALTER TABLE `Evento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Forma_Pagamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Forma_Pagamento`;

CREATE TABLE `Forma_Pagamento` (
  `idForma_Pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `vezes` int(11) DEFAULT '1',
  PRIMARY KEY (`idForma_Pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Forma_Pagamento` WRITE;
/*!40000 ALTER TABLE `Forma_Pagamento` DISABLE KEYS */;

INSERT INTO `Forma_Pagamento` (`idForma_Pagamento`, `nome`, `vezes`)
VALUES
	(1,'A Vista',1),
	(2,'Cartao',3);

/*!40000 ALTER TABLE `Forma_Pagamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ingresso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ingresso`;

CREATE TABLE `Ingresso` (
  `idIngresso` int(11) NOT NULL AUTO_INCREMENT,
  `idEvento` int(11) NOT NULL,
  `idSetor` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`idIngresso`,`idEvento`),
  KEY `fk_Ingresso_Evento1` (`idEvento`),
  CONSTRAINT `fk_Ingresso_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

LOCK TABLES `Ingresso` WRITE;
/*!40000 ALTER TABLE `Ingresso` DISABLE KEYS */;

INSERT INTO `Ingresso` (`idIngresso`, `idEvento`, `idSetor`, `valor`, `status`)
VALUES
	(1,1,1,400,0),
	(2,1,1,400,0),
	(3,1,1,400,0),
	(4,1,1,400,0),
	(5,1,1,400,0),
	(6,17,1,800,1),
	(7,17,1,800,0),
	(8,1,1,400,0),
	(9,1,1,300,NULL),
	(10,1,1,300,NULL),
	(11,1,1,300,NULL),
	(12,1,1,300,NULL);

/*!40000 ALTER TABLE `Ingresso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Integrantes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Integrantes`;

CREATE TABLE `Integrantes` (
  `idIntegrantes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idIntegrantes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `Integrantes` WRITE;
/*!40000 ALTER TABLE `Integrantes` DISABLE KEYS */;

INSERT INTO `Integrantes` (`idIntegrantes`, `nome`, `funcao`)
VALUES
	(1,'Maria',NULL),
	(2,'Joana',NULL),
	(3,'Paula',NULL),
	(4,'Bruno Serra',NULL),
	(5,'Marcos',NULL);

/*!40000 ALTER TABLE `Integrantes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Integrantes_has_Evento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Integrantes_has_Evento`;

CREATE TABLE `Integrantes_has_Evento` (
  `Integrantes_idIntegrantes` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`Integrantes_idIntegrantes`,`Evento_idEvento`),
  KEY `fk_Integrantes_has_Evento_Evento1` (`Evento_idEvento`),
  KEY `fk_Integrantes_has_Evento_Integrantes1` (`Integrantes_idIntegrantes`),
  CONSTRAINT `fk_Integrantes_has_Evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Integrantes_has_Evento_Integrantes1` FOREIGN KEY (`Integrantes_idIntegrantes`) REFERENCES `Integrantes` (`idIntegrantes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Integrantes_has_Evento` WRITE;
/*!40000 ALTER TABLE `Integrantes_has_Evento` DISABLE KEYS */;

INSERT INTO `Integrantes_has_Evento` (`Integrantes_idIntegrantes`, `Evento_idEvento`)
VALUES
	(1,17),
	(3,17),
	(4,17),
	(5,17),
	(1,18),
	(3,18),
	(4,18),
	(5,18);

/*!40000 ALTER TABLE `Integrantes_has_Evento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Pagamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pagamento`;

CREATE TABLE `Pagamento` (
  `idPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `idForma_Pagamento` int(11) NOT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0= em aberto 1 = pago',
  PRIMARY KEY (`idPagamento`,`idForma_Pagamento`),
  KEY `fk_Pagamento_Forma_Pagamento1` (`idForma_Pagamento`),
  CONSTRAINT `fk_Pagamento_Forma_Pagamento1` FOREIGN KEY (`idForma_Pagamento`) REFERENCES `Forma_Pagamento` (`idForma_Pagamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;

INSERT INTO `Pagamento` (`idPagamento`, `idForma_Pagamento`, `idCompra`, `valor`, `vencimento`, `status`)
VALUES
	(4,2,1,133.333,'2013-04-25',0),
	(5,2,1,133.333,'2013-05-25',0),
	(6,2,1,133.333,'2013-06-25',0),
	(7,1,1,400,'2013-03-25',0),
	(8,1,1,400,'2013-03-25',0),
	(9,1,4,400,'2013-03-25',0),
	(10,1,5,0,'2013-03-25',0),
	(11,1,6,0,'2013-03-25',0),
	(12,1,7,0,'2013-03-25',1),
	(13,1,8,0,'2013-03-25',1),
	(14,1,9,400,'2013-03-25',0),
	(15,1,13,800,'2013-01-26',0),
	(16,1,13,800,'2013-09-26',1),
	(17,1,13,400,'2013-03-26',1),
	(18,1,13,400,'2013-03-26',1),
	(19,1,13,400,'2013-03-26',1),
	(23,2,16,133,'2013-03-27',0),
	(24,2,16,133,'2013-04-27',0),
	(25,2,16,133,'2013-05-27',0);

/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Setor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Setor`;

CREATE TABLE `Setor` (
  `idSetor` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idSetor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Setor` WRITE;
/*!40000 ALTER TABLE `Setor` DISABLE KEYS */;

INSERT INTO `Setor` (`idSetor`, `descricao`, `nome`)
VALUES
	(1,'Pista','Pista');

/*!40000 ALTER TABLE `Setor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Tipo_Ambiente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Tipo_Ambiente`;

CREATE TABLE `Tipo_Ambiente` (
  `idTipo_Ambiente` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Ambiente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Tipo_Ambiente` WRITE;
/*!40000 ALTER TABLE `Tipo_Ambiente` DISABLE KEYS */;

INSERT INTO `Tipo_Ambiente` (`idTipo_Ambiente`, `descricao`)
VALUES
	(1,'Jockey');

/*!40000 ALTER TABLE `Tipo_Ambiente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Usuario`;

CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cpf` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;

INSERT INTO `Usuario` (`idUsuario`, `nome`, `email`, `cpf`)
VALUES
	(1,'Bruno Serra Barboza','bruno@uptune.com.br',1234567890),
	(2,'Nilo Junior','bruno@chipper.com.br',2147483647);

/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;






DELIMITER //
CREATE PROCEDURE insertTo(in _tabela varchar(45), in _values_name varchar(255), in _values VARCHAR(255))
BEGIN
	SET @insert = CONCAT("insert into ",_tabela ,"(", _values_name ,") values (",_values,")"); 
	PREPARE _intertSQL FROM @insert; 
	EXECUTE _intertSQL; 
	DEALLOCATE PREPARE _intertSQL; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateTo(in _tabela varchar(45), in _new_values varchar(255), in _where VARCHAR(255))
BEGIN
	SET @update = CONCAT("update ",_tabela ," set ", _new_values ," where ",_where); 
	PREPARE _intertSQL FROM @update; 
	EXECUTE _intertSQL; 
	DEALLOCATE PREPARE _intertSQL; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectFrom(in _tabela varchar(45), in _views varchar(255), in _where VARCHAR(255))
BEGIN
	SET @update = CONCAT("select", _views," from ",_tabela ," where ", _where); 
	PREPARE _intertSQL FROM @update; 
	EXECUTE _intertSQL; 
	DEALLOCATE PREPARE _intertSQL; 
END//
DELIMITER ;

-- call insertTo("Usuario","nome,email,cpf",' "Bruno Serra","bruno@chipper.com.br","2345678901"  ');
-- call updateTo("Usuario",' nome="Nilo Junior" ',' nome="Bruno Serra" ');
-- call selectFrom("Usuario",' nome,cpf ',' nome="Bruno Serra Barboza" ');

-- compraIngresso("Bruno Serra","Lollapalooza","Pista","2","Cartao de credito","3x");

DELIMITER //
create function buyPass(_nome varchar(255), _evento varchar(255), _setor varchar(255), _quantidade int, _forma_pagamento varchar(255), _parcelas int, _tipo int) returns varchar(255) begin

DECLARE done INT DEFAULT 0;
DECLARE usuario_id, compra_id, ingresso_id INT;
DECLARE contador int default 0;
DECLARE valor, valor_parcela FLOAT;
DECLARE total_c FLOAT DEFAULT 0;
DECLARE _evento_cap varchar(255) default _evento;
DECLARE _nome_cap varchar(255) default _nome;
DECLARE registra_venda_ingressos CURSOR FOR (SELECT i.idIngresso, i.valor from Ingresso as i inner join Setor as s where i.idSetor = (SELECT idSetor from Setor s where s.nome = _setor) and i.idEvento in(select e.idEvento from Evento as e where (e.nome = _evento) and (i.status = 1)) LIMIT 2);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	SET _nome						= LOWER(_nome);
	SET _evento						= LOWER(_evento);
	SET _setor							= LOWER(_setor);
	SET _forma_pagamento		= LOWER(_forma_pagamento);
	
		if(((_nome = '') or (_nome = null)) or ((_evento = '') or (_evento = null)) or ((_setor = '') or (_setor = null)) or ((_quantidade = '') or (_quantidade = null)) or ((_forma_pagamento = '') or (_forma_pagamento = null)) or ((_parcelas = '') or (_parcelas = null))) then
		return 'Por Favor, preencha os valores corretamente.';
		end if;
		
	SET @data_evento = 0;
	select `data` into @data_evento from Evento where lower(nome) = _evento;
	
	if(@data_evento < current_date)then
		return 'Evento já aconteceu';
	end if;
	
	SET usuario_id = (select idUsuario from Usuario where nome = _nome LIMIT 1);
	
	IF ((_quantidade>2) or (_quantidade <1)) THEN RETURN 'Limite de 2 ingressos por compra !'; END IF;


	if(_tipo = 0) then
	-- executa compra porque nao é reserva
	
	SET @fp_id  = 0;
	SET @vezes = 1;

	SELECT fp.idForma_Pagamento, fp.vezes into @fp_id, @vezes from Forma_Pagamento fp where LOWER(fp.nome) = _forma_pagamento;
	
	IF(@fp_id=0) then return 'Forma de pagamento inválida.'; end if;
	
	if(((_parcelas<0) or (_parcelas>1)) and (_forma_pagamento = 'a vista')) then 
		return 'Por favor, verifique a forma de pagamento !'; 
	end if;
	
	if((_parcelas=0) or (_parcelas >@vezes)) then 
		RETURN CONCAT('Quantidade de parcelas inválida. Só é possível dividir em ',@vezes,'x no ', _forma_pagamento, '.'); 
	END IF;
	
	end if; -- fim if(_tipo
	
	select count(*) as qtd into @disponiveis from Ingresso where `status` = 1 and idSetor = (SELECT idSetor from Setor s where s.nome = _setor);
	IF (@disponiveis < _quantidade) THEN 
		RETURN CONCAT(@disponiveis,' ingresso(s) disponiveis. Evento: ',_evento_cap,'. Setor: ',_setor); 
	END IF;
	
	insert into Compra (idUsuario,`data`,qtd, tipo) values (usuario_id, CURRENT_DATE, _quantidade, _tipo);
	SET compra_id = LAST_INSERT_ID();

    				-- a partir da compra registrada, cria associação: compra x ingresso
  					OPEN registra_venda_ingressos;
  						REPEAT
    						FETCH registra_venda_ingressos INTO ingresso_id, valor;
    						IF (_quantidade >0) THEN
    							IF NOT done THEN
      								 INSERT INTO Compra_has_ingresso (idIngresso,idCompra) VALUES (ingresso_id, compra_id);
									 UPDATE Ingresso set status=0 where idIngresso = ingresso_id;
									 SET _quantidade = _quantidade - 1;
									 SET total_c = total_c + valor;
    							END IF;
    						ELSE 
    							SET done =1;
    						END IF;
  						UNTIL done END REPEAT;
  					CLOSE registra_venda_ingressos;
		
  			     	UPDATE Compra set `total`=total_c where idCompra = compra_id;
  			     	
  			     	-- se for tipo compra, continua o pagamento
  			     	if(_tipo=0)then
  					SET valor_parcela = total_c / @vezes;
  					
  					IF (_forma_pagamento = "a vista") then
  							insert into Pagamento (idForma_Pagamento, idCompra, `valor`, vencimento) values (@fp_id,compra_id, valor_parcela, CURRENT_DATE());
  					ELSE
  						while contador < @vezes DO
  							insert into Pagamento (idForma_Pagamento, idCompra, `valor`, vencimento) values (@fp_id,compra_id, valor_parcela, date_add(CURRENT_DATE(), interval contador month));
  							SET contador = contador + 1;
  						END WHILE ;
  					end if;
  					end if; -- fim if(_tipo
  		if(_tipo=0)then
  		return concat('Sucesso! Comprador: ',_nome_cap,'.\nEvento: ',_evento_cap,'.\nSetor: ', _setor,'.\nForma de Pagamento: ', _forma_pagamento, '.\nParcelas: ',_parcelas);
	else
		return concat('Reservado com sucesso! Até 24 p/ finalizar.\nComprador: ',_nome_cap,'.\nEvento: ',_evento_cap,'.\nSetor: ', _setor,'.\nForma de Pagamento: ', _forma_pagamento, '.\nParcelas: ',_parcelas);
		end if;
end//
DELIMITER ;


SET @teste = buyPass("Bruno Serra Barboza", "Planeta Terra 2014", "Pista",  1, "a vista", 1, 1);
select @teste;



DELIMITER //
create function newEvent(_nome varchar(255), _ambiente varchar(255), _descricao varchar(255), _data varchar(255), _categoria varchar(255), _integrantes varchar(255)) returns varchar(255) begin

	DECLARE _nome_cap varchar(255) default _nome;
	DECLARE evento_id, integrante_id int;
	DECLARE done, controle, controle_2, controle_3 int default 0;
	DECLARE integrante_nome varchar(255);
	DECLARE registra_integrantes_evento CURSOR FOR (SELECT inte.idIntegrantes, inte.nome from Integrantes inte);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	SET _nome						    = LOWER(_nome);
	SET _ambiente						= LOWER(_ambiente);
	SET _categoria						= LOWER(_categoria);
	SET _integrantes		            = LOWER(_integrantes);
	SET _data 								= date_format(str_to_date(_data, '%d/%m/%Y'), '%Y-%m-%d'); 
	
	if(((_nome = '') or (_nome = null)) or ((_ambiente = '') or (_ambiente = null)) or ((_descricao = '') or (_descricao = null)) or ((_categoria = '') or (_categoria = null)) or ((_integrantes = '') or (_integrantes = null)) or ((_data = '') or (_data = null))) then
		return 'Por Favor, preencha os valores corretamente.';
		end if;
	
	SET @cat_id = 0;
	select idCategoria into @cat_id from categoria where nome = _categoria;
	
	if(@cat_id = 0)then
		return 'Categoria de evento invalida';
	end if;
	
	SET @ambiente_id = 0;
	select idAmbiente into @ambiente_id from Ambiente where nome = _ambiente;
	
	if(@ambiente_id = 0)then
		return 'Ambiente de evento invalida';
	end if;
	
	if(_data < current_date ) then
		return 'Só é possive cadastrar eventos de hoje em diante!';
	end if;

	SET @check_name = 1;
	select count(*) into @check_name from Evento where nome = _nome;
	
	if(@check_name = 1)then
		return concat('Já existe um evento com o nome ',_nome_cap,'. Por favor, escolha outro.');
	end if;
	
		SET controle_2 = LENGTH(_integrantes) - LENGTH(REPLACE(_integrantes, ',', ''))+1;
	
				-- a partir do evento registrado, cria associação: evento x integrantes
  					OPEN registra_integrantes_evento;
  						REPEAT
    						FETCH registra_integrantes_evento INTO integrante_id, integrante_nome;
    							IF NOT done THEN
												if(LOCATE(integrante_nome, _integrantes)) then
													set controle_3 = controle_3 +1;
												end if;
    							END IF;
  						UNTIL done END REPEAT;
  					CLOSE registra_integrantes_evento;
  					
  					if(controle_2 != controle_3) then
							return 'Alguns integrantes não foram encontrados';
					end if;
	
	insert into Evento (idAmbiente, idCategoria, descricao, `data`, nome) values (@ambiente_id, @cat_id, _descricao, _data, _nome_cap);
	SET evento_id = LAST_INSERT_ID();
	
	SET done = 0;
	
			-- a partir do evento registrado, cria associação: evento x integrantes
  					OPEN registra_integrantes_evento;
  						REPEAT
    						FETCH registra_integrantes_evento INTO integrante_id, integrante_nome;
    							IF NOT done THEN
    								 if(LOCATE(integrante_nome, _integrantes)>0) then
      								 	INSERT INTO Integrantes_has_Evento (Integrantes_idIntegrantes,Evento_idEvento) VALUES (integrante_id, evento_id);
									 END IF;
    							END IF;
  						UNTIL done END REPEAT;
  					CLOSE registra_integrantes_evento;

  						return concat(_nome_cap,' cadastrado com sucesso! Use a função newPass() para atribuir ingressos ao evento.');
  					end//
DELIMITER ;

SET @var = newEvent("Planeta Terra 2015", "Jockey Sao Paulo", "O maior evento hipster do brasil", "25/02/2013", "Festival", "Maria, Paula, Marcos, Bruno Serra");
select @var;


SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE EVENT remove_reservas
ON SCHEDULE EVERY 1 DAY
DO BEGIN
Update Compra c inner join Compra_has_ingresso ci on ci.idCompra = c.idCompra inner join Ingresso i on i.idIngresso = ci.idIngresso set i.status = 1 where (c.data < current_date()) and  (c.tipo=1);
delete from Compra  where (`data` < current_date()) and tipo = 1;

end//

DELIMITER ;


DELIMITER //
CREATE PROCEDURE ingressosDisponiveis(IN _evento varchar(255))
BEGIN
	if((_evento = NULL) or (_evento = '')) then
		select e.nome as Nome, count(*) as "Qtd. Disponivel" from Ingresso i inner join Evento e on e.idEvento = i.idEvento where (e.data >= current_date())  and (i.status = 1) group by e.nome;
	else 
		select e.nome as Nome, count(*) as "Qtd. Disponivel" from Ingresso i inner join Evento e on e.idEvento = i.idEvento where (e.data >= current_date())  and (i.status = 1) and (e.nome = _evento)group by e.nome;
	end if;
END//
DELIMITER ;

-- call ingressosDisponiveis("")

DELIMITER //
CREATE PROCEDURE ingressosReservados()
BEGIN
select u.nome as "Solicitante", e.nome as "Evento", DATE_FORMAT(c.data,"%d/%m/%Y") as "Dia da reserva",  c.qtd as "Qtd." from Compra c inner join Compra_has_ingresso ci on ci.idCompra = c.idCompra inner join Ingresso i on ci.idIngresso = i.idIngresso inner join Evento e on e.idEvento = i.idEvento inner join Usuario u on u.idUsuario = c.idUsuario where c.tipo = 1;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE listUsers(IN _nome varchar(255))
BEGIN
if((_nome = null) or (_nome = '')) then
	select nome as Nome, email as Email, cpf as CPF from Usuario;
else
	select nome as Nome, email as Email, cpf as CPF from Usuario where nome LIKE CONCAT('%',_nome,'%');
end if;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE buysPerUser(IN _nome varchar(255))
BEGIN
if((_nome = null) or (_nome = '')) then
	select u.nome as Nome, count(*) as 'Total de compras', sum(c.total) as 'Valor gasto R$' from Usuario u inner join Compra c on u.idUsuario = c.idUsuario where c.tipo = 0 group by u.nome ;
else
	SET @check = 0;
	select idUsuario into @check from Usuario where nome = _nome;
	if(@check >0) then
	select u.nome as Nome, count(*) as 'Total de compras', sum(c.total) as 'Valor gasto R$' from Usuario u inner join Compra c on u.idUsuario = c.idUsuario where (c.tipo = 0) and (u.nome = _nome) group by u.nome ;
	else 
	select 'Usuário não existe' as 'Atenção';
	end if;
end if;
END//
DELIMITER ;

-- call buysPerUser('Nilo Junior');

DELIMITER //
CREATE PROCEDURE lucrePerEvent(IN _nome varchar(255))
BEGIN
if((_nome = null) or (_nome = '')) then
select e.nome, sum(c.total) as "Arrecadado R$"  from Evento e inner join Ingresso i on i.idEvento = e.idEvento inner join Compra_has_ingresso ci on ci.idIngresso = i.idIngresso inner join Compra c on c.idCompra = ci.idCompra  where (c.tipo=0) group by e.nome;
else
	SET @check = 0;
	select idEvento into @check from Evento where nome = _nome;
	if(@check >0) then
	select e.nome, sum(c.total) as "Arrecadado R$"  from Evento e inner join Ingresso i on i.idEvento = e.idEvento inner join Compra_has_ingresso ci on ci.idIngresso = i.idIngresso inner join Compra c on c.idCompra = ci.idCompra where (c.tipo=0) and (e.nome = _nome) group by e.nome;
	else 
	select 'Evento não existe' as 'Atenção';
	end if;
end if;
END//
DELIMITER ;

-- call lucrePerEvent("planeta terra 2014");

DELIMITER //
CREATE PROCEDURE membersPerEvent(IN _nome varchar(255))
BEGIN
if((_nome = null) or (_nome = '')) then
select e.nome, count(*) as "Qtd. Integrantes" from Evento e inner join Integrantes_has_Evento ie on e.idEvento = ie.Evento_idEvento group by e.nome;
else
	SET @check = 0;
	select idEvento into @check from Evento where nome = _nome;
	if(@check >0) then
	select i.nome as 'Integrantes do evento' from Evento e inner join Integrantes_has_Evento ie on e.idEvento = ie.Evento_idEvento inner join Integrantes i  on i.idIntegrantes = Integrantes_idIntegrantes where e.nome = _nome;
		else 
	select 'Evento não existe' as 'Atenção';
	end if;
end if;
END//
DELIMITER ;

-- call membersPerEvent("");

DELIMITER //
CREATE PROCEDURE formPay()
BEGIN
select fp.nome as "Forma de Pagamento", count(*) as "Qtd." from Pagamento p inner join Forma_Pagamento fp on p.idForma_Pagamento = fp.idForma_Pagamento group by fp.nome;
END//
DELIMITER ;

-- call formPay()


DELIMITER //
CREATE PROCEDURE toReceive()
BEGIN
select TRUNCATE(SUM(valor),2) as "Total a Receber" from Pagamento where vencimento > current_date();
END//
DELIMITER ;

-- call toReceive()

DELIMITER //
CREATE PROCEDURE toReceiveFromUser(IN _nome varchar(255))
BEGIN
SET @check = 0;
	select idUsuario into @check from Usuario where nome = _nome;
	if(@check >0) then
select u.nome, sum(p.valor) as "A Receber" from Usuario u inner join Compra c on c.idUsuario = u.idUsuario inner join Pagamento p on p.idCompra = c.idCompra where (vencimento > current_date()) and (u.nome = "Bruno Serra Barboza") group by u.nome;
else 
	select 'Usuario não existe' as 'Atenção';
end if;
END//
DELIMITER ;

-- call toReceiveFromUser('Bruno Serra Barboza')


DELIMITER //
CREATE PROCEDURE inadimplente()
BEGIN
select u.nome as Inadimplente, p.valor as "Valor Parcela", DATE_FORMAT(p.vencimento,"%d/%m/%Y") as 'Venceu em', e.nome as Evento from Pagamento p inner join Compra c on p.idCompra = c.idCompra inner join Usuario u on u.idUsuario = c.idUsuario inner join Compra_has_ingresso ci on c.idCompra = ci.idCompra inner join Ingresso i on i.idIngresso = ci.idIngresso inner join Evento e on e.idEvento = i.idEvento where (vencimento < current_date()) and (p.status =0);
END//
DELIMITER ;

-- call inadimplente()



DELIMITER //
CREATE PROCEDURE eventsPerPlace(IN _nome varchar(255))
BEGIN
SET @check = 0;
	select idAmbiente into @check from Ambiente where nome = _nome;
	if(@check >0) then
select e.nome as 'Eventos' from Ambiente a inner join Evento e on e.idAmbiente = a.idAmbiente where a.nome = _nome;
else 
	select 'Ambiente não existe' as 'Atenção';
end if;
END//
DELIMITER ;

-- call inadimplente()


DELIMITER //
CREATE function registerPass(_nome varchar(255), _setor varchar(255), _valor FLOAT, _qtd INT) returns varchar(255)
BEGIN

	declare i INT DEFAULT 0;
	 
	if(((_nome = '') or (_nome = null)) or ((_setor = '') or (_setor = null)) or ((_valor = '') or (_valor = null) or (_valor <0 )) or ((_qtd = '') or (_qtd = null) or (_qtd<=0))) then
		return 'Por Favor, preencha os valores corretamente.';
		end if;
		
	SET @evento_id = 0;
	select idEvento, idAmbiente, nome into @evento_id, @ambiente_id, @e_nome from Evento where nome = _nome;
	if(@evento_id=0) then
		return 'Evento nao existe.';
	end if;
	
	
	SET @setor_id = 0;
	select idSetor into @setor_id from Setor where nome = _setor;
	if(@setor_id=0) then
		return 'Setor Nao existe';
	end if;
	
	SET @check = 0;
	select idSetor, capacidade into @check, @capacidade from Ambiente_has_setor where (idSetor = @setor_id) and (idAmbiente = @ambiente_id);
	if(@check=0) then
		return 'Ambiente nao suporta esse setor';
	end if;
	
	SET @ajuste = 0;
	select count(*) into @ajuste from Ingresso where (idEvento = @evento_id) and (idSetor = @setor_id);
	
	if(@ajuste >0)then
		SET _qtd = _qtd - @ajuste;
	end if;
	
	if(_qtd>@capacidade)then
		return concat('Voce só pode cadastrar ',@check,' ingressos para esse setor.');	
	end if;

	
	while (i < _qtd) do
		insert into Ingresso (idEvento, valor, idSetor, `status`) values (@evento_id, _valor, @setor_id,0);
		SET i = i +1;
	end while;
	
	if(_qtd != 0)then
		return concat(_qtd,' ingressos cadastrados ao evento ',@e_nome);
	else
		return 'Capacidade do setor atingida. Escolha outro setor.';
	end if;

END//
DELIMITER ;

-- call inadimplente()

-- SET @teste = registerPass("Lollapalooza", 'pista', 300, 10) ;
-- select @teste;
DELIMITER //
create function buyReserva(_codigo INT, _fp varchar(255), _parcelas INT) returns varchar(255)
begin
DECLARE valor_parcela INT;
declare contador INT default 0;
		if(_codigo = '' or _fp = '' or _parcelas = null or _parcelas <=0)then
			return 'Preencha os campos corretamente';
		end if;
		
		SET @compra_id = 0;
		select idCompra, total, idUsuario into @compra_id, @valor, @usuario_id from Compra where (idCompra = _codigo) and (tipo=1);
		
		select nome into @nome from Usuario where idUsuario = @usuario_id;
		
		if(@compra_id =0)then
			return 'Reservar expirou ou não existe';
		end if;

			SET @fp_id  = 0;
	SET @vezes = 1;

	SELECT fp.idForma_Pagamento, fp.vezes into @fp_id, @vezes from Forma_Pagamento fp where LOWER(fp.nome) = _fp;
	
	IF(@fp_id=0) then return 'Forma de pagamento inválida.'; end if;
	
	if(((_parcelas<0) or (_parcelas>1)) and (_fp = 'a vista')) then 
		return 'Por favor, verifique a forma de pagamento !'; 
	end if;
	
	if((_parcelas=0) or (_parcelas >@vezes)) then 
		RETURN CONCAT('Quantidade de parcelas inválida. Só é possível dividir em ',@vezes,'x no ', _fp, '.'); 
	END IF;
	
	SET valor_parcela = @valor / @vezes;
	
	UPDATE Compra set tipo=0 where idCompra = @compra_id;
  					
  	IF (_fp = "a vista") then
  		insert into Pagamento (idForma_Pagamento, idCompra, `valor`, vencimento, `status`) values (@fp_id,@compra_id, valor_parcela, CURRENT_DATE(),1);
  	ELSE
  						while contador < @vezes DO
  							insert into Pagamento (idForma_Pagamento, idCompra, `valor`, vencimento) values (@fp_id,@compra_id, valor_parcela, date_add(CURRENT_DATE(), interval contador month));
  							SET contador = contador + 1;
  						END WHILE ;
  	end if;
  					
	return concat('Sucesso! Comprador: ',@nome,'.\nForma de Pagamento: ', _fp, '.\nParcelas: ',_parcelas);


end//
DELIMITER ;

SET @teste = buyReserva(16, 'cartao', 2);
select @teste;



delimiter //
create function setor_am(_ambiente varchar(255), _setor varchar(255)) returns varchar(255)
begin

	SET @compra_i = 0;
		select `idAmbiente` into @compra_i from Ambiente where (nome = _ambiente);

		if(@compra_i =0)then
			return 'Ambiente não existe';
		end if;


			SET @compra_id = 0;
		select `idSetor` into @compra_id from Setor where (nome = _setor);

		if(@compra_id =0)then
			return 'Setor não existe';
		end if;
		
		
				SET @check = 0;
		select `idSetor` into @check from Ambiente_has_setor where (idSetor = @compra_id) and (idAmbiente = @compra_i);

		if(@check =0)then
			return 'Setor já cadastrado no ambiente';
		end if;
		
		

		insert into Ambiente_has_setor (idAmbiente, idSetor) values (@compra_i, @compra_id);
		return concat(_setor,' foi cadastrado ao ambiente ', _ambiente,' com sucesso !');


end//
delimiter ;