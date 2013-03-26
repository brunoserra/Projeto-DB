
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Ambiente
# ------------------------------------------------------------

CREATE TABLE `Ambiente` (
  `idAmbiente` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Ambiente` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAmbiente`),
  KEY `fk_Ambiente_Tipo_Ambiente1` (`idTipo_Ambiente`),
  CONSTRAINT `fk_Ambiente_Tipo_Ambiente1` FOREIGN KEY (`idTipo_Ambiente`) REFERENCES `Tipo_Ambiente` (`idTipo_Ambiente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table categoria
# ------------------------------------------------------------

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;

INSERT INTO `categoria` (`idcategoria`, `descricao`)
VALUES
	(1,'festival');

/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Compra
# ------------------------------------------------------------

CREATE TABLE `Compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_Compra_Usuario` (`idUsuario`),
  CONSTRAINT `fk_Compra_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;

INSERT INTO `Compra` (`idCompra`, `idUsuario`, `data`, `total`, `qtd`)
VALUES
	(1,1,'2013-03-25',400,1),
	(2,1,'2013-03-25',400,1);

/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Compra_has_ingresso
# ------------------------------------------------------------

CREATE TABLE `Compra_has_ingresso` (
  `idCompra` int(11) DEFAULT NULL,
  `idIngresso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Compra_has_ingresso` WRITE;
/*!40000 ALTER TABLE `Compra_has_ingresso` DISABLE KEYS */;

INSERT INTO `Compra_has_ingresso` (`idCompra`, `idIngresso`)
VALUES
	(1,1),
	(2,2);

/*!40000 ALTER TABLE `Compra_has_ingresso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Evento
# ------------------------------------------------------------

CREATE TABLE `Evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `resumo` varchar(45) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `fk_Evento_categoria1` (`idcategoria`),
  CONSTRAINT `fk_Evento_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Evento` WRITE;
/*!40000 ALTER TABLE `Evento` DISABLE KEYS */;

INSERT INTO `Evento` (`idEvento`, `idcategoria`, `descricao`, `data`, `resumo`, `imagem`, `nome`)
VALUES
	(1,1,'aiuedhiauehdiaudh','2012-12-12','aduhaisuhd','audha','Lollapalooza');

/*!40000 ALTER TABLE `Evento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Forma_Pagamento
# ------------------------------------------------------------

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

CREATE TABLE `Ingresso` (
  `idIngresso` int(11) NOT NULL AUTO_INCREMENT,
  `idEvento` int(11) NOT NULL,
  `idSetor` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`idIngresso`,`idEvento`),
  KEY `fk_Ingresso_Evento1` (`idEvento`),
  CONSTRAINT `fk_Ingresso_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Ingresso` WRITE;
/*!40000 ALTER TABLE `Ingresso` DISABLE KEYS */;

INSERT INTO `Ingresso` (`idIngresso`, `idEvento`, `idSetor`, `valor`, `tipo`, `status`)
VALUES
	(1,1,1,400,'1',0),
	(2,1,1,400,'1',0),
	(3,1,1,400,'1',1);

/*!40000 ALTER TABLE `Ingresso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Integrantes
# ------------------------------------------------------------

CREATE TABLE `Integrantes` (
  `idIntegrantes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idIntegrantes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Integrantes_has_Evento
# ------------------------------------------------------------

CREATE TABLE `Integrantes_has_Evento` (
  `Integrantes_idIntegrantes` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`Integrantes_idIntegrantes`,`Evento_idEvento`),
  KEY `fk_Integrantes_has_Evento_Evento1` (`Evento_idEvento`),
  KEY `fk_Integrantes_has_Evento_Integrantes1` (`Integrantes_idIntegrantes`),
  CONSTRAINT `fk_Integrantes_has_Evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Integrantes_has_Evento_Integrantes1` FOREIGN KEY (`Integrantes_idIntegrantes`) REFERENCES `Integrantes` (`idIntegrantes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Pagamento
# ------------------------------------------------------------

CREATE TABLE `Pagamento` (
  `idPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `idForma_Pagamento` int(11) NOT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  PRIMARY KEY (`idPagamento`,`idForma_Pagamento`),
  KEY `fk_Pagamento_Forma_Pagamento1` (`idForma_Pagamento`),
  CONSTRAINT `fk_Pagamento_Forma_Pagamento1` FOREIGN KEY (`idForma_Pagamento`) REFERENCES `Forma_Pagamento` (`idForma_Pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;

INSERT INTO `Pagamento` (`idPagamento`, `idForma_Pagamento`, `idCompra`, `valor`, `vencimento`)
VALUES
	(4,2,1,133.333,'2013-04-25'),
	(5,2,1,133.333,'2013-05-25'),
	(6,2,1,133.333,'2013-06-25'),
	(7,1,2,400,'2013-03-25');

/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Reserva
# ------------------------------------------------------------

CREATE TABLE `Reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idReserva`,`idUsuario`),
  KEY `fk_Reserva_Usuario1` (`idUsuario`),
  CONSTRAINT `fk_Reserva_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Setor
# ------------------------------------------------------------

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

CREATE TABLE `Tipo_Ambiente` (
  `idTipo_Ambiente` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Ambiente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Usuario
# ------------------------------------------------------------

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




