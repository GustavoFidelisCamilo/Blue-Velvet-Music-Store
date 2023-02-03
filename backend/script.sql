CREATE DATABASE IF NOT EXISTS BlueVelvet;
USE BlueVelvet;

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `pnumero` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `nome_artista` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pnumero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO `produtos` (`pnumero`,`nome`,`preco`,`nome_artista`) VALUES 
 (1,'Flower Boy','25.99','Tyler The Creator'),
 (2,'The Predator','19.50','Ice Cube'),
 (3,'The Eminem Show','39.99','Eminem');



DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `unumero` int(11) NOT NULL AUTO_INCREMENT,
  `pnome` varchar(50) DEFAULT NULL,
  `minicial` varchar(50) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  `unome` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unumero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `user` (`unumero`,`pnome`,`minicial`,`datanasc`,`unome`,`endereco`,`sexo`) VALUES 
 (1,'Mirtes',NULL,NULL,NULL,NULL,'feminino'),
 (12,'Carlos',NULL,NULL,NULL,NULL,'masculino'),
 (123,'Marcio','M','1981-08-09','Souza','Rua 6 n 7','masculino'),
 (1234,'Marta','S','1987-02-01','Lunes','','feminino'),
 (12345,'Mariane','Moreira','1983-07-25','Souza','Rua 1 n 2','feminino'),
 (98765,'Melise','Maria','1982-07-25','Veiga','Rua 3 n 4','feminino'),
 (123456,'Michel',NULL,NULL,NULL,NULL,'masculino'),
 (123456789,'JoÃ£o','M','1971-08-25','Souza',NULL,'masculino'),
 (987654321,'Eliseu','Cesar','1981-06-21','Miguel','Rua 5 n 6','masculino'),
 (2147483647,'JosÃ©','M','1987-09-07','Moraes','Rua 7 n 8','masculino');

DROP TABLE IF EXISTS `role`;

-- Criação da tabela `role`
CREATE TABLE `role` (
    `rnumero` int(11) NOT NULL AUTO_INCREMENT,
    `nome` varchar(50) DEFAULT NULL,
    `descricao` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`rnumero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `role` (`rnumero`, `nome`, `descricao`) VALUES
 (1, "ADM", "O ADM"),
 (2, "Cliente", "O Cliente"),
 (3, "Guest", "O Guest");

CREATE TABLE `role_user`(
    `rnumero` int(11) NOT NULL,
    `unumero` int(11) NOT NULL,
    PRIMARY KEY (`rnumero`,`unumero`),
    CONSTRAINT `fk_user_role_user` FOREIGN KEY (`unumero`) REFERENCES `user` (`unumero`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_role_user_role` FOREIGN KEY (`rnumero`) REFERENCES `role` (`rnumero`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `role_user` (`rnumero`, `unumero`) VALUES
 (1, 1),
 (2, 12),
 (3, 123),
 (1, 1234),
 (2, 12345),
 (3, 98765);
 
SELECT * FROM role r, role_user ru, user u WHERE ru.rnumero = r.rnumero and ru.unumero = u.unumero;
