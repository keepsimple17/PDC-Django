# ************************************************************
# Sequel Pro SQL dump
# Vers�o 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 177.85.98.245 (MySQL 5.6.38)
# Base de Dados: port4lfo_crm-pdc
# Tempo de Gera��o: 2018-03-06 16:12:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela accounts_conta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts_conta`;

CREATE TABLE `accounts_conta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `sobrenome` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` smallint(5) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_conta_slug_bb70a4f5` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `accounts_conta` WRITE;
/*!40000 ALTER TABLE `accounts_conta` DISABLE KEYS */;

INSERT INTO `accounts_conta` (`id`, `nome`, `sobrenome`, `email`, `password`, `role`, `status`, `start_date`, `slug`, `description`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Paulino','Rocha e Silva','paulino@neoplace.com.br','assadas',7,1,'2017-09-18','Paul','Administrador da porra toda','images/PaulContact.gif','2017-09-18 22:14:31.825092','2017-09-18 22:14:31.825137');

/*!40000 ALTER TABLE `accounts_conta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela accounts_equipe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts_equipe`;

CREATE TABLE `accounts_equipe` (
  `created_at` datetime(6) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_MembroEquipe` int(11) NOT NULL,
  `Id_Candidato` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `CPF` varchar(16) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `DataNascimento` date DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `emailEquipe` varchar(100) NOT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Cidade` varchar(60) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `Telefone` varchar(12) DEFAULT NULL,
  `Celular` varchar(12) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `Obs` longtext,
  `NivelAcessoMembro` int(11) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `AcessoGestCamp` smallint(5) unsigned NOT NULL,
  `AcessoGestFin` smallint(5) unsigned NOT NULL,
  `AcessoGestGab` smallint(5) unsigned NOT NULL,
  `Role` varchar(60) NOT NULL,
  `candidato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_equipe_slug_41161db3` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `accounts_equipe` WRITE;
/*!40000 ALTER TABLE `accounts_equipe` DISABLE KEYS */;

INSERT INTO `accounts_equipe` (`created_at`, `id`, `Id_MembroEquipe`, `Id_Candidato`, `Id_User`, `CPF`, `nome`, `sexo`, `DataNascimento`, `foto`, `emailEquipe`, `CEP`, `Endereco`, `Cidade`, `UF`, `Telefone`, `Celular`, `slug`, `Obs`, `NivelAcessoMembro`, `updated_at`, `AcessoGestCamp`, `AcessoGestFin`, `AcessoGestGab`, `Role`, `candidato`)
VALUES
	('2017-09-18 22:01:45.000000',1,1,1,1,'87528231991','Paulino Rocha e Silva','m','1973-11-04','images/FotosEquipe/Ogro_da_Floresta.jpg','paulino@neoplace.com.br','80240-050','Rua Pettit Carneiro, 632','Curitiba','PR','41 32442734','41 9 9209996','Paul','Lindo, gostoso e fortão',1,'2017-09-18 22:04:42.405058',7,7,7,'Administrador','João Dória');

/*!40000 ALTER TABLE `accounts_equipe` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela Articuladores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Articuladores`;

CREATE TABLE `Articuladores` (
  `id_Articulador` int(11) NOT NULL,
  `Id_Candidato` int(11) DEFAULT NULL,
  `Id_Referencia` int(11) DEFAULT NULL,
  `Id_Comite` int(11) DEFAULT NULL,
  `CPF_Articulador` varchar(30) DEFAULT NULL,
  `NomeArticulador` varchar(100) DEFAULT NULL,
  `End_Articulador` varchar(255) DEFAULT NULL,
  `Tel_Articulador` varbinary(12) DEFAULT NULL,
  `Cel_Articulador` varchar(12) DEFAULT NULL,
  `Cidade_Articulador` int(11) DEFAULT NULL,
  `UF_Articulador` int(11) DEFAULT NULL,
  `Email_Articulador` varchar(60) DEFAULT NULL,
  `WhatsApp_Articulador` varchar(255) DEFAULT NULL,
  `Religiao_art` int(11) DEFAULT NULL,
  `Org_Articulador` int(11) DEFAULT NULL,
  `DataEntradaArticulador` date DEFAULT NULL,
  `Facebook` varchar(50) DEFAULT NULL,
  `Twitter` varchar(50) DEFAULT NULL,
  `Linkedin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Articulador`),
  UNIQUE KEY `id_Articulador` (`id_Articulador`),
  KEY `Id_Candidato_idxfk` (`Id_Candidato`),
  KEY `Religiao_art_idxfk` (`Religiao_art`),
  KEY `Org_Articulador_idxfk` (`Org_Articulador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Assinaturas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Assinaturas`;

CREATE TABLE `Assinaturas` (
  `IdAssinatura` int(11) NOT NULL,
  `TipoAssinatura` int(11) DEFAULT NULL,
  `PeriodosAssinatura` int(11) DEFAULT NULL,
  `PercDescontoAd` double DEFAULT NULL,
  `ValorAssinatura` double DEFAULT NULL,
  `DataAssinatura` date DEFAULT NULL,
  `DataPagto` date DEFAULT NULL,
  `DataProxVenc` date DEFAULT NULL,
  `IdFranqueado` int(11) DEFAULT NULL,
  `Refenc` varchar(255) DEFAULT NULL,
  `ObsAssinatura` tinytext,
  PRIMARY KEY (`IdAssinatura`),
  UNIQUE KEY `IdAssinatura` (`IdAssinatura`),
  KEY `TipoAssinatura_idxfk` (`TipoAssinatura`),
  KEY `PeriodosAssinatura_idxfk` (`PeriodosAssinatura`),
  KEY `IdFranqueado_idxfk_1` (`IdFranqueado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela atividades_evento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `atividades_evento`;

CREATE TABLE `atividades_evento` (
  `created_at` datetime(6) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Candidato` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `Importancia` smallint(5) unsigned NOT NULL,
  `origem` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `reference` varchar(40) DEFAULT NULL,
  `mensagem` longtext,
  `about` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `atividades_evento_slug_ef2e6aee` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `atividades_evento` WRITE;
/*!40000 ALTER TABLE `atividades_evento` DISABLE KEYS */;

INSERT INTO `atividades_evento` (`created_at`, `id`, `id_Candidato`, `Id_User`, `updated_at`, `Importancia`, `origem`, `title`, `slug`, `reference`, `mensagem`, `about`)
VALUES
	('2017-09-21 18:33:30.000000',1,1,1,'2017-09-21 19:36:45.085173',1,0,'Atualização de Interface','atualizacao-de-interface','https://goo.gl/LkMufH','Atualizada base de dados PDC',''),
	('2017-09-20 00:00:00.000000',2,1,1,'2017-09-21 19:38:53.834378',1,1,'Banco de Dados Fora do Ar','banco-de-dados-fora-do-ar',NULL,'O banco de dados ficou fora do ar',''),
	('2017-09-21 19:39:16.000000',3,1,1,'2017-09-21 19:40:22.526669',3,1,'Manual do Candidato Disponível','manual-do-candidato-disponivel',NULL,'Novo manual para o candidato atualizado no sistema',''),
	('2017-09-19 12:00:00.000000',4,1,1,'2017-09-21 19:42:02.236608',4,2,'Novo usuário adicionado','novo-usuario-adicionado',NULL,'Usuário paulino@neoplace.com.br adicionado na equipe',''),
	('2017-09-20 00:00:00.000000',5,1,1,'2017-09-21 19:44:14.473136',3,3,'João solicitou relatório','joao-solicitou-relatorio',NULL,'Relatório de Visitas Orgânicas Solicitada por João',''),
	('2017-09-11 19:19:00.000000',6,1,1,'2017-09-21 19:46:29.267929',3,5,'Notícia Globo','noticia-globo','https://g1.globo.com/sao-paulo/noticia/e','Em evento com Alckmin e Doria, FHC defende prévias do PSDB',''),
	('2017-09-14 18:00:00.000000',7,1,1,'2017-09-21 19:47:45.582118',3,7,'Nova doação de campanha','nova-doacao-de-campanha',NULL,'Você recebeu uma nova doação',''),
	('2017-09-21 19:48:10.000000',8,1,1,'2017-09-21 19:49:02.802005',2,8,'Detratação Facebook','detratacao-facebook','www.facebook.com','Nova retratação do Facebook Identificada','');

/*!40000 ALTER TABLE `atividades_evento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump da tabela auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump da tabela auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add permission',3,'add_permission'),
	(8,'Can change permission',3,'change_permission'),
	(9,'Can delete permission',3,'delete_permission'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add dependency',7,'add_dependency'),
	(20,'Can change dependency',7,'change_dependency'),
	(21,'Can delete dependency',7,'delete_dependency'),
	(22,'Can add conta',8,'add_conta'),
	(23,'Can change conta',8,'change_conta'),
	(24,'Can delete conta',8,'delete_conta'),
	(25,'Can add equipe',9,'add_equipe'),
	(26,'Can change equipe',9,'change_equipe'),
	(27,'Can delete equipe',9,'delete_equipe'),
	(28,'Can add Atividade',10,'add_evento'),
	(29,'Can change Atividade',10,'change_evento'),
	(30,'Can delete Atividade',10,'delete_evento');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$36000$GVbWnhYblA8B$gei26AmlqLr9VMLw9lYv7SEqXgNkeuYuNyxqfQYBCOc=','2017-06-25 16:02:03.000000',1,'paul','Paulino','R. e Silva','paulino@neoplace.com.br',1,1,'2017-06-22 20:09:01.000000'),
	(2,'pbkdf2_sha256$36000$DvXhIcKGy4vz$kYbQkau8mWKM08LR+dr9nA56YWPWtKhfwteP3J5x5pM=','2018-03-05 13:59:44.269064',1,'paulino','','','paulino.rsilva@gmail.com',1,1,'2017-06-26 15:43:45.190582'),
	(3,'pbkdf2_sha256$36000$OVBY04l54Gv3$gdysNW9LSj2e0qi5RaQ3SV3e69KCxMDsid0g/a0SB7k=','2017-06-26 16:07:13.969512',1,'paulrsilva','','','paulino@neoplace.com.br',1,1,'2017-06-26 16:06:38.136806');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump da tabela auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump da tabela Candidato
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Candidato`;

CREATE TABLE `Candidato` (
  `id_Candidato` int(11) NOT NULL,
  `Reference_id` int(11) DEFAULT NULL,
  `NomeCandidato` varchar(255) DEFAULT NULL,
  `CPF_Candidato` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ApelidoPolitico` varchar(50) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `Email_candidato` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `Celular` varchar(14) DEFAULT NULL,
  `Telefone` varchar(14) DEFAULT NULL,
  `Pleito` varchar(20) DEFAULT NULL,
  `CargoDisputa` varchar(40) DEFAULT NULL,
  `UFDisputa` varchar(2) DEFAULT NULL,
  `CidadeDisputa` varchar(70) DEFAULT NULL,
  `id_Partido` int(11) DEFAULT NULL,
  `Numero_Candidato` varchar(5) DEFAULT NULL,
  `Coligacao` varchar(255) DEFAULT NULL,
  `ExerceCargo` bit(1) DEFAULT NULL,
  `Reeleicao` bit(1) DEFAULT NULL,
  `JaConcorreu` bit(1) DEFAULT NULL,
  `SituacaoCandidato` int(11) DEFAULT NULL,
  `UF_Candidato` int(11) DEFAULT NULL,
  `Cidade_Candidato` int(11) DEFAULT NULL,
  `Endereço_Candidato` varchar(255) DEFAULT NULL,
  `Resumo` text,
  `Obs` tinyblob,
  `facebook` varchar(60) DEFAULT NULL,
  `twitter` varchar(60) DEFAULT NULL,
  `google` varchar(60) DEFAULT NULL,
  `instagram` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_Candidato`),
  UNIQUE KEY `id_Candidato` (`id_Candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Candidato` WRITE;
/*!40000 ALTER TABLE `Candidato` DISABLE KEYS */;

INSERT INTO `Candidato` (`id_Candidato`, `Reference_id`, `NomeCandidato`, `CPF_Candidato`, `foto`, `ApelidoPolitico`, `Sexo`, `data_nascimento`, `Email_candidato`, `site`, `Celular`, `Telefone`, `Pleito`, `CargoDisputa`, `UFDisputa`, `CidadeDisputa`, `id_Partido`, `Numero_Candidato`, `Coligacao`, `ExerceCargo`, `Reeleicao`, `JaConcorreu`, `SituacaoCandidato`, `UF_Candidato`, `Cidade_Candidato`, `Endereço_Candidato`, `Resumo`, `Obs`, `facebook`, `twitter`, `google`, `instagram`)
VALUES
	(0,0,'João Doria','000.000.000/00',NULL,'Doria','M','1965-03-03','doria@candidato','','','','2016','prefeito','','',0,'','PSDB,PT,DEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,' ',NULL,'','','','');

/*!40000 ALTER TABLE `Candidato` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela Candidato2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Candidato2`;

CREATE TABLE `Candidato2` (
  `id_Candidato` int(11) NOT NULL,
  `Reference_id` int(11) DEFAULT NULL,
  `NomeCandidato` varchar(255) DEFAULT NULL,
  `CPF_Candidato` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ApelidoPolitico` varchar(50) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `Email_candidato` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `Celular` varchar(14) DEFAULT NULL,
  `Telefone` varchar(14) DEFAULT NULL,
  `Pleito` varchar(20) DEFAULT NULL,
  `CargoDisputa` varchar(40) DEFAULT NULL,
  `UFDisputa` varchar(2) DEFAULT NULL,
  `CidadeDisputa` varchar(70) DEFAULT NULL,
  `id_Partido` int(11) DEFAULT NULL,
  `Numero_Candidato` varchar(5) DEFAULT NULL,
  `Coligacao` varchar(255) DEFAULT NULL,
  `ExerceCargo` bit(1) DEFAULT NULL,
  `Reeleicao` bit(1) DEFAULT NULL,
  `JaConcorreu` bit(1) DEFAULT NULL,
  `SituacaoCandidato` int(11) DEFAULT NULL,
  `UF_Candidato` int(11) DEFAULT NULL,
  `Cidade_Candidato` int(11) DEFAULT NULL,
  `Endereço_Candidato` varchar(255) DEFAULT NULL,
  `Resumo` text,
  `Obs` tinyblob,
  PRIMARY KEY (`id_Candidato`),
  UNIQUE KEY `id_Candidato` (`id_Candidato`),
  KEY `id_Partido_idxfk` (`id_Partido`),
  KEY `UF_Candidato_idxfk` (`UF_Candidato`),
  KEY `Cidade_Candidato_idxfk` (`Cidade_Candidato`),
  KEY `SituacaoCandidato_idxfk` (`SituacaoCandidato`),
  KEY `candidato_ibfk_1` (`Reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela ci_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `email` varchar(32) NOT NULL,
  `logged_in` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`, `usuario`, `email`, `logged_in`)
VALUES
	('c41291400c76deb700b4e01710ed4bb8bf06706d','::1',1505934264,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933343236343B','','',b'0'),
	('93225beb2a702bead05fad225c2267d279020358','::1',1505934467,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933343236363B666C6173685F6D6573736167657C733A34313A2246616C6861206465204C6F67696E2E20456D61696C206F752073656E686120696E636F727265746F73223B5F5F63695F766172737C613A313A7B733A31333A22666C6173685F6D657373616765223B733A333A226F6C64223B7D','','',b'0'),
	('e9e1236dcc051fba4c07b3c6f7ec115994176ea9','::1',1505934739,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933343538313B69647C733A313A2230223B757365726E616D657C733A303A22223B66697273745F6E616D657C733A373A225061756C696E6F223B6C6173745F6E616D657C733A31333A22526F63686120652053696C7661223B656D61696C7C733A32393A227061756C696E6F406F67726F6461666C6F72657374612E636F6D2E6272223B7365786F7C4E3B4350467C4E3B666F746F5F757365727C4E3B446174615F4E617363696D656E746F7C4E3B4E756D43656C756C61727C4E3B4E756D4669786F7C4E3B55467C4E3B4369646164657C4E3B4345507C4E3B456E647C4E3B637265617465647C733A31393A22323031372D30392D32302031363A31313A3439223B726F6C657C733A393A22617373696E616E7465223B6C6173745F6C6F67696E7C733A32323A22323031372D30392D32302030373A31313A353020504D223B7374617475737C733A383A226170726F7661646F223B656D61696C5F7665726966696361646F7C733A313A2231223B63656C756C61725F7665726966696361646F7C4E3B6C6F6761646F7C4E3B69645F63616E64696461746F7C4E3B69645573756172696F7C733A313A2230223B6C6F676765645F696E7C623A313B6E6F6D657C733A373A225061756C696E6F223B736F6272656E6F6D657C733A31333A22526F63686120652053696C7661223B','','',b'0'),
	('3cda3cfbc3c4016da5ed79feac53388892d7132e','::1',1505934912,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933343930343B69647C733A313A2230223B757365726E616D657C733A303A22223B66697273745F6E616D657C733A373A225061756C696E6F223B6C6173745F6E616D657C733A31333A22526F63686120652053696C7661223B656D61696C7C733A32393A227061756C696E6F406F67726F6461666C6F72657374612E636F6D2E6272223B7365786F7C4E3B4350467C4E3B666F746F5F757365727C4E3B446174615F4E617363696D656E746F7C4E3B4E756D43656C756C61727C4E3B4E756D4669786F7C4E3B55467C4E3B4369646164657C4E3B4345507C4E3B456E647C4E3B637265617465647C733A31393A22323031372D30392D32302031363A31313A3439223B726F6C657C733A393A22617373696E616E7465223B6C6173745F6C6F67696E7C733A32323A22323031372D30392D32302030373A31313A353020504D223B7374617475737C733A383A226170726F7661646F223B656D61696C5F7665726966696361646F7C733A313A2231223B63656C756C61725F7665726966696361646F7C4E3B6C6F6761646F7C4E3B69645F63616E64696461746F7C4E3B69645573756172696F7C733A313A2230223B6C6F676765645F696E7C623A313B6E6F6D657C733A373A225061756C696E6F223B736F6272656E6F6D657C733A31333A22526F63686120652053696C7661223B','','',b'0'),
	('a1ef5ebcdfb9f9b1920d50f96b00ef90c4c41b3a','::1',1505935441,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933353333333B69647C733A313A2230223B757365726E616D657C733A303A22223B66697273745F6E616D657C733A373A225061756C696E6F223B6C6173745F6E616D657C733A31333A22526F63686120652053696C7661223B656D61696C7C733A32393A227061756C696E6F406F67726F6461666C6F72657374612E636F6D2E6272223B7365786F7C4E3B4350467C4E3B666F746F5F757365727C4E3B446174615F4E617363696D656E746F7C4E3B4E756D43656C756C61727C4E3B4E756D4669786F7C4E3B55467C4E3B4369646164657C4E3B4345507C4E3B456E647C4E3B637265617465647C733A31393A22323031372D30392D32302031363A31313A3439223B726F6C657C733A393A22617373696E616E7465223B6C6173745F6C6F67696E7C733A32323A22323031372D30392D32302030373A31313A353020504D223B7374617475737C733A383A226170726F7661646F223B656D61696C5F7665726966696361646F7C733A313A2231223B63656C756C61725F7665726966696361646F7C4E3B6C6F6761646F7C4E3B69645F63616E64696461746F7C4E3B69645573756172696F7C733A313A2230223B6C6F676765645F696E7C623A313B6E6F6D657C733A373A225061756C696E6F223B736F6272656E6F6D657C733A31333A22526F63686120652053696C7661223B','','',b'0'),
	('e30c4fb5f7177c906dc30bdc344c3b92e9cc5cd3','::1',1505936260,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933363231303B666C6173685F6D6573736167657C733A34313A2246616C6861206465204C6F67696E2E20456D61696C206F752073656E686120696E636F727265746F73223B5F5F63695F766172737C613A313A7B733A31333A22666C6173685F6D657373616765223B733A333A226F6C64223B7D','','',b'0'),
	('75109aaa998d2c7bc5ecfef8a1c9f6c1b10fd520','::1',1505936702,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933363634303B666C6173685F6D6573736167657C733A34313A2246616C6861206465204C6F67696E2E20456D61696C206F752073656E686120696E636F727265746F73223B5F5F63695F766172737C613A313A7B733A31333A22666C6173685F6D657373616765223B733A333A226F6C64223B7D','','',b'0'),
	('9b9c83f6b26913756b620ae214e3dd64a4fe5976','::1',1505937334,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353933373238393B69645573756172696F7C733A313A2230223B656D61696C7C733A32333A22636F6E7461746F406E656F706C6163652E636F6D2E6272223B6C6F676765645F696E7C623A313B6E6F6D657C733A343A225061756C223B736F6272656E6F6D657C733A31333A22526F63686120652053696C7661223B','','',b'0'),
	('cddcbcd30e82d4aa82d7aab6721670e47f666416','::1',1505941126,X'5F5F63695F6C6173745F726567656E65726174657C693A313530353934313132363B69645573756172696F7C733A313A2230223B656D61696C7C733A32333A22636F6E7461746F406E656F706C6163652E636F6D2E6272223B6C6F676765645F696E7C623A313B6E6F6D657C733A343A225061756C223B736F6272656E6F6D657C733A31333A22526F63686120652053696C7661223B','','',b'0');

/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela cidade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `idcidade` char(5) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `idestado` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Cidades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cidades`;

CREATE TABLE `Cidades` (
  `Id_Cidade` int(11) NOT NULL,
  `Id_UF` int(11) DEFAULT NULL,
  `Cidade` varchar(255) DEFAULT NULL,
  `NumHabCidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Cidade`),
  UNIQUE KEY `Id_Cidade` (`Id_Cidade`),
  KEY `Id_UF_idxfk` (`Id_UF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Comissoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Comissoes`;

CREATE TABLE `Comissoes` (
  `IdFranqueado` int(11) DEFAULT NULL,
  `DataComissao` int(11) DEFAULT NULL,
  `RefAssinatura` int(11) DEFAULT NULL,
  `StatusFranqData` varchar(10) DEFAULT NULL,
  `ValorComissao` double DEFAULT NULL,
  `DataPagto` date DEFAULT NULL,
  `ValorPago` bit(1) DEFAULT NULL,
  KEY `IdFranqueado_idxfk` (`IdFranqueado`),
  KEY `RefAssinatura_idxfk` (`RefAssinatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Comites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Comites`;

CREATE TABLE `Comites` (
  `id_Comite` int(11) NOT NULL,
  `id_Candidato` int(11) DEFAULT NULL,
  `NomeResp` varchar(255) DEFAULT NULL,
  `CPF_RepComite` int(11) DEFAULT NULL,
  `UF` int(11) DEFAULT NULL,
  `Cidade` int(11) DEFAULT NULL,
  `Endereço` varchar(255) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `Telefone` varchar(12) DEFAULT NULL,
  `Celular` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_Comite`),
  UNIQUE KEY `id_Comite` (`id_Comite`),
  KEY `id_Candidato_idxfk` (`id_Candidato`),
  KEY `UF_idxfk` (`UF`),
  KEY `Cidade_idxfk` (`Cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela ContextosDemandas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ContextosDemandas`;

CREATE TABLE `ContextosDemandas` (
  `id` int(11) NOT NULL,
  `Descrição` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Demandas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Demandas`;

CREATE TABLE `Demandas` (
  `idDemanda` int(11) NOT NULL,
  `Atendente` int(11) DEFAULT NULL,
  `ContextoDemanda` int(11) DEFAULT NULL,
  `OrigemDemanda` int(11) DEFAULT NULL,
  `Desc` varchar(255) DEFAULT NULL,
  `DataSoliDemanda` date DEFAULT NULL,
  `Situacao` varchar(255) DEFAULT NULL,
  `Obs` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2017-06-26 15:45:19.713300','1','paul',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,2),
	(2,'2017-06-26 15:47:06.791056','1','paul',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,2),
	(3,'2017-09-18 22:04:42.675949','1','Paulino Rocha e Silva',1,'[{\"added\": {}}]',9,2),
	(4,'2017-09-18 22:05:28.138180','1','Paulino Rocha e Silva',2,'[{\"changed\": {\"fields\": [\"Obs\"]}}]',9,2),
	(5,'2017-09-18 22:14:32.144726','1','Paulino',1,'[{\"added\": {}}]',8,2),
	(6,'2017-09-18 22:26:24.422829','1','Paulino Rocha e Silva',2,'[{\"changed\": {\"fields\": [\"candidato\"]}}]',9,2),
	(7,'2017-09-21 19:36:45.373320','1','Atualização de Interface',1,'[{\"added\": {}}]',10,2),
	(8,'2017-09-21 19:38:54.113253','2','Banco de Dados Fora do Ar',1,'[{\"added\": {}}]',10,2),
	(9,'2017-09-21 19:40:22.868489','3','Manual do Candidato Disponível',1,'[{\"added\": {}}]',10,2),
	(10,'2017-09-21 19:42:02.520769','4','Novo usuário adicionado',1,'[{\"added\": {}}]',10,2),
	(11,'2017-09-21 19:44:14.867663','5','João solicitou relatório',1,'[{\"added\": {}}]',10,2),
	(12,'2017-09-21 19:46:29.708467','6','Notícia Globo',1,'[{\"added\": {}}]',10,2),
	(13,'2017-09-21 19:47:45.873925','7','Nova doação de campanha',1,'[{\"added\": {}}]',10,2),
	(14,'2017-09-21 19:49:03.097027','8','Detratação Facebook',1,'[{\"added\": {}}]',10,2),
	(15,'2017-09-22 00:05:39.978922','8','Detratação Facebook',2,'[{\"changed\": {\"fields\": [\"Importancia\"]}}]',10,2);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(2,'auth','group'),
	(3,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(6,'sessions','session'),
	(7,'static_precompiler','dependency'),
	(8,'accounts','conta'),
	(9,'accounts','equipe'),
	(10,'atividades','evento');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2017-06-17 02:25:20.075246'),
	(2,'auth','0001_initial','2017-06-17 02:25:34.007181'),
	(3,'admin','0001_initial','2017-06-17 02:25:38.578106'),
	(4,'admin','0002_logentry_remove_auto_add','2017-06-17 02:25:40.358722'),
	(5,'contenttypes','0002_remove_content_type_name','2017-06-17 02:25:42.910266'),
	(6,'auth','0002_alter_permission_name_max_length','2017-06-17 02:25:44.416709'),
	(7,'auth','0003_alter_user_email_max_length','2017-06-17 02:25:45.935566'),
	(8,'auth','0004_alter_user_username_opts','2017-06-17 02:25:47.198578'),
	(9,'auth','0005_alter_user_last_login_null','2017-06-17 02:25:48.727564'),
	(10,'auth','0006_require_contenttypes_0002','2017-06-17 02:25:49.961002'),
	(11,'auth','0007_alter_validators_add_error_messages','2017-06-17 02:25:51.219870'),
	(12,'auth','0008_alter_user_username_max_length','2017-06-17 02:25:52.737744'),
	(13,'sessions','0001_initial','2017-06-17 02:25:55.252851'),
	(14,'static_precompiler','0001_initial','2017-06-17 02:25:58.285386'),
	(15,'accounts','0001_initial','2017-09-16 20:19:46.273799'),
	(16,'accounts','0002_auto_20170918_2159','2017-09-18 22:00:23.969485'),
	(17,'accounts','0003_equipe_candidato','2017-09-18 22:11:03.915217'),
	(18,'accounts','0004_auto_20170921_1426','2017-09-21 14:27:48.058045'),
	(19,'atividades','0001_initial','2017-09-21 14:28:12.767418'),
	(20,'atividades','0002_auto_20170925_2341','2017-09-25 23:42:08.889660');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('80cj8xc0s4a3h848kf8q22dqq6o3ssn9','NTYwMzcxMjM2MGQxNTc3Njc1ZTEyYWVhZmQ0NGY3NjBmY2U2MzY1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTk2M2U2NTBmMGU0NjJmNTk0ODViNWVkM2QyZmVlNzJmMTAzZDBjMiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-24 21:47:33.459204'),
	('fw8u0ivghs4ilm778o7mn83cob55hb1t','NTg1MjRlNDFhMjg1YzdhMWE1YWRhN2NlZTVmYzM2Y2QzYjlhZTY0ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-07-25 00:13:49.918467'),
	('7ixi4ikkvm2254fbdpyubng9h9w9ekqm','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-02 21:58:15.417539'),
	('ntj2tkcai4ch5lg6zudopxovvmz669m6','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-04 20:06:54.535648'),
	('bwfi5fc1dv3th12izgido6n18ewhkbyj','MTY0OGRhMjUwY2FkMmMxOTU2OTQ2ZjRmZWY2NDg4NTUyMDIyMThkZTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk5NjNlNjUwZjBlNDYyZjU5NDg1YjVlZDNkMmZlZTcyZjEwM2QwYzIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-10-20 22:04:32.088004'),
	('50jgz97pmwmwsajddodditmvb9i9vdnj','MTY0OGRhMjUwY2FkMmMxOTU2OTQ2ZjRmZWY2NDg4NTUyMDIyMThkZTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk5NjNlNjUwZjBlNDYyZjU5NDg1YjVlZDNkMmZlZTcyZjEwM2QwYzIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-10-06 00:19:13.717322'),
	('1bbtq8hqfdxanei27h79yep3tzlyjoo1','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-05 23:44:05.210129'),
	('ybxkcuwa3hfq30qad0754i400v37f2j6','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-07 00:01:03.939158'),
	('3t46ayhzqqr72hi0ibizu4wkcu0gydpr','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-11 19:06:54.838365'),
	('obk2a84xax701y9wiqck5wwljfyrg9ih','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2017-10-11 22:49:49.645156'),
	('j26z1wuvucdklnnvjz5k6bnuqy0i5nux','NTg1MjRlNDFhMjg1YzdhMWE1YWRhN2NlZTVmYzM2Y2QzYjlhZTY0ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2018-03-13 14:06:05.125642'),
	('vseqvh3vmuz7m322ukmr5rxlnpjcjoka','NTYwMzcxMjM2MGQxNTc3Njc1ZTEyYWVhZmQ0NGY3NjBmY2U2MzY1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTk2M2U2NTBmMGU0NjJmNTk0ODViNWVkM2QyZmVlNzJmMTAzZDBjMiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-03-05 22:45:42.522742'),
	('8s5crhprf5xq1zk1i7v6wref7re1la81','NTYwMzcxMjM2MGQxNTc3Njc1ZTEyYWVhZmQ0NGY3NjBmY2U2MzY1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTk2M2U2NTBmMGU0NjJmNTk0ODViNWVkM2QyZmVlNzJmMTAzZDBjMiIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-03-13 18:08:58.575623'),
	('3yffbw311ojvbq71vmj05djqio8qccnx','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2018-03-19 13:59:44.271761'),
	('abj5x0mxw921d7nm1x949qsl76vjx46l','ZGRhMTVmNDhjMWZjZWY0YTdmZmMzNzQwMTc5YWIzMjRiNzVlOGQzNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTYzZTY1MGYwZTQ2MmY1OTQ4NWI1ZWQzZDJmZWU3MmYxMDNkMGMyIn0=','2018-03-15 18:59:20.506791');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela EleitoresPotenciais
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EleitoresPotenciais`;

CREATE TABLE `EleitoresPotenciais` (
  `id` int(11) NOT NULL,
  `ID_Articulardor` int(11) DEFAULT NULL,
  `Organizacao` int(11) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Endereço` varchar(100) DEFAULT NULL,
  `Cidade` int(11) DEFAULT NULL,
  `UF` int(11) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `Celular` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `WhatsApp` varchar(12) DEFAULT NULL,
  `Facebook` varchar(50) DEFAULT NULL,
  `Twitter` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Equipe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Equipe`;

CREATE TABLE `Equipe` (
  `Id_MembroEquipe` int(11) NOT NULL,
  `Id_Candidato` int(11) DEFAULT NULL,
  `Id_User` int(11) DEFAULT NULL,
  `CPF` varchar(16) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `foto` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Cidade` varchar(60) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `Telefone` varchar(12) DEFAULT NULL,
  `Celular` varchar(12) DEFAULT NULL,
  `Obs` tinytext,
  `NivelAcessoMembro` int(11) DEFAULT NULL,
  `DataEntradaMembro` date DEFAULT NULL,
  `AcessoGestCamp` tinyint(4) DEFAULT NULL,
  `AcessoGestFin` tinyint(4) DEFAULT NULL,
  `AcessoGestGab` tinyint(4) DEFAULT NULL,
  `Role` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela estado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `idestado` char(2) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Franqueado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Franqueado`;

CREATE TABLE `Franqueado` (
  `FranqueadoID` int(11) NOT NULL,
  `Reference` int(11) DEFAULT NULL,
  `SitFranqueado` int(11) DEFAULT NULL,
  `StatusFranqueado` int(11) DEFAULT NULL,
  `id_UF` int(11) DEFAULT NULL,
  `Id_Cidade` int(11) DEFAULT NULL,
  `NomeFranqueado` varchar(255) DEFAULT NULL,
  `TelefoneFranqueado` varchar(255) DEFAULT NULL,
  `CelularFranqueado` varchar(255) DEFAULT NULL,
  `EnderecoFranqueado` varchar(255) DEFAULT NULL,
  `RefBancFranqueado` tinytext,
  `DataEntrada` date DEFAULT NULL,
  `Obs_Franqueado` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Grupos`;

CREATE TABLE `Grupos` (
  `id` int(11) NOT NULL,
  `idMembro` int(11) NOT NULL,
  `Grupo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela hashtags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hashtags`;

CREATE TABLE `hashtags` (
  `id` int(11) NOT NULL,
  `id_Candidato` int(11) DEFAULT NULL,
  `hashtag` varchar(15) DEFAULT NULL,
  `relevancia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Leads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Leads`;

CREATE TABLE `Leads` (
  `idLead` int(11) NOT NULL,
  `OrigemLead` int(11) DEFAULT NULL,
  `FonteLead` int(11) DEFAULT NULL,
  `NomeLead` int(11) DEFAULT NULL,
  `TelefoneLead` int(11) DEFAULT NULL,
  `CelularLead` int(11) DEFAULT NULL,
  `EmailLead` int(11) DEFAULT NULL,
  `End` int(11) DEFAULT NULL,
  `UF` int(11) DEFAULT NULL,
  `Cidade` int(11) DEFAULT NULL,
  `Facebook` int(11) DEFAULT NULL,
  `Whatsapp` int(11) DEFAULT NULL,
  `Twitter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Organizacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Organizacoes`;

CREATE TABLE `Organizacoes` (
  `idOrg` int(11) NOT NULL,
  `TipoOrg` int(11) DEFAULT NULL,
  `NomeOrg` varchar(100) DEFAULT NULL,
  `UF_Org` int(11) DEFAULT NULL,
  `Cidade_Org` int(11) DEFAULT NULL,
  `EndOrg` varchar(255) DEFAULT NULL,
  `Tel_Org` varchar(12) DEFAULT NULL,
  `Cel_Org` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela OrigensLeads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrigensLeads`;

CREATE TABLE `OrigensLeads` (
  `id` int(11) NOT NULL,
  `OrigemLead` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela PalavrasChave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PalavrasChave`;

CREATE TABLE `PalavrasChave` (
  `id` int(11) NOT NULL,
  `Candidato` int(11) DEFAULT NULL,
  `PalavraChave` varchar(40) DEFAULT NULL,
  `Relevancia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `PalavrasChave` WRITE;
/*!40000 ALTER TABLE `PalavrasChave` DISABLE KEYS */;

INSERT INTO `PalavrasChave` (`id`, `Candidato`, `PalavraChave`, `Relevancia`)
VALUES
	(0,0,'',NULL);

/*!40000 ALTER TABLE `PalavrasChave` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela Partidos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Partidos`;

CREATE TABLE `Partidos` (
  `id_Partido` int(11) NOT NULL,
  `SiglaPartido` varchar(6) NOT NULL,
  `NomePartido` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela PerAssinat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PerAssinat`;

CREATE TABLE `PerAssinat` (
  `IdPeriodo` int(11) NOT NULL,
  `CicloPagto` varchar(20) DEFAULT NULL,
  `Perc_Desc` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela PlataformaEleitoral
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PlataformaEleitoral`;

CREATE TABLE `PlataformaEleitoral` (
  `id` int(11) NOT NULL,
  `IdCandidato` int(11) DEFAULT NULL,
  `Contexto` varchar(255) DEFAULT NULL,
  `Local` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Projetos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Projetos`;

CREATE TABLE `Projetos` (
  `id` int(11) NOT NULL,
  `ResumoProjeto` varchar(255) DEFAULT NULL,
  `DescricaoProjeto` tinytext,
  `Anexos` tinyblob,
  `DataProjeto` date DEFAULT NULL,
  `Situação` varchar(255) DEFAULT NULL,
  `UltimaAtualizacao` date DEFAULT NULL,
  `Contexto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela Religiao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Religiao`;

CREATE TABLE `Religiao` (
  `idReligiao` int(11) DEFAULT NULL,
  `Religiao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela SituacaoFranqueado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SituacaoFranqueado`;

CREATE TABLE `SituacaoFranqueado` (
  `id` int(11) NOT NULL,
  `SituacaoFranqueado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela static_precompiler_dependency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `static_precompiler_dependency`;

CREATE TABLE `static_precompiler_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `depends_on` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `static_precompiler_dependency_source_depends_on_d8e91940_uniq` (`source`,`depends_on`),
  KEY `static_precompiler_dependency_source_6c770ab0` (`source`),
  KEY `static_precompiler_dependency_depends_on_a14c2c8b` (`depends_on`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump da tabela StatusCandidato
# ------------------------------------------------------------

DROP TABLE IF EXISTS `StatusCandidato`;

CREATE TABLE `StatusCandidato` (
  `id` int(11) NOT NULL,
  `SituacaoCandidato` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela StatusFranqueado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `StatusFranqueado`;

CREATE TABLE `StatusFranqueado` (
  `id` int(11) NOT NULL,
  `NivelFranqueado` varchar(255) DEFAULT NULL,
  `PercComissao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela TipoAcesso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TipoAcesso`;

CREATE TABLE `TipoAcesso` (
  `id` int(11) NOT NULL,
  `TipoAcesso` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela TipoOrg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TipoOrg`;

CREATE TABLE `TipoOrg` (
  `idTipoOrg` int(11) NOT NULL,
  `TipoOrg` int(11) DEFAULT NULL,
  `Publica` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela TiposAssinaturas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TiposAssinaturas`;

CREATE TABLE `TiposAssinaturas` (
  `idTipoAssinatura` int(11) NOT NULL,
  `CargoAssinatura` varchar(30) DEFAULT NULL,
  `ValorMensalAssinatura` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`)
VALUES
	(0,'001f63e8e182aac632769b5fd710c8',0,'2017-09-20'),
	(0,'afb0a9242843b94f292a2ac3e801c5',0,'2017-09-20');

/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela UFs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UFs`;

CREATE TABLE `UFs` (
  `Id_UF` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT '',
  `Sigla` varchar(2) NOT NULL,
  `Capital` varchar(20) DEFAULT NULL,
  `bandeira` longblob,
  `Região` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela UserAtrib
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserAtrib`;

CREATE TABLE `UserAtrib` (
  `id` int(11) NOT NULL,
  `Funcao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `foto_user` varchar(100) DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `NumCelular` varchar(14) DEFAULT NULL,
  `NumFixo` varchar(14) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `End` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(10) DEFAULT NULL,
  `last_login` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_verificado` bit(1) DEFAULT NULL,
  `celular_verificado` bit(1) DEFAULT NULL,
  `logado` bit(1) DEFAULT NULL,
  `id_candidato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `sexo`, `CPF`, `foto_user`, `Data_Nascimento`, `NumCelular`, `NumFixo`, `UF`, `Cidade`, `CEP`, `End`, `created`, `role`, `last_login`, `status`, `email_verificado`, `celular_verificado`, `logado`, `id_candidato`)
VALUES
	(0,'paulinors','0db773896e9a035d69061281ac6d09a9','Paulino','Rocha e Silva','paulino@ogrodafloresta.com.br','M','875.282.319/91',NULL,'1973-11-04','(41) 9920-9996','(41) 3244-2734','','','82.240-050','Rua Pettit Carneiro, 632','2017-09-20 16:55:20','Agência','2017-09-20 07:55:21 PM','aprovado',b'1',NULL,b'1',0),
	(0,'','9d668901a753dbf51d57333cbe35b8bc','Paul','Rocha e Silva','contato@neoplace.com.br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-20 16:55:20','assinante','2017-09-20 07:55:21 PM','aprovado',b'1',NULL,b'1',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
