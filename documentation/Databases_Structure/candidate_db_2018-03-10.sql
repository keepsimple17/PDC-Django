# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Base de Dados: candidate_db
# Tempo de Geração: 2018-03-11 02:27:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela candidate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `id_candidate` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL COMMENT 'The ID from the user who added the Candidate',
  `name_candidate` varchar(255) NOT NULL,
  `cpf_candidate` varchar(15) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `political_nickname` varchar(60) DEFAULT NULL COMMENT 'The name by which the politician is known. Campaign Name',
  `email_candidate` varchar(50) NOT NULL,
  `site` varchar(100) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `birthday_date` date DEFAULT NULL,
  `cel_number` varchar(14) DEFAULT NULL,
  `telephone_number` varchar(14) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `electoral_dispute` varchar(20) DEFAULT NULL COMMENT 'Electoral suit. Campaign in which the candidate is competing or will compete.',
  `dispute_position` varchar(40) DEFAULT NULL COMMENT 'Cargo ao qual o candidato está concorrendo. (vereador, deputado, senador, prefeito, presidente ou outro)',
  `dispute_UF` varchar(2) DEFAULT NULL,
  `dispute_city` varchar(70) DEFAULT NULL,
  `dispute_id_party` int(11) DEFAULT NULL,
  `candidate_number` varchar(255) DEFAULT NULL COMMENT 'The party number of the candidate in the election',
  `holds_political_position` tinyint(1) DEFAULT NULL COMMENT 'The candidate is exercising political office?',
  `reelection` tinyint(1) DEFAULT NULL COMMENT 'The candidate is trying to be re-elected?',
  `first_political_campaign` tinyint(1) DEFAULT NULL COMMENT 'It''s the first campaing of the candidate?',
  `candidate_situation` int(11) DEFAULT NULL COMMENT 'Candidate situation (vd. status_candidate table). Ex. 0 - inactive, 1 in demonstration - 2 regular status - 3 Awaiting Payment ..',
  `resume` text COMMENT 'A resume from candidate: Name, Political Party, Location, etc.',
  `obs` tinyblob COMMENT 'Candidate biografy',
  `facebook` varchar(60) DEFAULT NULL,
  `twitter` varchar(60) DEFAULT NULL,
  `google` varchar(60) DEFAULT NULL,
  `instagram` varchar(60) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` varchar(100) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `logged_in` tinyint(1) DEFAULT NULL,
  `youtube` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_candidate`),
  UNIQUE KEY `idx_candidate_id_candidate` (`id_candidate`),
  CONSTRAINT `fk_candidate_users` FOREIGN KEY (`id_candidate`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The table of candidate running for elections. \nThe candidate must be an user.\nThe three first insertions on the users table must me reserved to the candidate. (the id_user starts with number 4).\nThe UC-Registration define the following proccess:\n1) User register.\n2) After the first login, the USERS complete their user data. An id_user >= 4 is assigned\n3) If no candidate is assigned (check the table roles, candidate or users), he defines the base data for Candidate (name, email,name, etc). An user is created with a temporary password and sent to candidate.\n4) When the candidate execute his first login (with his username and temporary password, a Candidate Table is created. The id_candidate will be associated with his id_user)';



# Dump da tabela coligations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coligations`;

CREATE TABLE `coligations` (
  `id_coligation` int(11) NOT NULL AUTO_INCREMENT,
  `id_candidate` int(11) DEFAULT NULL,
  `name_coligation` varchar(100) DEFAULT NULL COMMENT 'Name of coligation',
  `political_partie_number` int(11) DEFAULT NULL COMMENT 'Consult the Politica Parties table in General DB',
  `political_partie_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_coligation`),
  UNIQUE KEY `idx_coligations_id_candidate` (`id_candidate`),
  CONSTRAINT `fk_coligations_candidate` FOREIGN KEY (`id_coligation`) REFERENCES `candidate` (`id_candidate`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Candidate Political Party Coligations. Consult the political_parties table in the General DB';



# Dump da tabela commitee_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commitee_members`;

CREATE TABLE `commitee_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_commitee` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `assignments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_commitee_members_id_commitee` (`id_commitee`),
  KEY `idx_commitee_members_id_user` (`id_user`),
  CONSTRAINT `fk_commitee_members_committee` FOREIGN KEY (`id_commitee`) REFERENCES `committee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commitee_members_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela committee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `committee`;

CREATE TABLE `committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL COMMENT 'Responsible to manage the commitee and actions on area',
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `neighborhood` varchar(40) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `cellphone_contact` varchar(20) DEFAULT NULL,
  `landline_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_committee_id_user` (`id_user`),
  CONSTRAINT `fk_committee_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Political committes of the candidate. Structures or organizations to mobilize the campaign.';



# Dump da tabela external_organizations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `external_organizations`;

CREATE TABLE `external_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(40) DEFAULT NULL COMMENT 'kind of organization',
  `name_of_organization` varchar(100) DEFAULT NULL,
  `responsible` varchar(60) DEFAULT NULL COMMENT 'responsible or owner',
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `landline` varchar(20) DEFAULT NULL COMMENT 'Telephone with area code',
  `cellphone` varchar(20) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL COMMENT 'web address',
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='business organizations from outside team or campaign';



# Dump da tabela field_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `field_department`;

CREATE TABLE `field_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origem` varchar(70) DEFAULT NULL,
  `organization` varchar(70) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `nickname` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `birthday_date` date DEFAULT NULL,
  `cel_number` varchar(14) DEFAULT NULL,
  `telephone_number` varchar(14) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `religion` varchar(50) DEFAULT NULL,
  `profession` varchar(10) DEFAULT NULL,
  `last_login` varchar(100) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `linkedin` varchar(50) DEFAULT NULL,
  `google` varchar(50) DEFAULT NULL,
  `user_reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_field_department_user_reference_id` (`user_reference_id`),
  CONSTRAINT `fk_field_department_users` FOREIGN KEY (`user_reference_id`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The field department focuses on the "on-the-ground" organizing that is required in order to personally contact voters through canvassing, phone calls, and building local events.\n\nAll involved in the election and election campaign mobilization that does not have user account to access the system.';



# Dump da tabela kinds_relationship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kinds_relationship`;

CREATE TABLE `kinds_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_relationship` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela relationship_network
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relationship_network`;

CREATE TABLE `relationship_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_actor_a` int(11) DEFAULT NULL,
  `kind_of_relationship` varchar(60) DEFAULT NULL,
  `id_actor_b` int(11) DEFAULT NULL,
  `observation` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationship betwen members';



# Dump da tabela staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `user_access_level` int(11) DEFAULT NULL COMMENT 'uses the binaty wrx (421) mode, in the sequences (ex. 777)',
  `date_added` date DEFAULT NULL,
  `add_from_id` int(11) DEFAULT NULL COMMENT 'ID of who added the member',
  `access_manage_campaign` tinyint(4) DEFAULT NULL COMMENT 'Atribution of staff user in campaign managment.\nUses a Integer from 0 to 7, in the RWX (4,2,1) attribution.',
  `access_financial_campaign` tinyint(4) DEFAULT NULL COMMENT 'Atribution of staff user in campaign finantial managment.\nUses a Integer from 0 to 7, in the RWX (4,2,1) attribution.',
  `access_cabinet_managment` tinyint(4) DEFAULT NULL COMMENT 'Atribution of staff user in parlour managment.\nUses a Integer from 0 to 7, in the RWX (4,2,1) attribution.',
  `role` varchar(50) DEFAULT NULL COMMENT 'Staff Roles take precedence over user roles',
  `obs` blob,
  PRIMARY KEY (`id`),
  KEY `idx_staff_id_user` (`id_user`),
  CONSTRAINT `fk_staff_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Candidate Staff Members. Registrated users who can perform exclusive actions in the parlour.';



# Dump da tabela staff_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `budget_managment` tinyint(4) DEFAULT NULL,
  `members_managment` tinyint(4) DEFAULT NULL,
  `reports_managment` tinyint(4) DEFAULT NULL,
  `members_access` tinyint(4) DEFAULT NULL,
  `agenda_access` tinyint(4) DEFAULT NULL,
  `internet_interaction` tinyint(4) DEFAULT NULL,
  `send_messages` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;

INSERT INTO `user_roles` (`id`, `role_name`, `budget_managment`, `members_managment`, `reports_managment`, `members_access`, `agenda_access`, `internet_interaction`, `send_messages`)
VALUES
	(1,'regular user',2,6,2,4,4,1,0),
	(2,'internal employee',2,6,2,6,6,7,3),
	(3,'secretary',6,6,7,6,7,7,7),
	(4,'chief of staff',7,7,7,7,7,7,7);

/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `birthday_date` date DEFAULT NULL,
  `cel_number` varchar(14) DEFAULT NULL,
  `telephone_number` varchar(14) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_role` int(11) DEFAULT NULL,
  `last_login` varchar(100) DEFAULT NULL,
  `email_verified` bit(1) DEFAULT NULL,
  `logged_in` bit(1) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `updated_at` varchar(200) DEFAULT NULL COMMENT 'If updated, store the detais',
  `aditional_attributions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `idx_users_id_role` (`id_role`),
  CONSTRAINT `fk_users_user_roles` FOREIGN KEY (`id_role`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
