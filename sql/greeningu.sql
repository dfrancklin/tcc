create database greeningu;

use greeningu;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(30) DEFAULT NULL,
	`login` varchar(10) DEFAULT NULL,
	`nome` varchar(20) DEFAULT NULL,
	`pontuacao` int(11) DEFAULT NULL,
	`senha` varchar(12) DEFAULT NULL,
	`sexo` varchar(1) DEFAULT NULL,
	`sobrenome` varchar(30) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comunidade`;
CREATE TABLE `comunidade` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`data` datetime DEFAULT NULL,
	`name` varchar(45) DEFAULT NULL,
	`lider_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `FKsyi2y58soh5hibwfql4khbwm3` (`lider_id`),
	CONSTRAINT `FKsyi2y58soh5hibwfql4khbwm3` FOREIGN KEY (`lider_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `usuario_comunidade`;
CREATE TABLE `usuario_comunidade` (
	`usuarios_id` int(11) NOT NULL,
	`assinaturas_id` int(11) NOT NULL,
	KEY `FKp2we5sgvbife63a623618n7kt` (`assinaturas_id`),
	KEY `FKisvgm67i3vh3iqj5i8pt5mito` (`usuarios_id`),
	CONSTRAINT `FKisvgm67i3vh3iqj5i8pt5mito` FOREIGN KEY (`usuarios_id`) REFERENCES `usuario` (`id`),
	CONSTRAINT `FKp2we5sgvbife63a623618n7kt` FOREIGN KEY (`assinaturas_id`) REFERENCES `comunidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`data` datetime DEFAULT NULL,
	`descricao` varchar(100) DEFAULT NULL,
	`imagem` longtext,
	`titulo` varchar(20) DEFAULT NULL,
	`comunidade_id` int(11) DEFAULT NULL,
	`usuario_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `FK2bwtlk26cusreo8lfxskohk14` (`comunidade_id`),
	KEY `FK27q2ean2bp3015mcu7a5ukacn` (`usuario_id`),
	CONSTRAINT `FK27q2ean2bp3015mcu7a5ukacn` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
	CONSTRAINT `FK2bwtlk26cusreo8lfxskohk14` FOREIGN KEY (`comunidade_id`) REFERENCES `comunidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`data` datetime DEFAULT NULL,
	`texto` varchar(100) DEFAULT NULL,
	`post_id` int(11) DEFAULT NULL,
	`usuario_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `FK5tm5pw9ofhc1dxw2xulc348jg` (`post_id`),
	KEY `FKixspmid2pb85o8ypsd20jakxg` (`usuario_id`),
	CONSTRAINT `FK5tm5pw9ofhc1dxw2xulc348jg` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
	CONSTRAINT `FKixspmid2pb85o8ypsd20jakxg` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voto`;
CREATE TABLE `voto` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`data` datetime DEFAULT NULL,
	`pontos` int(11) DEFAULT NULL,
	`post_id` int(11) DEFAULT NULL,
	`usuario_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `FKn80k52xdd4ryuilahtgcco5co` (`post_id`),
	KEY `FKi9ulyrisn6f8ccd2lwpsbk382` (`usuario_id`),
	CONSTRAINT `FKi9ulyrisn6f8ccd2lwpsbk382` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
	CONSTRAINT `FKn80k52xdd4ryuilahtgcco5co` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `usuario`
VALUES
	(1,NULL,NULL,'Frodo',8,NULL,NULL,'Baggins'),
	(2,NULL,NULL,'Frodo 2',10,NULL,NULL,'Baggins 2');

INSERT INTO `comunidade`
VALUES
	(1,'2017-10-25 00:00:00','Comunidade #1',1),
	(2,'2017-10-25 00:00:00','Comunidade #2',2);

INSERT INTO `post`
VALUES
	(1,'2017-10-25 00:00:00','Lorem ipsum',NULL,'Post #1',1,1),
	(2,'2017-10-25 00:00:00','Lorem ipsum',NULL,'Post #2',1,1),
	(3,'2017-10-25 00:00:00','Lorem ipsum',NULL,'Post #3',1,2);
