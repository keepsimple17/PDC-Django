-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: pdc
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add association',7,'add_association'),(20,'Can change association',7,'change_association'),(21,'Can delete association',7,'delete_association'),(22,'Can add user social auth',8,'add_usersocialauth'),(23,'Can change user social auth',8,'change_usersocialauth'),(24,'Can delete user social auth',8,'delete_usersocialauth'),(25,'Can add code',9,'add_code'),(26,'Can change code',9,'change_code'),(27,'Can delete code',9,'delete_code'),(28,'Can add partial',10,'add_partial'),(29,'Can change partial',10,'change_partial'),(30,'Can delete partial',10,'delete_partial'),(31,'Can add nonce',11,'add_nonce'),(32,'Can change nonce',11,'change_nonce'),(33,'Can delete nonce',11,'delete_nonce'),(34,'Can add user candidates',12,'add_usercandidates'),(35,'Can change user candidates',12,'change_usercandidates'),(36,'Can delete user candidates',12,'delete_usercandidates'),(37,'Can add bairro',13,'add_bairro'),(38,'Can change bairro',13,'change_bairro'),(39,'Can delete bairro',13,'delete_bairro'),(40,'Can add usuario',14,'add_usuario'),(41,'Can change usuario',14,'change_usuario'),(42,'Can delete usuario',14,'delete_usuario'),(43,'Can add relationship_network',15,'add_relationship_network'),(44,'Can change relationship_network',15,'change_relationship_network'),(45,'Can delete relationship_network',15,'delete_relationship_network'),(46,'Can add municipio',16,'add_municipio'),(47,'Can change municipio',16,'change_municipio'),(48,'Can delete municipio',16,'delete_municipio'),(49,'Can add estado',17,'add_estado'),(50,'Can change estado',17,'change_estado'),(51,'Can delete estado',17,'delete_estado'),(52,'Can add political parties',18,'add_politicalparties'),(53,'Can change political parties',18,'change_politicalparties'),(54,'Can delete political parties',18,'delete_politicalparties'),(55,'Can add coalitions',19,'add_coalitions'),(56,'Can change coalitions',19,'change_coalitions'),(57,'Can delete coalitions',19,'delete_coalitions'),(58,'Can add candidate',20,'add_candidate'),(59,'Can change candidate',20,'change_candidate'),(60,'Can delete candidate',20,'delete_candidate'),(61,'Can add committees',21,'add_committees'),(62,'Can change committees',21,'change_committees'),(63,'Can delete committees',21,'delete_committees'),(64,'Can add staff',22,'add_staff'),(65,'Can change staff',22,'change_staff'),(66,'Can delete staff',22,'delete_staff'),(67,'Can add committee_ members',23,'add_committee_members'),(68,'Can change committee_ members',23,'change_committee_members'),(69,'Can delete committee_ members',23,'delete_committee_members'),(70,'Can add user roles_list',24,'add_userroles_list'),(71,'Can change user roles_list',24,'change_userroles_list'),(72,'Can delete user roles_list',24,'delete_userroles_list'),(73,'Can add user roles',25,'add_userroles'),(74,'Can change user roles',25,'change_userroles'),(75,'Can delete user roles',25,'delete_userroles'),(76,'Can add position',26,'add_position'),(77,'Can change position',26,'change_position'),(78,'Can delete position',26,'delete_position'),(79,'Can add ballot',27,'add_ballot'),(80,'Can change ballot',27,'change_ballot'),(81,'Can delete ballot',27,'delete_ballot'),(82,'Can add invites',28,'add_invites'),(83,'Can change invites',28,'change_invites'),(84,'Can delete invites',28,'delete_invites'),(85,'Can add candidate requests',29,'add_candidaterequests'),(86,'Can change candidate requests',29,'change_candidaterequests'),(87,'Can delete candidate requests',29,'delete_candidaterequests'),(88,'Can add proposal',30,'add_proposal'),(89,'Can change proposal',30,'change_proposal'),(90,'Can delete proposal',30,'delete_proposal'),(91,'Can add scope list',31,'add_scopelist'),(92,'Can change scope list',31,'change_scopelist'),(93,'Can delete scope list',31,'delete_scopelist'),(94,'Can add keyword',32,'add_keyword'),(95,'Can change keyword',32,'change_keyword'),(96,'Can delete keyword',32,'delete_keyword'),(97,'Can add committee members',23,'add_committeemembers'),(98,'Can change committee members',23,'change_committeemembers'),(99,'Can delete committee members',23,'delete_committeemembers'),(100,'Can add user roles list',24,'add_userroleslist'),(101,'Can change user roles list',24,'change_userroleslist'),(102,'Can delete user roles list',24,'delete_userroleslist'),(103,'Can add relationship network',15,'add_relationshipnetwork'),(104,'Can change relationship network',15,'change_relationshipnetwork'),(105,'Can delete relationship network',15,'delete_relationshipnetwork'),(106,'Can add temp user',33,'add_tempuser'),(107,'Can change temp user',33,'change_tempuser'),(108,'Can delete temp user',33,'delete_tempuser'),(109,'Can add dispute',34,'add_dispute'),(110,'Can change dispute',34,'change_dispute'),(111,'Can delete dispute',34,'delete_dispute');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$n3tyOp7WQgXz$1DMIop1gM9Zn36AgX4WxLoV018n16kNoLNHDTf1JXXo=','2018-06-18 08:11:41.916184',1,'tulga','','','tulga870911@gmail.com',1,1,'2018-05-27 15:35:07.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidate`
--

DROP TABLE IF EXISTS `candidato_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_political_nickname` varchar(40) DEFAULT NULL,
  `candidate_dispute_party` varchar(50) DEFAULT NULL,
  `canditate_Election_Ballot` varchar(30) DEFAULT NULL,
  `campaign_desired_position` varchar(30) DEFAULT NULL,
  `state_campaign` varchar(2) DEFAULT NULL,
  `city_campaign` varchar(255) DEFAULT NULL,
  `candidate_dispute_number` varchar(6) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `holds_political_position` varchar(4) DEFAULT NULL,
  `political_position` varchar(40) DEFAULT NULL,
  `reelection` varchar(40) DEFAULT NULL,
  `first_political_campaign` tinyint(1) NOT NULL,
  `candidate_site` varchar(50) DEFAULT NULL,
  `campaign_email` varchar(254) DEFAULT NULL,
  `facebook` varchar(40) DEFAULT NULL,
  `twitter` varchar(40) DEFAULT NULL,
  `googlep` varchar(40) DEFAULT NULL,
  `youtube` varchar(40) DEFAULT NULL,
  `instagram` varchar(40) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `obs` longtext,
  `candidate_situation` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `candidate_blog_rss` varchar(40) DEFAULT NULL,
  `candidate_city` varchar(255) DEFAULT NULL,
  `candidate_current_position` varchar(30) DEFAULT NULL,
  `candidate_desired_position` varchar(30) DEFAULT NULL,
  `candidate_state` varchar(2) DEFAULT NULL,
  `first_election` varchar(40) DEFAULT NULL,
  `holds_position` varchar(255) DEFAULT NULL,
  `candidate_party` varchar(50) DEFAULT NULL,
  `candidate_blog_rss_img` longtext,
  `candidate_blog_rss_url` varchar(200) DEFAULT NULL,
  `facebook_img` longtext,
  `facebook_url` varchar(200) DEFAULT NULL,
  `googlep_img` longtext,
  `googlep_url` varchar(200) DEFAULT NULL,
  `instagram_img` longtext,
  `instagram_url` varchar(200) DEFAULT NULL,
  `twitter_img` longtext,
  `twitter_url` varchar(200) DEFAULT NULL,
  `youtube_img` longtext,
  `youtube_url` varchar(200) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `candidato_candidate_slug_c886c0cb` (`slug`),
  CONSTRAINT `candidato_candidate_user_id_22b621b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidate`
--

LOCK TABLES `candidato_candidate` WRITE;
/*!40000 ALTER TABLE `candidato_candidate` DISABLE KEYS */;
INSERT INTO `candidato_candidate` VALUES (1,'',NULL,'',NULL,NULL,NULL,'','','N','','S',0,'','freeeup.ebat@gamil.com','','','','','','',NULL,'pending','2018-05-29 04:15:08.179549','2018-05-29 04:15:08.179596',1,'','','','','','S','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `candidato_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidate_negative_keywords`
--

DROP TABLE IF EXISTS `candidato_candidate_negative_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidate_negative_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_candidate_nega_candidate_id_keyword_id_d7406235_uniq` (`candidate_id`,`keyword_id`),
  KEY `candidato_candidate__keyword_id_df90dcfd_fk_candidato` (`keyword_id`),
  CONSTRAINT `candidato_candidate__candidate_id_7aaa2778_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_candidate__keyword_id_df90dcfd_fk_candidato` FOREIGN KEY (`keyword_id`) REFERENCES `candidato_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidate_negative_keywords`
--

LOCK TABLES `candidato_candidate_negative_keywords` WRITE;
/*!40000 ALTER TABLE `candidato_candidate_negative_keywords` DISABLE KEYS */;
INSERT INTO `candidato_candidate_negative_keywords` VALUES (1,1,2),(2,1,4);
/*!40000 ALTER TABLE `candidato_candidate_negative_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidate_positive_keywords`
--

DROP TABLE IF EXISTS `candidato_candidate_positive_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidate_positive_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_candidate_posi_candidate_id_keyword_id_e6229919_uniq` (`candidate_id`,`keyword_id`),
  KEY `candidato_candidate__keyword_id_8cd7d0d0_fk_candidato` (`keyword_id`),
  CONSTRAINT `candidato_candidate__candidate_id_e0da66d4_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_candidate__keyword_id_8cd7d0d0_fk_candidato` FOREIGN KEY (`keyword_id`) REFERENCES `candidato_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidate_positive_keywords`
--

LOCK TABLES `candidato_candidate_positive_keywords` WRITE;
/*!40000 ALTER TABLE `candidato_candidate_positive_keywords` DISABLE KEYS */;
INSERT INTO `candidato_candidate_positive_keywords` VALUES (1,1,1),(2,1,3);
/*!40000 ALTER TABLE `candidato_candidate_positive_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidate_proposals`
--

DROP TABLE IF EXISTS `candidato_candidate_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidate_proposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_candidate_prop_candidate_id_proposal_id_ec38ebf8_uniq` (`candidate_id`,`proposal_id`),
  KEY `candidato_candidate__proposal_id_94a8409c_fk_candidato` (`proposal_id`),
  CONSTRAINT `candidato_candidate__candidate_id_400dc237_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_candidate__proposal_id_94a8409c_fk_candidato` FOREIGN KEY (`proposal_id`) REFERENCES `candidato_proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidate_proposals`
--

LOCK TABLES `candidato_candidate_proposals` WRITE;
/*!40000 ALTER TABLE `candidato_candidate_proposals` DISABLE KEYS */;
INSERT INTO `candidato_candidate_proposals` VALUES (1,1,1);
/*!40000 ALTER TABLE `candidato_candidate_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidate_usuarioes`
--

DROP TABLE IF EXISTS `candidato_candidate_usuarioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidate_usuarioes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_candidate_usua_candidate_id_usuario_id_3838c71c_uniq` (`candidate_id`,`usuario_id`),
  KEY `candidato_candidate__usuario_id_169fd6cf_fk_dashboard` (`usuario_id`),
  CONSTRAINT `candidato_candidate__candidate_id_ab9757a2_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_candidate__usuario_id_169fd6cf_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidate_usuarioes`
--

LOCK TABLES `candidato_candidate_usuarioes` WRITE;
/*!40000 ALTER TABLE `candidato_candidate_usuarioes` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_candidate_usuarioes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_candidaterequests`
--

DROP TABLE IF EXISTS `candidato_candidaterequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_candidaterequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `candidator_email` varchar(60) DEFAULT NULL,
  `request_status` varchar(10) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `request_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_candidaterequests`
--

LOCK TABLES `candidato_candidaterequests` WRITE;
/*!40000 ALTER TABLE `candidato_candidaterequests` DISABLE KEYS */;
INSERT INTO `candidato_candidaterequests` VALUES (1,'tulga870911@gmail.com','','REQUESTED','2018-06-01 09:16:42.389287','INVITE');
/*!40000 ALTER TABLE `candidato_candidaterequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_coalitions`
--

DROP TABLE IF EXISTS `candidato_coalitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_coalitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_coligation` varchar(60) DEFAULT NULL,
  `political_partie_abbreviation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_coalitions`
--

LOCK TABLES `candidato_coalitions` WRITE;
/*!40000 ALTER TABLE `candidato_coalitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_coalitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_committeemembers`
--

DROP TABLE IF EXISTS `candidato_committeemembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_committeemembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignments` varchar(255) DEFAULT NULL,
  `observations` longtext,
  `commitee_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidato_committeem_commitee_id_e20de89b_fk_candidato` (`commitee_id`),
  KEY `candidato_committeem_usuario_id_2307b3fa_fk_dashboard` (`usuario_id`),
  CONSTRAINT `candidato_committeem_commitee_id_e20de89b_fk_candidato` FOREIGN KEY (`commitee_id`) REFERENCES `candidato_committees` (`id`),
  CONSTRAINT `candidato_committeem_usuario_id_2307b3fa_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_committeemembers`
--

LOCK TABLES `candidato_committeemembers` WRITE;
/*!40000 ALTER TABLE `candidato_committeemembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_committeemembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_committees`
--

DROP TABLE IF EXISTS `candidato_committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_committees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(17) DEFAULT NULL,
  `estado` varchar(17) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `cell_phone` varchar(17) DEFAULT NULL,
  `landline_phone` varchar(17) DEFAULT NULL,
  `responsible_id` int(11) DEFAULT NULL,
  `responsible_tmp_id` int(11) DEFAULT NULL,
  `name` longtext,
  PRIMARY KEY (`id`),
  KEY `candidato_committees_candidate_id_26e4cf72_fk_candidato` (`candidate_id`),
  KEY `candidato_committees_responsible_id_2db7aea0_fk_dashboard` (`responsible_id`),
  KEY `candidato_committees_responsible_tmp_id_557da764_fk_candidato` (`responsible_tmp_id`),
  CONSTRAINT `candidato_committees_candidate_id_26e4cf72_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_committees_responsible_id_2db7aea0_fk_dashboard` FOREIGN KEY (`responsible_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `candidato_committees_responsible_tmp_id_557da764_fk_candidato` FOREIGN KEY (`responsible_tmp_id`) REFERENCES `candidato_tempuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_committees`
--

LOCK TABLES `candidato_committees` WRITE;
/*!40000 ALTER TABLE `candidato_committees` DISABLE KEYS */;
INSERT INTO `candidato_committees` VALUES (1,'80240-050','BA','2901106','','',1,'','',NULL,2,'ssssss');
/*!40000 ALTER TABLE `candidato_committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_committees_members`
--

DROP TABLE IF EXISTS `candidato_committees_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_committees_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committees_id` int(11) NOT NULL,
  `committeemembers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_committees_mem_committees_id_committeem_e176df3b_uniq` (`committees_id`,`committeemembers_id`),
  KEY `candidato_committees_committeemembers_id_ad843132_fk_candidato` (`committeemembers_id`),
  CONSTRAINT `candidato_committees_committeemembers_id_ad843132_fk_candidato` FOREIGN KEY (`committeemembers_id`) REFERENCES `candidato_committeemembers` (`id`),
  CONSTRAINT `candidato_committees_committees_id_20087b49_fk_candidato` FOREIGN KEY (`committees_id`) REFERENCES `candidato_committees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_committees_members`
--

LOCK TABLES `candidato_committees_members` WRITE;
/*!40000 ALTER TABLE `candidato_committees_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_committees_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_invites`
--

DROP TABLE IF EXISTS `candidato_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitator_email` varchar(50) NOT NULL,
  `invited_name` varchar(60) DEFAULT NULL,
  `invited_email` varchar(60) NOT NULL,
  `invited_cel` varchar(20) DEFAULT NULL,
  `invite_status` varchar(10) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_invites`
--

LOCK TABLES `candidato_invites` WRITE;
/*!40000 ALTER TABLE `candidato_invites` DISABLE KEYS */;
INSERT INTO `candidato_invites` VALUES (1,'freeeup.ebat@gmail.com','erdenetulga','erdenetulgabat418@gmail.com','','I','2018-05-29 09:25:57.145969');
/*!40000 ALTER TABLE `candidato_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_invites_candidate`
--

DROP TABLE IF EXISTS `candidato_invites_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_invites_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invites_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidato_invites_candid_invites_id_candidate_id_179f6622_uniq` (`invites_id`,`candidate_id`),
  KEY `candidato_invites_ca_candidate_id_344908ad_fk_candidato` (`candidate_id`),
  CONSTRAINT `candidato_invites_ca_candidate_id_344908ad_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_invites_ca_invites_id_2a6eeab6_fk_candidato` FOREIGN KEY (`invites_id`) REFERENCES `candidato_invites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_invites_candidate`
--

LOCK TABLES `candidato_invites_candidate` WRITE;
/*!40000 ALTER TABLE `candidato_invites_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_invites_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_keyword`
--

DROP TABLE IF EXISTS `candidato_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(60) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_keyword`
--

LOCK TABLES `candidato_keyword` WRITE;
/*!40000 ALTER TABLE `candidato_keyword` DISABLE KEYS */;
INSERT INTO `candidato_keyword` VALUES (1,'positive','P','2018-05-29 09:29:13.562250',NULL),(2,'negative','N','2018-05-29 09:29:19.743770',NULL),(3,'hey','P','2018-05-29 09:54:15.969816',NULL),(4,'why','N','2018-05-29 10:02:38.945500',NULL);
/*!40000 ALTER TABLE `candidato_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_proposal`
--

DROP TABLE IF EXISTS `candidato_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidato_proposal_scope_id_f133d6f1_fk_candidato_scopelist_id` (`scope_id`),
  CONSTRAINT `candidato_proposal_scope_id_f133d6f1_fk_candidato_scopelist_id` FOREIGN KEY (`scope_id`) REFERENCES `candidato_scopelist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_proposal`
--

LOCK TABLES `candidato_proposal` WRITE;
/*!40000 ALTER TABLE `candidato_proposal` DISABLE KEYS */;
INSERT INTO `candidato_proposal` VALUES (1,'asdfa','asdfasfd','2018-05-29 09:53:31.494069',NULL,9);
/*!40000 ALTER TABLE `candidato_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_scopelist`
--

DROP TABLE IF EXISTS `candidato_scopelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_scopelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `is_template` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidato_scopelist_user_id_4c734ffb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `candidato_scopelist_user_id_4c734ffb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_scopelist`
--

LOCK TABLES `candidato_scopelist` WRITE;
/*!40000 ALTER TABLE `candidato_scopelist` DISABLE KEYS */;
INSERT INTO `candidato_scopelist` VALUES (1,'Saúde',1,'2018-04-18 23:31:45.135669',NULL,NULL),(2,'Segurança',1,'2018-04-18 23:31:45.135669',NULL,NULL),(3,'Educação',1,'2018-04-18 23:31:45.135669',NULL,NULL),(4,'Social',1,'2018-04-18 23:31:45.135669',NULL,NULL),(5,'Infra Estrutura',1,'2018-04-18 23:31:45.135669',NULL,NULL),(6,'Meio Ambiente',1,'2018-04-18 23:31:45.135669',NULL,NULL),(7,'Moradia',1,'2018-04-18 23:31:45.135669',NULL,NULL),(8,'Adicionar Categoria',1,'2018-04-18 23:31:45.135669',NULL,NULL),(9,'new category',0,'2018-05-29 09:53:20.974129',NULL,1);
/*!40000 ALTER TABLE `candidato_scopelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_staff`
--

DROP TABLE IF EXISTS `candidato_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_staff`
--

LOCK TABLES `candidato_staff` WRITE;
/*!40000 ALTER TABLE `candidato_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_tempuser`
--

DROP TABLE IF EXISTS `candidato_tempuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_tempuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` longtext,
  `email` longtext,
  `kind` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_tempuser`
--

LOCK TABLES `candidato_tempuser` WRITE;
/*!40000 ALTER TABLE `candidato_tempuser` DISABLE KEYS */;
INSERT INTO `candidato_tempuser` VALUES (1,'tem','tst@gmail.com','Committee','2018-05-22 14:18:43.238689',NULL),(2,'test committee','freeeup.ebat@gmail.com','Committee','2018-05-29 10:21:27.353365',NULL);
/*!40000 ALTER TABLE `candidato_tempuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_userroles`
--

DROP TABLE IF EXISTS `candidato_userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_userroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  `budget_managment` smallint(5) unsigned NOT NULL,
  `members_managment` smallint(5) unsigned NOT NULL,
  `reports_managment` smallint(5) unsigned NOT NULL,
  `members_access` smallint(5) unsigned NOT NULL,
  `agenda_access` smallint(5) unsigned NOT NULL,
  `internetInteraction` smallint(5) unsigned NOT NULL,
  `sendMessages` smallint(5) unsigned NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidato_userroles_candidate_id_0e11ac96_fk_candidato` (`candidate_id`),
  KEY `candidato_userroles_user_id_f399e886_fk_dashboard_usuario_id` (`user_id`),
  KEY `candidato_userroles_invite_id_30eaf182_fk_candidato_invites_id` (`invite_id`),
  CONSTRAINT `candidato_userroles_candidate_id_0e11ac96_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `candidato_userroles_invite_id_30eaf182_fk_candidato_invites_id` FOREIGN KEY (`invite_id`) REFERENCES `candidato_invites` (`id`),
  CONSTRAINT `candidato_userroles_user_id_f399e886_fk_dashboard_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_userroles`
--

LOCK TABLES `candidato_userroles` WRITE;
/*!40000 ALTER TABLE `candidato_userroles` DISABLE KEYS */;
INSERT INTO `candidato_userroles` VALUES (1,'Geral',6,4,6,4,6,7,7,NULL,NULL,1);
/*!40000 ALTER TABLE `candidato_userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_userroleslist`
--

DROP TABLE IF EXISTS `candidato_userroleslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato_userroleslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  `budget_managment` smallint(5) unsigned NOT NULL,
  `members_managment` smallint(5) unsigned NOT NULL,
  `reports_managment` smallint(5) unsigned NOT NULL,
  `members_access` smallint(5) unsigned NOT NULL,
  `agenda_access` smallint(5) unsigned NOT NULL,
  `internetInteraction` smallint(5) unsigned NOT NULL,
  `sendMessages` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_userroleslist`
--

LOCK TABLES `candidato_userroleslist` WRITE;
/*!40000 ALTER TABLE `candidato_userroleslist` DISABLE KEYS */;
INSERT INTO `candidato_userroleslist` VALUES (1,'Candidato',7,7,7,7,7,7,7),(2,'Agência de Marketing',6,4,6,4,6,7,7),(3,'Consultor de campanha',4,4,6,6,6,4,4),(4,'Contratado Externo',4,4,4,4,4,4,4),(5,'Empregado Interno',4,4,6,4,4,4,4),(6,'Voluntário',4,4,4,4,4,4,4),(7,'Coordenador Geral de Campanha',7,7,7,7,7,7,7),(8,'Coordenador Financiero',7,6,7,6,6,6,6),(9,'Contador',7,6,6,4,4,4,4),(10,'Assessor Financeiro',7,6,6,4,6,4,4),(11,'Contas a Pagar e Receber',6,4,4,4,4,4,4),(12,'Auxiliar Financeiro',4,4,4,4,4,4,4),(13,'Doador de Campanha',4,4,4,4,4,4,4),(14,'Coordenador de Marketing',6,6,6,4,6,6,6),(15,'Jornalistas',6,4,6,4,6,6,6),(16,'Publicitários',6,6,6,6,6,6,6),(17,'Designer',4,4,4,4,4,4,4),(18,'Analista de Marketing',4,4,4,4,4,4,4),(19,'Roteirista',4,4,4,4,4,4,4),(20,'Mídia Social',4,4,4,4,4,4,4),(21,'Fornecedor de Serviço',4,4,4,4,4,4,4),(22,'Fornecedor de Produto',4,4,4,4,4,4,4),(23,'Coordenador de Pesquisa',6,6,6,6,6,6,6),(24,'Analista de Pesquisa',4,4,4,4,4,4,4),(25,'Pesquisador de Campo',4,4,4,4,4,4,4),(26,'Pesquisador Online',4,4,4,4,4,4,4),(27,'Coordenador da Militância e Cabos Eleito',6,6,6,6,6,6,6),(28,'Militante',4,4,4,4,4,4,4),(29,'Cabo Eleitoral',4,4,4,4,4,4,4);
/*!40000 ALTER TABLE `candidato_userroleslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_bairro`
--

DROP TABLE IF EXISTS `dashboard_bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_bairro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Uf` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Codigo` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_bairro`
--

LOCK TABLES `dashboard_bairro` WRITE;
/*!40000 ALTER TABLE `dashboard_bairro` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_estado`
--

DROP TABLE IF EXISTS `dashboard_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_estado` (
  `CodigoUf` smallint(5) unsigned NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Uf` varchar(2) NOT NULL,
  `Regiao` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`CodigoUf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_estado`
--

LOCK TABLES `dashboard_estado` WRITE;
/*!40000 ALTER TABLE `dashboard_estado` DISABLE KEYS */;
INSERT INTO `dashboard_estado` VALUES (11,'Rondônia','RO',1),(12,'Acre','AC',1),(13,'Amazonas','AM',1),(14,'Roraima','RR',1),(15,'Pará','PA',1),(16,'Amapá','AP',1),(17,'Tocantins','TO',1),(21,'Maranhão','MA',2),(22,'Piauí','PI',2),(23,'Ceará','CE',2),(24,'Rio Grande do Norte','RN',2),(25,'Paraíba','PB',2),(26,'Pernambuco','PE',2),(27,'Alagoas','AL',2),(28,'Sergipe','SE',2),(29,'Bahia','BA',2),(31,'Minas Gerais','MG',3),(32,'Espírito Santo','ES',3),(33,'Rio de Janeiro','RJ',3),(35,'São Paulo','SP',3),(41,'Paraná','PR',4),(42,'Santa Catarina','SC',4),(43,'Rio Grande do Sul','RS',4),(50,'Mato Grosso do Sul','MS',5),(51,'Mato Grosso','MT',5),(52,'Goiás','GO',5),(53,'Distrito Federal','DF',5);
/*!40000 ALTER TABLE `dashboard_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_municipio`
--

DROP TABLE IF EXISTS `dashboard_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Uf` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Codigo` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_municipio`
--

LOCK TABLES `dashboard_municipio` WRITE;
/*!40000 ALTER TABLE `dashboard_municipio` DISABLE KEYS */;
INSERT INTO `dashboard_municipio` VALUES (1,1100015,'Alta Floresta D\'Oeste','RO'),(2,1100023,'Ariquemes','RO'),(3,1100031,'Cabixi','RO'),(4,1100049,'Cacoal','RO'),(5,1100056,'Cerejeiras','RO'),(6,1100064,'Colorado do Oeste','RO'),(7,1100072,'Corumbiara','RO'),(8,1100080,'Costa Marques','RO'),(9,1100098,'Espigão D\'Oeste','RO'),(10,1100106,'Guajará-Mirim','RO'),(11,1100114,'Jaru','RO'),(12,1100122,'Ji-Paraná','RO'),(13,1100130,'Machadinho D\'Oeste','RO'),(14,1100148,'Nova Brasilândia D\'Oeste','RO'),(15,1100155,'Ouro Preto do Oeste','RO'),(16,1100189,'Pimenta Bueno','RO'),(17,1100205,'Porto Velho','RO'),(18,1100254,'Presidente Médici','RO'),(19,1100262,'Rio Crespo','RO'),(20,1100288,'Rolim de Moura','RO'),(21,1100296,'Santa Luzia D\'Oeste','RO'),(22,1100304,'Vilhena','RO'),(23,1100320,'São Miguel do Guaporé','RO'),(24,1100338,'Nova Mamoré','RO'),(25,1100346,'Alvorada D\'Oeste','RO'),(26,1100379,'Alto Alegre dos Parecis','RO'),(27,1100403,'Alto Paraíso','RO'),(28,1100452,'Buritis','RO'),(29,1100502,'Novo Horizonte do Oeste','RO'),(30,1100601,'Cacaulândia','RO'),(31,1100700,'Campo Novo de Rondônia','RO'),(32,1100809,'Candeias do Jamari','RO'),(33,1100908,'Castanheiras','RO'),(34,1100924,'Chupinguaia','RO'),(35,1100940,'Cujubim','RO'),(36,1101005,'Governador Jorge Teixeira','RO'),(37,1101104,'Itapuã do Oeste','RO'),(38,1101203,'Ministro Andreazza','RO'),(39,1101302,'Mirante da Serra','RO'),(40,1101401,'Monte Negro','RO'),(41,1101435,'Nova União','RO'),(42,1101450,'Parecis','RO'),(43,1101468,'Pimenteiras do Oeste','RO'),(44,1101476,'Primavera de Rondônia','RO'),(45,1101484,'São Felipe D\'Oeste','RO'),(46,1101492,'São Francisco do Guaporé','RO'),(47,1101500,'Seringueiras','RO'),(48,1101559,'Teixeirópolis','RO'),(49,1101609,'Theobroma','RO'),(50,1101708,'Urupá','RO'),(51,1101757,'Vale do Anari','RO'),(52,1101807,'Vale do Paraíso','RO'),(53,1200013,'Acrelândia','AC'),(54,1200054,'Assis Brasil','AC'),(55,1200104,'Brasiléia','AC'),(56,1200138,'Bujari','AC'),(57,1200179,'Capixaba','AC'),(58,1200203,'Cruzeiro do Sul','AC'),(59,1200252,'Epitaciolândia','AC'),(60,1200302,'Feijó','AC'),(61,1200328,'Jordão','AC'),(62,1200336,'Mâncio Lima','AC'),(63,1200344,'Manoel Urbano','AC'),(64,1200351,'Marechal Thaumaturgo','AC'),(65,1200385,'Plácido de Castro','AC'),(66,1200393,'Porto Walter','AC'),(67,1200401,'Rio Branco','AC'),(68,1200427,'Rodrigues Alves','AC'),(69,1200435,'Santa Rosa do Purus','AC'),(70,1200450,'Senador Guiomard','AC'),(71,1200500,'Sena Madureira','AC'),(72,1200609,'Tarauacá','AC'),(73,1200708,'Xapuri','AC'),(74,1200807,'Porto Acre','AC'),(75,1300029,'Alvarães','AM'),(76,1300060,'Amaturá','AM'),(77,1300086,'Anamã','AM'),(78,1300102,'Anori','AM'),(79,1300144,'Apuí','AM'),(80,1300201,'Atalaia do Norte','AM'),(81,1300300,'Autazes','AM'),(82,1300409,'Barcelos','AM'),(83,1300508,'Barreirinha','AM'),(84,1300607,'Benjamin Constant','AM'),(85,1300631,'Beruri','AM'),(86,1300680,'Boa Vista do Ramos','AM'),(87,1300706,'Boca do Acre','AM'),(88,1300805,'Borba','AM'),(89,1300839,'Caapiranga','AM'),(90,1300904,'Canutama','AM'),(91,1301001,'Carauari','AM'),(92,1301100,'Careiro','AM'),(93,1301159,'Careiro da Várzea','AM'),(94,1301209,'Coari','AM'),(95,1301308,'Codajás','AM'),(96,1301407,'Eirunepé','AM'),(97,1301506,'Envira','AM'),(98,1301605,'Fonte Boa','AM'),(99,1301654,'Guajará','AM'),(100,1301704,'Humaitá','AM'),(101,1301803,'Ipixuna','AM'),(102,1301852,'Iranduba','AM'),(103,1301902,'Itacoatiara','AM'),(104,1301951,'Itamarati','AM'),(105,1302009,'Itapiranga','AM'),(106,1302108,'Japurá','AM'),(107,1302207,'Juruá','AM'),(108,1302306,'Jutaí','AM'),(109,1302405,'Lábrea','AM'),(110,1302504,'Manacapuru','AM'),(111,1302553,'Manaquiri','AM'),(112,1302603,'Manaus','AM'),(113,1302702,'Manicoré','AM'),(114,1302801,'Maraã','AM'),(115,1302900,'Maués','AM'),(116,1303007,'Nhamundá','AM'),(117,1303106,'Nova Olinda do Norte','AM'),(118,1303205,'Novo Airão','AM'),(119,1303304,'Novo Aripuanã','AM'),(120,1303403,'Parintins','AM'),(121,1303502,'Pauini','AM'),(122,1303536,'Presidente Figueiredo','AM'),(123,1303569,'Rio Preto da Eva','AM'),(124,1303601,'Santa Isabel do Rio Negro','AM'),(125,1303700,'Santo Antônio do Içá','AM'),(126,1303809,'São Gabriel da Cachoeira','AM'),(127,1303908,'São Paulo de Olivença','AM'),(128,1303957,'São Sebastião do Uatumã','AM'),(129,1304005,'Silves','AM'),(130,1304062,'Tabatinga','AM'),(131,1304104,'Tapauá','AM'),(132,1304203,'Tefé','AM'),(133,1304237,'Tonantins','AM'),(134,1304260,'Uarini','AM'),(135,1304302,'Urucará','AM'),(136,1304401,'Urucurituba','AM'),(137,1400027,'Amajari','RR'),(138,1400050,'Alto Alegre','RR'),(139,1400100,'Boa Vista','RR'),(140,1400159,'Bonfim','RR'),(141,1400175,'Cantá','RR'),(142,1400209,'Caracaraí','RR'),(143,1400233,'Caroebe','RR'),(144,1400282,'Iracema','RR'),(145,1400308,'Mucajaí','RR'),(146,1400407,'Normandia','RR'),(147,1400456,'Pacaraima','RR'),(148,1400472,'Rorainópolis','RR'),(149,1400506,'São João da Baliza','RR'),(150,1400605,'São Luiz','RR'),(151,1400704,'Uiramutã','RR'),(152,1500107,'Abaetetuba','PA'),(153,1500131,'Abel Figueiredo','PA'),(154,1500206,'Acará','PA'),(155,1500305,'Afuá','PA'),(156,1500347,'Água Azul do Norte','PA'),(157,1500404,'Alenquer','PA'),(158,1500503,'Almeirim','PA'),(159,1500602,'Altamira','PA'),(160,1500701,'Anajás','PA'),(161,1500800,'Ananindeua','PA'),(162,1500859,'Anapu','PA'),(163,1500909,'Augusto Corrêa','PA'),(164,1500958,'Aurora do Pará','PA'),(165,1501006,'Aveiro','PA'),(166,1501105,'Bagre','PA'),(167,1501204,'Baião','PA'),(168,1501253,'Bannach','PA'),(169,1501303,'Barcarena','PA'),(170,1501402,'Belém','PA'),(171,1501451,'Belterra','PA'),(172,1501501,'Benevides','PA'),(173,1501576,'Bom Jesus do Tocantins','PA'),(174,1501600,'Bonito','PA'),(175,1501709,'Bragança','PA'),(176,1501725,'Brasil Novo','PA'),(177,1501758,'Brejo Grande do Araguaia','PA'),(178,1501782,'Breu Branco','PA'),(179,1501808,'Breves','PA'),(180,1501907,'Bujaru','PA'),(181,1501956,'Cachoeira do Piriá','PA'),(182,1502004,'Cachoeira do Arari','PA'),(183,1502103,'Cametá','PA'),(184,1502152,'Canaã dos Carajás','PA'),(185,1502202,'Capanema','PA'),(186,1502301,'Capitão Poço','PA'),(187,1502400,'Castanhal','PA'),(188,1502509,'Chaves','PA'),(189,1502608,'Colares','PA'),(190,1502707,'Conceição do Araguaia','PA'),(191,1502756,'Concórdia do Pará','PA'),(192,1502764,'Cumaru do Norte','PA'),(193,1502772,'Curionópolis','PA'),(194,1502806,'Curralinho','PA'),(195,1502855,'Curuá','PA'),(196,1502905,'Curuçá','PA'),(197,1502939,'Dom Eliseu','PA'),(198,1502954,'Eldorado dos Carajás','PA'),(199,1503002,'Faro','PA'),(200,1503044,'Floresta do Araguaia','PA'),(201,1503077,'Garrafão do Norte','PA'),(202,1503093,'Goianésia do Pará','PA'),(203,1503101,'Gurupá','PA'),(204,1503200,'Igarapé-Açu','PA'),(205,1503309,'Igarapé-Miri','PA'),(206,1503408,'Inhangapi','PA'),(207,1503457,'Ipixuna do Pará','PA'),(208,1503507,'Irituia','PA'),(209,1503606,'Itaituba','PA'),(210,1503705,'Itupiranga','PA'),(211,1503754,'Jacareacanga','PA'),(212,1503804,'Jacundá','PA'),(213,1503903,'Juruti','PA'),(214,1504000,'Limoeiro do Ajuru','PA'),(215,1504059,'Mãe do Rio','PA'),(216,1504109,'Magalhães Barata','PA'),(217,1504208,'Marabá','PA'),(218,1504307,'Maracanã','PA'),(219,1504406,'Marapanim','PA'),(220,1504422,'Marituba','PA'),(221,1504455,'Medicilândia','PA'),(222,1504505,'Melgaço','PA'),(223,1504604,'Mocajuba','PA'),(224,1504703,'Moju','PA'),(225,1504752,'Mojuí dos Campos','PA'),(226,1504802,'Monte Alegre','PA'),(227,1504901,'Muaná','PA'),(228,1504950,'Nova Esperança do Piriá','PA'),(229,1504976,'Nova Ipixuna','PA'),(230,1505007,'Nova Timboteua','PA'),(231,1505031,'Novo Progresso','PA'),(232,1505064,'Novo Repartimento','PA'),(233,1505106,'Óbidos','PA'),(234,1505205,'Oeiras do Pará','PA'),(235,1505304,'Oriximiná','PA'),(236,1505403,'Ourém','PA'),(237,1505437,'Ourilândia do Norte','PA'),(238,1505486,'Pacajá','PA'),(239,1505494,'Palestina do Pará','PA'),(240,1505502,'Paragominas','PA'),(241,1505536,'Parauapebas','PA'),(242,1505551,'Pau D\'Arco','PA'),(243,1505601,'Peixe-Boi','PA'),(244,1505635,'Piçarra','PA'),(245,1505650,'Placas','PA'),(246,1505700,'Ponta de Pedras','PA'),(247,1505809,'Portel','PA'),(248,1505908,'Porto de Moz','PA'),(249,1506005,'Prainha','PA'),(250,1506104,'Primavera','PA'),(251,1506112,'Quatipuru','PA'),(252,1506138,'Redenção','PA'),(253,1506161,'Rio Maria','PA'),(254,1506187,'Rondon do Pará','PA'),(255,1506195,'Rurópolis','PA'),(256,1506203,'Salinópolis','PA'),(257,1506302,'Salvaterra','PA'),(258,1506351,'Santa Bárbara do Pará','PA'),(259,1506401,'Santa Cruz do Arari','PA'),(260,1506500,'Santa Isabel do Pará','PA'),(261,1506559,'Santa Luzia do Pará','PA'),(262,1506583,'Santa Maria das Barreiras','PA'),(263,1506609,'Santa Maria do Pará','PA'),(264,1506708,'Santana do Araguaia','PA'),(265,1506807,'Santarém','PA'),(266,1506906,'Santarém Novo','PA'),(267,1507003,'Santo Antônio do Tauá','PA'),(268,1507102,'São Caetano de Odivelas','PA'),(269,1507151,'São Domingos do Araguaia','PA'),(270,1507201,'São Domingos do Capim','PA'),(271,1507300,'São Félix do Xingu','PA'),(272,1507409,'São Francisco do Pará','PA'),(273,1507458,'São Geraldo do Araguaia','PA'),(274,1507466,'São João da Ponta','PA'),(275,1507474,'São João de Pirabas','PA'),(276,1507508,'São João do Araguaia','PA'),(277,1507607,'São Miguel do Guamá','PA'),(278,1507706,'São Sebastião da Boa Vista','PA'),(279,1507755,'Sapucaia','PA'),(280,1507805,'Senador José Porfírio','PA'),(281,1507904,'Soure','PA'),(282,1507953,'Tailândia','PA'),(283,1507961,'Terra Alta','PA'),(284,1507979,'Terra Santa','PA'),(285,1508001,'Tomé-Açu','PA'),(286,1508035,'Tracuateua','PA'),(287,1508050,'Trairão','PA'),(288,1508084,'Tucumã','PA'),(289,1508100,'Tucuruí','PA'),(290,1508126,'Ulianópolis','PA'),(291,1508159,'Uruará','PA'),(292,1508209,'Vigia','PA'),(293,1508308,'Viseu','PA'),(294,1508357,'Vitória do Xingu','PA'),(295,1508407,'Xinguara','PA'),(296,1600055,'Serra do Navio','AP'),(297,1600105,'Amapá','AP'),(298,1600154,'Pedra Branca do Amapari','AP'),(299,1600204,'Calçoene','AP'),(300,1600212,'Cutias','AP'),(301,1600238,'Ferreira Gomes','AP'),(302,1600253,'Itaubal','AP'),(303,1600279,'Laranjal do Jari','AP'),(304,1600303,'Macapá','AP'),(305,1600402,'Mazagão','AP'),(306,1600501,'Oiapoque','AP'),(307,1600535,'Porto Grande','AP'),(308,1600550,'Pracuúba','AP'),(309,1600600,'Santana','AP'),(310,1600709,'Tartarugalzinho','AP'),(311,1600808,'Vitória do Jari','AP'),(312,1700251,'Abreulândia','TO'),(313,1700301,'Aguiarnópolis','TO'),(314,1700350,'Aliança do Tocantins','TO'),(315,1700400,'Almas','TO'),(316,1700707,'Alvorada','TO'),(317,1701002,'Ananás','TO'),(318,1701051,'Angico','TO'),(319,1701101,'Aparecida do Rio Negro','TO'),(320,1701309,'Aragominas','TO'),(321,1701903,'Araguacema','TO'),(322,1702000,'Araguaçu','TO'),(323,1702109,'Araguaína','TO'),(324,1702158,'Araguanã','TO'),(325,1702208,'Araguatins','TO'),(326,1702307,'Arapoema','TO'),(327,1702406,'Arraias','TO'),(328,1702554,'Augustinópolis','TO'),(329,1702703,'Aurora do Tocantins','TO'),(330,1702901,'Axixá do Tocantins','TO'),(331,1703008,'Babaçulândia','TO'),(332,1703057,'Bandeirantes do Tocantins','TO'),(333,1703073,'Barra do Ouro','TO'),(334,1703107,'Barrolândia','TO'),(335,1703206,'Bernardo Sayão','TO'),(336,1703305,'Bom Jesus do Tocantins','TO'),(337,1703602,'Brasilândia do Tocantins','TO'),(338,1703701,'Brejinho de Nazaré','TO'),(339,1703800,'Buriti do Tocantins','TO'),(340,1703826,'Cachoeirinha','TO'),(341,1703842,'Campos Lindos','TO'),(342,1703867,'Cariri do Tocantins','TO'),(343,1703883,'Carmolândia','TO'),(344,1703891,'Carrasco Bonito','TO'),(345,1703909,'Caseara','TO'),(346,1704105,'Centenário','TO'),(347,1704600,'Chapada de Areia','TO'),(348,1705102,'Chapada da Natividade','TO'),(349,1705508,'Colinas do Tocantins','TO'),(350,1705557,'Combinado','TO'),(351,1705607,'Conceição do Tocantins','TO'),(352,1706001,'Couto Magalhães','TO'),(353,1706100,'Cristalândia','TO'),(354,1706258,'Crixás do Tocantins','TO'),(355,1706506,'Darcinópolis','TO'),(356,1707009,'Dianópolis','TO'),(357,1707108,'Divinópolis do Tocantins','TO'),(358,1707207,'Dois Irmãos do Tocantins','TO'),(359,1707306,'Dueré','TO'),(360,1707405,'Esperantina','TO'),(361,1707553,'Fátima','TO'),(362,1707652,'Figueirópolis','TO'),(363,1707702,'Filadélfia','TO'),(364,1708205,'Formoso do Araguaia','TO'),(365,1708254,'Fortaleza do Tabocão','TO'),(366,1708304,'Goianorte','TO'),(367,1709005,'Goiatins','TO'),(368,1709302,'Guaraí','TO'),(369,1709500,'Gurupi','TO'),(370,1709807,'Ipueiras','TO'),(371,1710508,'Itacajá','TO'),(372,1710706,'Itaguatins','TO'),(373,1710904,'Itapiratins','TO'),(374,1711100,'Itaporã do Tocantins','TO'),(375,1711506,'Jaú do Tocantins','TO'),(376,1711803,'Juarina','TO'),(377,1711902,'Lagoa da Confusão','TO'),(378,1711951,'Lagoa do Tocantins','TO'),(379,1712009,'Lajeado','TO'),(380,1712157,'Lavandeira','TO'),(381,1712405,'Lizarda','TO'),(382,1712454,'Luzinópolis','TO'),(383,1712504,'Marianópolis do Tocantins','TO'),(384,1712702,'Mateiros','TO'),(385,1712801,'Maurilândia do Tocantins','TO'),(386,1713205,'Miracema do Tocantins','TO'),(387,1713304,'Miranorte','TO'),(388,1713601,'Monte do Carmo','TO'),(389,1713700,'Monte Santo do Tocantins','TO'),(390,1713809,'Palmeiras do Tocantins','TO'),(391,1713957,'Muricilândia','TO'),(392,1714203,'Natividade','TO'),(393,1714302,'Nazaré','TO'),(394,1714880,'Nova Olinda','TO'),(395,1715002,'Nova Rosalândia','TO'),(396,1715101,'Novo Acordo','TO'),(397,1715150,'Novo Alegre','TO'),(398,1715259,'Novo Jardim','TO'),(399,1715507,'Oliveira de Fátima','TO'),(400,1715705,'Palmeirante','TO'),(401,1715754,'Palmeirópolis','TO'),(402,1716109,'Paraíso do Tocantins','TO'),(403,1716208,'Paranã','TO'),(404,1716307,'Pau D\'Arco','TO'),(405,1716505,'Pedro Afonso','TO'),(406,1716604,'Peixe','TO'),(407,1716653,'Pequizeiro','TO'),(408,1716703,'Colméia','TO'),(409,1717008,'Pindorama do Tocantins','TO'),(410,1717206,'Piraquê','TO'),(411,1717503,'Pium','TO'),(412,1717800,'Ponte Alta do Bom Jesus','TO'),(413,1717909,'Ponte Alta do Tocantins','TO'),(414,1718006,'Porto Alegre do Tocantins','TO'),(415,1718204,'Porto Nacional','TO'),(416,1718303,'Praia Norte','TO'),(417,1718402,'Presidente Kennedy','TO'),(418,1718451,'Pugmil','TO'),(419,1718501,'Recursolândia','TO'),(420,1718550,'Riachinho','TO'),(421,1718659,'Rio da Conceição','TO'),(422,1718709,'Rio dos Bois','TO'),(423,1718758,'Rio Sono','TO'),(424,1718808,'Sampaio','TO'),(425,1718840,'Sandolândia','TO'),(426,1718865,'Santa Fé do Araguaia','TO'),(427,1718881,'Santa Maria do Tocantins','TO'),(428,1718899,'Santa Rita do Tocantins','TO'),(429,1718907,'Santa Rosa do Tocantins','TO'),(430,1719004,'Santa Tereza do Tocantins','TO'),(431,1720002,'Santa Terezinha do Tocantins','TO'),(432,1720101,'São Bento do Tocantins','TO'),(433,1720150,'São Félix do Tocantins','TO'),(434,1720200,'São Miguel do Tocantins','TO'),(435,1720259,'São Salvador do Tocantins','TO'),(436,1720309,'São Sebastião do Tocantins','TO'),(437,1720499,'São Valério','TO'),(438,1720655,'Silvanópolis','TO'),(439,1720804,'Sítio Novo do Tocantins','TO'),(440,1720853,'Sucupira','TO'),(441,1720903,'Taguatinga','TO'),(442,1720937,'Taipas do Tocantins','TO'),(443,1720978,'Talismã','TO'),(444,1721000,'Palmas','TO'),(445,1721109,'Tocantínia','TO'),(446,1721208,'Tocantinópolis','TO'),(447,1721257,'Tupirama','TO'),(448,1721307,'Tupiratins','TO'),(449,1722081,'Wanderlândia','TO'),(450,1722107,'Xambioá','TO'),(451,2100055,'Açailândia','MA'),(452,2100105,'Afonso Cunha','MA'),(453,2100154,'Água Doce do Maranhão','MA'),(454,2100204,'Alcântara','MA'),(455,2100303,'Aldeias Altas','MA'),(456,2100402,'Altamira do Maranhão','MA'),(457,2100436,'Alto Alegre do Maranhão','MA'),(458,2100477,'Alto Alegre do Pindaré','MA'),(459,2100501,'Alto Parnaíba','MA'),(460,2100550,'Amapá do Maranhão','MA'),(461,2100600,'Amarante do Maranhão','MA'),(462,2100709,'Anajatuba','MA'),(463,2100808,'Anapurus','MA'),(464,2100832,'Apicum-Açu','MA'),(465,2100873,'Araguanã','MA'),(466,2100907,'Araioses','MA'),(467,2100956,'Arame','MA'),(468,2101004,'Arari','MA'),(469,2101103,'Axixá','MA'),(470,2101202,'Bacabal','MA'),(471,2101251,'Bacabeira','MA'),(472,2101301,'Bacuri','MA'),(473,2101350,'Bacurituba','MA'),(474,2101400,'Balsas','MA'),(475,2101509,'Barão de Grajaú','MA'),(476,2101608,'Barra do Corda','MA'),(477,2101707,'Barreirinhas','MA'),(478,2101731,'Belágua','MA'),(479,2101772,'Bela Vista do Maranhão','MA'),(480,2101806,'Benedito Leite','MA'),(481,2101905,'Bequimão','MA'),(482,2101939,'Bernardo do Mearim','MA'),(483,2101970,'Boa Vista do Gurupi','MA'),(484,2102002,'Bom Jardim','MA'),(485,2102036,'Bom Jesus das Selvas','MA'),(486,2102077,'Bom Lugar','MA'),(487,2102101,'Brejo','MA'),(488,2102150,'Brejo de Areia','MA'),(489,2102200,'Buriti','MA'),(490,2102309,'Buriti Bravo','MA'),(491,2102325,'Buriticupu','MA'),(492,2102358,'Buritirana','MA'),(493,2102374,'Cachoeira Grande','MA'),(494,2102408,'Cajapió','MA'),(495,2102507,'Cajari','MA'),(496,2102556,'Campestre do Maranhão','MA'),(497,2102606,'Cândido Mendes','MA'),(498,2102705,'Cantanhede','MA'),(499,2102754,'Capinzal do Norte','MA'),(500,2102804,'Carolina','MA'),(501,2102903,'Carutapera','MA'),(502,2103000,'Caxias','MA'),(503,2103109,'Cedral','MA'),(504,2103125,'Central do Maranhão','MA'),(505,2103158,'Centro do Guilherme','MA'),(506,2103174,'Centro Novo do Maranhão','MA'),(507,2103208,'Chapadinha','MA'),(508,2103257,'Cidelândia','MA'),(509,2103307,'Codó','MA'),(510,2103406,'Coelho Neto','MA'),(511,2103505,'Colinas','MA'),(512,2103554,'Conceição do Lago-Açu','MA'),(513,2103604,'Coroatá','MA'),(514,2103703,'Cururupu','MA'),(515,2103752,'Davinópolis','MA'),(516,2103802,'Dom Pedro','MA'),(517,2103901,'Duque Bacelar','MA'),(518,2104008,'Esperantinópolis','MA'),(519,2104057,'Estreito','MA'),(520,2104073,'Feira Nova do Maranhão','MA'),(521,2104081,'Fernando Falcão','MA'),(522,2104099,'Formosa da Serra Negra','MA'),(523,2104107,'Fortaleza dos Nogueiras','MA'),(524,2104206,'Fortuna','MA'),(525,2104305,'Godofredo Viana','MA'),(526,2104404,'Gonçalves Dias','MA'),(527,2104503,'Governador Archer','MA'),(528,2104552,'Governador Edison Lobão','MA'),(529,2104602,'Governador Eugênio Barros','MA'),(530,2104628,'Governador Luiz Rocha','MA'),(531,2104651,'Governador Newton Bello','MA'),(532,2104677,'Governador Nunes Freire','MA'),(533,2104701,'Graça Aranha','MA'),(534,2104800,'Grajaú','MA'),(535,2104909,'Guimarães','MA'),(536,2105005,'Humberto de Campos','MA'),(537,2105104,'Icatu','MA'),(538,2105153,'Igarapé do Meio','MA'),(539,2105203,'Igarapé Grande','MA'),(540,2105302,'Imperatriz','MA'),(541,2105351,'Itaipava do Grajaú','MA'),(542,2105401,'Itapecuru Mirim','MA'),(543,2105427,'Itinga do Maranhão','MA'),(544,2105450,'Jatobá','MA'),(545,2105476,'Jenipapo dos Vieiras','MA'),(546,2105500,'João Lisboa','MA'),(547,2105609,'Joselândia','MA'),(548,2105658,'Junco do Maranhão','MA'),(549,2105708,'Lago da Pedra','MA'),(550,2105807,'Lago do Junco','MA'),(551,2105906,'Lago Verde','MA'),(552,2105922,'Lagoa do Mato','MA'),(553,2105948,'Lago dos Rodrigues','MA'),(554,2105963,'Lagoa Grande do Maranhão','MA'),(555,2105989,'Lajeado Novo','MA'),(556,2106003,'Lima Campos','MA'),(557,2106102,'Loreto','MA'),(558,2106201,'Luís Domingues','MA'),(559,2106300,'Magalhães de Almeida','MA'),(560,2106326,'Maracaçumé','MA'),(561,2106359,'Marajá do Sena','MA'),(562,2106375,'Maranhãozinho','MA'),(563,2106409,'Mata Roma','MA'),(564,2106508,'Matinha','MA'),(565,2106607,'Matões','MA'),(566,2106631,'Matões do Norte','MA'),(567,2106672,'Milagres do Maranhão','MA'),(568,2106706,'Mirador','MA'),(569,2106755,'Miranda do Norte','MA'),(570,2106805,'Mirinzal','MA'),(571,2106904,'Monção','MA'),(572,2107001,'Montes Altos','MA'),(573,2107100,'Morros','MA'),(574,2107209,'Nina Rodrigues','MA'),(575,2107258,'Nova Colinas','MA'),(576,2107308,'Nova Iorque','MA'),(577,2107357,'Nova Olinda do Maranhão','MA'),(578,2107407,'Olho D\'Água das Cunhãs','MA'),(579,2107456,'Olinda Nova do Maranhão','MA'),(580,2107506,'Paço do Lumiar','MA'),(581,2107605,'Palmeirândia','MA'),(582,2107704,'Paraibano','MA'),(583,2107803,'Parnarama','MA'),(584,2107902,'Passagem Franca','MA'),(585,2108009,'Pastos Bons','MA'),(586,2108058,'Paulino Neves','MA'),(587,2108108,'Paulo Ramos','MA'),(588,2108207,'Pedreiras','MA'),(589,2108256,'Pedro do Rosário','MA'),(590,2108306,'Penalva','MA'),(591,2108405,'Peri Mirim','MA'),(592,2108454,'Peritoró','MA'),(593,2108504,'Pindaré-Mirim','MA'),(594,2108603,'Pinheiro','MA'),(595,2108702,'Pio XII','MA'),(596,2108801,'Pirapemas','MA'),(597,2108900,'Poção de Pedras','MA'),(598,2109007,'Porto Franco','MA'),(599,2109056,'Porto Rico do Maranhão','MA'),(600,2109106,'Presidente Dutra','MA'),(601,2109205,'Presidente Juscelino','MA'),(602,2109239,'Presidente Médici','MA'),(603,2109270,'Presidente Sarney','MA'),(604,2109304,'Presidente Vargas','MA'),(605,2109403,'Primeira Cruz','MA'),(606,2109452,'Raposa','MA'),(607,2109502,'Riachão','MA'),(608,2109551,'Ribamar Fiquene','MA'),(609,2109601,'Rosário','MA'),(610,2109700,'Sambaíba','MA'),(611,2109759,'Santa Filomena do Maranhão','MA'),(612,2109809,'Santa Helena','MA'),(613,2109908,'Santa Inês','MA'),(614,2110005,'Santa Luzia','MA'),(615,2110039,'Santa Luzia do Paruá','MA'),(616,2110104,'Santa Quitéria do Maranhão','MA'),(617,2110203,'Santa Rita','MA'),(618,2110237,'Santana do Maranhão','MA'),(619,2110278,'Santo Amaro do Maranhão','MA'),(620,2110302,'Santo Antônio dos Lopes','MA'),(621,2110401,'São Benedito do Rio Preto','MA'),(622,2110500,'São Bento','MA'),(623,2110609,'São Bernardo','MA'),(624,2110658,'São Domingos do Azeitão','MA'),(625,2110708,'São Domingos do Maranhão','MA'),(626,2110807,'São Félix de Balsas','MA'),(627,2110856,'São Francisco do Brejão','MA'),(628,2110906,'São Francisco do Maranhão','MA'),(629,2111003,'São João Batista','MA'),(630,2111029,'São João do Carú','MA'),(631,2111052,'São João do Paraíso','MA'),(632,2111078,'São João do Soter','MA'),(633,2111102,'São João dos Patos','MA'),(634,2111201,'São José de Ribamar','MA'),(635,2111250,'São José dos Basílios','MA'),(636,2111300,'São Luís','MA'),(637,2111409,'São Luís Gonzaga do Maranhão','MA'),(638,2111508,'São Mateus do Maranhão','MA'),(639,2111532,'São Pedro da Água Branca','MA'),(640,2111573,'São Pedro dos Crentes','MA'),(641,2111607,'São Raimundo das Mangabeiras','MA'),(642,2111631,'São Raimundo do Doca Bezerra','MA'),(643,2111672,'São Roberto','MA'),(644,2111706,'São Vicente Ferrer','MA'),(645,2111722,'Satubinha','MA'),(646,2111748,'Senador Alexandre Costa','MA'),(647,2111763,'Senador La Rocque','MA'),(648,2111789,'Serrano do Maranhão','MA'),(649,2111805,'Sítio Novo','MA'),(650,2111904,'Sucupira do Norte','MA'),(651,2111953,'Sucupira do Riachão','MA'),(652,2112001,'Tasso Fragoso','MA'),(653,2112100,'Timbiras','MA'),(654,2112209,'Timon','MA'),(655,2112233,'Trizidela do Vale','MA'),(656,2112274,'Tufilândia','MA'),(657,2112308,'Tuntum','MA'),(658,2112407,'Turiaçu','MA'),(659,2112456,'Turilândia','MA'),(660,2112506,'Tutóia','MA'),(661,2112605,'Urbano Santos','MA'),(662,2112704,'Vargem Grande','MA'),(663,2112803,'Viana','MA'),(664,2112852,'Vila Nova dos Martírios','MA'),(665,2112902,'Vitória do Mearim','MA'),(666,2113009,'Vitorino Freire','MA'),(667,2114007,'Zé Doca','MA'),(668,2200053,'Acauã','PI'),(669,2200103,'Agricolândia','PI'),(670,2200202,'Água Branca','PI'),(671,2200251,'Alagoinha do Piauí','PI'),(672,2200277,'Alegrete do Piauí','PI'),(673,2200301,'Alto Longá','PI'),(674,2200400,'Altos','PI'),(675,2200459,'Alvorada do Gurguéia','PI'),(676,2200509,'Amarante','PI'),(677,2200608,'Angical do Piauí','PI'),(678,2200707,'Anísio de Abreu','PI'),(679,2200806,'Antônio Almeida','PI'),(680,2200905,'Aroazes','PI'),(681,2200954,'Aroeiras do Itaim','PI'),(682,2201002,'Arraial','PI'),(683,2201051,'Assunção do Piauí','PI'),(684,2201101,'Avelino Lopes','PI'),(685,2201150,'Baixa Grande do Ribeiro','PI'),(686,2201176,'Barra D\'Alcântara','PI'),(687,2201200,'Barras','PI'),(688,2201309,'Barreiras do Piauí','PI'),(689,2201408,'Barro Duro','PI'),(690,2201507,'Batalha','PI'),(691,2201556,'Bela Vista do Piauí','PI'),(692,2201572,'Belém do Piauí','PI'),(693,2201606,'Beneditinos','PI'),(694,2201705,'Bertolínia','PI'),(695,2201739,'Betânia do Piauí','PI'),(696,2201770,'Boa Hora','PI'),(697,2201804,'Bocaina','PI'),(698,2201903,'Bom Jesus','PI'),(699,2201919,'Bom Princípio do Piauí','PI'),(700,2201929,'Bonfim do Piauí','PI'),(701,2201945,'Boqueirão do Piauí','PI'),(702,2201960,'Brasileira','PI'),(703,2201988,'Brejo do Piauí','PI'),(704,2202000,'Buriti dos Lopes','PI'),(705,2202026,'Buriti dos Montes','PI'),(706,2202059,'Cabeceiras do Piauí','PI'),(707,2202075,'Cajazeiras do Piauí','PI'),(708,2202083,'Cajueiro da Praia','PI'),(709,2202091,'Caldeirão Grande do Piauí','PI'),(710,2202109,'Campinas do Piauí','PI'),(711,2202117,'Campo Alegre do Fidalgo','PI'),(712,2202133,'Campo Grande do Piauí','PI'),(713,2202174,'Campo Largo do Piauí','PI'),(714,2202208,'Campo Maior','PI'),(715,2202251,'Canavieira','PI'),(716,2202307,'Canto do Buriti','PI'),(717,2202406,'Capitão de Campos','PI'),(718,2202455,'Capitão Gervásio Oliveira','PI'),(719,2202505,'Caracol','PI'),(720,2202539,'Caraúbas do Piauí','PI'),(721,2202554,'Caridade do Piauí','PI'),(722,2202604,'Castelo do Piauí','PI'),(723,2202653,'Caxingó','PI'),(724,2202703,'Cocal','PI'),(725,2202711,'Cocal de Telha','PI'),(726,2202729,'Cocal dos Alves','PI'),(727,2202737,'Coivaras','PI'),(728,2202752,'Colônia do Gurguéia','PI'),(729,2202778,'Colônia do Piauí','PI'),(730,2202802,'Conceição do Canindé','PI'),(731,2202851,'Coronel José Dias','PI'),(732,2202901,'Corrente','PI'),(733,2203008,'Cristalândia do Piauí','PI'),(734,2203107,'Cristino Castro','PI'),(735,2203206,'Curimatá','PI'),(736,2203230,'Currais','PI'),(737,2203255,'Curralinhos','PI'),(738,2203271,'Curral Novo do Piauí','PI'),(739,2203305,'Demerval Lobão','PI'),(740,2203354,'Dirceu Arcoverde','PI'),(741,2203404,'Dom Expedito Lopes','PI'),(742,2203420,'Domingos Mourão','PI'),(743,2203453,'Dom Inocêncio','PI'),(744,2203503,'Elesbão Veloso','PI'),(745,2203602,'Eliseu Martins','PI'),(746,2203701,'Esperantina','PI'),(747,2203750,'Fartura do Piauí','PI'),(748,2203800,'Flores do Piauí','PI'),(749,2203859,'Floresta do Piauí','PI'),(750,2203909,'Floriano','PI'),(751,2204006,'Francinópolis','PI'),(752,2204105,'Francisco Ayres','PI'),(753,2204154,'Francisco Macedo','PI'),(754,2204204,'Francisco Santos','PI'),(755,2204303,'Fronteiras','PI'),(756,2204352,'Geminiano','PI'),(757,2204402,'Gilbués','PI'),(758,2204501,'Guadalupe','PI'),(759,2204550,'Guaribas','PI'),(760,2204600,'Hugo Napoleão','PI'),(761,2204659,'Ilha Grande','PI'),(762,2204709,'Inhuma','PI'),(763,2204808,'Ipiranga do Piauí','PI'),(764,2204907,'Isaías Coelho','PI'),(765,2205003,'Itainópolis','PI'),(766,2205102,'Itaueira','PI'),(767,2205151,'Jacobina do Piauí','PI'),(768,2205201,'Jaicós','PI'),(769,2205250,'Jardim do Mulato','PI'),(770,2205276,'Jatobá do Piauí','PI'),(771,2205300,'Jerumenha','PI'),(772,2205359,'João Costa','PI'),(773,2205409,'Joaquim Pires','PI'),(774,2205458,'Joca Marques','PI'),(775,2205508,'José de Freitas','PI'),(776,2205516,'Juazeiro do Piauí','PI'),(777,2205524,'Júlio Borges','PI'),(778,2205532,'Jurema','PI'),(779,2205540,'Lagoinha do Piauí','PI'),(780,2205557,'Lagoa Alegre','PI'),(781,2205565,'Lagoa do Barro do Piauí','PI'),(782,2205573,'Lagoa de São Francisco','PI'),(783,2205581,'Lagoa do Piauí','PI'),(784,2205599,'Lagoa do Sítio','PI'),(785,2205607,'Landri Sales','PI'),(786,2205706,'Luís Correia','PI'),(787,2205805,'Luzilândia','PI'),(788,2205854,'Madeiro','PI'),(789,2205904,'Manoel Emídio','PI'),(790,2205953,'Marcolândia','PI'),(791,2206001,'Marcos Parente','PI'),(792,2206050,'Massapê do Piauí','PI'),(793,2206100,'Matias Olímpio','PI'),(794,2206209,'Miguel Alves','PI'),(795,2206308,'Miguel Leão','PI'),(796,2206357,'Milton Brandão','PI'),(797,2206407,'Monsenhor Gil','PI'),(798,2206506,'Monsenhor Hipólito','PI'),(799,2206605,'Monte Alegre do Piauí','PI'),(800,2206654,'Morro Cabeça no Tempo','PI'),(801,2206670,'Morro do Chapéu do Piauí','PI'),(802,2206696,'Murici dos Portelas','PI'),(803,2206704,'Nazaré do Piauí','PI'),(804,2206720,'Nazária','PI'),(805,2206753,'Nossa Senhora de Nazaré','PI'),(806,2206803,'Nossa Senhora dos Remédios','PI'),(807,2206902,'Novo Oriente do Piauí','PI'),(808,2206951,'Novo Santo Antônio','PI'),(809,2207009,'Oeiras','PI'),(810,2207108,'Olho D\'Água do Piauí','PI'),(811,2207207,'Padre Marcos','PI'),(812,2207306,'Paes Landim','PI'),(813,2207355,'Pajeú do Piauí','PI'),(814,2207405,'Palmeira do Piauí','PI'),(815,2207504,'Palmeirais','PI'),(816,2207553,'Paquetá','PI'),(817,2207603,'Parnaguá','PI'),(818,2207702,'Parnaíba','PI'),(819,2207751,'Passagem Franca do Piauí','PI'),(820,2207777,'Patos do Piauí','PI'),(821,2207793,'Pau D\'Arco do Piauí','PI'),(822,2207801,'Paulistana','PI'),(823,2207850,'Pavussu','PI'),(824,2207900,'Pedro II','PI'),(825,2207934,'Pedro Laurentino','PI'),(826,2207959,'Nova Santa Rita','PI'),(827,2208007,'Picos','PI'),(828,2208106,'Pimenteiras','PI'),(829,2208205,'Pio IX','PI'),(830,2208304,'Piracuruca','PI'),(831,2208403,'Piripiri','PI'),(832,2208502,'Porto','PI'),(833,2208551,'Porto Alegre do Piauí','PI'),(834,2208601,'Prata do Piauí','PI'),(835,2208650,'Queimada Nova','PI'),(836,2208700,'Redenção do Gurguéia','PI'),(837,2208809,'Regeneração','PI'),(838,2208858,'Riacho Frio','PI'),(839,2208874,'Ribeira do Piauí','PI'),(840,2208908,'Ribeiro Gonçalves','PI'),(841,2209005,'Rio Grande do Piauí','PI'),(842,2209104,'Santa Cruz do Piauí','PI'),(843,2209153,'Santa Cruz dos Milagres','PI'),(844,2209203,'Santa Filomena','PI'),(845,2209302,'Santa Luz','PI'),(846,2209351,'Santana do Piauí','PI'),(847,2209377,'Santa Rosa do Piauí','PI'),(848,2209401,'Santo Antônio de Lisboa','PI'),(849,2209450,'Santo Antônio dos Milagres','PI'),(850,2209500,'Santo Inácio do Piauí','PI'),(851,2209559,'São Braz do Piauí','PI'),(852,2209609,'São Félix do Piauí','PI'),(853,2209658,'São Francisco de Assis do Piauí','PI'),(854,2209708,'São Francisco do Piauí','PI'),(855,2209757,'São Gonçalo do Gurguéia','PI'),(856,2209807,'São Gonçalo do Piauí','PI'),(857,2209856,'São João da Canabrava','PI'),(858,2209872,'São João da Fronteira','PI'),(859,2209906,'São João da Serra','PI'),(860,2209955,'São João da Varjota','PI'),(861,2209971,'São João do Arraial','PI'),(862,2210003,'São João do Piauí','PI'),(863,2210052,'São José do Divino','PI'),(864,2210102,'São José do Peixe','PI'),(865,2210201,'São José do Piauí','PI'),(866,2210300,'São Julião','PI'),(867,2210359,'São Lourenço do Piauí','PI'),(868,2210375,'São Luis do Piauí','PI'),(869,2210383,'São Miguel da Baixa Grande','PI'),(870,2210391,'São Miguel do Fidalgo','PI'),(871,2210409,'São Miguel do Tapuio','PI'),(872,2210508,'São Pedro do Piauí','PI'),(873,2210607,'São Raimundo Nonato','PI'),(874,2210623,'Sebastião Barros','PI'),(875,2210631,'Sebastião Leal','PI'),(876,2210656,'Sigefredo Pacheco','PI'),(877,2210706,'Simões','PI'),(878,2210805,'Simplício Mendes','PI'),(879,2210904,'Socorro do Piauí','PI'),(880,2210938,'Sussuapara','PI'),(881,2210953,'Tamboril do Piauí','PI'),(882,2210979,'Tanque do Piauí','PI'),(883,2211001,'Teresina','PI'),(884,2211100,'União','PI'),(885,2211209,'Uruçuí','PI'),(886,2211308,'Valença do Piauí','PI'),(887,2211357,'Várzea Branca','PI'),(888,2211407,'Várzea Grande','PI'),(889,2211506,'Vera Mendes','PI'),(890,2211605,'Vila Nova do Piauí','PI'),(891,2211704,'Wall Ferraz','PI'),(892,2300101,'Abaiara','CE'),(893,2300150,'Acarape','CE'),(894,2300200,'Acaraú','CE'),(895,2300309,'Acopiara','CE'),(896,2300408,'Aiuaba','CE'),(897,2300507,'Alcântaras','CE'),(898,2300606,'Altaneira','CE'),(899,2300705,'Alto Santo','CE'),(900,2300754,'Amontada','CE'),(901,2300804,'Antonina do Norte','CE'),(902,2300903,'Apuiarés','CE'),(903,2301000,'Aquiraz','CE'),(904,2301109,'Aracati','CE'),(905,2301208,'Aracoiaba','CE'),(906,2301257,'Ararendá','CE'),(907,2301307,'Araripe','CE'),(908,2301406,'Aratuba','CE'),(909,2301505,'Arneiroz','CE'),(910,2301604,'Assaré','CE'),(911,2301703,'Aurora','CE'),(912,2301802,'Baixio','CE'),(913,2301851,'Banabuiú','CE'),(914,2301901,'Barbalha','CE'),(915,2301950,'Barreira','CE'),(916,2302008,'Barro','CE'),(917,2302057,'Barroquinha','CE'),(918,2302107,'Baturité','CE'),(919,2302206,'Beberibe','CE'),(920,2302305,'Bela Cruz','CE'),(921,2302404,'Boa Viagem','CE'),(922,2302503,'Brejo Santo','CE'),(923,2302602,'Camocim','CE'),(924,2302701,'Campos Sales','CE'),(925,2302800,'Canindé','CE'),(926,2302909,'Capistrano','CE'),(927,2303006,'Caridade','CE'),(928,2303105,'Cariré','CE'),(929,2303204,'Caririaçu','CE'),(930,2303303,'Cariús','CE'),(931,2303402,'Carnaubal','CE'),(932,2303501,'Cascavel','CE'),(933,2303600,'Catarina','CE'),(934,2303659,'Catunda','CE'),(935,2303709,'Caucaia','CE'),(936,2303808,'Cedro','CE'),(937,2303907,'Chaval','CE'),(938,2303931,'Choró','CE'),(939,2303956,'Chorozinho','CE'),(940,2304004,'Coreaú','CE'),(941,2304103,'Crateús','CE'),(942,2304202,'Crato','CE'),(943,2304236,'Croatá','CE'),(944,2304251,'Cruz','CE'),(945,2304269,'Deputado Irapuan Pinheiro','CE'),(946,2304277,'Ererê','CE'),(947,2304285,'Eusébio','CE'),(948,2304301,'Farias Brito','CE'),(949,2304350,'Forquilha','CE'),(950,2304400,'Fortaleza','CE'),(951,2304459,'Fortim','CE'),(952,2304509,'Frecheirinha','CE'),(953,2304608,'General Sampaio','CE'),(954,2304657,'Graça','CE'),(955,2304707,'Granja','CE'),(956,2304806,'Granjeiro','CE'),(957,2304905,'Groaíras','CE'),(958,2304954,'Guaiúba','CE'),(959,2305001,'Guaraciaba do Norte','CE'),(960,2305100,'Guaramiranga','CE'),(961,2305209,'Hidrolândia','CE'),(962,2305233,'Horizonte','CE'),(963,2305266,'Ibaretama','CE'),(964,2305308,'Ibiapina','CE'),(965,2305332,'Ibicuitinga','CE'),(966,2305357,'Icapuí','CE'),(967,2305407,'Icó','CE'),(968,2305506,'Iguatu','CE'),(969,2305605,'Independência','CE'),(970,2305654,'Ipaporanga','CE'),(971,2305704,'Ipaumirim','CE'),(972,2305803,'Ipu','CE'),(973,2305902,'Ipueiras','CE'),(974,2306009,'Iracema','CE'),(975,2306108,'Irauçuba','CE'),(976,2306207,'Itaiçaba','CE'),(977,2306256,'Itaitinga','CE'),(978,2306306,'Itapagé','CE'),(979,2306405,'Itapipoca','CE'),(980,2306504,'Itapiúna','CE'),(981,2306553,'Itarema','CE'),(982,2306603,'Itatira','CE'),(983,2306702,'Jaguaretama','CE'),(984,2306801,'Jaguaribara','CE'),(985,2306900,'Jaguaribe','CE'),(986,2307007,'Jaguaruana','CE'),(987,2307106,'Jardim','CE'),(988,2307205,'Jati','CE'),(989,2307254,'Jijoca de Jericoacoara','CE'),(990,2307304,'Juazeiro do Norte','CE'),(991,2307403,'Jucás','CE'),(992,2307502,'Lavras da Mangabeira','CE'),(993,2307601,'Limoeiro do Norte','CE'),(994,2307635,'Madalena','CE'),(995,2307650,'Maracanaú','CE'),(996,2307700,'Maranguape','CE'),(997,2307809,'Marco','CE'),(998,2307908,'Martinópole','CE'),(999,2308005,'Massapê','CE'),(1000,2308104,'Mauriti','CE'),(1001,2308203,'Meruoca','CE'),(1002,2308302,'Milagres','CE'),(1003,2308351,'Milhã','CE'),(1004,2308377,'Miraíma','CE'),(1005,2308401,'Missão Velha','CE'),(1006,2308500,'Mombaça','CE'),(1007,2308609,'Monsenhor Tabosa','CE'),(1008,2308708,'Morada Nova','CE'),(1009,2308807,'Moraújo','CE'),(1010,2308906,'Morrinhos','CE'),(1011,2309003,'Mucambo','CE'),(1012,2309102,'Mulungu','CE'),(1013,2309201,'Nova Olinda','CE'),(1014,2309300,'Nova Russas','CE'),(1015,2309409,'Novo Oriente','CE'),(1016,2309458,'Ocara','CE'),(1017,2309508,'Orós','CE'),(1018,2309607,'Pacajus','CE'),(1019,2309706,'Pacatuba','CE'),(1020,2309805,'Pacoti','CE'),(1021,2309904,'Pacujá','CE'),(1022,2310001,'Palhano','CE'),(1023,2310100,'Palmácia','CE'),(1024,2310209,'Paracuru','CE'),(1025,2310258,'Paraipaba','CE'),(1026,2310308,'Parambu','CE'),(1027,2310407,'Paramoti','CE'),(1028,2310506,'Pedra Branca','CE'),(1029,2310605,'Penaforte','CE'),(1030,2310704,'Pentecoste','CE'),(1031,2310803,'Pereiro','CE'),(1032,2310852,'Pindoretama','CE'),(1033,2310902,'Piquet Carneiro','CE'),(1034,2310951,'Pires Ferreira','CE'),(1035,2311009,'Poranga','CE'),(1036,2311108,'Porteiras','CE'),(1037,2311207,'Potengi','CE'),(1038,2311231,'Potiretama','CE'),(1039,2311264,'Quiterianópolis','CE'),(1040,2311306,'Quixadá','CE'),(1041,2311355,'Quixelô','CE'),(1042,2311405,'Quixeramobim','CE'),(1043,2311504,'Quixeré','CE'),(1044,2311603,'Redenção','CE'),(1045,2311702,'Reriutaba','CE'),(1046,2311801,'Russas','CE'),(1047,2311900,'Saboeiro','CE'),(1048,2311959,'Salitre','CE'),(1049,2312007,'Santana do Acaraú','CE'),(1050,2312106,'Santana do Cariri','CE'),(1051,2312205,'Santa Quitéria','CE'),(1052,2312304,'São Benedito','CE'),(1053,2312403,'São Gonçalo do Amarante','CE'),(1054,2312502,'São João do Jaguaribe','CE'),(1055,2312601,'São Luís do Curu','CE'),(1056,2312700,'Senador Pompeu','CE'),(1057,2312809,'Senador Sá','CE'),(1058,2312908,'Sobral','CE'),(1059,2313005,'Solonópole','CE'),(1060,2313104,'Tabuleiro do Norte','CE'),(1061,2313203,'Tamboril','CE'),(1062,2313252,'Tarrafas','CE'),(1063,2313302,'Tauá','CE'),(1064,2313351,'Tejuçuoca','CE'),(1065,2313401,'Tianguá','CE'),(1066,2313500,'Trairi','CE'),(1067,2313559,'Tururu','CE'),(1068,2313609,'Ubajara','CE'),(1069,2313708,'Umari','CE'),(1070,2313757,'Umirim','CE'),(1071,2313807,'Uruburetama','CE'),(1072,2313906,'Uruoca','CE'),(1073,2313955,'Varjota','CE'),(1074,2314003,'Várzea Alegre','CE'),(1075,2314102,'Viçosa do Ceará','CE'),(1076,2400109,'Acari','RN'),(1077,2400208,'Açu','RN'),(1078,2400307,'Afonso Bezerra','RN'),(1079,2400406,'Água Nova','RN'),(1080,2400505,'Alexandria','RN'),(1081,2400604,'Almino Afonso','RN'),(1082,2400703,'Alto do Rodrigues','RN'),(1083,2400802,'Angicos','RN'),(1084,2400901,'Antônio Martins','RN'),(1085,2401008,'Apodi','RN'),(1086,2401107,'Areia Branca','RN'),(1087,2401206,'Arês','RN'),(1088,2401305,'Augusto Severo','RN'),(1089,2401404,'Baía Formosa','RN'),(1090,2401453,'Baraúna','RN'),(1091,2401503,'Barcelona','RN'),(1092,2401602,'Bento Fernandes','RN'),(1093,2401651,'Bodó','RN'),(1094,2401701,'Bom Jesus','RN'),(1095,2401800,'Brejinho','RN'),(1096,2401859,'Caiçara do Norte','RN'),(1097,2401909,'Caiçara do Rio do Vento','RN'),(1098,2402006,'Caicó','RN'),(1099,2402105,'Campo Redondo','RN'),(1100,2402204,'Canguaretama','RN'),(1101,2402303,'Caraúbas','RN'),(1102,2402402,'Carnaúba dos Dantas','RN'),(1103,2402501,'Carnaubais','RN'),(1104,2402600,'Ceará-Mirim','RN'),(1105,2402709,'Cerro Corá','RN'),(1106,2402808,'Coronel Ezequiel','RN'),(1107,2402907,'Coronel João Pessoa','RN'),(1108,2403004,'Cruzeta','RN'),(1109,2403103,'Currais Novos','RN'),(1110,2403202,'Doutor Severiano','RN'),(1111,2403251,'Parnamirim','RN'),(1112,2403301,'Encanto','RN'),(1113,2403400,'Equador','RN'),(1114,2403509,'Espírito Santo','RN'),(1115,2403608,'Extremoz','RN'),(1116,2403707,'Felipe Guerra','RN'),(1117,2403756,'Fernando Pedroza','RN'),(1118,2403806,'Florânia','RN'),(1119,2403905,'Francisco Dantas','RN'),(1120,2404002,'Frutuoso Gomes','RN'),(1121,2404101,'Galinhos','RN'),(1122,2404200,'Goianinha','RN'),(1123,2404309,'Governador Dix-Sept Rosado','RN'),(1124,2404408,'Grossos','RN'),(1125,2404507,'Guamaré','RN'),(1126,2404606,'Ielmo Marinho','RN'),(1127,2404705,'Ipanguaçu','RN'),(1128,2404804,'Ipueira','RN'),(1129,2404853,'Itajá','RN'),(1130,2404903,'Itaú','RN'),(1131,2405009,'Jaçanã','RN'),(1132,2405108,'Jandaíra','RN'),(1133,2405207,'Janduís','RN'),(1134,2405306,'Januário Cicco','RN'),(1135,2405405,'Japi','RN'),(1136,2405504,'Jardim de Angicos','RN'),(1137,2405603,'Jardim de Piranhas','RN'),(1138,2405702,'Jardim do Seridó','RN'),(1139,2405801,'João Câmara','RN'),(1140,2405900,'João Dias','RN'),(1141,2406007,'José da Penha','RN'),(1142,2406106,'Jucurutu','RN'),(1143,2406155,'Jundiá','RN'),(1144,2406205,'Lagoa D\'Anta','RN'),(1145,2406304,'Lagoa de Pedras','RN'),(1146,2406403,'Lagoa de Velhos','RN'),(1147,2406502,'Lagoa Nova','RN'),(1148,2406601,'Lagoa Salgada','RN'),(1149,2406700,'Lajes','RN'),(1150,2406809,'Lajes Pintadas','RN'),(1151,2406908,'Lucrécia','RN'),(1152,2407005,'Luís Gomes','RN'),(1153,2407104,'Macaíba','RN'),(1154,2407203,'Macau','RN'),(1155,2407252,'Major Sales','RN'),(1156,2407302,'Marcelino Vieira','RN'),(1157,2407401,'Martins','RN'),(1158,2407500,'Maxaranguape','RN'),(1159,2407609,'Messias Targino','RN'),(1160,2407708,'Montanhas','RN'),(1161,2407807,'Monte Alegre','RN'),(1162,2407906,'Monte das Gameleiras','RN'),(1163,2408003,'Mossoró','RN'),(1164,2408102,'Natal','RN'),(1165,2408201,'Nísia Floresta','RN'),(1166,2408300,'Nova Cruz','RN'),(1167,2408409,'Olho-D\'Água do Borges','RN'),(1168,2408508,'Ouro Branco','RN'),(1169,2408607,'Paraná','RN'),(1170,2408706,'Paraú','RN'),(1171,2408805,'Parazinho','RN'),(1172,2408904,'Parelhas','RN'),(1173,2408953,'Rio do Fogo','RN'),(1174,2409100,'Passa e Fica','RN'),(1175,2409209,'Passagem','RN'),(1176,2409308,'Patu','RN'),(1177,2409332,'Santa Maria','RN'),(1178,2409407,'Pau dos Ferros','RN'),(1179,2409506,'Pedra Grande','RN'),(1180,2409605,'Pedra Preta','RN'),(1181,2409704,'Pedro Avelino','RN'),(1182,2409803,'Pedro Velho','RN'),(1183,2409902,'Pendências','RN'),(1184,2410009,'Pilões','RN'),(1185,2410108,'Poço Branco','RN'),(1186,2410207,'Portalegre','RN'),(1187,2410256,'Porto do Mangue','RN'),(1188,2410306,'Presidente Juscelino','RN'),(1189,2410405,'Pureza','RN'),(1190,2410504,'Rafael Fernandes','RN'),(1191,2410603,'Rafael Godeiro','RN'),(1192,2410702,'Riacho da Cruz','RN'),(1193,2410801,'Riacho de Santana','RN'),(1194,2410900,'Riachuelo','RN'),(1195,2411007,'Rodolfo Fernandes','RN'),(1196,2411056,'Tibau','RN'),(1197,2411106,'Ruy Barbosa','RN'),(1198,2411205,'Santa Cruz','RN'),(1199,2411403,'Santana do Matos','RN'),(1200,2411429,'Santana do Seridó','RN'),(1201,2411502,'Santo Antônio','RN'),(1202,2411601,'São Bento do Norte','RN'),(1203,2411700,'São Bento do Trairí','RN'),(1204,2411809,'São Fernando','RN'),(1205,2411908,'São Francisco do Oeste','RN'),(1206,2412005,'São Gonçalo do Amarante','RN'),(1207,2412104,'São João do Sabugi','RN'),(1208,2412203,'São José de Mipibu','RN'),(1209,2412302,'São José do Campestre','RN'),(1210,2412401,'São José do Seridó','RN'),(1211,2412500,'São Miguel','RN'),(1212,2412559,'São Miguel do Gostoso','RN'),(1213,2412609,'São Paulo do Potengi','RN'),(1214,2412708,'São Pedro','RN'),(1215,2412807,'São Rafael','RN'),(1216,2412906,'São Tomé','RN'),(1217,2413003,'São Vicente','RN'),(1218,2413102,'Senador Elói de Souza','RN'),(1219,2413201,'Senador Georgino Avelino','RN'),(1220,2413300,'Serra de São Bento','RN'),(1221,2413359,'Serra do Mel','RN'),(1222,2413409,'Serra Negra do Norte','RN'),(1223,2413508,'Serrinha','RN'),(1224,2413557,'Serrinha dos Pintos','RN'),(1225,2413607,'Severiano Melo','RN'),(1226,2413706,'Sítio Novo','RN'),(1227,2413805,'Taboleiro Grande','RN'),(1228,2413904,'Taipu','RN'),(1229,2414001,'Tangará','RN'),(1230,2414100,'Tenente Ananias','RN'),(1231,2414159,'Tenente Laurentino Cruz','RN'),(1232,2414209,'Tibau do Sul','RN'),(1233,2414308,'Timbaúba dos Batistas','RN'),(1234,2414407,'Touros','RN'),(1235,2414456,'Triunfo Potiguar','RN'),(1236,2414506,'Umarizal','RN'),(1237,2414605,'Upanema','RN'),(1238,2414704,'Várzea','RN'),(1239,2414753,'Venha-Ver','RN'),(1240,2414803,'Vera Cruz','RN'),(1241,2414902,'Viçosa','RN'),(1242,2415008,'Vila Flor','RN'),(1243,2500106,'Água Branca','PB'),(1244,2500205,'Aguiar','PB'),(1245,2500304,'Alagoa Grande','PB'),(1246,2500403,'Alagoa Nova','PB'),(1247,2500502,'Alagoinha','PB'),(1248,2500536,'Alcantil','PB'),(1249,2500577,'Algodão de Jandaíra','PB'),(1250,2500601,'Alhandra','PB'),(1251,2500700,'São João do Rio do Peixe','PB'),(1252,2500734,'Amparo','PB'),(1253,2500775,'Aparecida','PB'),(1254,2500809,'Araçagi','PB'),(1255,2500908,'Arara','PB'),(1256,2501005,'Araruna','PB'),(1257,2501104,'Areia','PB'),(1258,2501153,'Areia de Baraúnas','PB'),(1259,2501203,'Areial','PB'),(1260,2501302,'Aroeiras','PB'),(1261,2501351,'Assunção','PB'),(1262,2501401,'Baía da Traição','PB'),(1263,2501500,'Bananeiras','PB'),(1264,2501534,'Baraúna','PB'),(1265,2501575,'Barra de Santana','PB'),(1266,2501609,'Barra de Santa Rosa','PB'),(1267,2501708,'Barra de São Miguel','PB'),(1268,2501807,'Bayeux','PB'),(1269,2501906,'Belém','PB'),(1270,2502003,'Belém do Brejo do Cruz','PB'),(1271,2502052,'Bernardino Batista','PB'),(1272,2502102,'Boa Ventura','PB'),(1273,2502151,'Boa Vista','PB'),(1274,2502201,'Bom Jesus','PB'),(1275,2502300,'Bom Sucesso','PB'),(1276,2502409,'Bonito de Santa Fé','PB'),(1277,2502508,'Boqueirão','PB'),(1278,2502607,'Igaracy','PB'),(1279,2502706,'Borborema','PB'),(1280,2502805,'Brejo do Cruz','PB'),(1281,2502904,'Brejo dos Santos','PB'),(1282,2503001,'Caaporã','PB'),(1283,2503100,'Cabaceiras','PB'),(1284,2503209,'Cabedelo','PB'),(1285,2503308,'Cachoeira dos Índios','PB'),(1286,2503407,'Cacimba de Areia','PB'),(1287,2503506,'Cacimba de Dentro','PB'),(1288,2503555,'Cacimbas','PB'),(1289,2503605,'Caiçara','PB'),(1290,2503704,'Cajazeiras','PB'),(1291,2503753,'Cajazeirinhas','PB'),(1292,2503803,'Caldas Brandão','PB'),(1293,2503902,'Camalaú','PB'),(1294,2504009,'Campina Grande','PB'),(1295,2504033,'Capim','PB'),(1296,2504074,'Caraúbas','PB'),(1297,2504108,'Carrapateira','PB'),(1298,2504157,'Casserengue','PB'),(1299,2504207,'Catingueira','PB'),(1300,2504306,'Catolé do Rocha','PB'),(1301,2504355,'Caturité','PB'),(1302,2504405,'Conceição','PB'),(1303,2504504,'Condado','PB'),(1304,2504603,'Conde','PB'),(1305,2504702,'Congo','PB'),(1306,2504801,'Coremas','PB'),(1307,2504850,'Coxixola','PB'),(1308,2504900,'Cruz do Espírito Santo','PB'),(1309,2505006,'Cubati','PB'),(1310,2505105,'Cuité','PB'),(1311,2505204,'Cuitegi','PB'),(1312,2505238,'Cuité de Mamanguape','PB'),(1313,2505279,'Curral de Cima','PB'),(1314,2505303,'Curral Velho','PB'),(1315,2505352,'Damião','PB'),(1316,2505402,'Desterro','PB'),(1317,2505501,'Vista Serrana','PB'),(1318,2505600,'Diamante','PB'),(1319,2505709,'Dona Inês','PB'),(1320,2505808,'Duas Estradas','PB'),(1321,2505907,'Emas','PB'),(1322,2506004,'Esperança','PB'),(1323,2506103,'Fagundes','PB'),(1324,2506202,'Frei Martinho','PB'),(1325,2506251,'Gado Bravo','PB'),(1326,2506301,'Guarabira','PB'),(1327,2506400,'Gurinhém','PB'),(1328,2506509,'Gurjão','PB'),(1329,2506608,'Ibiara','PB'),(1330,2506707,'Imaculada','PB'),(1331,2506806,'Ingá','PB'),(1332,2506905,'Itabaiana','PB'),(1333,2507002,'Itaporanga','PB'),(1334,2507101,'Itapororoca','PB'),(1335,2507200,'Itatuba','PB'),(1336,2507309,'Jacaraú','PB'),(1337,2507408,'Jericó','PB'),(1338,2507507,'João Pessoa','PB'),(1339,2507606,'Juarez Távora','PB'),(1340,2507705,'Juazeirinho','PB'),(1341,2507804,'Junco do Seridó','PB'),(1342,2507903,'Juripiranga','PB'),(1343,2508000,'Juru','PB'),(1344,2508109,'Lagoa','PB'),(1345,2508208,'Lagoa de Dentro','PB'),(1346,2508307,'Lagoa Seca','PB'),(1347,2508406,'Lastro','PB'),(1348,2508505,'Livramento','PB'),(1349,2508554,'Logradouro','PB'),(1350,2508604,'Lucena','PB'),(1351,2508703,'Mãe D\'Água','PB'),(1352,2508802,'Malta','PB'),(1353,2508901,'Mamanguape','PB'),(1354,2509008,'Manaíra','PB'),(1355,2509057,'Marcação','PB'),(1356,2509107,'Mari','PB'),(1357,2509156,'Marizópolis','PB'),(1358,2509206,'Massaranduba','PB'),(1359,2509305,'Mataraca','PB'),(1360,2509339,'Matinhas','PB'),(1361,2509370,'Mato Grosso','PB'),(1362,2509396,'Maturéia','PB'),(1363,2509404,'Mogeiro','PB'),(1364,2509503,'Montadas','PB'),(1365,2509602,'Monte Horebe','PB'),(1366,2509701,'Monteiro','PB'),(1367,2509800,'Mulungu','PB'),(1368,2509909,'Natuba','PB'),(1369,2510006,'Nazarezinho','PB'),(1370,2510105,'Nova Floresta','PB'),(1371,2510204,'Nova Olinda','PB'),(1372,2510303,'Nova Palmeira','PB'),(1373,2510402,'Olho D\'Água','PB'),(1374,2510501,'Olivedos','PB'),(1375,2510600,'Ouro Velho','PB'),(1376,2510659,'Parari','PB'),(1377,2510709,'Passagem','PB'),(1378,2510808,'Patos','PB'),(1379,2510907,'Paulista','PB'),(1380,2511004,'Pedra Branca','PB'),(1381,2511103,'Pedra Lavrada','PB'),(1382,2511202,'Pedras de Fogo','PB'),(1383,2511301,'Piancó','PB'),(1384,2511400,'Picuí','PB'),(1385,2511509,'Pilar','PB'),(1386,2511608,'Pilões','PB'),(1387,2511707,'Pilõezinhos','PB'),(1388,2511806,'Pirpirituba','PB'),(1389,2511905,'Pitimbu','PB'),(1390,2512002,'Pocinhos','PB'),(1391,2512036,'Poço Dantas','PB'),(1392,2512077,'Poço de José de Moura','PB'),(1393,2512101,'Pombal','PB'),(1394,2512200,'Prata','PB'),(1395,2512309,'Princesa Isabel','PB'),(1396,2512408,'Puxinanã','PB'),(1397,2512507,'Queimadas','PB'),(1398,2512606,'Quixabá','PB'),(1399,2512705,'Remígio','PB'),(1400,2512721,'Pedro Régis','PB'),(1401,2512747,'Riachão','PB'),(1402,2512754,'Riachão do Bacamarte','PB'),(1403,2512762,'Riachão do Poço','PB'),(1404,2512788,'Riacho de Santo Antônio','PB'),(1405,2512804,'Riacho dos Cavalos','PB'),(1406,2512903,'Rio Tinto','PB'),(1407,2513000,'Salgadinho','PB'),(1408,2513109,'Salgado de São Félix','PB'),(1409,2513158,'Santa Cecília','PB'),(1410,2513208,'Santa Cruz','PB'),(1411,2513307,'Santa Helena','PB'),(1412,2513356,'Santa Inês','PB'),(1413,2513406,'Santa Luzia','PB'),(1414,2513505,'Santana de Mangueira','PB'),(1415,2513604,'Santana dos Garrotes','PB'),(1416,2513653,'Joca Claudino','PB'),(1417,2513703,'Santa Rita','PB'),(1418,2513802,'Santa Teresinha','PB'),(1419,2513851,'Santo André','PB'),(1420,2513901,'São Bento','PB'),(1421,2513927,'São Bentinho','PB'),(1422,2513943,'São Domingos do Cariri','PB'),(1423,2513968,'São Domingos','PB'),(1424,2513984,'São Francisco','PB'),(1425,2514008,'São João do Cariri','PB'),(1426,2514107,'São João do Tigre','PB'),(1427,2514206,'São José da Lagoa Tapada','PB'),(1428,2514305,'São José de Caiana','PB'),(1429,2514404,'São José de Espinharas','PB'),(1430,2514453,'São José dos Ramos','PB'),(1431,2514503,'São José de Piranhas','PB'),(1432,2514552,'São José de Princesa','PB'),(1433,2514602,'São José do Bonfim','PB'),(1434,2514651,'São José do Brejo do Cruz','PB'),(1435,2514701,'São José do Sabugi','PB'),(1436,2514800,'São José dos Cordeiros','PB'),(1437,2514909,'São Mamede','PB'),(1438,2515005,'São Miguel de Taipu','PB'),(1439,2515104,'São Sebastião de Lagoa de Roça','PB'),(1440,2515203,'São Sebastião do Umbuzeiro','PB'),(1441,2515302,'Sapé','PB'),(1442,2515401,'São Vicente do Seridó','PB'),(1443,2515500,'Serra Branca','PB'),(1444,2515609,'Serra da Raiz','PB'),(1445,2515708,'Serra Grande','PB'),(1446,2515807,'Serra Redonda','PB'),(1447,2515906,'Serraria','PB'),(1448,2515930,'Sertãozinho','PB'),(1449,2515971,'Sobrado','PB'),(1450,2516003,'Solânea','PB'),(1451,2516102,'Soledade','PB'),(1452,2516151,'Sossêgo','PB'),(1453,2516201,'Sousa','PB'),(1454,2516300,'Sumé','PB'),(1455,2516409,'Tacima','PB'),(1456,2516508,'Taperoá','PB'),(1457,2516607,'Tavares','PB'),(1458,2516706,'Teixeira','PB'),(1459,2516755,'Tenório','PB'),(1460,2516805,'Triunfo','PB'),(1461,2516904,'Uiraúna','PB'),(1462,2517001,'Umbuzeiro','PB'),(1463,2517100,'Várzea','PB'),(1464,2517209,'Vieirópolis','PB'),(1465,2517407,'Zabelê','PB'),(1466,2600054,'Abreu e Lima','PE'),(1467,2600104,'Afogados da Ingazeira','PE'),(1468,2600203,'Afrânio','PE'),(1469,2600302,'Agrestina','PE'),(1470,2600401,'Água Preta','PE'),(1471,2600500,'Águas Belas','PE'),(1472,2600609,'Alagoinha','PE'),(1473,2600708,'Aliança','PE'),(1474,2600807,'Altinho','PE'),(1475,2600906,'Amaraji','PE'),(1476,2601003,'Angelim','PE'),(1477,2601052,'Araçoiaba','PE'),(1478,2601102,'Araripina','PE'),(1479,2601201,'Arcoverde','PE'),(1480,2601300,'Barra de Guabiraba','PE'),(1481,2601409,'Barreiros','PE'),(1482,2601508,'Belém de Maria','PE'),(1483,2601607,'Belém do São Francisco','PE'),(1484,2601706,'Belo Jardim','PE'),(1485,2601805,'Betânia','PE'),(1486,2601904,'Bezerros','PE'),(1487,2602001,'Bodocó','PE'),(1488,2602100,'Bom Conselho','PE'),(1489,2602209,'Bom Jardim','PE'),(1490,2602308,'Bonito','PE'),(1491,2602407,'Brejão','PE'),(1492,2602506,'Brejinho','PE'),(1493,2602605,'Brejo da Madre de Deus','PE'),(1494,2602704,'Buenos Aires','PE'),(1495,2602803,'Buíque','PE'),(1496,2602902,'Cabo de Santo Agostinho','PE'),(1497,2603009,'Cabrobó','PE'),(1498,2603108,'Cachoeirinha','PE'),(1499,2603207,'Caetés','PE'),(1500,2603306,'Calçado','PE'),(1501,2603405,'Calumbi','PE'),(1502,2603454,'Camaragibe','PE'),(1503,2603504,'Camocim de São Félix','PE'),(1504,2603603,'Camutanga','PE'),(1505,2603702,'Canhotinho','PE'),(1506,2603801,'Capoeiras','PE'),(1507,2603900,'Carnaíba','PE'),(1508,2603926,'Carnaubeira da Penha','PE'),(1509,2604007,'Carpina','PE'),(1510,2604106,'Caruaru','PE'),(1511,2604155,'Casinhas','PE'),(1512,2604205,'Catende','PE'),(1513,2604304,'Cedro','PE'),(1514,2604403,'Chã de Alegria','PE'),(1515,2604502,'Chã Grande','PE'),(1516,2604601,'Condado','PE'),(1517,2604700,'Correntes','PE'),(1518,2604809,'Cortês','PE'),(1519,2604908,'Cumaru','PE'),(1520,2605004,'Cupira','PE'),(1521,2605103,'Custódia','PE'),(1522,2605152,'Dormentes','PE'),(1523,2605202,'Escada','PE'),(1524,2605301,'Exu','PE'),(1525,2605400,'Feira Nova','PE'),(1526,2605459,'Fernando de Noronha','PE'),(1527,2605509,'Ferreiros','PE'),(1528,2605608,'Flores','PE'),(1529,2605707,'Floresta','PE'),(1530,2605806,'Frei Miguelinho','PE'),(1531,2605905,'Gameleira','PE'),(1532,2606002,'Garanhuns','PE'),(1533,2606101,'Glória do Goitá','PE'),(1534,2606200,'Goiana','PE'),(1535,2606309,'Granito','PE'),(1536,2606408,'Gravatá','PE'),(1537,2606507,'Iati','PE'),(1538,2606606,'Ibimirim','PE'),(1539,2606705,'Ibirajuba','PE'),(1540,2606804,'Igarassu','PE'),(1541,2606903,'Iguaraci','PE'),(1542,2607000,'Inajá','PE'),(1543,2607109,'Ingazeira','PE'),(1544,2607208,'Ipojuca','PE'),(1545,2607307,'Ipubi','PE'),(1546,2607406,'Itacuruba','PE'),(1547,2607505,'Itaíba','PE'),(1548,2607604,'Ilha de Itamaracá','PE'),(1549,2607653,'Itambé','PE'),(1550,2607703,'Itapetim','PE'),(1551,2607752,'Itapissuma','PE'),(1552,2607802,'Itaquitinga','PE'),(1553,2607901,'Jaboatão dos Guararapes','PE'),(1554,2607950,'Jaqueira','PE'),(1555,2608008,'Jataúba','PE'),(1556,2608057,'Jatobá','PE'),(1557,2608107,'João Alfredo','PE'),(1558,2608206,'Joaquim Nabuco','PE'),(1559,2608255,'Jucati','PE'),(1560,2608305,'Jupi','PE'),(1561,2608404,'Jurema','PE'),(1562,2608453,'Lagoa do Carro','PE'),(1563,2608503,'Lagoa de Itaenga','PE'),(1564,2608602,'Lagoa do Ouro','PE'),(1565,2608701,'Lagoa dos Gatos','PE'),(1566,2608750,'Lagoa Grande','PE'),(1567,2608800,'Lajedo','PE'),(1568,2608909,'Limoeiro','PE'),(1569,2609006,'Macaparana','PE'),(1570,2609105,'Machados','PE'),(1571,2609154,'Manari','PE'),(1572,2609204,'Maraial','PE'),(1573,2609303,'Mirandiba','PE'),(1574,2609402,'Moreno','PE'),(1575,2609501,'Nazaré da Mata','PE'),(1576,2609600,'Olinda','PE'),(1577,2609709,'Orobó','PE'),(1578,2609808,'Orocó','PE'),(1579,2609907,'Ouricuri','PE'),(1580,2610004,'Palmares','PE'),(1581,2610103,'Palmeirina','PE'),(1582,2610202,'Panelas','PE'),(1583,2610301,'Paranatama','PE'),(1584,2610400,'Parnamirim','PE'),(1585,2610509,'Passira','PE'),(1586,2610608,'Paudalho','PE'),(1587,2610707,'Paulista','PE'),(1588,2610806,'Pedra','PE'),(1589,2610905,'Pesqueira','PE'),(1590,2611002,'Petrolândia','PE'),(1591,2611101,'Petrolina','PE'),(1592,2611200,'Poção','PE'),(1593,2611309,'Pombos','PE'),(1594,2611408,'Primavera','PE'),(1595,2611507,'Quipapá','PE'),(1596,2611533,'Quixaba','PE'),(1597,2611606,'Recife','PE'),(1598,2611705,'Riacho das Almas','PE'),(1599,2611804,'Ribeirão','PE'),(1600,2611903,'Rio Formoso','PE'),(1601,2612000,'Sairé','PE'),(1602,2612109,'Salgadinho','PE'),(1603,2612208,'Salgueiro','PE'),(1604,2612307,'Saloá','PE'),(1605,2612406,'Sanharó','PE'),(1606,2612455,'Santa Cruz','PE'),(1607,2612471,'Santa Cruz da Baixa Verde','PE'),(1608,2612505,'Santa Cruz do Capibaribe','PE'),(1609,2612554,'Santa Filomena','PE'),(1610,2612604,'Santa Maria da Boa Vista','PE'),(1611,2612703,'Santa Maria do Cambucá','PE'),(1612,2612802,'Santa Terezinha','PE'),(1613,2612901,'São Benedito do Sul','PE'),(1614,2613008,'São Bento do Una','PE'),(1615,2613107,'São Caitano','PE'),(1616,2613206,'São João','PE'),(1617,2613305,'São Joaquim do Monte','PE'),(1618,2613404,'São José da Coroa Grande','PE'),(1619,2613503,'São José do Belmonte','PE'),(1620,2613602,'São José do Egito','PE'),(1621,2613701,'São Lourenço da Mata','PE'),(1622,2613800,'São Vicente Ferrer','PE'),(1623,2613909,'Serra Talhada','PE'),(1624,2614006,'Serrita','PE'),(1625,2614105,'Sertânia','PE'),(1626,2614204,'Sirinhaém','PE'),(1627,2614303,'Moreilândia','PE'),(1628,2614402,'Solidão','PE'),(1629,2614501,'Surubim','PE'),(1630,2614600,'Tabira','PE'),(1631,2614709,'Tacaimbó','PE'),(1632,2614808,'Tacaratu','PE'),(1633,2614857,'Tamandaré','PE'),(1634,2615003,'Taquaritinga do Norte','PE'),(1635,2615102,'Terezinha','PE'),(1636,2615201,'Terra Nova','PE'),(1637,2615300,'Timbaúba','PE'),(1638,2615409,'Toritama','PE'),(1639,2615508,'Tracunhaém','PE'),(1640,2615607,'Trindade','PE'),(1641,2615706,'Triunfo','PE'),(1642,2615805,'Tupanatinga','PE'),(1643,2615904,'Tuparetama','PE'),(1644,2616001,'Venturosa','PE'),(1645,2616100,'Verdejante','PE'),(1646,2616183,'Vertente do Lério','PE'),(1647,2616209,'Vertentes','PE'),(1648,2616308,'Vicência','PE'),(1649,2616407,'Vitória de Santo Antão','PE'),(1650,2616506,'Xexéu','PE'),(1651,2700102,'Água Branca','AL'),(1652,2700201,'Anadia','AL'),(1653,2700300,'Arapiraca','AL'),(1654,2700409,'Atalaia','AL'),(1655,2700508,'Barra de Santo Antônio','AL'),(1656,2700607,'Barra de São Miguel','AL'),(1657,2700706,'Batalha','AL'),(1658,2700805,'Belém','AL'),(1659,2700904,'Belo Monte','AL'),(1660,2701001,'Boca da Mata','AL'),(1661,2701100,'Branquinha','AL'),(1662,2701209,'Cacimbinhas','AL'),(1663,2701308,'Cajueiro','AL'),(1664,2701357,'Campestre','AL'),(1665,2701407,'Campo Alegre','AL'),(1666,2701506,'Campo Grande','AL'),(1667,2701605,'Canapi','AL'),(1668,2701704,'Capela','AL'),(1669,2701803,'Carneiros','AL'),(1670,2701902,'Chã Preta','AL'),(1671,2702009,'Coité do Nóia','AL'),(1672,2702108,'Colônia Leopoldina','AL'),(1673,2702207,'Coqueiro Seco','AL'),(1674,2702306,'Coruripe','AL'),(1675,2702355,'Craíbas','AL'),(1676,2702405,'Delmiro Gouveia','AL'),(1677,2702504,'Dois Riachos','AL'),(1678,2702553,'Estrela de Alagoas','AL'),(1679,2702603,'Feira Grande','AL'),(1680,2702702,'Feliz Deserto','AL'),(1681,2702801,'Flexeiras','AL'),(1682,2702900,'Girau do Ponciano','AL'),(1683,2703007,'Ibateguara','AL'),(1684,2703106,'Igaci','AL'),(1685,2703205,'Igreja Nova','AL'),(1686,2703304,'Inhapi','AL'),(1687,2703403,'Jacaré dos Homens','AL'),(1688,2703502,'Jacuípe','AL'),(1689,2703601,'Japaratinga','AL'),(1690,2703700,'Jaramataia','AL'),(1691,2703759,'Jequiá da Praia','AL'),(1692,2703809,'Joaquim Gomes','AL'),(1693,2703908,'Jundiá','AL'),(1694,2704005,'Junqueiro','AL'),(1695,2704104,'Lagoa da Canoa','AL'),(1696,2704203,'Limoeiro de Anadia','AL'),(1697,2704302,'Maceió','AL'),(1698,2704401,'Major Isidoro','AL'),(1699,2704500,'Maragogi','AL'),(1700,2704609,'Maravilha','AL'),(1701,2704708,'Marechal Deodoro','AL'),(1702,2704807,'Maribondo','AL'),(1703,2704906,'Mar Vermelho','AL'),(1704,2705002,'Mata Grande','AL'),(1705,2705101,'Matriz de Camaragibe','AL'),(1706,2705200,'Messias','AL'),(1707,2705309,'Minador do Negrão','AL'),(1708,2705408,'Monteirópolis','AL'),(1709,2705507,'Murici','AL'),(1710,2705606,'Novo Lino','AL'),(1711,2705705,'Olho D\'Água das Flores','AL'),(1712,2705804,'Olho D\'Água do Casado','AL'),(1713,2705903,'Olho D\'Água Grande','AL'),(1714,2706000,'Olivença','AL'),(1715,2706109,'Ouro Branco','AL'),(1716,2706208,'Palestina','AL'),(1717,2706307,'Palmeira dos Índios','AL'),(1718,2706406,'Pão de Açúcar','AL'),(1719,2706422,'Pariconha','AL'),(1720,2706448,'Paripueira','AL'),(1721,2706505,'Passo de Camaragibe','AL'),(1722,2706604,'Paulo Jacinto','AL'),(1723,2706703,'Penedo','AL'),(1724,2706802,'Piaçabuçu','AL'),(1725,2706901,'Pilar','AL'),(1726,2707008,'Pindoba','AL'),(1727,2707107,'Piranhas','AL'),(1728,2707206,'Poço das Trincheiras','AL'),(1729,2707305,'Porto Calvo','AL'),(1730,2707404,'Porto de Pedras','AL'),(1731,2707503,'Porto Real do Colégio','AL'),(1732,2707602,'Quebrangulo','AL'),(1733,2707701,'Rio Largo','AL'),(1734,2707800,'Roteiro','AL'),(1735,2707909,'Santa Luzia do Norte','AL'),(1736,2708006,'Santana do Ipanema','AL'),(1737,2708105,'Santana do Mundaú','AL'),(1738,2708204,'São Brás','AL'),(1739,2708303,'São José da Laje','AL'),(1740,2708402,'São José da Tapera','AL'),(1741,2708501,'São Luís do Quitunde','AL'),(1742,2708600,'São Miguel dos Campos','AL'),(1743,2708709,'São Miguel dos Milagres','AL'),(1744,2708808,'São Sebastião','AL'),(1745,2708907,'Satuba','AL'),(1746,2708956,'Senador Rui Palmeira','AL'),(1747,2709004,'Tanque D\'Arca','AL'),(1748,2709103,'Taquarana','AL'),(1749,2709152,'Teotônio Vilela','AL'),(1750,2709202,'Traipu','AL'),(1751,2709301,'União dos Palmares','AL'),(1752,2709400,'Viçosa','AL'),(1753,2800100,'Amparo de São Francisco','SE'),(1754,2800209,'Aquidabã','SE'),(1755,2800308,'Aracaju','SE'),(1756,2800407,'Arauá','SE'),(1757,2800506,'Areia Branca','SE'),(1758,2800605,'Barra dos Coqueiros','SE'),(1759,2800670,'Boquim','SE'),(1760,2800704,'Brejo Grande','SE'),(1761,2801009,'Campo do Brito','SE'),(1762,2801108,'Canhoba','SE'),(1763,2801207,'Canindé de São Francisco','SE'),(1764,2801306,'Capela','SE'),(1765,2801405,'Carira','SE'),(1766,2801504,'Carmópolis','SE'),(1767,2801603,'Cedro de São João','SE'),(1768,2801702,'Cristinápolis','SE'),(1769,2801900,'Cumbe','SE'),(1770,2802007,'Divina Pastora','SE'),(1771,2802106,'Estância','SE'),(1772,2802205,'Feira Nova','SE'),(1773,2802304,'Frei Paulo','SE'),(1774,2802403,'Gararu','SE'),(1775,2802502,'General Maynard','SE'),(1776,2802601,'Gracho Cardoso','SE'),(1777,2802700,'Ilha das Flores','SE'),(1778,2802809,'Indiaroba','SE'),(1779,2802908,'Itabaiana','SE'),(1780,2803005,'Itabaianinha','SE'),(1781,2803104,'Itabi','SE'),(1782,2803203,'Itaporanga D\'Ajuda','SE'),(1783,2803302,'Japaratuba','SE'),(1784,2803401,'Japoatã','SE'),(1785,2803500,'Lagarto','SE'),(1786,2803609,'Laranjeiras','SE'),(1787,2803708,'Macambira','SE'),(1788,2803807,'Malhada dos Bois','SE'),(1789,2803906,'Malhador','SE'),(1790,2804003,'Maruim','SE'),(1791,2804102,'Moita Bonita','SE'),(1792,2804201,'Monte Alegre de Sergipe','SE'),(1793,2804300,'Muribeca','SE'),(1794,2804409,'Neópolis','SE'),(1795,2804458,'Nossa Senhora Aparecida','SE'),(1796,2804508,'Nossa Senhora da Glória','SE'),(1797,2804607,'Nossa Senhora das Dores','SE'),(1798,2804706,'Nossa Senhora de Lourdes','SE'),(1799,2804805,'Nossa Senhora do Socorro','SE'),(1800,2804904,'Pacatuba','SE'),(1801,2805000,'Pedra Mole','SE'),(1802,2805109,'Pedrinhas','SE'),(1803,2805208,'Pinhão','SE'),(1804,2805307,'Pirambu','SE'),(1805,2805406,'Poço Redondo','SE'),(1806,2805505,'Poço Verde','SE'),(1807,2805604,'Porto da Folha','SE'),(1808,2805703,'Propriá','SE'),(1809,2805802,'Riachão do Dantas','SE'),(1810,2805901,'Riachuelo','SE'),(1811,2806008,'Ribeirópolis','SE'),(1812,2806107,'Rosário do Catete','SE'),(1813,2806206,'Salgado','SE'),(1814,2806305,'Santa Luzia do Itanhy','SE'),(1815,2806404,'Santana do São Francisco','SE'),(1816,2806503,'Santa Rosa de Lima','SE'),(1817,2806602,'Santo Amaro das Brotas','SE'),(1818,2806701,'São Cristóvão','SE'),(1819,2806800,'São Domingos','SE'),(1820,2806909,'São Francisco','SE'),(1821,2807006,'São Miguel do Aleixo','SE'),(1822,2807105,'Simão Dias','SE'),(1823,2807204,'Siriri','SE'),(1824,2807303,'Telha','SE'),(1825,2807402,'Tobias Barreto','SE'),(1826,2807501,'Tomar do Geru','SE'),(1827,2807600,'Umbaúba','SE'),(1828,2900108,'Abaíra','BA'),(1829,2900207,'Abaré','BA'),(1830,2900306,'Acajutiba','BA'),(1831,2900355,'Adustina','BA'),(1832,2900405,'Água Fria','BA'),(1833,2900504,'Érico Cardoso','BA'),(1834,2900603,'Aiquara','BA'),(1835,2900702,'Alagoinhas','BA'),(1836,2900801,'Alcobaça','BA'),(1837,2900900,'Almadina','BA'),(1838,2901007,'Amargosa','BA'),(1839,2901106,'Amélia Rodrigues','BA'),(1840,2901155,'América Dourada','BA'),(1841,2901205,'Anagé','BA'),(1842,2901304,'Andaraí','BA'),(1843,2901353,'Andorinha','BA'),(1844,2901403,'Angical','BA'),(1845,2901502,'Anguera','BA'),(1846,2901601,'Antas','BA'),(1847,2901700,'Antônio Cardoso','BA'),(1848,2901809,'Antônio Gonçalves','BA'),(1849,2901908,'Aporá','BA'),(1850,2901957,'Apuarema','BA'),(1851,2902005,'Aracatu','BA'),(1852,2902054,'Araças','BA'),(1853,2902104,'Araci','BA'),(1854,2902203,'Aramari','BA'),(1855,2902252,'Arataca','BA'),(1856,2902302,'Aratuípe','BA'),(1857,2902401,'Aurelino Leal','BA'),(1858,2902500,'Baianópolis','BA'),(1859,2902609,'Baixa Grande','BA'),(1860,2902658,'Banzaê','BA'),(1861,2902708,'Barra','BA'),(1862,2902807,'Barra da Estiva','BA'),(1863,2902906,'Barra do Choça','BA'),(1864,2903003,'Barra do Mendes','BA'),(1865,2903102,'Barra do Rocha','BA'),(1866,2903201,'Barreiras','BA'),(1867,2903235,'Barro Alto','BA'),(1868,2903276,'Barrocas','BA'),(1869,2903300,'Barro Preto','BA'),(1870,2903409,'Belmonte','BA'),(1871,2903508,'Belo Campo','BA'),(1872,2903607,'Biritinga','BA'),(1873,2903706,'Boa Nova','BA'),(1874,2903805,'Boa Vista do Tupim','BA'),(1875,2903904,'Bom Jesus da Lapa','BA'),(1876,2903953,'Bom Jesus da Serra','BA'),(1877,2904001,'Boninal','BA'),(1878,2904050,'Bonito','BA'),(1879,2904100,'Boquira','BA'),(1880,2904209,'Botuporã','BA'),(1881,2904308,'Brejões','BA'),(1882,2904407,'Brejolândia','BA'),(1883,2904506,'Brotas de Macaúbas','BA'),(1884,2904605,'Brumado','BA'),(1885,2904704,'Buerarema','BA'),(1886,2904753,'Buritirama','BA'),(1887,2904803,'Caatiba','BA'),(1888,2904852,'Cabaceiras do Paraguaçu','BA'),(1889,2904902,'Cachoeira','BA'),(1890,2905008,'Caculé','BA'),(1891,2905107,'Caém','BA'),(1892,2905156,'Caetanos','BA'),(1893,2905206,'Caetité','BA'),(1894,2905305,'Cafarnaum','BA'),(1895,2905404,'Cairu','BA'),(1896,2905503,'Caldeirão Grande','BA'),(1897,2905602,'Camacan','BA'),(1898,2905701,'Camaçari','BA'),(1899,2905800,'Camamu','BA'),(1900,2905909,'Campo Alegre de Lourdes','BA'),(1901,2906006,'Campo Formoso','BA'),(1902,2906105,'Canápolis','BA'),(1903,2906204,'Canarana','BA'),(1904,2906303,'Canavieiras','BA'),(1905,2906402,'Candeal','BA'),(1906,2906501,'Candeias','BA'),(1907,2906600,'Candiba','BA'),(1908,2906709,'Cândido Sales','BA'),(1909,2906808,'Cansanção','BA'),(1910,2906824,'Canudos','BA'),(1911,2906857,'Capela do Alto Alegre','BA'),(1912,2906873,'Capim Grosso','BA'),(1913,2906899,'Caraíbas','BA'),(1914,2906907,'Caravelas','BA'),(1915,2907004,'Cardeal da Silva','BA'),(1916,2907103,'Carinhanha','BA'),(1917,2907202,'Casa Nova','BA'),(1918,2907301,'Castro Alves','BA'),(1919,2907400,'Catolândia','BA'),(1920,2907509,'Catu','BA'),(1921,2907558,'Caturama','BA'),(1922,2907608,'Central','BA'),(1923,2907707,'Chorrochó','BA'),(1924,2907806,'Cícero Dantas','BA'),(1925,2907905,'Cipó','BA'),(1926,2908002,'Coaraci','BA'),(1927,2908101,'Cocos','BA'),(1928,2908200,'Conceição da Feira','BA'),(1929,2908309,'Conceição do Almeida','BA'),(1930,2908408,'Conceição do Coité','BA'),(1931,2908507,'Conceição do Jacuípe','BA'),(1932,2908606,'Conde','BA'),(1933,2908705,'Condeúba','BA'),(1934,2908804,'Contendas do Sincorá','BA'),(1935,2908903,'Coração de Maria','BA'),(1936,2909000,'Cordeiros','BA'),(1937,2909109,'Coribe','BA'),(1938,2909208,'Coronel João Sá','BA'),(1939,2909307,'Correntina','BA'),(1940,2909406,'Cotegipe','BA'),(1941,2909505,'Cravolândia','BA'),(1942,2909604,'Crisópolis','BA'),(1943,2909703,'Cristópolis','BA'),(1944,2909802,'Cruz das Almas','BA'),(1945,2909901,'Curaçá','BA'),(1946,2910008,'Dário Meira','BA'),(1947,2910057,'Dias D\'Ávila','BA'),(1948,2910107,'Dom Basílio','BA'),(1949,2910206,'Dom Macedo Costa','BA'),(1950,2910305,'Elísio Medrado','BA'),(1951,2910404,'Encruzilhada','BA'),(1952,2910503,'Entre Rios','BA'),(1953,2910602,'Esplanada','BA'),(1954,2910701,'Euclides da Cunha','BA'),(1955,2910727,'Eunápolis','BA'),(1956,2910750,'Fátima','BA'),(1957,2910776,'Feira da Mata','BA'),(1958,2910800,'Feira de Santana','BA'),(1959,2910859,'Filadélfia','BA'),(1960,2910909,'Firmino Alves','BA'),(1961,2911006,'Floresta Azul','BA'),(1962,2911105,'Formosa do Rio Preto','BA'),(1963,2911204,'Gandu','BA'),(1964,2911253,'Gavião','BA'),(1965,2911303,'Gentio do Ouro','BA'),(1966,2911402,'Glória','BA'),(1967,2911501,'Gongogi','BA'),(1968,2911600,'Governador Mangabeira','BA'),(1969,2911659,'Guajeru','BA'),(1970,2911709,'Guanambi','BA'),(1971,2911808,'Guaratinga','BA'),(1972,2911857,'Heliópolis','BA'),(1973,2911907,'Iaçu','BA'),(1974,2912004,'Ibiassucê','BA'),(1975,2912103,'Ibicaraí','BA'),(1976,2912202,'Ibicoara','BA'),(1977,2912301,'Ibicuí','BA'),(1978,2912400,'Ibipeba','BA'),(1979,2912509,'Ibipitanga','BA'),(1980,2912608,'Ibiquera','BA'),(1981,2912707,'Ibirapitanga','BA'),(1982,2912806,'Ibirapuã','BA'),(1983,2912905,'Ibirataia','BA'),(1984,2913002,'Ibitiara','BA'),(1985,2913101,'Ibititá','BA'),(1986,2913200,'Ibotirama','BA'),(1987,2913309,'Ichu','BA'),(1988,2913408,'Igaporã','BA'),(1989,2913457,'Igrapiúna','BA'),(1990,2913507,'Iguaí','BA'),(1991,2913606,'Ilhéus','BA'),(1992,2913705,'Inhambupe','BA'),(1993,2913804,'Ipecaetá','BA'),(1994,2913903,'Ipiaú','BA'),(1995,2914000,'Ipirá','BA'),(1996,2914109,'Ipupiara','BA'),(1997,2914208,'Irajuba','BA'),(1998,2914307,'Iramaia','BA'),(1999,2914406,'Iraquara','BA'),(2000,2914505,'Irará','BA'),(2001,2914604,'Irecê','BA'),(2002,2914653,'Itabela','BA'),(2003,2914703,'Itaberaba','BA'),(2004,2914802,'Itabuna','BA'),(2005,2914901,'Itacaré','BA'),(2006,2915007,'Itaeté','BA'),(2007,2915106,'Itagi','BA'),(2008,2915205,'Itagibá','BA'),(2009,2915304,'Itagimirim','BA'),(2010,2915353,'Itaguaçu da Bahia','BA'),(2011,2915403,'Itaju do Colônia','BA'),(2012,2915502,'Itajuípe','BA'),(2013,2915601,'Itamaraju','BA'),(2014,2915700,'Itamari','BA'),(2015,2915809,'Itambé','BA'),(2016,2915908,'Itanagra','BA'),(2017,2916005,'Itanhém','BA'),(2018,2916104,'Itaparica','BA'),(2019,2916203,'Itapé','BA'),(2020,2916302,'Itapebi','BA'),(2021,2916401,'Itapetinga','BA'),(2022,2916500,'Itapicuru','BA'),(2023,2916609,'Itapitanga','BA'),(2024,2916708,'Itaquara','BA'),(2025,2916807,'Itarantim','BA'),(2026,2916856,'Itatim','BA'),(2027,2916906,'Itiruçu','BA'),(2028,2917003,'Itiúba','BA'),(2029,2917102,'Itororó','BA'),(2030,2917201,'Ituaçu','BA'),(2031,2917300,'Ituberá','BA'),(2032,2917334,'Iuiú','BA'),(2033,2917359,'Jaborandi','BA'),(2034,2917409,'Jacaraci','BA'),(2035,2917508,'Jacobina','BA'),(2036,2917607,'Jaguaquara','BA'),(2037,2917706,'Jaguarari','BA'),(2038,2917805,'Jaguaripe','BA'),(2039,2917904,'Jandaíra','BA'),(2040,2918001,'Jequié','BA'),(2041,2918100,'Jeremoabo','BA'),(2042,2918209,'Jiquiriçá','BA'),(2043,2918308,'Jitaúna','BA'),(2044,2918357,'João Dourado','BA'),(2045,2918407,'Juazeiro','BA'),(2046,2918456,'Jucuruçu','BA'),(2047,2918506,'Jussara','BA'),(2048,2918555,'Jussari','BA'),(2049,2918605,'Jussiape','BA'),(2050,2918704,'Lafaiete Coutinho','BA'),(2051,2918753,'Lagoa Real','BA'),(2052,2918803,'Laje','BA'),(2053,2918902,'Lajedão','BA'),(2054,2919009,'Lajedinho','BA'),(2055,2919058,'Lajedo do Tabocal','BA'),(2056,2919108,'Lamarão','BA'),(2057,2919157,'Lapão','BA'),(2058,2919207,'Lauro de Freitas','BA'),(2059,2919306,'Lençóis','BA'),(2060,2919405,'Licínio de Almeida','BA'),(2061,2919504,'Livramento de Nossa Senhora','BA'),(2062,2919553,'Luís Eduardo Magalhães','BA'),(2063,2919603,'Macajuba','BA'),(2064,2919702,'Macarani','BA'),(2065,2919801,'Macaúbas','BA'),(2066,2919900,'Macururé','BA'),(2067,2919926,'Madre de Deus','BA'),(2068,2919959,'Maetinga','BA'),(2069,2920007,'Maiquinique','BA'),(2070,2920106,'Mairi','BA'),(2071,2920205,'Malhada','BA'),(2072,2920304,'Malhada de Pedras','BA'),(2073,2920403,'Manoel Vitorino','BA'),(2074,2920452,'Mansidão','BA'),(2075,2920502,'Maracás','BA'),(2076,2920601,'Maragogipe','BA'),(2077,2920700,'Maraú','BA'),(2078,2920809,'Marcionílio Souza','BA'),(2079,2920908,'Mascote','BA'),(2080,2921005,'Mata de São João','BA'),(2081,2921054,'Matina','BA'),(2082,2921104,'Medeiros Neto','BA'),(2083,2921203,'Miguel Calmon','BA'),(2084,2921302,'Milagres','BA'),(2085,2921401,'Mirangaba','BA'),(2086,2921450,'Mirante','BA'),(2087,2921500,'Monte Santo','BA'),(2088,2921609,'Morpará','BA'),(2089,2921708,'Morro do Chapéu','BA'),(2090,2921807,'Mortugaba','BA'),(2091,2921906,'Mucugê','BA'),(2092,2922003,'Mucuri','BA'),(2093,2922052,'Mulungu do Morro','BA'),(2094,2922102,'Mundo Novo','BA'),(2095,2922201,'Muniz Ferreira','BA'),(2096,2922250,'Muquém de São Francisco','BA'),(2097,2922300,'Muritiba','BA'),(2098,2922409,'Mutuípe','BA'),(2099,2922508,'Nazaré','BA'),(2100,2922607,'Nilo Peçanha','BA'),(2101,2922656,'Nordestina','BA'),(2102,2922706,'Nova Canaã','BA'),(2103,2922730,'Nova Fátima','BA'),(2104,2922755,'Nova Ibiá','BA'),(2105,2922805,'Nova Itarana','BA'),(2106,2922854,'Nova Redenção','BA'),(2107,2922904,'Nova Soure','BA'),(2108,2923001,'Nova Viçosa','BA'),(2109,2923035,'Novo Horizonte','BA'),(2110,2923050,'Novo Triunfo','BA'),(2111,2923100,'Olindina','BA'),(2112,2923209,'Oliveira dos Brejinhos','BA'),(2113,2923308,'Ouriçangas','BA'),(2114,2923357,'Ourolândia','BA'),(2115,2923407,'Palmas de Monte Alto','BA'),(2116,2923506,'Palmeiras','BA'),(2117,2923605,'Paramirim','BA'),(2118,2923704,'Paratinga','BA'),(2119,2923803,'Paripiranga','BA'),(2120,2923902,'Pau Brasil','BA'),(2121,2924009,'Paulo Afonso','BA'),(2122,2924058,'Pé de Serra','BA'),(2123,2924108,'Pedrão','BA'),(2124,2924207,'Pedro Alexandre','BA'),(2125,2924306,'Piatã','BA'),(2126,2924405,'Pilão Arcado','BA'),(2127,2924504,'Pindaí','BA'),(2128,2924603,'Pindobaçu','BA'),(2129,2924652,'Pintadas','BA'),(2130,2924678,'Piraí do Norte','BA'),(2131,2924702,'Piripá','BA'),(2132,2924801,'Piritiba','BA'),(2133,2924900,'Planaltino','BA'),(2134,2925006,'Planalto','BA'),(2135,2925105,'Poções','BA'),(2136,2925204,'Pojuca','BA'),(2137,2925253,'Ponto Novo','BA'),(2138,2925303,'Porto Seguro','BA'),(2139,2925402,'Potiraguá','BA'),(2140,2925501,'Prado','BA'),(2141,2925600,'Presidente Dutra','BA'),(2142,2925709,'Presidente Jânio Quadros','BA'),(2143,2925758,'Presidente Tancredo Neves','BA'),(2144,2925808,'Queimadas','BA'),(2145,2925907,'Quijingue','BA'),(2146,2925931,'Quixabeira','BA'),(2147,2925956,'Rafael Jambeiro','BA'),(2148,2926004,'Remanso','BA'),(2149,2926103,'Retirolândia','BA'),(2150,2926202,'Riachão das Neves','BA'),(2151,2926301,'Riachão do Jacuípe','BA'),(2152,2926400,'Riacho de Santana','BA'),(2153,2926509,'Ribeira do Amparo','BA'),(2154,2926608,'Ribeira do Pombal','BA'),(2155,2926657,'Ribeirão do Largo','BA'),(2156,2926707,'Rio de Contas','BA'),(2157,2926806,'Rio do Antônio','BA'),(2158,2926905,'Rio do Pires','BA'),(2159,2927002,'Rio Real','BA'),(2160,2927101,'Rodelas','BA'),(2161,2927200,'Ruy Barbosa','BA'),(2162,2927309,'Salinas da Margarida','BA'),(2163,2927408,'Salvador','BA'),(2164,2927507,'Santa Bárbara','BA'),(2165,2927606,'Santa Brígida','BA'),(2166,2927705,'Santa Cruz Cabrália','BA'),(2167,2927804,'Santa Cruz da Vitória','BA'),(2168,2927903,'Santa Inês','BA'),(2169,2928000,'Santaluz','BA'),(2170,2928059,'Santa Luzia','BA'),(2171,2928109,'Santa Maria da Vitória','BA'),(2172,2928208,'Santana','BA'),(2173,2928307,'Santanópolis','BA'),(2174,2928406,'Santa Rita de Cássia','BA'),(2175,2928505,'Santa Teresinha','BA'),(2176,2928604,'Santo Amaro','BA'),(2177,2928703,'Santo Antônio de Jesus','BA'),(2178,2928802,'Santo Estêvão','BA'),(2179,2928901,'São Desidério','BA'),(2180,2928950,'São Domingos','BA'),(2181,2929008,'São Félix','BA'),(2182,2929057,'São Félix do Coribe','BA'),(2183,2929107,'São Felipe','BA'),(2184,2929206,'São Francisco do Conde','BA'),(2185,2929255,'São Gabriel','BA'),(2186,2929305,'São Gonçalo dos Campos','BA'),(2187,2929354,'São José da Vitória','BA'),(2188,2929370,'São José do Jacuípe','BA'),(2189,2929404,'São Miguel das Matas','BA'),(2190,2929503,'São Sebastião do Passé','BA'),(2191,2929602,'Sapeaçu','BA'),(2192,2929701,'Sátiro Dias','BA'),(2193,2929750,'Saubara','BA'),(2194,2929800,'Saúde','BA'),(2195,2929909,'Seabra','BA'),(2196,2930006,'Sebastião Laranjeiras','BA'),(2197,2930105,'Senhor do Bonfim','BA'),(2198,2930154,'Serra do Ramalho','BA'),(2199,2930204,'Sento Sé','BA'),(2200,2930303,'Serra Dourada','BA'),(2201,2930402,'Serra Preta','BA'),(2202,2930501,'Serrinha','BA'),(2203,2930600,'Serrolândia','BA'),(2204,2930709,'Simões Filho','BA'),(2205,2930758,'Sítio do Mato','BA'),(2206,2930766,'Sítio do Quinto','BA'),(2207,2930774,'Sobradinho','BA'),(2208,2930808,'Souto Soares','BA'),(2209,2930907,'Tabocas do Brejo Velho','BA'),(2210,2931004,'Tanhaçu','BA'),(2211,2931053,'Tanque Novo','BA'),(2212,2931103,'Tanquinho','BA'),(2213,2931202,'Taperoá','BA'),(2214,2931301,'Tapiramutá','BA'),(2215,2931350,'Teixeira de Freitas','BA'),(2216,2931400,'Teodoro Sampaio','BA'),(2217,2931509,'Teofilândia','BA'),(2218,2931608,'Teolândia','BA'),(2219,2931707,'Terra Nova','BA'),(2220,2931806,'Tremedal','BA'),(2221,2931905,'Tucano','BA'),(2222,2932002,'Uauá','BA'),(2223,2932101,'Ubaíra','BA'),(2224,2932200,'Ubaitaba','BA'),(2225,2932309,'Ubatã','BA'),(2226,2932408,'Uibaí','BA'),(2227,2932457,'Umburanas','BA'),(2228,2932507,'Una','BA'),(2229,2932606,'Urandi','BA'),(2230,2932705,'Uruçuca','BA'),(2231,2932804,'Utinga','BA'),(2232,2932903,'Valença','BA'),(2233,2933000,'Valente','BA'),(2234,2933059,'Várzea da Roça','BA'),(2235,2933109,'Várzea do Poço','BA'),(2236,2933158,'Várzea Nova','BA'),(2237,2933174,'Varzedo','BA'),(2238,2933208,'Vera Cruz','BA'),(2239,2933257,'Vereda','BA'),(2240,2933307,'Vitória da Conquista','BA'),(2241,2933406,'Wagner','BA'),(2242,2933455,'Wanderley','BA'),(2243,2933505,'Wenceslau Guimarães','BA'),(2244,2933604,'Xique-Xique','BA'),(2245,3100104,'Abadia dos Dourados','MG'),(2246,3100203,'Abaeté','MG'),(2247,3100302,'Abre Campo','MG'),(2248,3100401,'Acaiaca','MG'),(2249,3100500,'Açucena','MG'),(2250,3100609,'Água Boa','MG'),(2251,3100708,'Água Comprida','MG'),(2252,3100807,'Aguanil','MG'),(2253,3100906,'Águas Formosas','MG'),(2254,3101003,'Águas Vermelhas','MG'),(2255,3101102,'Aimorés','MG'),(2256,3101201,'Aiuruoca','MG'),(2257,3101300,'Alagoa','MG'),(2258,3101409,'Albertina','MG'),(2259,3101508,'Além Paraíba','MG'),(2260,3101607,'Alfenas','MG'),(2261,3101631,'Alfredo Vasconcelos','MG'),(2262,3101706,'Almenara','MG'),(2263,3101805,'Alpercata','MG'),(2264,3101904,'Alpinópolis','MG'),(2265,3102001,'Alterosa','MG'),(2266,3102050,'Alto Caparaó','MG'),(2267,3102100,'Alto Rio Doce','MG'),(2268,3102209,'Alvarenga','MG'),(2269,3102308,'Alvinópolis','MG'),(2270,3102407,'Alvorada de Minas','MG'),(2271,3102506,'Amparo do Serra','MG'),(2272,3102605,'Andradas','MG'),(2273,3102704,'Cachoeira de Pajeú','MG'),(2274,3102803,'Andrelândia','MG'),(2275,3102852,'Angelândia','MG'),(2276,3102902,'Antônio Carlos','MG'),(2277,3103009,'Antônio Dias','MG'),(2278,3103108,'Antônio Prado de Minas','MG'),(2279,3103207,'Araçaí','MG'),(2280,3103306,'Aracitaba','MG'),(2281,3103405,'Araçuaí','MG'),(2282,3103504,'Araguari','MG'),(2283,3103603,'Arantina','MG'),(2284,3103702,'Araponga','MG'),(2285,3103751,'Araporã','MG'),(2286,3103801,'Arapuá','MG'),(2287,3103900,'Araújos','MG'),(2288,3104007,'Araxá','MG'),(2289,3104106,'Arceburgo','MG'),(2290,3104205,'Arcos','MG'),(2291,3104304,'Areado','MG'),(2292,3104403,'Argirita','MG'),(2293,3104452,'Aricanduva','MG'),(2294,3104502,'Arinos','MG'),(2295,3104601,'Astolfo Dutra','MG'),(2296,3104700,'Ataléia','MG'),(2297,3104809,'Augusto de Lima','MG'),(2298,3104908,'Baependi','MG'),(2299,3105004,'Baldim','MG'),(2300,3105103,'Bambuí','MG'),(2301,3105202,'Bandeira','MG'),(2302,3105301,'Bandeira do Sul','MG'),(2303,3105400,'Barão de Cocais','MG'),(2304,3105509,'Barão de Monte Alto','MG'),(2305,3105608,'Barbacena','MG'),(2306,3105707,'Barra Longa','MG'),(2307,3105905,'Barroso','MG'),(2308,3106002,'Bela Vista de Minas','MG'),(2309,3106101,'Belmiro Braga','MG'),(2310,3106200,'Belo Horizonte','MG'),(2311,3106309,'Belo Oriente','MG'),(2312,3106408,'Belo Vale','MG'),(2313,3106507,'Berilo','MG'),(2314,3106606,'Bertópolis','MG'),(2315,3106655,'Berizal','MG'),(2316,3106705,'Betim','MG'),(2317,3106804,'Bias Fortes','MG'),(2318,3106903,'Bicas','MG'),(2319,3107000,'Biquinhas','MG'),(2320,3107109,'Boa Esperança','MG'),(2321,3107208,'Bocaina de Minas','MG'),(2322,3107307,'Bocaiúva','MG'),(2323,3107406,'Bom Despacho','MG'),(2324,3107505,'Bom Jardim de Minas','MG'),(2325,3107604,'Bom Jesus da Penha','MG'),(2326,3107703,'Bom Jesus do Amparo','MG'),(2327,3107802,'Bom Jesus do Galho','MG'),(2328,3107901,'Bom Repouso','MG'),(2329,3108008,'Bom Sucesso','MG'),(2330,3108107,'Bonfim','MG'),(2331,3108206,'Bonfinópolis de Minas','MG'),(2332,3108255,'Bonito de Minas','MG'),(2333,3108305,'Borda da Mata','MG'),(2334,3108404,'Botelhos','MG'),(2335,3108503,'Botumirim','MG'),(2336,3108552,'Brasilândia de Minas','MG'),(2337,3108602,'Brasília de Minas','MG'),(2338,3108701,'Brás Pires','MG'),(2339,3108800,'Braúnas','MG'),(2340,3108909,'Brazópolis','MG'),(2341,3109006,'Brumadinho','MG'),(2342,3109105,'Bueno Brandão','MG'),(2343,3109204,'Buenópolis','MG'),(2344,3109253,'Bugre','MG'),(2345,3109303,'Buritis','MG'),(2346,3109402,'Buritizeiro','MG'),(2347,3109451,'Cabeceira Grande','MG'),(2348,3109501,'Cabo Verde','MG'),(2349,3109600,'Cachoeira da Prata','MG'),(2350,3109709,'Cachoeira de Minas','MG'),(2351,3109808,'Cachoeira Dourada','MG'),(2352,3109907,'Caetanópolis','MG'),(2353,3110004,'Caeté','MG'),(2354,3110103,'Caiana','MG'),(2355,3110202,'Cajuri','MG'),(2356,3110301,'Caldas','MG'),(2357,3110400,'Camacho','MG'),(2358,3110509,'Camanducaia','MG'),(2359,3110608,'Cambuí','MG'),(2360,3110707,'Cambuquira','MG'),(2361,3110806,'Campanário','MG'),(2362,3110905,'Campanha','MG'),(2363,3111002,'Campestre','MG'),(2364,3111101,'Campina Verde','MG'),(2365,3111150,'Campo Azul','MG'),(2366,3111200,'Campo Belo','MG'),(2367,3111309,'Campo do Meio','MG'),(2368,3111408,'Campo Florido','MG'),(2369,3111507,'Campos Altos','MG'),(2370,3111606,'Campos Gerais','MG'),(2371,3111705,'Canaã','MG'),(2372,3111804,'Canápolis','MG'),(2373,3111903,'Cana Verde','MG'),(2374,3112000,'Candeias','MG'),(2375,3112059,'Cantagalo','MG'),(2376,3112109,'Caparaó','MG'),(2377,3112208,'Capela Nova','MG'),(2378,3112307,'Capelinha','MG'),(2379,3112406,'Capetinga','MG'),(2380,3112505,'Capim Branco','MG'),(2381,3112604,'Capinópolis','MG'),(2382,3112653,'Capitão Andrade','MG'),(2383,3112703,'Capitão Enéas','MG'),(2384,3112802,'Capitólio','MG'),(2385,3112901,'Caputira','MG'),(2386,3113008,'Caraí','MG'),(2387,3113107,'Caranaíba','MG'),(2388,3113206,'Carandaí','MG'),(2389,3113305,'Carangola','MG'),(2390,3113404,'Caratinga','MG'),(2391,3113503,'Carbonita','MG'),(2392,3113602,'Careaçu','MG'),(2393,3113701,'Carlos Chagas','MG'),(2394,3113800,'Carmésia','MG'),(2395,3113909,'Carmo da Cachoeira','MG'),(2396,3114006,'Carmo da Mata','MG'),(2397,3114105,'Carmo de Minas','MG'),(2398,3114204,'Carmo do Cajuru','MG'),(2399,3114303,'Carmo do Paranaíba','MG'),(2400,3114402,'Carmo do Rio Claro','MG'),(2401,3114501,'Carmópolis de Minas','MG'),(2402,3114550,'Carneirinho','MG'),(2403,3114600,'Carrancas','MG'),(2404,3114709,'Carvalhópolis','MG'),(2405,3114808,'Carvalhos','MG'),(2406,3114907,'Casa Grande','MG'),(2407,3115003,'Cascalho Rico','MG'),(2408,3115102,'Cássia','MG'),(2409,3115201,'Conceição da Barra de Minas','MG'),(2410,3115300,'Cataguases','MG'),(2411,3115359,'Catas Altas','MG'),(2412,3115409,'Catas Altas da Noruega','MG'),(2413,3115458,'Catuji','MG'),(2414,3115474,'Catuti','MG'),(2415,3115508,'Caxambu','MG'),(2416,3115607,'Cedro do Abaeté','MG'),(2417,3115706,'Central de Minas','MG'),(2418,3115805,'Centralina','MG'),(2419,3115904,'Chácara','MG'),(2420,3116001,'Chalé','MG'),(2421,3116100,'Chapada do Norte','MG'),(2422,3116159,'Chapada Gaúcha','MG'),(2423,3116209,'Chiador','MG'),(2424,3116308,'Cipotânea','MG'),(2425,3116407,'Claraval','MG'),(2426,3116506,'Claro dos Poções','MG'),(2427,3116605,'Cláudio','MG'),(2428,3116704,'Coimbra','MG'),(2429,3116803,'Coluna','MG'),(2430,3116902,'Comendador Gomes','MG'),(2431,3117009,'Comercinho','MG'),(2432,3117108,'Conceição da Aparecida','MG'),(2433,3117207,'Conceição das Pedras','MG'),(2434,3117306,'Conceição das Alagoas','MG'),(2435,3117405,'Conceição de Ipanema','MG'),(2436,3117504,'Conceição do Mato Dentro','MG'),(2437,3117603,'Conceição do Pará','MG'),(2438,3117702,'Conceição do Rio Verde','MG'),(2439,3117801,'Conceição dos Ouros','MG'),(2440,3117836,'Cônego Marinho','MG'),(2441,3117876,'Confins','MG'),(2442,3117900,'Congonhal','MG'),(2443,3118007,'Congonhas','MG'),(2444,3118106,'Congonhas do Norte','MG'),(2445,3118205,'Conquista','MG'),(2446,3118304,'Conselheiro Lafaiete','MG'),(2447,3118403,'Conselheiro Pena','MG'),(2448,3118502,'Consolação','MG'),(2449,3118601,'Contagem','MG'),(2450,3118700,'Coqueiral','MG'),(2451,3118809,'Coração de Jesus','MG'),(2452,3118908,'Cordisburgo','MG'),(2453,3119005,'Cordislândia','MG'),(2454,3119104,'Corinto','MG'),(2455,3119203,'Coroaci','MG'),(2456,3119302,'Coromandel','MG'),(2457,3119401,'Coronel Fabriciano','MG'),(2458,3119500,'Coronel Murta','MG'),(2459,3119609,'Coronel Pacheco','MG'),(2460,3119708,'Coronel Xavier Chaves','MG'),(2461,3119807,'Córrego Danta','MG'),(2462,3119906,'Córrego do Bom Jesus','MG'),(2463,3119955,'Córrego Fundo','MG'),(2464,3120003,'Córrego Novo','MG'),(2465,3120102,'Couto de Magalhães de Minas','MG'),(2466,3120151,'Crisólita','MG'),(2467,3120201,'Cristais','MG'),(2468,3120300,'Cristália','MG'),(2469,3120409,'Cristiano Otoni','MG'),(2470,3120508,'Cristina','MG'),(2471,3120607,'Crucilândia','MG'),(2472,3120706,'Cruzeiro da Fortaleza','MG'),(2473,3120805,'Cruzília','MG'),(2474,3120839,'Cuparaque','MG'),(2475,3120870,'Curral de Dentro','MG'),(2476,3120904,'Curvelo','MG'),(2477,3121001,'Datas','MG'),(2478,3121100,'Delfim Moreira','MG'),(2479,3121209,'Delfinópolis','MG'),(2480,3121258,'Delta','MG'),(2481,3121308,'Descoberto','MG'),(2482,3121407,'Desterro de Entre Rios','MG'),(2483,3121506,'Desterro do Melo','MG'),(2484,3121605,'Diamantina','MG'),(2485,3121704,'Diogo de Vasconcelos','MG'),(2486,3121803,'Dionísio','MG'),(2487,3121902,'Divinésia','MG'),(2488,3122009,'Divino','MG'),(2489,3122108,'Divino das Laranjeiras','MG'),(2490,3122207,'Divinolândia de Minas','MG'),(2491,3122306,'Divinópolis','MG'),(2492,3122355,'Divisa Alegre','MG'),(2493,3122405,'Divisa Nova','MG'),(2494,3122454,'Divisópolis','MG'),(2495,3122470,'Dom Bosco','MG'),(2496,3122504,'Dom Cavati','MG'),(2497,3122603,'Dom Joaquim','MG'),(2498,3122702,'Dom Silvério','MG'),(2499,3122801,'Dom Viçoso','MG'),(2500,3122900,'Dona Eusébia','MG'),(2501,3123007,'Dores de Campos','MG'),(2502,3123106,'Dores de Guanhães','MG'),(2503,3123205,'Dores do Indaiá','MG'),(2504,3123304,'Dores do Turvo','MG'),(2505,3123403,'Doresópolis','MG'),(2506,3123502,'Douradoquara','MG'),(2507,3123528,'Durandé','MG'),(2508,3123601,'Elói Mendes','MG'),(2509,3123700,'Engenheiro Caldas','MG'),(2510,3123809,'Engenheiro Navarro','MG'),(2511,3123858,'Entre Folhas','MG'),(2512,3123908,'Entre Rios de Minas','MG'),(2513,3124005,'Ervália','MG'),(2514,3124104,'Esmeraldas','MG'),(2515,3124203,'Espera Feliz','MG'),(2516,3124302,'Espinosa','MG'),(2517,3124401,'Espírito Santo do Dourado','MG'),(2518,3124500,'Estiva','MG'),(2519,3124609,'Estrela Dalva','MG'),(2520,3124708,'Estrela do Indaiá','MG'),(2521,3124807,'Estrela do Sul','MG'),(2522,3124906,'Eugenópolis','MG'),(2523,3125002,'Ewbank da Câmara','MG'),(2524,3125101,'Extrema','MG'),(2525,3125200,'Fama','MG'),(2526,3125309,'Faria Lemos','MG'),(2527,3125408,'Felício dos Santos','MG'),(2528,3125507,'São Gonçalo do Rio Preto','MG'),(2529,3125606,'Felisburgo','MG'),(2530,3125705,'Felixlândia','MG'),(2531,3125804,'Fernandes Tourinho','MG'),(2532,3125903,'Ferros','MG'),(2533,3125952,'Fervedouro','MG'),(2534,3126000,'Florestal','MG'),(2535,3126109,'Formiga','MG'),(2536,3126208,'Formoso','MG'),(2537,3126307,'Fortaleza de Minas','MG'),(2538,3126406,'Fortuna de Minas','MG'),(2539,3126505,'Francisco Badaró','MG'),(2540,3126604,'Francisco Dumont','MG'),(2541,3126703,'Francisco Sá','MG'),(2542,3126752,'Franciscópolis','MG'),(2543,3126802,'Frei Gaspar','MG'),(2544,3126901,'Frei Inocêncio','MG'),(2545,3126950,'Frei Lagonegro','MG'),(2546,3127008,'Fronteira','MG'),(2547,3127057,'Fronteira dos Vales','MG'),(2548,3127073,'Fruta de Leite','MG'),(2549,3127107,'Frutal','MG'),(2550,3127206,'Funilândia','MG'),(2551,3127305,'Galiléia','MG'),(2552,3127339,'Gameleiras','MG'),(2553,3127354,'Glaucilândia','MG'),(2554,3127370,'Goiabeira','MG'),(2555,3127388,'Goianá','MG'),(2556,3127404,'Gonçalves','MG'),(2557,3127503,'Gonzaga','MG'),(2558,3127602,'Gouveia','MG'),(2559,3127701,'Governador Valadares','MG'),(2560,3127800,'Grão Mogol','MG'),(2561,3127909,'Grupiara','MG'),(2562,3128006,'Guanhães','MG'),(2563,3128105,'Guapé','MG'),(2564,3128204,'Guaraciaba','MG'),(2565,3128253,'Guaraciama','MG'),(2566,3128303,'Guaranésia','MG'),(2567,3128402,'Guarani','MG'),(2568,3128501,'Guarará','MG'),(2569,3128600,'Guarda-Mor','MG'),(2570,3128709,'Guaxupé','MG'),(2571,3128808,'Guidoval','MG'),(2572,3128907,'Guimarânia','MG'),(2573,3129004,'Guiricema','MG'),(2574,3129103,'Gurinhatã','MG'),(2575,3129202,'Heliodora','MG'),(2576,3129301,'Iapu','MG'),(2577,3129400,'Ibertioga','MG'),(2578,3129509,'Ibiá','MG'),(2579,3129608,'Ibiaí','MG'),(2580,3129657,'Ibiracatu','MG'),(2581,3129707,'Ibiraci','MG'),(2582,3129806,'Ibirité','MG'),(2583,3129905,'Ibitiúra de Minas','MG'),(2584,3130002,'Ibituruna','MG'),(2585,3130051,'Icaraí de Minas','MG'),(2586,3130101,'Igarapé','MG'),(2587,3130200,'Igaratinga','MG'),(2588,3130309,'Iguatama','MG'),(2589,3130408,'Ijaci','MG'),(2590,3130507,'Ilicínea','MG'),(2591,3130556,'Imbé de Minas','MG'),(2592,3130606,'Inconfidentes','MG'),(2593,3130655,'Indaiabira','MG'),(2594,3130705,'Indianópolis','MG'),(2595,3130804,'Ingaí','MG'),(2596,3130903,'Inhapim','MG'),(2597,3131000,'Inhaúma','MG'),(2598,3131109,'Inimutaba','MG'),(2599,3131158,'Ipaba','MG'),(2600,3131208,'Ipanema','MG'),(2601,3131307,'Ipatinga','MG'),(2602,3131406,'Ipiaçu','MG'),(2603,3131505,'Ipuiúna','MG'),(2604,3131604,'Iraí de Minas','MG'),(2605,3131703,'Itabira','MG'),(2606,3131802,'Itabirinha','MG'),(2607,3131901,'Itabirito','MG'),(2608,3132008,'Itacambira','MG'),(2609,3132107,'Itacarambi','MG'),(2610,3132206,'Itaguara','MG'),(2611,3132305,'Itaipé','MG'),(2612,3132404,'Itajubá','MG'),(2613,3132503,'Itamarandiba','MG'),(2614,3132602,'Itamarati de Minas','MG'),(2615,3132701,'Itambacuri','MG'),(2616,3132800,'Itambé do Mato Dentro','MG'),(2617,3132909,'Itamogi','MG'),(2618,3133006,'Itamonte','MG'),(2619,3133105,'Itanhandu','MG'),(2620,3133204,'Itanhomi','MG'),(2621,3133303,'Itaobim','MG'),(2622,3133402,'Itapagipe','MG'),(2623,3133501,'Itapecerica','MG'),(2624,3133600,'Itapeva','MG'),(2625,3133709,'Itatiaiuçu','MG'),(2626,3133758,'Itaú de Minas','MG'),(2627,3133808,'Itaúna','MG'),(2628,3133907,'Itaverava','MG'),(2629,3134004,'Itinga','MG'),(2630,3134103,'Itueta','MG'),(2631,3134202,'Ituiutaba','MG'),(2632,3134301,'Itumirim','MG'),(2633,3134400,'Iturama','MG'),(2634,3134509,'Itutinga','MG'),(2635,3134608,'Jaboticatubas','MG'),(2636,3134707,'Jacinto','MG'),(2637,3134806,'Jacuí','MG'),(2638,3134905,'Jacutinga','MG'),(2639,3135001,'Jaguaraçu','MG'),(2640,3135050,'Jaíba','MG'),(2641,3135076,'Jampruca','MG'),(2642,3135100,'Janaúba','MG'),(2643,3135209,'Januária','MG'),(2644,3135308,'Japaraíba','MG'),(2645,3135357,'Japonvar','MG'),(2646,3135407,'Jeceaba','MG'),(2647,3135456,'Jenipapo de Minas','MG'),(2648,3135506,'Jequeri','MG'),(2649,3135605,'Jequitaí','MG'),(2650,3135704,'Jequitibá','MG'),(2651,3135803,'Jequitinhonha','MG'),(2652,3135902,'Jesuânia','MG'),(2653,3136009,'Joaíma','MG'),(2654,3136108,'Joanésia','MG'),(2655,3136207,'João Monlevade','MG'),(2656,3136306,'João Pinheiro','MG'),(2657,3136405,'Joaquim Felício','MG'),(2658,3136504,'Jordânia','MG'),(2659,3136520,'José Gonçalves de Minas','MG'),(2660,3136553,'José Raydan','MG'),(2661,3136579,'Josenópolis','MG'),(2662,3136603,'Nova União','MG'),(2663,3136652,'Juatuba','MG'),(2664,3136702,'Juiz de Fora','MG'),(2665,3136801,'Juramento','MG'),(2666,3136900,'Juruaia','MG'),(2667,3136959,'Juvenília','MG'),(2668,3137007,'Ladainha','MG'),(2669,3137106,'Lagamar','MG'),(2670,3137205,'Lagoa da Prata','MG'),(2671,3137304,'Lagoa dos Patos','MG'),(2672,3137403,'Lagoa Dourada','MG'),(2673,3137502,'Lagoa Formosa','MG'),(2674,3137536,'Lagoa Grande','MG'),(2675,3137601,'Lagoa Santa','MG'),(2676,3137700,'Lajinha','MG'),(2677,3137809,'Lambari','MG'),(2678,3137908,'Lamim','MG'),(2679,3138005,'Laranjal','MG'),(2680,3138104,'Lassance','MG'),(2681,3138203,'Lavras','MG'),(2682,3138302,'Leandro Ferreira','MG'),(2683,3138351,'Leme do Prado','MG'),(2684,3138401,'Leopoldina','MG'),(2685,3138500,'Liberdade','MG'),(2686,3138609,'Lima Duarte','MG'),(2687,3138625,'Limeira do Oeste','MG'),(2688,3138658,'Lontra','MG'),(2689,3138674,'Luisburgo','MG'),(2690,3138682,'Luislândia','MG'),(2691,3138708,'Luminárias','MG'),(2692,3138807,'Luz','MG'),(2693,3138906,'Machacalis','MG'),(2694,3139003,'Machado','MG'),(2695,3139102,'Madre de Deus de Minas','MG'),(2696,3139201,'Malacacheta','MG'),(2697,3139250,'Mamonas','MG'),(2698,3139300,'Manga','MG'),(2699,3139409,'Manhuaçu','MG'),(2700,3139508,'Manhumirim','MG'),(2701,3139607,'Mantena','MG'),(2702,3139706,'Maravilhas','MG'),(2703,3139805,'Mar de Espanha','MG'),(2704,3139904,'Maria da Fé','MG'),(2705,3140001,'Mariana','MG'),(2706,3140100,'Marilac','MG'),(2707,3140159,'Mário Campos','MG'),(2708,3140209,'Maripá de Minas','MG'),(2709,3140308,'Marliéria','MG'),(2710,3140407,'Marmelópolis','MG'),(2711,3140506,'Martinho Campos','MG'),(2712,3140530,'Martins Soares','MG'),(2713,3140555,'Mata Verde','MG'),(2714,3140605,'Materlândia','MG'),(2715,3140704,'Mateus Leme','MG'),(2716,3140803,'Matias Barbosa','MG'),(2717,3140852,'Matias Cardoso','MG'),(2718,3140902,'Matipó','MG'),(2719,3141009,'Mato Verde','MG'),(2720,3141108,'Matozinhos','MG'),(2721,3141207,'Matutina','MG'),(2722,3141306,'Medeiros','MG'),(2723,3141405,'Medina','MG'),(2724,3141504,'Mendes Pimentel','MG'),(2725,3141603,'Mercês','MG'),(2726,3141702,'Mesquita','MG'),(2727,3141801,'Minas Novas','MG'),(2728,3141900,'Minduri','MG'),(2729,3142007,'Mirabela','MG'),(2730,3142106,'Miradouro','MG'),(2731,3142205,'Miraí','MG'),(2732,3142254,'Miravânia','MG'),(2733,3142304,'Moeda','MG'),(2734,3142403,'Moema','MG'),(2735,3142502,'Monjolos','MG'),(2736,3142601,'Monsenhor Paulo','MG'),(2737,3142700,'Montalvânia','MG'),(2738,3142809,'Monte Alegre de Minas','MG'),(2739,3142908,'Monte Azul','MG'),(2740,3143005,'Monte Belo','MG'),(2741,3143104,'Monte Carmelo','MG'),(2742,3143153,'Monte Formoso','MG'),(2743,3143203,'Monte Santo de Minas','MG'),(2744,3143302,'Montes Claros','MG'),(2745,3143401,'Monte Sião','MG'),(2746,3143450,'Montezuma','MG'),(2747,3143500,'Morada Nova de Minas','MG'),(2748,3143609,'Morro da Garça','MG'),(2749,3143708,'Morro do Pilar','MG'),(2750,3143807,'Munhoz','MG'),(2751,3143906,'Muriaé','MG'),(2752,3144003,'Mutum','MG'),(2753,3144102,'Muzambinho','MG'),(2754,3144201,'Nacip Raydan','MG'),(2755,3144300,'Nanuque','MG'),(2756,3144359,'Naque','MG'),(2757,3144375,'Natalândia','MG'),(2758,3144409,'Natércia','MG'),(2759,3144508,'Nazareno','MG'),(2760,3144607,'Nepomuceno','MG'),(2761,3144656,'Ninheira','MG'),(2762,3144672,'Nova Belém','MG'),(2763,3144706,'Nova Era','MG'),(2764,3144805,'Nova Lima','MG'),(2765,3144904,'Nova Módica','MG'),(2766,3145000,'Nova Ponte','MG'),(2767,3145059,'Nova Porteirinha','MG'),(2768,3145109,'Nova Resende','MG'),(2769,3145208,'Nova Serrana','MG'),(2770,3145307,'Novo Cruzeiro','MG'),(2771,3145356,'Novo Oriente de Minas','MG'),(2772,3145372,'Novorizonte','MG'),(2773,3145406,'Olaria','MG'),(2774,3145455,'Olhos-D\'Água','MG'),(2775,3145505,'Olímpio Noronha','MG'),(2776,3145604,'Oliveira','MG'),(2777,3145703,'Oliveira Fortes','MG'),(2778,3145802,'Onça de Pitangui','MG'),(2779,3145851,'Oratórios','MG'),(2780,3145877,'Orizânia','MG'),(2781,3145901,'Ouro Branco','MG'),(2782,3146008,'Ouro Fino','MG'),(2783,3146107,'Ouro Preto','MG'),(2784,3146206,'Ouro Verde de Minas','MG'),(2785,3146255,'Padre Carvalho','MG'),(2786,3146305,'Padre Paraíso','MG'),(2787,3146404,'Paineiras','MG'),(2788,3146503,'Pains','MG'),(2789,3146552,'Pai Pedro','MG'),(2790,3146602,'Paiva','MG'),(2791,3146701,'Palma','MG'),(2792,3146750,'Palmópolis','MG'),(2793,3146909,'Papagaios','MG'),(2794,3147006,'Paracatu','MG'),(2795,3147105,'Pará de Minas','MG'),(2796,3147204,'Paraguaçu','MG'),(2797,3147303,'Paraisópolis','MG'),(2798,3147402,'Paraopeba','MG'),(2799,3147501,'Passabém','MG'),(2800,3147600,'Passa Quatro','MG'),(2801,3147709,'Passa Tempo','MG'),(2802,3147808,'Passa-Vinte','MG'),(2803,3147907,'Passos','MG'),(2804,3147956,'Patis','MG'),(2805,3148004,'Patos de Minas','MG'),(2806,3148103,'Patrocínio','MG'),(2807,3148202,'Patrocínio do Muriaé','MG'),(2808,3148301,'Paula Cândido','MG'),(2809,3148400,'Paulistas','MG'),(2810,3148509,'Pavão','MG'),(2811,3148608,'Peçanha','MG'),(2812,3148707,'Pedra Azul','MG'),(2813,3148756,'Pedra Bonita','MG'),(2814,3148806,'Pedra do Anta','MG'),(2815,3148905,'Pedra do Indaiá','MG'),(2816,3149002,'Pedra Dourada','MG'),(2817,3149101,'Pedralva','MG'),(2818,3149150,'Pedras de Maria da Cruz','MG'),(2819,3149200,'Pedrinópolis','MG'),(2820,3149309,'Pedro Leopoldo','MG'),(2821,3149408,'Pedro Teixeira','MG'),(2822,3149507,'Pequeri','MG'),(2823,3149606,'Pequi','MG'),(2824,3149705,'Perdigão','MG'),(2825,3149804,'Perdizes','MG'),(2826,3149903,'Perdões','MG'),(2827,3149952,'Periquito','MG'),(2828,3150000,'Pescador','MG'),(2829,3150109,'Piau','MG'),(2830,3150158,'Piedade de Caratinga','MG'),(2831,3150208,'Piedade de Ponte Nova','MG'),(2832,3150307,'Piedade do Rio Grande','MG'),(2833,3150406,'Piedade dos Gerais','MG'),(2834,3150505,'Pimenta','MG'),(2835,3150539,'Pingo-D\'Água','MG'),(2836,3150570,'Pintópolis','MG'),(2837,3150604,'Piracema','MG'),(2838,3150703,'Pirajuba','MG'),(2839,3150802,'Piranga','MG'),(2840,3150901,'Piranguçu','MG'),(2841,3151008,'Piranguinho','MG'),(2842,3151107,'Pirapetinga','MG'),(2843,3151206,'Pirapora','MG'),(2844,3151305,'Piraúba','MG'),(2845,3151404,'Pitangui','MG'),(2846,3151503,'Piumhi','MG'),(2847,3151602,'Planura','MG'),(2848,3151701,'Poço Fundo','MG'),(2849,3151800,'Poços de Caldas','MG'),(2850,3151909,'Pocrane','MG'),(2851,3152006,'Pompéu','MG'),(2852,3152105,'Ponte Nova','MG'),(2853,3152131,'Ponto Chique','MG'),(2854,3152170,'Ponto dos Volantes','MG'),(2855,3152204,'Porteirinha','MG'),(2856,3152303,'Porto Firme','MG'),(2857,3152402,'Poté','MG'),(2858,3152501,'Pouso Alegre','MG'),(2859,3152600,'Pouso Alto','MG'),(2860,3152709,'Prados','MG'),(2861,3152808,'Prata','MG'),(2862,3152907,'Pratápolis','MG'),(2863,3153004,'Pratinha','MG'),(2864,3153103,'Presidente Bernardes','MG'),(2865,3153202,'Presidente Juscelino','MG'),(2866,3153301,'Presidente Kubitschek','MG'),(2867,3153400,'Presidente Olegário','MG'),(2868,3153509,'Alto Jequitibá','MG'),(2869,3153608,'Prudente de Morais','MG'),(2870,3153707,'Quartel Geral','MG'),(2871,3153806,'Queluzito','MG'),(2872,3153905,'Raposos','MG'),(2873,3154002,'Raul Soares','MG'),(2874,3154101,'Recreio','MG'),(2875,3154150,'Reduto','MG'),(2876,3154200,'Resende Costa','MG'),(2877,3154309,'Resplendor','MG'),(2878,3154408,'Ressaquinha','MG'),(2879,3154457,'Riachinho','MG'),(2880,3154507,'Riacho dos Machados','MG'),(2881,3154606,'Ribeirão das Neves','MG'),(2882,3154705,'Ribeirão Vermelho','MG'),(2883,3154804,'Rio Acima','MG'),(2884,3154903,'Rio Casca','MG'),(2885,3155009,'Rio Doce','MG'),(2886,3155108,'Rio do Prado','MG'),(2887,3155207,'Rio Espera','MG'),(2888,3155306,'Rio Manso','MG'),(2889,3155405,'Rio Novo','MG'),(2890,3155504,'Rio Paranaíba','MG'),(2891,3155603,'Rio Pardo de Minas','MG'),(2892,3155702,'Rio Piracicaba','MG'),(2893,3155801,'Rio Pomba','MG'),(2894,3155900,'Rio Preto','MG'),(2895,3156007,'Rio Vermelho','MG'),(2896,3156106,'Ritápolis','MG'),(2897,3156205,'Rochedo de Minas','MG'),(2898,3156304,'Rodeiro','MG'),(2899,3156403,'Romaria','MG'),(2900,3156452,'Rosário da Limeira','MG'),(2901,3156502,'Rubelita','MG'),(2902,3156601,'Rubim','MG'),(2903,3156700,'Sabará','MG'),(2904,3156809,'Sabinópolis','MG'),(2905,3156908,'Sacramento','MG'),(2906,3157005,'Salinas','MG'),(2907,3157104,'Salto da Divisa','MG'),(2908,3157203,'Santa Bárbara','MG'),(2909,3157252,'Santa Bárbara do Leste','MG'),(2910,3157278,'Santa Bárbara do Monte Verde','MG'),(2911,3157302,'Santa Bárbara do Tugúrio','MG'),(2912,3157336,'Santa Cruz de Minas','MG'),(2913,3157377,'Santa Cruz de Salinas','MG'),(2914,3157401,'Santa Cruz do Escalvado','MG'),(2915,3157500,'Santa Efigênia de Minas','MG'),(2916,3157609,'Santa Fé de Minas','MG'),(2917,3157658,'Santa Helena de Minas','MG'),(2918,3157708,'Santa Juliana','MG'),(2919,3157807,'Santa Luzia','MG'),(2920,3157906,'Santa Margarida','MG'),(2921,3158003,'Santa Maria de Itabira','MG'),(2922,3158102,'Santa Maria do Salto','MG'),(2923,3158201,'Santa Maria do Suaçuí','MG'),(2924,3158300,'Santana da Vargem','MG'),(2925,3158409,'Santana de Cataguases','MG'),(2926,3158508,'Santana de Pirapama','MG'),(2927,3158607,'Santana do Deserto','MG'),(2928,3158706,'Santana do Garambéu','MG'),(2929,3158805,'Santana do Jacaré','MG'),(2930,3158904,'Santana do Manhuaçu','MG'),(2931,3158953,'Santana do Paraíso','MG'),(2932,3159001,'Santana do Riacho','MG'),(2933,3159100,'Santana dos Montes','MG'),(2934,3159209,'Santa Rita de Caldas','MG'),(2935,3159308,'Santa Rita de Jacutinga','MG'),(2936,3159357,'Santa Rita de Minas','MG'),(2937,3159407,'Santa Rita de Ibitipoca','MG'),(2938,3159506,'Santa Rita do Itueto','MG'),(2939,3159605,'Santa Rita do Sapucaí','MG'),(2940,3159704,'Santa Rosa da Serra','MG'),(2941,3159803,'Santa Vitória','MG'),(2942,3159902,'Santo Antônio do Amparo','MG'),(2943,3160009,'Santo Antônio do Aventureiro','MG'),(2944,3160108,'Santo Antônio do Grama','MG'),(2945,3160207,'Santo Antônio do Itambé','MG'),(2946,3160306,'Santo Antônio do Jacinto','MG'),(2947,3160405,'Santo Antônio do Monte','MG'),(2948,3160454,'Santo Antônio do Retiro','MG'),(2949,3160504,'Santo Antônio do Rio Abaixo','MG'),(2950,3160603,'Santo Hipólito','MG'),(2951,3160702,'Santos Dumont','MG'),(2952,3160801,'São Bento Abade','MG'),(2953,3160900,'São Brás do Suaçuí','MG'),(2954,3160959,'São Domingos das Dores','MG'),(2955,3161007,'São Domingos do Prata','MG'),(2956,3161056,'São Félix de Minas','MG'),(2957,3161106,'São Francisco','MG'),(2958,3161205,'São Francisco de Paula','MG'),(2959,3161304,'São Francisco de Sales','MG'),(2960,3161403,'São Francisco do Glória','MG'),(2961,3161502,'São Geraldo','MG'),(2962,3161601,'São Geraldo da Piedade','MG'),(2963,3161650,'São Geraldo do Baixio','MG'),(2964,3161700,'São Gonçalo do Abaeté','MG'),(2965,3161809,'São Gonçalo do Pará','MG'),(2966,3161908,'São Gonçalo do Rio Abaixo','MG'),(2967,3162005,'São Gonçalo do Sapucaí','MG'),(2968,3162104,'São Gotardo','MG'),(2969,3162203,'São João Batista do Glória','MG'),(2970,3162252,'São João da Lagoa','MG'),(2971,3162302,'São João da Mata','MG'),(2972,3162401,'São João da Ponte','MG'),(2973,3162450,'São João das Missões','MG'),(2974,3162500,'São João del Rei','MG'),(2975,3162559,'São João do Manhuaçu','MG'),(2976,3162575,'São João do Manteninha','MG'),(2977,3162609,'São João do Oriente','MG'),(2978,3162658,'São João do Pacuí','MG'),(2979,3162708,'São João do Paraíso','MG'),(2980,3162807,'São João Evangelista','MG'),(2981,3162906,'São João Nepomuceno','MG'),(2982,3162922,'São Joaquim de Bicas','MG'),(2983,3162948,'São José da Barra','MG'),(2984,3162955,'São José da Lapa','MG'),(2985,3163003,'São José da Safira','MG'),(2986,3163102,'São José da Varginha','MG'),(2987,3163201,'São José do Alegre','MG'),(2988,3163300,'São José do Divino','MG'),(2989,3163409,'São José do Goiabal','MG'),(2990,3163508,'São José do Jacuri','MG'),(2991,3163607,'São José do Mantimento','MG'),(2992,3163706,'São Lourenço','MG'),(2993,3163805,'São Miguel do Anta','MG'),(2994,3163904,'São Pedro da União','MG'),(2995,3164001,'São Pedro dos Ferros','MG'),(2996,3164100,'São Pedro do Suaçuí','MG'),(2997,3164209,'São Romão','MG'),(2998,3164308,'São Roque de Minas','MG'),(2999,3164407,'São Sebastião da Bela Vista','MG'),(3000,3164431,'São Sebastião da Vargem Alegre','MG'),(3001,3164472,'São Sebastião do Anta','MG'),(3002,3164506,'São Sebastião do Maranhão','MG'),(3003,3164605,'São Sebastião do Oeste','MG'),(3004,3164704,'São Sebastião do Paraíso','MG'),(3005,3164803,'São Sebastião do Rio Preto','MG'),(3006,3164902,'São Sebastião do Rio Verde','MG'),(3007,3165008,'São Tiago','MG'),(3008,3165107,'São Tomás de Aquino','MG'),(3009,3165206,'São Thomé das Letras','MG'),(3010,3165305,'São Vicente de Minas','MG'),(3011,3165404,'Sapucaí-Mirim','MG'),(3012,3165503,'Sardoá','MG'),(3013,3165537,'Sarzedo','MG'),(3014,3165552,'Setubinha','MG'),(3015,3165560,'Sem-Peixe','MG'),(3016,3165578,'Senador Amaral','MG'),(3017,3165602,'Senador Cortes','MG'),(3018,3165701,'Senador Firmino','MG'),(3019,3165800,'Senador José Bento','MG'),(3020,3165909,'Senador Modestino Gonçalves','MG'),(3021,3166006,'Senhora de Oliveira','MG'),(3022,3166105,'Senhora do Porto','MG'),(3023,3166204,'Senhora dos Remédios','MG'),(3024,3166303,'Sericita','MG'),(3025,3166402,'Seritinga','MG'),(3026,3166501,'Serra Azul de Minas','MG'),(3027,3166600,'Serra da Saudade','MG'),(3028,3166709,'Serra dos Aimorés','MG'),(3029,3166808,'Serra do Salitre','MG'),(3030,3166907,'Serrania','MG'),(3031,3166956,'Serranópolis de Minas','MG'),(3032,3167004,'Serranos','MG'),(3033,3167103,'Serro','MG'),(3034,3167202,'Sete Lagoas','MG'),(3035,3167301,'Silveirânia','MG'),(3036,3167400,'Silvianópolis','MG'),(3037,3167509,'Simão Pereira','MG'),(3038,3167608,'Simonésia','MG'),(3039,3167707,'Sobrália','MG'),(3040,3167806,'Soledade de Minas','MG'),(3041,3167905,'Tabuleiro','MG'),(3042,3168002,'Taiobeiras','MG'),(3043,3168051,'Taparuba','MG'),(3044,3168101,'Tapira','MG'),(3045,3168200,'Tapiraí','MG'),(3046,3168309,'Taquaraçu de Minas','MG'),(3047,3168408,'Tarumirim','MG'),(3048,3168507,'Teixeiras','MG'),(3049,3168606,'Teófilo Otoni','MG'),(3050,3168705,'Timóteo','MG'),(3051,3168804,'Tiradentes','MG'),(3052,3168903,'Tiros','MG'),(3053,3169000,'Tocantins','MG'),(3054,3169059,'Tocos do Moji','MG'),(3055,3169109,'Toledo','MG'),(3056,3169208,'Tombos','MG'),(3057,3169307,'Três Corações','MG'),(3058,3169356,'Três Marias','MG'),(3059,3169406,'Três Pontas','MG'),(3060,3169505,'Tumiritinga','MG'),(3061,3169604,'Tupaciguara','MG'),(3062,3169703,'Turmalina','MG'),(3063,3169802,'Turvolândia','MG'),(3064,3169901,'Ubá','MG'),(3065,3170008,'Ubaí','MG'),(3066,3170057,'Ubaporanga','MG'),(3067,3170107,'Uberaba','MG'),(3068,3170206,'Uberlândia','MG'),(3069,3170305,'Umburatiba','MG'),(3070,3170404,'Unaí','MG'),(3071,3170438,'União de Minas','MG'),(3072,3170479,'Uruana de Minas','MG'),(3073,3170503,'Urucânia','MG'),(3074,3170529,'Urucuia','MG'),(3075,3170578,'Vargem Alegre','MG'),(3076,3170602,'Vargem Bonita','MG'),(3077,3170651,'Vargem Grande do Rio Pardo','MG'),(3078,3170701,'Varginha','MG'),(3079,3170750,'Varjão de Minas','MG'),(3080,3170800,'Várzea da Palma','MG'),(3081,3170909,'Varzelândia','MG'),(3082,3171006,'Vazante','MG'),(3083,3171030,'Verdelândia','MG'),(3084,3171071,'Veredinha','MG'),(3085,3171105,'Veríssimo','MG'),(3086,3171154,'Vermelho Novo','MG'),(3087,3171204,'Vespasiano','MG'),(3088,3171303,'Viçosa','MG'),(3089,3171402,'Vieiras','MG'),(3090,3171501,'Mathias Lobato','MG'),(3091,3171600,'Virgem da Lapa','MG'),(3092,3171709,'Virgínia','MG'),(3093,3171808,'Virginópolis','MG'),(3094,3171907,'Virgolândia','MG'),(3095,3172004,'Visconde do Rio Branco','MG'),(3096,3172103,'Volta Grande','MG'),(3097,3172202,'Wenceslau Braz','MG'),(3098,3200102,'Afonso Cláudio','ES'),(3099,3200136,'Águia Branca','ES'),(3100,3200169,'Água Doce do Norte','ES'),(3101,3200201,'Alegre','ES'),(3102,3200300,'Alfredo Chaves','ES'),(3103,3200359,'Alto Rio Novo','ES'),(3104,3200409,'Anchieta','ES'),(3105,3200508,'Apiacá','ES'),(3106,3200607,'Aracruz','ES'),(3107,3200706,'Atilio Vivacqua','ES'),(3108,3200805,'Baixo Guandu','ES'),(3109,3200904,'Barra de São Francisco','ES'),(3110,3201001,'Boa Esperança','ES'),(3111,3201100,'Bom Jesus do Norte','ES'),(3112,3201159,'Brejetuba','ES'),(3113,3201209,'Cachoeiro de Itapemirim','ES'),(3114,3201308,'Cariacica','ES'),(3115,3201407,'Castelo','ES'),(3116,3201506,'Colatina','ES'),(3117,3201605,'Conceição da Barra','ES'),(3118,3201704,'Conceição do Castelo','ES'),(3119,3201803,'Divino de São Lourenço','ES'),(3120,3201902,'Domingos Martins','ES'),(3121,3202009,'Dores do Rio Preto','ES'),(3122,3202108,'Ecoporanga','ES'),(3123,3202207,'Fundão','ES'),(3124,3202256,'Governador Lindenberg','ES'),(3125,3202306,'Guaçuí','ES'),(3126,3202405,'Guarapari','ES'),(3127,3202454,'Ibatiba','ES'),(3128,3202504,'Ibiraçu','ES'),(3129,3202553,'Ibitirama','ES'),(3130,3202603,'Iconha','ES'),(3131,3202652,'Irupi','ES'),(3132,3202702,'Itaguaçu','ES'),(3133,3202801,'Itapemirim','ES'),(3134,3202900,'Itarana','ES'),(3135,3203007,'Iúna','ES'),(3136,3203056,'Jaguaré','ES'),(3137,3203106,'Jerônimo Monteiro','ES'),(3138,3203130,'João Neiva','ES'),(3139,3203163,'Laranja da Terra','ES'),(3140,3203205,'Linhares','ES'),(3141,3203304,'Mantenópolis','ES'),(3142,3203320,'Marataízes','ES'),(3143,3203346,'Marechal Floriano','ES'),(3144,3203353,'Marilândia','ES'),(3145,3203403,'Mimoso do Sul','ES'),(3146,3203502,'Montanha','ES'),(3147,3203601,'Mucurici','ES'),(3148,3203700,'Muniz Freire','ES'),(3149,3203809,'Muqui','ES'),(3150,3203908,'Nova Venécia','ES'),(3151,3204005,'Pancas','ES'),(3152,3204054,'Pedro Canário','ES'),(3153,3204104,'Pinheiros','ES'),(3154,3204203,'Piúma','ES'),(3155,3204252,'Ponto Belo','ES'),(3156,3204302,'Presidente Kennedy','ES'),(3157,3204351,'Rio Bananal','ES'),(3158,3204401,'Rio Novo do Sul','ES'),(3159,3204500,'Santa Leopoldina','ES'),(3160,3204559,'Santa Maria de Jetibá','ES'),(3161,3204609,'Santa Teresa','ES'),(3162,3204658,'São Domingos do Norte','ES'),(3163,3204708,'São Gabriel da Palha','ES'),(3164,3204807,'São José do Calçado','ES'),(3165,3204906,'São Mateus','ES'),(3166,3204955,'São Roque do Canaã','ES'),(3167,3205002,'Serra','ES'),(3168,3205010,'Sooretama','ES'),(3169,3205036,'Vargem Alta','ES'),(3170,3205069,'Venda Nova do Imigrante','ES'),(3171,3205101,'Viana','ES'),(3172,3205150,'Vila Pavão','ES'),(3173,3205176,'Vila Valério','ES'),(3174,3205200,'Vila Velha','ES'),(3175,3205309,'Vitória','ES'),(3176,3300100,'Angra dos Reis','RJ'),(3177,3300159,'Aperibé','RJ'),(3178,3300209,'Araruama','RJ'),(3179,3300225,'Areal','RJ'),(3180,3300233,'Armação dos Búzios','RJ'),(3181,3300258,'Arraial do Cabo','RJ'),(3182,3300308,'Barra do Piraí','RJ'),(3183,3300407,'Barra Mansa','RJ'),(3184,3300456,'Belford Roxo','RJ'),(3185,3300506,'Bom Jardim','RJ'),(3186,3300605,'Bom Jesus do Itabapoana','RJ'),(3187,3300704,'Cabo Frio','RJ'),(3188,3300803,'Cachoeiras de Macacu','RJ'),(3189,3300902,'Cambuci','RJ'),(3190,3300936,'Carapebus','RJ'),(3191,3300951,'Comendador Levy Gasparian','RJ'),(3192,3301009,'Campos dos Goytacazes','RJ'),(3193,3301108,'Cantagalo','RJ'),(3194,3301157,'Cardoso Moreira','RJ'),(3195,3301207,'Carmo','RJ'),(3196,3301306,'Casimiro de Abreu','RJ'),(3197,3301405,'Conceição de Macabu','RJ'),(3198,3301504,'Cordeiro','RJ'),(3199,3301603,'Duas Barras','RJ'),(3200,3301702,'Duque de Caxias','RJ'),(3201,3301801,'Engenheiro Paulo de Frontin','RJ'),(3202,3301850,'Guapimirim','RJ'),(3203,3301876,'Iguaba Grande','RJ'),(3204,3301900,'Itaboraí','RJ'),(3205,3302007,'Itaguaí','RJ'),(3206,3302056,'Italva','RJ'),(3207,3302106,'Itaocara','RJ'),(3208,3302205,'Itaperuna','RJ'),(3209,3302254,'Itatiaia','RJ'),(3210,3302270,'Japeri','RJ'),(3211,3302304,'Laje do Muriaé','RJ'),(3212,3302403,'Macaé','RJ'),(3213,3302452,'Macuco','RJ'),(3214,3302502,'Magé','RJ'),(3215,3302601,'Mangaratiba','RJ'),(3216,3302700,'Maricá','RJ'),(3217,3302809,'Mendes','RJ'),(3218,3302858,'Mesquita','RJ'),(3219,3302908,'Miguel Pereira','RJ'),(3220,3303005,'Miracema','RJ'),(3221,3303104,'Natividade','RJ'),(3222,3303203,'Nilópolis','RJ'),(3223,3303302,'Niterói','RJ'),(3224,3303401,'Nova Friburgo','RJ'),(3225,3303500,'Nova Iguaçu','RJ'),(3226,3303609,'Paracambi','RJ'),(3227,3303708,'Paraíba do Sul','RJ'),(3228,3303807,'Paraty','RJ'),(3229,3303856,'Paty do Alferes','RJ'),(3230,3303906,'Petrópolis','RJ'),(3231,3303955,'Pinheiral','RJ'),(3232,3304003,'Piraí','RJ'),(3233,3304102,'Porciúncula','RJ'),(3234,3304110,'Porto Real','RJ'),(3235,3304128,'Quatis','RJ'),(3236,3304144,'Queimados','RJ'),(3237,3304151,'Quissamã','RJ'),(3238,3304201,'Resende','RJ'),(3239,3304300,'Rio Bonito','RJ'),(3240,3304409,'Rio Claro','RJ'),(3241,3304508,'Rio das Flores','RJ'),(3242,3304524,'Rio das Ostras','RJ'),(3243,3304557,'Rio de Janeiro','RJ'),(3244,3304607,'Santa Maria Madalena','RJ'),(3245,3304706,'Santo Antônio de Pádua','RJ'),(3246,3304755,'São Francisco de Itabapoana','RJ'),(3247,3304805,'São Fidélis','RJ'),(3248,3304904,'São Gonçalo','RJ'),(3249,3305000,'São João da Barra','RJ'),(3250,3305109,'São João de Meriti','RJ'),(3251,3305133,'São José de Ubá','RJ'),(3252,3305158,'São José do Vale do Rio Preto','RJ'),(3253,3305208,'São Pedro da Aldeia','RJ'),(3254,3305307,'São Sebastião do Alto','RJ'),(3255,3305406,'Sapucaia','RJ'),(3256,3305505,'Saquarema','RJ'),(3257,3305554,'Seropédica','RJ'),(3258,3305604,'Silva Jardim','RJ'),(3259,3305703,'Sumidouro','RJ'),(3260,3305752,'Tanguá','RJ'),(3261,3305802,'Teresópolis','RJ'),(3262,3305901,'Trajano de Moraes','RJ'),(3263,3306008,'Três Rios','RJ'),(3264,3306107,'Valença','RJ'),(3265,3306156,'Varre-Sai','RJ'),(3266,3306206,'Vassouras','RJ'),(3267,3306305,'Volta Redonda','RJ'),(3268,3500105,'Adamantina','SP'),(3269,3500204,'Adolfo','SP'),(3270,3500303,'Aguaí','SP'),(3271,3500402,'Águas da Prata','SP'),(3272,3500501,'Águas de Lindóia','SP'),(3273,3500550,'Águas de Santa Bárbara','SP'),(3274,3500600,'Águas de São Pedro','SP'),(3275,3500709,'Agudos','SP'),(3276,3500758,'Alambari','SP'),(3277,3500808,'Alfredo Marcondes','SP'),(3278,3500907,'Altair','SP'),(3279,3501004,'Altinópolis','SP'),(3280,3501103,'Alto Alegre','SP'),(3281,3501152,'Alumínio','SP'),(3282,3501202,'Álvares Florence','SP'),(3283,3501301,'Álvares Machado','SP'),(3284,3501400,'Álvaro de Carvalho','SP'),(3285,3501509,'Alvinlândia','SP'),(3286,3501608,'Americana','SP'),(3287,3501707,'Américo Brasiliense','SP'),(3288,3501806,'Américo de Campos','SP'),(3289,3501905,'Amparo','SP'),(3290,3502002,'Analândia','SP'),(3291,3502101,'Andradina','SP'),(3292,3502200,'Angatuba','SP'),(3293,3502309,'Anhembi','SP'),(3294,3502408,'Anhumas','SP'),(3295,3502507,'Aparecida','SP'),(3296,3502606,'Aparecida D\'Oeste','SP'),(3297,3502705,'Apiaí','SP'),(3298,3502754,'Araçariguama','SP'),(3299,3502804,'Araçatuba','SP'),(3300,3502903,'Araçoiaba da Serra','SP'),(3301,3503000,'Aramina','SP'),(3302,3503109,'Arandu','SP'),(3303,3503158,'Arapeí','SP'),(3304,3503208,'Araraquara','SP'),(3305,3503307,'Araras','SP'),(3306,3503356,'Arco-Íris','SP'),(3307,3503406,'Arealva','SP'),(3308,3503505,'Areias','SP'),(3309,3503604,'Areiópolis','SP'),(3310,3503703,'Ariranha','SP'),(3311,3503802,'Artur Nogueira','SP'),(3312,3503901,'Arujá','SP'),(3313,3503950,'Aspásia','SP'),(3314,3504008,'Assis','SP'),(3315,3504107,'Atibaia','SP'),(3316,3504206,'Auriflama','SP'),(3317,3504305,'Avaí','SP'),(3318,3504404,'Avanhandava','SP'),(3319,3504503,'Avaré','SP'),(3320,3504602,'Bady Bassitt','SP'),(3321,3504701,'Balbinos','SP'),(3322,3504800,'Bálsamo','SP'),(3323,3504909,'Bananal','SP'),(3324,3505005,'Barão de Antonina','SP'),(3325,3505104,'Barbosa','SP'),(3326,3505203,'Bariri','SP'),(3327,3505302,'Barra Bonita','SP'),(3328,3505351,'Barra do Chapéu','SP'),(3329,3505401,'Barra do Turvo','SP'),(3330,3505500,'Barretos','SP'),(3331,3505609,'Barrinha','SP'),(3332,3505708,'Barueri','SP'),(3333,3505807,'Bastos','SP'),(3334,3505906,'Batatais','SP'),(3335,3506003,'Bauru','SP'),(3336,3506102,'Bebedouro','SP'),(3337,3506201,'Bento de Abreu','SP'),(3338,3506300,'Bernardino de Campos','SP'),(3339,3506359,'Bertioga','SP'),(3340,3506409,'Bilac','SP'),(3341,3506508,'Birigui','SP'),(3342,3506607,'Biritiba-Mirim','SP'),(3343,3506706,'Boa Esperança do Sul','SP'),(3344,3506805,'Bocaina','SP'),(3345,3506904,'Bofete','SP'),(3346,3507001,'Boituva','SP'),(3347,3507100,'Bom Jesus dos Perdões','SP'),(3348,3507159,'Bom Sucesso de Itararé','SP'),(3349,3507209,'Borá','SP'),(3350,3507308,'Boracéia','SP'),(3351,3507407,'Borborema','SP'),(3352,3507456,'Borebi','SP'),(3353,3507506,'Botucatu','SP'),(3354,3507605,'Bragança Paulista','SP'),(3355,3507704,'Braúna','SP'),(3356,3507753,'Brejo Alegre','SP'),(3357,3507803,'Brodowski','SP'),(3358,3507902,'Brotas','SP'),(3359,3508009,'Buri','SP'),(3360,3508108,'Buritama','SP'),(3361,3508207,'Buritizal','SP'),(3362,3508306,'Cabrália Paulista','SP'),(3363,3508405,'Cabreúva','SP'),(3364,3508504,'Caçapava','SP'),(3365,3508603,'Cachoeira Paulista','SP'),(3366,3508702,'Caconde','SP'),(3367,3508801,'Cafelândia','SP'),(3368,3508900,'Caiabu','SP'),(3369,3509007,'Caieiras','SP'),(3370,3509106,'Caiuá','SP'),(3371,3509205,'Cajamar','SP'),(3372,3509254,'Cajati','SP'),(3373,3509304,'Cajobi','SP'),(3374,3509403,'Cajuru','SP'),(3375,3509452,'Campina do Monte Alegre','SP'),(3376,3509502,'Campinas','SP'),(3377,3509601,'Campo Limpo Paulista','SP'),(3378,3509700,'Campos do Jordão','SP'),(3379,3509809,'Campos Novos Paulista','SP'),(3380,3509908,'Cananéia','SP'),(3381,3509957,'Canas','SP'),(3382,3510005,'Cândido Mota','SP'),(3383,3510104,'Cândido Rodrigues','SP'),(3384,3510153,'Canitar','SP'),(3385,3510203,'Capão Bonito','SP'),(3386,3510302,'Capela do Alto','SP'),(3387,3510401,'Capivari','SP'),(3388,3510500,'Caraguatatuba','SP'),(3389,3510609,'Carapicuíba','SP'),(3390,3510708,'Cardoso','SP'),(3391,3510807,'Casa Branca','SP'),(3392,3510906,'Cássia dos Coqueiros','SP'),(3393,3511003,'Castilho','SP'),(3394,3511102,'Catanduva','SP'),(3395,3511201,'Catiguá','SP'),(3396,3511300,'Cedral','SP'),(3397,3511409,'Cerqueira César','SP'),(3398,3511508,'Cerquilho','SP'),(3399,3511607,'Cesário Lange','SP'),(3400,3511706,'Charqueada','SP'),(3401,3511904,'Clementina','SP'),(3402,3512001,'Colina','SP'),(3403,3512100,'Colômbia','SP'),(3404,3512209,'Conchal','SP'),(3405,3512308,'Conchas','SP'),(3406,3512407,'Cordeirópolis','SP'),(3407,3512506,'Coroados','SP'),(3408,3512605,'Coronel Macedo','SP'),(3409,3512704,'Corumbataí','SP'),(3410,3512803,'Cosmópolis','SP'),(3411,3512902,'Cosmorama','SP'),(3412,3513009,'Cotia','SP'),(3413,3513108,'Cravinhos','SP'),(3414,3513207,'Cristais Paulista','SP'),(3415,3513306,'Cruzália','SP'),(3416,3513405,'Cruzeiro','SP'),(3417,3513504,'Cubatão','SP'),(3418,3513603,'Cunha','SP'),(3419,3513702,'Descalvado','SP'),(3420,3513801,'Diadema','SP'),(3421,3513850,'Dirce Reis','SP'),(3422,3513900,'Divinolândia','SP'),(3423,3514007,'Dobrada','SP'),(3424,3514106,'Dois Córregos','SP'),(3425,3514205,'Dolcinópolis','SP'),(3426,3514304,'Dourado','SP'),(3427,3514403,'Dracena','SP'),(3428,3514502,'Duartina','SP'),(3429,3514601,'Dumont','SP'),(3430,3514700,'Echaporã','SP'),(3431,3514809,'Eldorado','SP'),(3432,3514908,'Elias Fausto','SP'),(3433,3514924,'Elisiário','SP'),(3434,3514957,'Embaúba','SP'),(3435,3515004,'Embu das Artes','SP'),(3436,3515103,'Embu-Guaçu','SP'),(3437,3515129,'Emilianópolis','SP'),(3438,3515152,'Engenheiro Coelho','SP'),(3439,3515186,'Espírito Santo do Pinhal','SP'),(3440,3515194,'Espírito Santo do Turvo','SP'),(3441,3515202,'Estrela D\'Oeste','SP'),(3442,3515301,'Estrela do Norte','SP'),(3443,3515350,'Euclides da Cunha Paulista','SP'),(3444,3515400,'Fartura','SP'),(3445,3515509,'Fernandópolis','SP'),(3446,3515608,'Fernando Prestes','SP'),(3447,3515657,'Fernão','SP'),(3448,3515707,'Ferraz de Vasconcelos','SP'),(3449,3515806,'Flora Rica','SP'),(3450,3515905,'Floreal','SP'),(3451,3516002,'Flórida Paulista','SP'),(3452,3516101,'Florínia','SP'),(3453,3516200,'Franca','SP'),(3454,3516309,'Francisco Morato','SP'),(3455,3516408,'Franco da Rocha','SP'),(3456,3516507,'Gabriel Monteiro','SP'),(3457,3516606,'Gália','SP'),(3458,3516705,'Garça','SP'),(3459,3516804,'Gastão Vidigal','SP'),(3460,3516853,'Gavião Peixoto','SP'),(3461,3516903,'General Salgado','SP'),(3462,3517000,'Getulina','SP'),(3463,3517109,'Glicério','SP'),(3464,3517208,'Guaiçara','SP'),(3465,3517307,'Guaimbê','SP'),(3466,3517406,'Guaíra','SP'),(3467,3517505,'Guapiaçu','SP'),(3468,3517604,'Guapiara','SP'),(3469,3517703,'Guará','SP'),(3470,3517802,'Guaraçaí','SP'),(3471,3517901,'Guaraci','SP'),(3472,3518008,'Guarani D\'Oeste','SP'),(3473,3518107,'Guarantã','SP'),(3474,3518206,'Guararapes','SP'),(3475,3518305,'Guararema','SP'),(3476,3518404,'Guaratinguetá','SP'),(3477,3518503,'Guareí','SP'),(3478,3518602,'Guariba','SP'),(3479,3518701,'Guarujá','SP'),(3480,3518800,'Guarulhos','SP'),(3481,3518859,'Guatapará','SP'),(3482,3518909,'Guzolândia','SP'),(3483,3519006,'Herculândia','SP'),(3484,3519055,'Holambra','SP'),(3485,3519071,'Hortolândia','SP'),(3486,3519105,'Iacanga','SP'),(3487,3519204,'Iacri','SP'),(3488,3519253,'Iaras','SP'),(3489,3519303,'Ibaté','SP'),(3490,3519402,'Ibirá','SP'),(3491,3519501,'Ibirarema','SP'),(3492,3519600,'Ibitinga','SP'),(3493,3519709,'Ibiúna','SP'),(3494,3519808,'Icém','SP'),(3495,3519907,'Iepê','SP'),(3496,3520004,'Igaraçu do Tietê','SP'),(3497,3520103,'Igarapava','SP'),(3498,3520202,'Igaratá','SP'),(3499,3520301,'Iguape','SP'),(3500,3520400,'Ilhabela','SP'),(3501,3520426,'Ilha Comprida','SP'),(3502,3520442,'Ilha Solteira','SP'),(3503,3520509,'Indaiatuba','SP'),(3504,3520608,'Indiana','SP'),(3505,3520707,'Indiaporã','SP'),(3506,3520806,'Inúbia Paulista','SP'),(3507,3520905,'Ipaussu','SP'),(3508,3521002,'Iperó','SP'),(3509,3521101,'Ipeúna','SP'),(3510,3521150,'Ipiguá','SP'),(3511,3521200,'Iporanga','SP'),(3512,3521309,'Ipuã','SP'),(3513,3521408,'Iracemápolis','SP'),(3514,3521507,'Irapuã','SP'),(3515,3521606,'Irapuru','SP'),(3516,3521705,'Itaberá','SP'),(3517,3521804,'Itaí','SP'),(3518,3521903,'Itajobi','SP'),(3519,3522000,'Itaju','SP'),(3520,3522109,'Itanhaém','SP'),(3521,3522158,'Itaóca','SP'),(3522,3522208,'Itapecerica da Serra','SP'),(3523,3522307,'Itapetininga','SP'),(3524,3522406,'Itapeva','SP'),(3525,3522505,'Itapevi','SP'),(3526,3522604,'Itapira','SP'),(3527,3522653,'Itapirapuã Paulista','SP'),(3528,3522703,'Itápolis','SP'),(3529,3522802,'Itaporanga','SP'),(3530,3522901,'Itapuí','SP'),(3531,3523008,'Itapura','SP'),(3532,3523107,'Itaquaquecetuba','SP'),(3533,3523206,'Itararé','SP'),(3534,3523305,'Itariri','SP'),(3535,3523404,'Itatiba','SP'),(3536,3523503,'Itatinga','SP'),(3537,3523602,'Itirapina','SP'),(3538,3523701,'Itirapuã','SP'),(3539,3523800,'Itobi','SP'),(3540,3523909,'Itu','SP'),(3541,3524006,'Itupeva','SP'),(3542,3524105,'Ituverava','SP'),(3543,3524204,'Jaborandi','SP'),(3544,3524303,'Jaboticabal','SP'),(3545,3524402,'Jacareí','SP'),(3546,3524501,'Jaci','SP'),(3547,3524600,'Jacupiranga','SP'),(3548,3524709,'Jaguariúna','SP'),(3549,3524808,'Jales','SP'),(3550,3524907,'Jambeiro','SP'),(3551,3525003,'Jandira','SP'),(3552,3525102,'Jardinópolis','SP'),(3553,3525201,'Jarinu','SP'),(3554,3525300,'Jaú','SP'),(3555,3525409,'Jeriquara','SP'),(3556,3525508,'Joanópolis','SP'),(3557,3525607,'João Ramalho','SP'),(3558,3525706,'José Bonifácio','SP'),(3559,3525805,'Júlio Mesquita','SP'),(3560,3525854,'Jumirim','SP'),(3561,3525904,'Jundiaí','SP'),(3562,3526001,'Junqueirópolis','SP'),(3563,3526100,'Juquiá','SP'),(3564,3526209,'Juquitiba','SP'),(3565,3526308,'Lagoinha','SP'),(3566,3526407,'Laranjal Paulista','SP'),(3567,3526506,'Lavínia','SP'),(3568,3526605,'Lavrinhas','SP'),(3569,3526704,'Leme','SP'),(3570,3526803,'Lençóis Paulista','SP'),(3571,3526902,'Limeira','SP'),(3572,3527009,'Lindóia','SP'),(3573,3527108,'Lins','SP'),(3574,3527207,'Lorena','SP'),(3575,3527256,'Lourdes','SP'),(3576,3527306,'Louveira','SP'),(3577,3527405,'Lucélia','SP'),(3578,3527504,'Lucianópolis','SP'),(3579,3527603,'Luís Antônio','SP'),(3580,3527702,'Luiziânia','SP'),(3581,3527801,'Lupércio','SP'),(3582,3527900,'Lutécia','SP'),(3583,3528007,'Macatuba','SP'),(3584,3528106,'Macaubal','SP'),(3585,3528205,'Macedônia','SP'),(3586,3528304,'Magda','SP'),(3587,3528403,'Mairinque','SP'),(3588,3528502,'Mairiporã','SP'),(3589,3528601,'Manduri','SP'),(3590,3528700,'Marabá Paulista','SP'),(3591,3528809,'Maracaí','SP'),(3592,3528858,'Marapoama','SP'),(3593,3528908,'Mariápolis','SP'),(3594,3529005,'Marília','SP'),(3595,3529104,'Marinópolis','SP'),(3596,3529203,'Martinópolis','SP'),(3597,3529302,'Matão','SP'),(3598,3529401,'Mauá','SP'),(3599,3529500,'Mendonça','SP'),(3600,3529609,'Meridiano','SP'),(3601,3529658,'Mesópolis','SP'),(3602,3529708,'Miguelópolis','SP'),(3603,3529807,'Mineiros do Tietê','SP'),(3604,3529906,'Miracatu','SP'),(3605,3530003,'Mira Estrela','SP'),(3606,3530102,'Mirandópolis','SP'),(3607,3530201,'Mirante do Paranapanema','SP'),(3608,3530300,'Mirassol','SP'),(3609,3530409,'Mirassolândia','SP'),(3610,3530508,'Mococa','SP'),(3611,3530607,'Mogi das Cruzes','SP'),(3612,3530706,'Mogi Guaçu','SP'),(3613,3530805,'Moji Mirim','SP'),(3614,3530904,'Mombuca','SP'),(3615,3531001,'Monções','SP'),(3616,3531100,'Mongaguá','SP'),(3617,3531209,'Monte Alegre do Sul','SP'),(3618,3531308,'Monte Alto','SP'),(3619,3531407,'Monte Aprazível','SP'),(3620,3531506,'Monte Azul Paulista','SP'),(3621,3531605,'Monte Castelo','SP'),(3622,3531704,'Monteiro Lobato','SP'),(3623,3531803,'Monte Mor','SP'),(3624,3531902,'Morro Agudo','SP'),(3625,3532009,'Morungaba','SP'),(3626,3532058,'Motuca','SP'),(3627,3532108,'Murutinga do Sul','SP'),(3628,3532157,'Nantes','SP'),(3629,3532207,'Narandiba','SP'),(3630,3532306,'Natividade da Serra','SP'),(3631,3532405,'Nazaré Paulista','SP'),(3632,3532504,'Neves Paulista','SP'),(3633,3532603,'Nhandeara','SP'),(3634,3532702,'Nipoã','SP'),(3635,3532801,'Nova Aliança','SP'),(3636,3532827,'Nova Campina','SP'),(3637,3532843,'Nova Canaã Paulista','SP'),(3638,3532868,'Nova Castilho','SP'),(3639,3532900,'Nova Europa','SP'),(3640,3533007,'Nova Granada','SP'),(3641,3533106,'Nova Guataporanga','SP'),(3642,3533205,'Nova Independência','SP'),(3643,3533254,'Novais','SP'),(3644,3533304,'Nova Luzitânia','SP'),(3645,3533403,'Nova Odessa','SP'),(3646,3533502,'Novo Horizonte','SP'),(3647,3533601,'Nuporanga','SP'),(3648,3533700,'Ocauçu','SP'),(3649,3533809,'Óleo','SP'),(3650,3533908,'Olímpia','SP'),(3651,3534005,'Onda Verde','SP'),(3652,3534104,'Oriente','SP'),(3653,3534203,'Orindiúva','SP'),(3654,3534302,'Orlândia','SP'),(3655,3534401,'Osasco','SP'),(3656,3534500,'Oscar Bressane','SP'),(3657,3534609,'Osvaldo Cruz','SP'),(3658,3534708,'Ourinhos','SP'),(3659,3534757,'Ouroeste','SP'),(3660,3534807,'Ouro Verde','SP'),(3661,3534906,'Pacaembu','SP'),(3662,3535002,'Palestina','SP'),(3663,3535101,'Palmares Paulista','SP'),(3664,3535200,'Palmeira D\'Oeste','SP'),(3665,3535309,'Palmital','SP'),(3666,3535408,'Panorama','SP'),(3667,3535507,'Paraguaçu Paulista','SP'),(3668,3535606,'Paraibuna','SP'),(3669,3535705,'Paraíso','SP'),(3670,3535804,'Paranapanema','SP'),(3671,3535903,'Paranapuã','SP'),(3672,3536000,'Parapuã','SP'),(3673,3536109,'Pardinho','SP'),(3674,3536208,'Pariquera-Açu','SP'),(3675,3536257,'Parisi','SP'),(3676,3536307,'Patrocínio Paulista','SP'),(3677,3536406,'Paulicéia','SP'),(3678,3536505,'Paulínia','SP'),(3679,3536570,'Paulistânia','SP'),(3680,3536604,'Paulo de Faria','SP'),(3681,3536703,'Pederneiras','SP'),(3682,3536802,'Pedra Bela','SP'),(3683,3536901,'Pedranópolis','SP'),(3684,3537008,'Pedregulho','SP'),(3685,3537107,'Pedreira','SP'),(3686,3537156,'Pedrinhas Paulista','SP'),(3687,3537206,'Pedro de Toledo','SP'),(3688,3537305,'Penápolis','SP'),(3689,3537404,'Pereira Barreto','SP'),(3690,3537503,'Pereiras','SP'),(3691,3537602,'Peruíbe','SP'),(3692,3537701,'Piacatu','SP'),(3693,3537800,'Piedade','SP'),(3694,3537909,'Pilar do Sul','SP'),(3695,3538006,'Pindamonhangaba','SP'),(3696,3538105,'Pindorama','SP'),(3697,3538204,'Pinhalzinho','SP'),(3698,3538303,'Piquerobi','SP'),(3699,3538501,'Piquete','SP'),(3700,3538600,'Piracaia','SP'),(3701,3538709,'Piracicaba','SP'),(3702,3538808,'Piraju','SP'),(3703,3538907,'Pirajuí','SP'),(3704,3539004,'Pirangi','SP'),(3705,3539103,'Pirapora do Bom Jesus','SP'),(3706,3539202,'Pirapozinho','SP'),(3707,3539301,'Pirassununga','SP'),(3708,3539400,'Piratininga','SP'),(3709,3539509,'Pitangueiras','SP'),(3710,3539608,'Planalto','SP'),(3711,3539707,'Platina','SP'),(3712,3539806,'Poá','SP'),(3713,3539905,'Poloni','SP'),(3714,3540002,'Pompéia','SP'),(3715,3540101,'Pongaí','SP'),(3716,3540200,'Pontal','SP'),(3717,3540259,'Pontalinda','SP'),(3718,3540309,'Pontes Gestal','SP'),(3719,3540408,'Populina','SP'),(3720,3540507,'Porangaba','SP'),(3721,3540606,'Porto Feliz','SP'),(3722,3540705,'Porto Ferreira','SP'),(3723,3540754,'Potim','SP'),(3724,3540804,'Potirendaba','SP'),(3725,3540853,'Pracinha','SP'),(3726,3540903,'Pradópolis','SP'),(3727,3541000,'Praia Grande','SP'),(3728,3541059,'Pratânia','SP'),(3729,3541109,'Presidente Alves','SP'),(3730,3541208,'Presidente Bernardes','SP'),(3731,3541307,'Presidente Epitácio','SP'),(3732,3541406,'Presidente Prudente','SP'),(3733,3541505,'Presidente Venceslau','SP'),(3734,3541604,'Promissão','SP'),(3735,3541653,'Quadra','SP'),(3736,3541703,'Quatá','SP'),(3737,3541802,'Queiroz','SP'),(3738,3541901,'Queluz','SP'),(3739,3542008,'Quintana','SP'),(3740,3542107,'Rafard','SP'),(3741,3542206,'Rancharia','SP'),(3742,3542305,'Redenção da Serra','SP'),(3743,3542404,'Regente Feijó','SP'),(3744,3542503,'Reginópolis','SP'),(3745,3542602,'Registro','SP'),(3746,3542701,'Restinga','SP'),(3747,3542800,'Ribeira','SP'),(3748,3542909,'Ribeirão Bonito','SP'),(3749,3543006,'Ribeirão Branco','SP'),(3750,3543105,'Ribeirão Corrente','SP'),(3751,3543204,'Ribeirão do Sul','SP'),(3752,3543238,'Ribeirão dos Índios','SP'),(3753,3543253,'Ribeirão Grande','SP'),(3754,3543303,'Ribeirão Pires','SP'),(3755,3543402,'Ribeirão Preto','SP'),(3756,3543501,'Riversul','SP'),(3757,3543600,'Rifaina','SP'),(3758,3543709,'Rincão','SP'),(3759,3543808,'Rinópolis','SP'),(3760,3543907,'Rio Claro','SP'),(3761,3544004,'Rio das Pedras','SP'),(3762,3544103,'Rio Grande da Serra','SP'),(3763,3544202,'Riolândia','SP'),(3764,3544251,'Rosana','SP'),(3765,3544301,'Roseira','SP'),(3766,3544400,'Rubiácea','SP'),(3767,3544509,'Rubinéia','SP'),(3768,3544608,'Sabino','SP'),(3769,3544707,'Sagres','SP'),(3770,3544806,'Sales','SP'),(3771,3544905,'Sales Oliveira','SP'),(3772,3545001,'Salesópolis','SP'),(3773,3545100,'Salmourão','SP'),(3774,3545159,'Saltinho','SP'),(3775,3545209,'Salto','SP'),(3776,3545308,'Salto de Pirapora','SP'),(3777,3545407,'Salto Grande','SP'),(3778,3545506,'Sandovalina','SP'),(3779,3545605,'Santa Adélia','SP'),(3780,3545704,'Santa Albertina','SP'),(3781,3545803,'Santa Bárbara D\'Oeste','SP'),(3782,3546009,'Santa Branca','SP'),(3783,3546108,'Santa Clara D\'Oeste','SP'),(3784,3546207,'Santa Cruz da Conceição','SP'),(3785,3546256,'Santa Cruz da Esperança','SP'),(3786,3546306,'Santa Cruz das Palmeiras','SP'),(3787,3546405,'Santa Cruz do Rio Pardo','SP'),(3788,3546504,'Santa Ernestina','SP'),(3789,3546603,'Santa Fé do Sul','SP'),(3790,3546702,'Santa Gertrudes','SP'),(3791,3546801,'Santa Isabel','SP'),(3792,3546900,'Santa Lúcia','SP'),(3793,3547007,'Santa Maria da Serra','SP'),(3794,3547106,'Santa Mercedes','SP'),(3795,3547205,'Santana da Ponte Pensa','SP'),(3796,3547304,'Santana de Parnaíba','SP'),(3797,3547403,'Santa Rita D\'Oeste','SP'),(3798,3547502,'Santa Rita do Passa Quatro','SP'),(3799,3547601,'Santa Rosa de Viterbo','SP'),(3800,3547650,'Santa Salete','SP'),(3801,3547700,'Santo Anastácio','SP'),(3802,3547809,'Santo André','SP'),(3803,3547908,'Santo Antônio da Alegria','SP'),(3804,3548005,'Santo Antônio de Posse','SP'),(3805,3548054,'Santo Antônio do Aracanguá','SP'),(3806,3548104,'Santo Antônio do Jardim','SP'),(3807,3548203,'Santo Antônio do Pinhal','SP'),(3808,3548302,'Santo Expedito','SP'),(3809,3548401,'Santópolis do Aguapeí','SP'),(3810,3548500,'Santos','SP'),(3811,3548609,'São Bento do Sapucaí','SP'),(3812,3548708,'São Bernardo do Campo','SP'),(3813,3548807,'São Caetano do Sul','SP'),(3814,3548906,'São Carlos','SP'),(3815,3549003,'São Francisco','SP'),(3816,3549102,'São João da Boa Vista','SP'),(3817,3549201,'São João das Duas Pontes','SP'),(3818,3549250,'São João de Iracema','SP'),(3819,3549300,'São João do Pau D\'Alho','SP'),(3820,3549409,'São Joaquim da Barra','SP'),(3821,3549508,'São José da Bela Vista','SP'),(3822,3549607,'São José do Barreiro','SP'),(3823,3549706,'São José do Rio Pardo','SP'),(3824,3549805,'São José do Rio Preto','SP'),(3825,3549904,'São José dos Campos','SP'),(3826,3549953,'São Lourenço da Serra','SP'),(3827,3550001,'São Luís do Paraitinga','SP'),(3828,3550100,'São Manuel','SP'),(3829,3550209,'São Miguel Arcanjo','SP'),(3830,3550308,'São Paulo','SP'),(3831,3550407,'São Pedro','SP'),(3832,3550506,'São Pedro do Turvo','SP'),(3833,3550605,'São Roque','SP'),(3834,3550704,'São Sebastião','SP'),(3835,3550803,'São Sebastião da Grama','SP'),(3836,3550902,'São Simão','SP'),(3837,3551009,'São Vicente','SP'),(3838,3551108,'Sarapuí','SP'),(3839,3551207,'Sarutaiá','SP'),(3840,3551306,'Sebastianópolis do Sul','SP'),(3841,3551405,'Serra Azul','SP'),(3842,3551504,'Serrana','SP'),(3843,3551603,'Serra Negra','SP'),(3844,3551702,'Sertãozinho','SP'),(3845,3551801,'Sete Barras','SP'),(3846,3551900,'Severínia','SP'),(3847,3552007,'Silveiras','SP'),(3848,3552106,'Socorro','SP'),(3849,3552205,'Sorocaba','SP'),(3850,3552304,'Sud Mennucci','SP'),(3851,3552403,'Sumaré','SP'),(3852,3552502,'Suzano','SP'),(3853,3552551,'Suzanápolis','SP'),(3854,3552601,'Tabapuã','SP'),(3855,3552700,'Tabatinga','SP'),(3856,3552809,'Taboão da Serra','SP'),(3857,3552908,'Taciba','SP'),(3858,3553005,'Taguaí','SP'),(3859,3553104,'Taiaçu','SP'),(3860,3553203,'Taiúva','SP'),(3861,3553302,'Tambaú','SP'),(3862,3553401,'Tanabi','SP'),(3863,3553500,'Tapiraí','SP'),(3864,3553609,'Tapiratiba','SP'),(3865,3553658,'Taquaral','SP'),(3866,3553708,'Taquaritinga','SP'),(3867,3553807,'Taquarituba','SP'),(3868,3553856,'Taquarivaí','SP'),(3869,3553906,'Tarabai','SP'),(3870,3553955,'Tarumã','SP'),(3871,3554003,'Tatuí','SP'),(3872,3554102,'Taubaté','SP'),(3873,3554201,'Tejupá','SP'),(3874,3554300,'Teodoro Sampaio','SP'),(3875,3554409,'Terra Roxa','SP'),(3876,3554508,'Tietê','SP'),(3877,3554607,'Timburi','SP'),(3878,3554656,'Torre de Pedra','SP'),(3879,3554706,'Torrinha','SP'),(3880,3554755,'Trabiju','SP'),(3881,3554805,'Tremembé','SP'),(3882,3554904,'Três Fronteiras','SP'),(3883,3554953,'Tuiuti','SP'),(3884,3555000,'Tupã','SP'),(3885,3555109,'Tupi Paulista','SP'),(3886,3555208,'Turiúba','SP'),(3887,3555307,'Turmalina','SP'),(3888,3555356,'Ubarana','SP'),(3889,3555406,'Ubatuba','SP'),(3890,3555505,'Ubirajara','SP'),(3891,3555604,'Uchoa','SP'),(3892,3555703,'União Paulista','SP'),(3893,3555802,'Urânia','SP'),(3894,3555901,'Uru','SP'),(3895,3556008,'Urupês','SP'),(3896,3556107,'Valentim Gentil','SP'),(3897,3556206,'Valinhos','SP'),(3898,3556305,'Valparaíso','SP'),(3899,3556354,'Vargem','SP'),(3900,3556404,'Vargem Grande do Sul','SP'),(3901,3556453,'Vargem Grande Paulista','SP'),(3902,3556503,'Várzea Paulista','SP'),(3903,3556602,'Vera Cruz','SP'),(3904,3556701,'Vinhedo','SP'),(3905,3556800,'Viradouro','SP'),(3906,3556909,'Vista Alegre do Alto','SP'),(3907,3556958,'Vitória Brasil','SP'),(3908,3557006,'Votorantim','SP'),(3909,3557105,'Votuporanga','SP'),(3910,3557154,'Zacarias','SP'),(3911,3557204,'Chavantes','SP'),(3912,3557303,'Estiva Gerbi','SP'),(3913,4100103,'Abatiá','PR'),(3914,4100202,'Adrianópolis','PR'),(3915,4100301,'Agudos do Sul','PR'),(3916,4100400,'Almirante Tamandaré','PR'),(3917,4100459,'Altamira do Paraná','PR'),(3918,4100509,'Altônia','PR'),(3919,4100608,'Alto Paraná','PR'),(3920,4100707,'Alto Piquiri','PR'),(3921,4100806,'Alvorada do Sul','PR'),(3922,4100905,'Amaporã','PR'),(3923,4101002,'Ampére','PR'),(3924,4101051,'Anahy','PR'),(3925,4101101,'Andirá','PR'),(3926,4101150,'Ângulo','PR'),(3927,4101200,'Antonina','PR'),(3928,4101309,'Antônio Olinto','PR'),(3929,4101408,'Apucarana','PR'),(3930,4101507,'Arapongas','PR'),(3931,4101606,'Arapoti','PR'),(3932,4101655,'Arapuã','PR'),(3933,4101705,'Araruna','PR'),(3934,4101804,'Araucária','PR'),(3935,4101853,'Ariranha do Ivaí','PR'),(3936,4101903,'Assaí','PR'),(3937,4102000,'Assis Chateaubriand','PR'),(3938,4102109,'Astorga','PR'),(3939,4102208,'Atalaia','PR'),(3940,4102307,'Balsa Nova','PR'),(3941,4102406,'Bandeirantes','PR'),(3942,4102505,'Barbosa Ferraz','PR'),(3943,4102604,'Barracão','PR'),(3944,4102703,'Barra do Jacaré','PR'),(3945,4102752,'Bela Vista da Caroba','PR'),(3946,4102802,'Bela Vista do Paraíso','PR'),(3947,4102901,'Bituruna','PR'),(3948,4103008,'Boa Esperança','PR'),(3949,4103024,'Boa Esperança do Iguaçu','PR'),(3950,4103040,'Boa Ventura de São Roque','PR'),(3951,4103057,'Boa Vista da Aparecida','PR'),(3952,4103107,'Bocaiúva do Sul','PR'),(3953,4103156,'Bom Jesus do Sul','PR'),(3954,4103206,'Bom Sucesso','PR'),(3955,4103222,'Bom Sucesso do Sul','PR'),(3956,4103305,'Borrazópolis','PR'),(3957,4103354,'Braganey','PR'),(3958,4103370,'Brasilândia do Sul','PR'),(3959,4103404,'Cafeara','PR'),(3960,4103453,'Cafelândia','PR'),(3961,4103479,'Cafezal do Sul','PR'),(3962,4103503,'Califórnia','PR'),(3963,4103602,'Cambará','PR'),(3964,4103701,'Cambé','PR'),(3965,4103800,'Cambira','PR'),(3966,4103909,'Campina da Lagoa','PR'),(3967,4103958,'Campina do Simão','PR'),(3968,4104006,'Campina Grande do Sul','PR'),(3969,4104055,'Campo Bonito','PR'),(3970,4104105,'Campo do Tenente','PR'),(3971,4104204,'Campo Largo','PR'),(3972,4104253,'Campo Magro','PR'),(3973,4104303,'Campo Mourão','PR'),(3974,4104402,'Cândido de Abreu','PR'),(3975,4104428,'Candói','PR'),(3976,4104451,'Cantagalo','PR'),(3977,4104501,'Capanema','PR'),(3978,4104600,'Capitão Leônidas Marques','PR'),(3979,4104659,'Carambeí','PR'),(3980,4104709,'Carlópolis','PR'),(3981,4104808,'Cascavel','PR'),(3982,4104907,'Castro','PR'),(3983,4105003,'Catanduvas','PR'),(3984,4105102,'Centenário do Sul','PR'),(3985,4105201,'Cerro Azul','PR'),(3986,4105300,'Céu Azul','PR'),(3987,4105409,'Chopinzinho','PR'),(3988,4105508,'Cianorte','PR'),(3989,4105607,'Cidade Gaúcha','PR'),(3990,4105706,'Clevelândia','PR'),(3991,4105805,'Colombo','PR'),(3992,4105904,'Colorado','PR'),(3993,4106001,'Congonhinhas','PR'),(3994,4106100,'Conselheiro Mairinck','PR'),(3995,4106209,'Contenda','PR'),(3996,4106308,'Corbélia','PR'),(3997,4106407,'Cornélio Procópio','PR'),(3998,4106456,'Coronel Domingos Soares','PR'),(3999,4106506,'Coronel Vivida','PR'),(4000,4106555,'Corumbataí do Sul','PR'),(4001,4106571,'Cruzeiro do Iguaçu','PR'),(4002,4106605,'Cruzeiro do Oeste','PR'),(4003,4106704,'Cruzeiro do Sul','PR'),(4004,4106803,'Cruz Machado','PR'),(4005,4106852,'Cruzmaltina','PR'),(4006,4106902,'Curitiba','PR'),(4007,4107009,'Curiúva','PR'),(4008,4107108,'Diamante do Norte','PR'),(4009,4107124,'Diamante do Sul','PR'),(4010,4107157,'Diamante D\'Oeste','PR'),(4011,4107207,'Dois Vizinhos','PR'),(4012,4107256,'Douradina','PR'),(4013,4107306,'Doutor Camargo','PR'),(4014,4107405,'Enéas Marques','PR'),(4015,4107504,'Engenheiro Beltrão','PR'),(4016,4107520,'Esperança Nova','PR'),(4017,4107538,'Entre Rios do Oeste','PR'),(4018,4107546,'Espigão Alto do Iguaçu','PR'),(4019,4107553,'Farol','PR'),(4020,4107603,'Faxinal','PR'),(4021,4107652,'Fazenda Rio Grande','PR'),(4022,4107702,'Fênix','PR'),(4023,4107736,'Fernandes Pinheiro','PR'),(4024,4107751,'Figueira','PR'),(4025,4107801,'Floraí','PR'),(4026,4107850,'Flor da Serra do Sul','PR'),(4027,4107900,'Floresta','PR'),(4028,4108007,'Florestópolis','PR'),(4029,4108106,'Flórida','PR'),(4030,4108205,'Formosa do Oeste','PR'),(4031,4108304,'Foz do Iguaçu','PR'),(4032,4108320,'Francisco Alves','PR'),(4033,4108403,'Francisco Beltrão','PR'),(4034,4108452,'Foz do Jordão','PR'),(4035,4108502,'General Carneiro','PR'),(4036,4108551,'Godoy Moreira','PR'),(4037,4108601,'Goioerê','PR'),(4038,4108650,'Goioxim','PR'),(4039,4108700,'Grandes Rios','PR'),(4040,4108809,'Guaíra','PR'),(4041,4108908,'Guairaçá','PR'),(4042,4108957,'Guamiranga','PR'),(4043,4109005,'Guapirama','PR'),(4044,4109104,'Guaporema','PR'),(4045,4109203,'Guaraci','PR'),(4046,4109302,'Guaraniaçu','PR'),(4047,4109401,'Guarapuava','PR'),(4048,4109500,'Guaraqueçaba','PR'),(4049,4109609,'Guaratuba','PR'),(4050,4109658,'Honório Serpa','PR'),(4051,4109708,'Ibaiti','PR'),(4052,4109757,'Ibema','PR'),(4053,4109807,'Ibiporã','PR'),(4054,4109906,'Icaraíma','PR'),(4055,4110003,'Iguaraçu','PR'),(4056,4110052,'Iguatu','PR'),(4057,4110078,'Imbaú','PR'),(4058,4110102,'Imbituva','PR'),(4059,4110201,'Inácio Martins','PR'),(4060,4110300,'Inajá','PR'),(4061,4110409,'Indianópolis','PR'),(4062,4110508,'Ipiranga','PR'),(4063,4110607,'Iporã','PR'),(4064,4110656,'Iracema do Oeste','PR'),(4065,4110706,'Irati','PR'),(4066,4110805,'Iretama','PR'),(4067,4110904,'Itaguajé','PR'),(4068,4110953,'Itaipulândia','PR'),(4069,4111001,'Itambaracá','PR'),(4070,4111100,'Itambé','PR'),(4071,4111209,'Itapejara D\'Oeste','PR'),(4072,4111258,'Itaperuçu','PR'),(4073,4111308,'Itaúna do Sul','PR'),(4074,4111407,'Ivaí','PR'),(4075,4111506,'Ivaiporã','PR'),(4076,4111555,'Ivaté','PR'),(4077,4111605,'Ivatuba','PR'),(4078,4111704,'Jaboti','PR'),(4079,4111803,'Jacarezinho','PR'),(4080,4111902,'Jaguapitã','PR'),(4081,4112009,'Jaguariaíva','PR'),(4082,4112108,'Jandaia do Sul','PR'),(4083,4112207,'Janiópolis','PR'),(4084,4112306,'Japira','PR'),(4085,4112405,'Japurá','PR'),(4086,4112504,'Jardim Alegre','PR'),(4087,4112603,'Jardim Olinda','PR'),(4088,4112702,'Jataizinho','PR'),(4089,4112751,'Jesuítas','PR'),(4090,4112801,'Joaquim Távora','PR'),(4091,4112900,'Jundiaí do Sul','PR'),(4092,4112959,'Juranda','PR'),(4093,4113007,'Jussara','PR'),(4094,4113106,'Kaloré','PR'),(4095,4113205,'Lapa','PR'),(4096,4113254,'Laranjal','PR'),(4097,4113304,'Laranjeiras do Sul','PR'),(4098,4113403,'Leópolis','PR'),(4099,4113429,'Lidianópolis','PR'),(4100,4113452,'Lindoeste','PR'),(4101,4113502,'Loanda','PR'),(4102,4113601,'Lobato','PR'),(4103,4113700,'Londrina','PR'),(4104,4113734,'Luiziana','PR'),(4105,4113759,'Lunardelli','PR'),(4106,4113809,'Lupionópolis','PR'),(4107,4113908,'Mallet','PR'),(4108,4114005,'Mamborê','PR'),(4109,4114104,'Mandaguaçu','PR'),(4110,4114203,'Mandaguari','PR'),(4111,4114302,'Mandirituba','PR'),(4112,4114351,'Manfrinópolis','PR'),(4113,4114401,'Mangueirinha','PR'),(4114,4114500,'Manoel Ribas','PR'),(4115,4114609,'Marechal Cândido Rondon','PR'),(4116,4114708,'Maria Helena','PR'),(4117,4114807,'Marialva','PR'),(4118,4114906,'Marilândia do Sul','PR'),(4119,4115002,'Marilena','PR'),(4120,4115101,'Mariluz','PR'),(4121,4115200,'Maringá','PR'),(4122,4115309,'Mariópolis','PR'),(4123,4115358,'Maripá','PR'),(4124,4115408,'Marmeleiro','PR'),(4125,4115457,'Marquinho','PR'),(4126,4115507,'Marumbi','PR'),(4127,4115606,'Matelândia','PR'),(4128,4115705,'Matinhos','PR'),(4129,4115739,'Mato Rico','PR'),(4130,4115754,'Mauá da Serra','PR'),(4131,4115804,'Medianeira','PR'),(4132,4115853,'Mercedes','PR'),(4133,4115903,'Mirador','PR'),(4134,4116000,'Miraselva','PR'),(4135,4116059,'Missal','PR'),(4136,4116109,'Moreira Sales','PR'),(4137,4116208,'Morretes','PR'),(4138,4116307,'Munhoz de Melo','PR'),(4139,4116406,'Nossa Senhora das Graças','PR'),(4140,4116505,'Nova Aliança do Ivaí','PR'),(4141,4116604,'Nova América da Colina','PR'),(4142,4116703,'Nova Aurora','PR'),(4143,4116802,'Nova Cantu','PR'),(4144,4116901,'Nova Esperança','PR'),(4145,4116950,'Nova Esperança do Sudoeste','PR'),(4146,4117008,'Nova Fátima','PR'),(4147,4117057,'Nova Laranjeiras','PR'),(4148,4117107,'Nova Londrina','PR'),(4149,4117206,'Nova Olímpia','PR'),(4150,4117214,'Nova Santa Bárbara','PR'),(4151,4117222,'Nova Santa Rosa','PR'),(4152,4117255,'Nova Prata do Iguaçu','PR'),(4153,4117271,'Nova Tebas','PR'),(4154,4117297,'Novo Itacolomi','PR'),(4155,4117305,'Ortigueira','PR'),(4156,4117404,'Ourizona','PR'),(4157,4117453,'Ouro Verde do Oeste','PR'),(4158,4117503,'Paiçandu','PR'),(4159,4117602,'Palmas','PR'),(4160,4117701,'Palmeira','PR'),(4161,4117800,'Palmital','PR'),(4162,4117909,'Palotina','PR'),(4163,4118006,'Paraíso do Norte','PR'),(4164,4118105,'Paranacity','PR'),(4165,4118204,'Paranaguá','PR'),(4166,4118303,'Paranapoema','PR'),(4167,4118402,'Paranavaí','PR'),(4168,4118451,'Pato Bragado','PR'),(4169,4118501,'Pato Branco','PR'),(4170,4118600,'Paula Freitas','PR'),(4171,4118709,'Paulo Frontin','PR'),(4172,4118808,'Peabiru','PR'),(4173,4118857,'Perobal','PR'),(4174,4118907,'Pérola','PR'),(4175,4119004,'Pérola D\'Oeste','PR'),(4176,4119103,'Piên','PR'),(4177,4119152,'Pinhais','PR'),(4178,4119202,'Pinhalão','PR'),(4179,4119251,'Pinhal de São Bento','PR'),(4180,4119301,'Pinhão','PR'),(4181,4119400,'Piraí do Sul','PR'),(4182,4119509,'Piraquara','PR'),(4183,4119608,'Pitanga','PR'),(4184,4119657,'Pitangueiras','PR'),(4185,4119707,'Planaltina do Paraná','PR'),(4186,4119806,'Planalto','PR'),(4187,4119905,'Ponta Grossa','PR'),(4188,4119954,'Pontal do Paraná','PR'),(4189,4120002,'Porecatu','PR'),(4190,4120101,'Porto Amazonas','PR'),(4191,4120150,'Porto Barreiro','PR'),(4192,4120200,'Porto Rico','PR'),(4193,4120309,'Porto Vitória','PR'),(4194,4120333,'Prado Ferreira','PR'),(4195,4120358,'Pranchita','PR'),(4196,4120408,'Presidente Castelo Branco','PR'),(4197,4120507,'Primeiro de Maio','PR'),(4198,4120606,'Prudentópolis','PR'),(4199,4120655,'Quarto Centenário','PR'),(4200,4120705,'Quatiguá','PR'),(4201,4120804,'Quatro Barras','PR'),(4202,4120853,'Quatro Pontes','PR'),(4203,4120903,'Quedas do Iguaçu','PR'),(4204,4121000,'Querência do Norte','PR'),(4205,4121109,'Quinta do Sol','PR'),(4206,4121208,'Quitandinha','PR'),(4207,4121257,'Ramilândia','PR'),(4208,4121307,'Rancho Alegre','PR'),(4209,4121356,'Rancho Alegre D\'Oeste','PR'),(4210,4121406,'Realeza','PR'),(4211,4121505,'Rebouças','PR'),(4212,4121604,'Renascença','PR'),(4213,4121703,'Reserva','PR'),(4214,4121752,'Reserva do Iguaçu','PR'),(4215,4121802,'Ribeirão Claro','PR'),(4216,4121901,'Ribeirão do Pinhal','PR'),(4217,4122008,'Rio Azul','PR'),(4218,4122107,'Rio Bom','PR'),(4219,4122156,'Rio Bonito do Iguaçu','PR'),(4220,4122172,'Rio Branco do Ivaí','PR'),(4221,4122206,'Rio Branco do Sul','PR'),(4222,4122305,'Rio Negro','PR'),(4223,4122404,'Rolândia','PR'),(4224,4122503,'Roncador','PR'),(4225,4122602,'Rondon','PR'),(4226,4122651,'Rosário do Ivaí','PR'),(4227,4122701,'Sabáudia','PR'),(4228,4122800,'Salgado Filho','PR'),(4229,4122909,'Salto do Itararé','PR'),(4230,4123006,'Salto do Lontra','PR'),(4231,4123105,'Santa Amélia','PR'),(4232,4123204,'Santa Cecília do Pavão','PR'),(4233,4123303,'Santa Cruz de Monte Castelo','PR'),(4234,4123402,'Santa Fé','PR'),(4235,4123501,'Santa Helena','PR'),(4236,4123600,'Santa Inês','PR'),(4237,4123709,'Santa Isabel do Ivaí','PR'),(4238,4123808,'Santa Izabel do Oeste','PR'),(4239,4123824,'Santa Lúcia','PR'),(4240,4123857,'Santa Maria do Oeste','PR'),(4241,4123907,'Santa Mariana','PR'),(4242,4123956,'Santa Mônica','PR'),(4243,4124004,'Santana do Itararé','PR'),(4244,4124020,'Santa Tereza do Oeste','PR'),(4245,4124053,'Santa Terezinha de Itaipu','PR'),(4246,4124103,'Santo Antônio da Platina','PR'),(4247,4124202,'Santo Antônio do Caiuá','PR'),(4248,4124301,'Santo Antônio do Paraíso','PR'),(4249,4124400,'Santo Antônio do Sudoeste','PR'),(4250,4124509,'Santo Inácio','PR'),(4251,4124608,'São Carlos do Ivaí','PR'),(4252,4124707,'São Jerônimo da Serra','PR'),(4253,4124806,'São João','PR'),(4254,4124905,'São João do Caiuá','PR'),(4255,4125001,'São João do Ivaí','PR'),(4256,4125100,'São João do Triunfo','PR'),(4257,4125209,'São Jorge D\'Oeste','PR'),(4258,4125308,'São Jorge do Ivaí','PR'),(4259,4125357,'São Jorge do Patrocínio','PR'),(4260,4125407,'São José da Boa Vista','PR'),(4261,4125456,'São José das Palmeiras','PR'),(4262,4125506,'São José dos Pinhais','PR'),(4263,4125555,'São Manoel do Paraná','PR'),(4264,4125605,'São Mateus do Sul','PR'),(4265,4125704,'São Miguel do Iguaçu','PR'),(4266,4125753,'São Pedro do Iguaçu','PR'),(4267,4125803,'São Pedro do Ivaí','PR'),(4268,4125902,'São Pedro do Paraná','PR'),(4269,4126009,'São Sebastião da Amoreira','PR'),(4270,4126108,'São Tomé','PR'),(4271,4126207,'Sapopema','PR'),(4272,4126256,'Sarandi','PR'),(4273,4126272,'Saudade do Iguaçu','PR'),(4274,4126306,'Sengés','PR'),(4275,4126355,'Serranópolis do Iguaçu','PR'),(4276,4126405,'Sertaneja','PR'),(4277,4126504,'Sertanópolis','PR'),(4278,4126603,'Siqueira Campos','PR'),(4279,4126652,'Sulina','PR'),(4280,4126678,'Tamarana','PR'),(4281,4126702,'Tamboara','PR'),(4282,4126801,'Tapejara','PR'),(4283,4126900,'Tapira','PR'),(4284,4127007,'Teixeira Soares','PR'),(4285,4127106,'Telêmaco Borba','PR'),(4286,4127205,'Terra Boa','PR'),(4287,4127304,'Terra Rica','PR'),(4288,4127403,'Terra Roxa','PR'),(4289,4127502,'Tibagi','PR'),(4290,4127601,'Tijucas do Sul','PR'),(4291,4127700,'Toledo','PR'),(4292,4127809,'Tomazina','PR'),(4293,4127858,'Três Barras do Paraná','PR'),(4294,4127882,'Tunas do Paraná','PR'),(4295,4127908,'Tuneiras do Oeste','PR'),(4296,4127957,'Tupãssi','PR'),(4297,4127965,'Turvo','PR'),(4298,4128005,'Ubiratã','PR'),(4299,4128104,'Umuarama','PR'),(4300,4128203,'União da Vitória','PR'),(4301,4128302,'Uniflor','PR'),(4302,4128401,'Uraí','PR'),(4303,4128500,'Wenceslau Braz','PR'),(4304,4128534,'Ventania','PR'),(4305,4128559,'Vera Cruz do Oeste','PR'),(4306,4128609,'Verê','PR'),(4307,4128625,'Alto Paraíso','PR'),(4308,4128633,'Doutor Ulysses','PR'),(4309,4128658,'Virmond','PR'),(4310,4128708,'Vitorino','PR'),(4311,4128807,'Xambrê','PR'),(4312,4200051,'Abdon Batista','SC'),(4313,4200101,'Abelardo Luz','SC'),(4314,4200200,'Agrolândia','SC'),(4315,4200309,'Agronômica','SC'),(4316,4200408,'Água Doce','SC'),(4317,4200507,'Águas de Chapecó','SC'),(4318,4200556,'Águas Frias','SC'),(4319,4200606,'Águas Mornas','SC'),(4320,4200705,'Alfredo Wagner','SC'),(4321,4200754,'Alto Bela Vista','SC'),(4322,4200804,'Anchieta','SC'),(4323,4200903,'Angelina','SC'),(4324,4201000,'Anita Garibaldi','SC'),(4325,4201109,'Anitápolis','SC'),(4326,4201208,'Antônio Carlos','SC'),(4327,4201257,'Apiúna','SC'),(4328,4201273,'Arabutã','SC'),(4329,4201307,'Araquari','SC'),(4330,4201406,'Araranguá','SC'),(4331,4201505,'Armazém','SC'),(4332,4201604,'Arroio Trinta','SC'),(4333,4201653,'Arvoredo','SC'),(4334,4201703,'Ascurra','SC'),(4335,4201802,'Atalanta','SC'),(4336,4201901,'Aurora','SC'),(4337,4201950,'Balneário Arroio do Silva','SC'),(4338,4202008,'Balneário Camboriú','SC'),(4339,4202057,'Balneário Barra do Sul','SC'),(4340,4202073,'Balneário Gaivota','SC'),(4341,4202081,'Bandeirante','SC'),(4342,4202099,'Barra Bonita','SC'),(4343,4202107,'Barra Velha','SC'),(4344,4202131,'Bela Vista do Toldo','SC'),(4345,4202156,'Belmonte','SC'),(4346,4202206,'Benedito Novo','SC'),(4347,4202305,'Biguaçu','SC'),(4348,4202404,'Blumenau','SC'),(4349,4202438,'Bocaina do Sul','SC'),(4350,4202453,'Bombinhas','SC'),(4351,4202503,'Bom Jardim da Serra','SC'),(4352,4202537,'Bom Jesus','SC'),(4353,4202578,'Bom Jesus do Oeste','SC'),(4354,4202602,'Bom Retiro','SC'),(4355,4202701,'Botuverá','SC'),(4356,4202800,'Braço do Norte','SC'),(4357,4202859,'Braço do Trombudo','SC'),(4358,4202875,'Brunópolis','SC'),(4359,4202909,'Brusque','SC'),(4360,4203006,'Caçador','SC'),(4361,4203105,'Caibi','SC'),(4362,4203154,'Calmon','SC'),(4363,4203204,'Camboriú','SC'),(4364,4203253,'Capão Alto','SC'),(4365,4203303,'Campo Alegre','SC'),(4366,4203402,'Campo Belo do Sul','SC'),(4367,4203501,'Campo Erê','SC'),(4368,4203600,'Campos Novos','SC'),(4369,4203709,'Canelinha','SC'),(4370,4203808,'Canoinhas','SC'),(4371,4203907,'Capinzal','SC'),(4372,4203956,'Capivari de Baixo','SC'),(4373,4204004,'Catanduvas','SC'),(4374,4204103,'Caxambu do Sul','SC'),(4375,4204152,'Celso Ramos','SC'),(4376,4204178,'Cerro Negro','SC'),(4377,4204194,'Chapadão do Lageado','SC'),(4378,4204202,'Chapecó','SC'),(4379,4204251,'Cocal do Sul','SC'),(4380,4204301,'Concórdia','SC'),(4381,4204350,'Cordilheira Alta','SC'),(4382,4204400,'Coronel Freitas','SC'),(4383,4204459,'Coronel Martins','SC'),(4384,4204509,'Corupá','SC'),(4385,4204558,'Correia Pinto','SC'),(4386,4204608,'Criciúma','SC'),(4387,4204707,'Cunha Porã','SC'),(4388,4204756,'Cunhataí','SC'),(4389,4204806,'Curitibanos','SC'),(4390,4204905,'Descanso','SC'),(4391,4205001,'Dionísio Cerqueira','SC'),(4392,4205100,'Dona Emma','SC'),(4393,4205159,'Doutor Pedrinho','SC'),(4394,4205175,'Entre Rios','SC'),(4395,4205191,'Ermo','SC'),(4396,4205209,'Erval Velho','SC'),(4397,4205308,'Faxinal dos Guedes','SC'),(4398,4205357,'Flor do Sertão','SC'),(4399,4205407,'Florianópolis','SC'),(4400,4205431,'Formosa do Sul','SC'),(4401,4205456,'Forquilhinha','SC'),(4402,4205506,'Fraiburgo','SC'),(4403,4205555,'Frei Rogério','SC'),(4404,4205605,'Galvão','SC'),(4405,4205704,'Garopaba','SC'),(4406,4205803,'Garuva','SC'),(4407,4205902,'Gaspar','SC'),(4408,4206009,'Governador Celso Ramos','SC'),(4409,4206108,'Grão Pará','SC'),(4410,4206207,'Gravatal','SC'),(4411,4206306,'Guabiruba','SC'),(4412,4206405,'Guaraciaba','SC'),(4413,4206504,'Guaramirim','SC'),(4414,4206603,'Guarujá do Sul','SC'),(4415,4206652,'Guatambú','SC'),(4416,4206702,'Herval D\'Oeste','SC'),(4417,4206751,'Ibiam','SC'),(4418,4206801,'Ibicaré','SC'),(4419,4206900,'Ibirama','SC'),(4420,4207007,'Içara','SC'),(4421,4207106,'Ilhota','SC'),(4422,4207205,'Imaruí','SC'),(4423,4207304,'Imbituba','SC'),(4424,4207403,'Imbuia','SC'),(4425,4207502,'Indaial','SC'),(4426,4207577,'Iomerê','SC'),(4427,4207601,'Ipira','SC'),(4428,4207650,'Iporã do Oeste','SC'),(4429,4207684,'Ipuaçu','SC'),(4430,4207700,'Ipumirim','SC'),(4431,4207759,'Iraceminha','SC'),(4432,4207809,'Irani','SC'),(4433,4207858,'Irati','SC'),(4434,4207908,'Irineópolis','SC'),(4435,4208005,'Itá','SC'),(4436,4208104,'Itaiópolis','SC'),(4437,4208203,'Itajaí','SC'),(4438,4208302,'Itapema','SC'),(4439,4208401,'Itapiranga','SC'),(4440,4208450,'Itapoá','SC'),(4441,4208500,'Ituporanga','SC'),(4442,4208609,'Jaborá','SC'),(4443,4208708,'Jacinto Machado','SC'),(4444,4208807,'Jaguaruna','SC'),(4445,4208906,'Jaraguá do Sul','SC'),(4446,4208955,'Jardinópolis','SC'),(4447,4209003,'Joaçaba','SC'),(4448,4209102,'Joinville','SC'),(4449,4209151,'José Boiteux','SC'),(4450,4209177,'Jupiá','SC'),(4451,4209201,'Lacerdópolis','SC'),(4452,4209300,'Lages','SC'),(4453,4209409,'Laguna','SC'),(4454,4209458,'Lajeado Grande','SC'),(4455,4209508,'Laurentino','SC'),(4456,4209607,'Lauro Muller','SC'),(4457,4209706,'Lebon Régis','SC'),(4458,4209805,'Leoberto Leal','SC'),(4459,4209854,'Lindóia do Sul','SC'),(4460,4209904,'Lontras','SC'),(4461,4210001,'Luiz Alves','SC'),(4462,4210035,'Luzerna','SC'),(4463,4210050,'Macieira','SC'),(4464,4210100,'Mafra','SC'),(4465,4210209,'Major Gercino','SC'),(4466,4210308,'Major Vieira','SC'),(4467,4210407,'Maracajá','SC'),(4468,4210506,'Maravilha','SC'),(4469,4210555,'Marema','SC'),(4470,4210605,'Massaranduba','SC'),(4471,4210704,'Matos Costa','SC'),(4472,4210803,'Meleiro','SC'),(4473,4210852,'Mirim Doce','SC'),(4474,4210902,'Modelo','SC'),(4475,4211009,'Mondaí','SC'),(4476,4211058,'Monte Carlo','SC'),(4477,4211108,'Monte Castelo','SC'),(4478,4211207,'Morro da Fumaça','SC'),(4479,4211256,'Morro Grande','SC'),(4480,4211306,'Navegantes','SC'),(4481,4211405,'Nova Erechim','SC'),(4482,4211454,'Nova Itaberaba','SC'),(4483,4211504,'Nova Trento','SC'),(4484,4211603,'Nova Veneza','SC'),(4485,4211652,'Novo Horizonte','SC'),(4486,4211702,'Orleans','SC'),(4487,4211751,'Otacílio Costa','SC'),(4488,4211801,'Ouro','SC'),(4489,4211850,'Ouro Verde','SC'),(4490,4211876,'Paial','SC'),(4491,4211892,'Painel','SC'),(4492,4211900,'Palhoça','SC'),(4493,4212007,'Palma Sola','SC'),(4494,4212056,'Palmeira','SC'),(4495,4212106,'Palmitos','SC'),(4496,4212205,'Papanduva','SC'),(4497,4212239,'Paraíso','SC'),(4498,4212254,'Passo de Torres','SC'),(4499,4212270,'Passos Maia','SC'),(4500,4212304,'Paulo Lopes','SC'),(4501,4212403,'Pedras Grandes','SC'),(4502,4212502,'Penha','SC'),(4503,4212601,'Peritiba','SC'),(4504,4212650,'Pescaria Brava','SC'),(4505,4212700,'Petrolândia','SC'),(4506,4212809,'Balneário Piçarras','SC'),(4507,4212908,'Pinhalzinho','SC'),(4508,4213005,'Pinheiro Preto','SC'),(4509,4213104,'Piratuba','SC'),(4510,4213153,'Planalto Alegre','SC'),(4511,4213203,'Pomerode','SC'),(4512,4213302,'Ponte Alta','SC'),(4513,4213351,'Ponte Alta do Norte','SC'),(4514,4213401,'Ponte Serrada','SC'),(4515,4213500,'Porto Belo','SC'),(4516,4213609,'Porto União','SC'),(4517,4213708,'Pouso Redondo','SC'),(4518,4213807,'Praia Grande','SC'),(4519,4213906,'Presidente Castello Branco','SC'),(4520,4214003,'Presidente Getúlio','SC'),(4521,4214102,'Presidente Nereu','SC'),(4522,4214151,'Princesa','SC'),(4523,4214201,'Quilombo','SC'),(4524,4214300,'Rancho Queimado','SC'),(4525,4214409,'Rio das Antas','SC'),(4526,4214508,'Rio do Campo','SC'),(4527,4214607,'Rio do Oeste','SC'),(4528,4214706,'Rio dos Cedros','SC'),(4529,4214805,'Rio do Sul','SC'),(4530,4214904,'Rio Fortuna','SC'),(4531,4215000,'Rio Negrinho','SC'),(4532,4215059,'Rio Rufino','SC'),(4533,4215075,'Riqueza','SC'),(4534,4215109,'Rodeio','SC'),(4535,4215208,'Romelândia','SC'),(4536,4215307,'Salete','SC'),(4537,4215356,'Saltinho','SC'),(4538,4215406,'Salto Veloso','SC'),(4539,4215455,'Sangão','SC'),(4540,4215505,'Santa Cecília','SC'),(4541,4215554,'Santa Helena','SC'),(4542,4215604,'Santa Rosa de Lima','SC'),(4543,4215653,'Santa Rosa do Sul','SC'),(4544,4215679,'Santa Terezinha','SC'),(4545,4215687,'Santa Terezinha do Progresso','SC'),(4546,4215695,'Santiago do Sul','SC'),(4547,4215703,'Santo Amaro da Imperatriz','SC'),(4548,4215752,'São Bernardino','SC'),(4549,4215802,'São Bento do Sul','SC'),(4550,4215901,'São Bonifácio','SC'),(4551,4216008,'São Carlos','SC'),(4552,4216057,'São Cristovão do Sul','SC'),(4553,4216107,'São Domingos','SC'),(4554,4216206,'São Francisco do Sul','SC'),(4555,4216255,'São João do Oeste','SC'),(4556,4216305,'São João Batista','SC'),(4557,4216354,'São João do Itaperiú','SC'),(4558,4216404,'São João do Sul','SC'),(4559,4216503,'São Joaquim','SC'),(4560,4216602,'São José','SC'),(4561,4216701,'São José do Cedro','SC'),(4562,4216800,'São José do Cerrito','SC'),(4563,4216909,'São Lourenço do Oeste','SC'),(4564,4217006,'São Ludgero','SC'),(4565,4217105,'São Martinho','SC'),(4566,4217154,'São Miguel da Boa Vista','SC'),(4567,4217204,'São Miguel do Oeste','SC'),(4568,4217253,'São Pedro de Alcântara','SC'),(4569,4217303,'Saudades','SC'),(4570,4217402,'Schroeder','SC'),(4571,4217501,'Seara','SC'),(4572,4217550,'Serra Alta','SC'),(4573,4217600,'Siderópolis','SC'),(4574,4217709,'Sombrio','SC'),(4575,4217758,'Sul Brasil','SC'),(4576,4217808,'Taió','SC'),(4577,4217907,'Tangará','SC'),(4578,4217956,'Tigrinhos','SC'),(4579,4218004,'Tijucas','SC'),(4580,4218103,'Timbé do Sul','SC'),(4581,4218202,'Timbó','SC'),(4582,4218251,'Timbó Grande','SC'),(4583,4218301,'Três Barras','SC'),(4584,4218350,'Treviso','SC'),(4585,4218400,'Treze de Maio','SC'),(4586,4218509,'Treze Tílias','SC'),(4587,4218608,'Trombudo Central','SC'),(4588,4218707,'Tubarão','SC'),(4589,4218756,'Tunápolis','SC'),(4590,4218806,'Turvo','SC'),(4591,4218855,'União do Oeste','SC'),(4592,4218905,'Urubici','SC'),(4593,4218954,'Urupema','SC'),(4594,4219002,'Urussanga','SC'),(4595,4219101,'Vargeão','SC'),(4596,4219150,'Vargem','SC'),(4597,4219176,'Vargem Bonita','SC'),(4598,4219200,'Vidal Ramos','SC'),(4599,4219309,'Videira','SC'),(4600,4219358,'Vitor Meireles','SC'),(4601,4219408,'Witmarsum','SC'),(4602,4219507,'Xanxerê','SC'),(4603,4219606,'Xavantina','SC'),(4604,4219705,'Xaxim','SC'),(4605,4219853,'Zortéa','SC'),(4606,4220000,'Balneário Rincão','SC'),(4607,4300034,'Aceguá','RS'),(4608,4300059,'Água Santa','RS'),(4609,4300109,'Agudo','RS'),(4610,4300208,'Ajuricaba','RS'),(4611,4300307,'Alecrim','RS'),(4612,4300406,'Alegrete','RS'),(4613,4300455,'Alegria','RS'),(4614,4300471,'Almirante Tamandaré do Sul','RS'),(4615,4300505,'Alpestre','RS'),(4616,4300554,'Alto Alegre','RS'),(4617,4300570,'Alto Feliz','RS'),(4618,4300604,'Alvorada','RS'),(4619,4300638,'Amaral Ferrador','RS'),(4620,4300646,'Ametista do Sul','RS'),(4621,4300661,'André da Rocha','RS'),(4622,4300703,'Anta Gorda','RS'),(4623,4300802,'Antônio Prado','RS'),(4624,4300851,'Arambaré','RS'),(4625,4300877,'Araricá','RS'),(4626,4300901,'Aratiba','RS'),(4627,4301008,'Arroio do Meio','RS'),(4628,4301057,'Arroio do Sal','RS'),(4629,4301073,'Arroio do Padre','RS'),(4630,4301107,'Arroio dos Ratos','RS'),(4631,4301206,'Arroio do Tigre','RS'),(4632,4301305,'Arroio Grande','RS'),(4633,4301404,'Arvorezinha','RS'),(4634,4301503,'Augusto Pestana','RS'),(4635,4301552,'Áurea','RS'),(4636,4301602,'Bagé','RS'),(4637,4301636,'Balneário Pinhal','RS'),(4638,4301651,'Barão','RS'),(4639,4301701,'Barão de Cotegipe','RS'),(4640,4301750,'Barão do Triunfo','RS'),(4641,4301800,'Barracão','RS'),(4642,4301859,'Barra do Guarita','RS'),(4643,4301875,'Barra do Quaraí','RS'),(4644,4301909,'Barra do Ribeiro','RS'),(4645,4301925,'Barra do Rio Azul','RS'),(4646,4301958,'Barra Funda','RS'),(4647,4302006,'Barros Cassal','RS'),(4648,4302055,'Benjamin Constant do Sul','RS'),(4649,4302105,'Bento Gonçalves','RS'),(4650,4302154,'Boa Vista das Missões','RS'),(4651,4302204,'Boa Vista do Buricá','RS'),(4652,4302220,'Boa Vista do Cadeado','RS'),(4653,4302238,'Boa Vista do Incra','RS'),(4654,4302253,'Boa Vista do Sul','RS'),(4655,4302303,'Bom Jesus','RS'),(4656,4302352,'Bom Princípio','RS'),(4657,4302378,'Bom Progresso','RS'),(4658,4302402,'Bom Retiro do Sul','RS'),(4659,4302451,'Boqueirão do Leão','RS'),(4660,4302501,'Bossoroca','RS'),(4661,4302584,'Bozano','RS'),(4662,4302600,'Braga','RS'),(4663,4302659,'Brochier','RS'),(4664,4302709,'Butiá','RS'),(4665,4302808,'Caçapava do Sul','RS'),(4666,4302907,'Cacequi','RS'),(4667,4303004,'Cachoeira do Sul','RS'),(4668,4303103,'Cachoeirinha','RS'),(4669,4303202,'Cacique Doble','RS'),(4670,4303301,'Caibaté','RS'),(4671,4303400,'Caiçara','RS'),(4672,4303509,'Camaquã','RS'),(4673,4303558,'Camargo','RS'),(4674,4303608,'Cambará do Sul','RS'),(4675,4303673,'Campestre da Serra','RS'),(4676,4303707,'Campina das Missões','RS'),(4677,4303806,'Campinas do Sul','RS'),(4678,4303905,'Campo Bom','RS'),(4679,4304002,'Campo Novo','RS'),(4680,4304101,'Campos Borges','RS'),(4681,4304200,'Candelária','RS'),(4682,4304309,'Cândido Godói','RS'),(4683,4304358,'Candiota','RS'),(4684,4304408,'Canela','RS'),(4685,4304507,'Canguçu','RS'),(4686,4304606,'Canoas','RS'),(4687,4304614,'Canudos do Vale','RS'),(4688,4304622,'Capão Bonito do Sul','RS'),(4689,4304630,'Capão da Canoa','RS'),(4690,4304655,'Capão do Cipó','RS'),(4691,4304663,'Capão do Leão','RS'),(4692,4304671,'Capivari do Sul','RS'),(4693,4304689,'Capela de Santana','RS'),(4694,4304697,'Capitão','RS'),(4695,4304705,'Carazinho','RS'),(4696,4304713,'Caraá','RS'),(4697,4304804,'Carlos Barbosa','RS'),(4698,4304853,'Carlos Gomes','RS'),(4699,4304903,'Casca','RS'),(4700,4304952,'Caseiros','RS'),(4701,4305009,'Catuípe','RS'),(4702,4305108,'Caxias do Sul','RS'),(4703,4305116,'Centenário','RS'),(4704,4305124,'Cerrito','RS'),(4705,4305132,'Cerro Branco','RS'),(4706,4305157,'Cerro Grande','RS'),(4707,4305173,'Cerro Grande do Sul','RS'),(4708,4305207,'Cerro Largo','RS'),(4709,4305306,'Chapada','RS'),(4710,4305355,'Charqueadas','RS'),(4711,4305371,'Charrua','RS'),(4712,4305405,'Chiapetta','RS'),(4713,4305439,'Chuí','RS'),(4714,4305447,'Chuvisca','RS'),(4715,4305454,'Cidreira','RS'),(4716,4305504,'Ciríaco','RS'),(4717,4305587,'Colinas','RS'),(4718,4305603,'Colorado','RS'),(4719,4305702,'Condor','RS'),(4720,4305801,'Constantina','RS'),(4721,4305835,'Coqueiro Baixo','RS'),(4722,4305850,'Coqueiros do Sul','RS'),(4723,4305871,'Coronel Barros','RS'),(4724,4305900,'Coronel Bicaco','RS'),(4725,4305934,'Coronel Pilar','RS'),(4726,4305959,'Cotiporã','RS'),(4727,4305975,'Coxilha','RS'),(4728,4306007,'Crissiumal','RS'),(4729,4306056,'Cristal','RS'),(4730,4306072,'Cristal do Sul','RS'),(4731,4306106,'Cruz Alta','RS'),(4732,4306130,'Cruzaltense','RS'),(4733,4306205,'Cruzeiro do Sul','RS'),(4734,4306304,'David Canabarro','RS'),(4735,4306320,'Derrubadas','RS'),(4736,4306353,'Dezesseis de Novembro','RS'),(4737,4306379,'Dilermando de Aguiar','RS'),(4738,4306403,'Dois Irmãos','RS'),(4739,4306429,'Dois Irmãos das Missões','RS'),(4740,4306452,'Dois Lajeados','RS'),(4741,4306502,'Dom Feliciano','RS'),(4742,4306551,'Dom Pedro de Alcântara','RS'),(4743,4306601,'Dom Pedrito','RS'),(4744,4306700,'Dona Francisca','RS'),(4745,4306734,'Doutor Maurício Cardoso','RS'),(4746,4306759,'Doutor Ricardo','RS'),(4747,4306767,'Eldorado do Sul','RS'),(4748,4306809,'Encantado','RS'),(4749,4306908,'Encruzilhada do Sul','RS'),(4750,4306924,'Engenho Velho','RS'),(4751,4306932,'Entre-Ijuís','RS'),(4752,4306957,'Entre Rios do Sul','RS'),(4753,4306973,'Erebango','RS'),(4754,4307005,'Erechim','RS'),(4755,4307054,'Ernestina','RS'),(4756,4307104,'Herval','RS'),(4757,4307203,'Erval Grande','RS'),(4758,4307302,'Erval Seco','RS'),(4759,4307401,'Esmeralda','RS'),(4760,4307450,'Esperança do Sul','RS'),(4761,4307500,'Espumoso','RS'),(4762,4307559,'Estação','RS'),(4763,4307609,'Estância Velha','RS'),(4764,4307708,'Esteio','RS'),(4765,4307807,'Estrela','RS'),(4766,4307815,'Estrela Velha','RS'),(4767,4307831,'Eugênio de Castro','RS'),(4768,4307864,'Fagundes Varela','RS'),(4769,4307906,'Farroupilha','RS'),(4770,4308003,'Faxinal do Soturno','RS'),(4771,4308052,'Faxinalzinho','RS'),(4772,4308078,'Fazenda Vilanova','RS'),(4773,4308102,'Feliz','RS'),(4774,4308201,'Flores da Cunha','RS'),(4775,4308250,'Floriano Peixoto','RS'),(4776,4308300,'Fontoura Xavier','RS'),(4777,4308409,'Formigueiro','RS'),(4778,4308433,'Forquetinha','RS'),(4779,4308458,'Fortaleza dos Valos','RS'),(4780,4308508,'Frederico Westphalen','RS'),(4781,4308607,'Garibaldi','RS'),(4782,4308656,'Garruchos','RS'),(4783,4308706,'Gaurama','RS'),(4784,4308805,'General Câmara','RS'),(4785,4308854,'Gentil','RS'),(4786,4308904,'Getúlio Vargas','RS'),(4787,4309001,'Giruá','RS'),(4788,4309050,'Glorinha','RS'),(4789,4309100,'Gramado','RS'),(4790,4309126,'Gramado dos Loureiros','RS'),(4791,4309159,'Gramado Xavier','RS'),(4792,4309209,'Gravataí','RS'),(4793,4309258,'Guabiju','RS'),(4794,4309308,'Guaíba','RS'),(4795,4309407,'Guaporé','RS'),(4796,4309506,'Guarani das Missões','RS'),(4797,4309555,'Harmonia','RS'),(4798,4309571,'Herveiras','RS'),(4799,4309605,'Horizontina','RS'),(4800,4309654,'Hulha Negra','RS'),(4801,4309704,'Humaitá','RS'),(4802,4309753,'Ibarama','RS'),(4803,4309803,'Ibiaçá','RS'),(4804,4309902,'Ibiraiaras','RS'),(4805,4309951,'Ibirapuitã','RS'),(4806,4310009,'Ibirubá','RS'),(4807,4310108,'Igrejinha','RS'),(4808,4310207,'Ijuí','RS'),(4809,4310306,'Ilópolis','RS'),(4810,4310330,'Imbé','RS'),(4811,4310363,'Imigrante','RS'),(4812,4310405,'Independência','RS'),(4813,4310413,'Inhacorá','RS'),(4814,4310439,'Ipê','RS'),(4815,4310462,'Ipiranga do Sul','RS'),(4816,4310504,'Iraí','RS'),(4817,4310538,'Itaara','RS'),(4818,4310553,'Itacurubi','RS'),(4819,4310579,'Itapuca','RS'),(4820,4310603,'Itaqui','RS'),(4821,4310652,'Itati','RS'),(4822,4310702,'Itatiba do Sul','RS'),(4823,4310751,'Ivorá','RS'),(4824,4310801,'Ivoti','RS'),(4825,4310850,'Jaboticaba','RS'),(4826,4310876,'Jacuizinho','RS'),(4827,4310900,'Jacutinga','RS'),(4828,4311007,'Jaguarão','RS'),(4829,4311106,'Jaguari','RS'),(4830,4311122,'Jaquirana','RS'),(4831,4311130,'Jari','RS'),(4832,4311155,'Jóia','RS'),(4833,4311205,'Júlio de Castilhos','RS'),(4834,4311239,'Lagoa Bonita do Sul','RS'),(4835,4311254,'Lagoão','RS'),(4836,4311270,'Lagoa dos Três Cantos','RS'),(4837,4311304,'Lagoa Vermelha','RS'),(4838,4311403,'Lajeado','RS'),(4839,4311429,'Lajeado do Bugre','RS'),(4840,4311502,'Lavras do Sul','RS'),(4841,4311601,'Liberato Salzano','RS'),(4842,4311627,'Lindolfo Collor','RS'),(4843,4311643,'Linha Nova','RS'),(4844,4311700,'Machadinho','RS'),(4845,4311718,'Maçambará','RS'),(4846,4311734,'Mampituba','RS'),(4847,4311759,'Manoel Viana','RS'),(4848,4311775,'Maquiné','RS'),(4849,4311791,'Maratá','RS'),(4850,4311809,'Marau','RS'),(4851,4311908,'Marcelino Ramos','RS'),(4852,4311981,'Mariana Pimentel','RS'),(4853,4312005,'Mariano Moro','RS'),(4854,4312054,'Marques de Souza','RS'),(4855,4312104,'Mata','RS'),(4856,4312138,'Mato Castelhano','RS'),(4857,4312153,'Mato Leitão','RS'),(4858,4312179,'Mato Queimado','RS'),(4859,4312203,'Maximiliano de Almeida','RS'),(4860,4312252,'Minas do Leão','RS'),(4861,4312302,'Miraguaí','RS'),(4862,4312351,'Montauri','RS'),(4863,4312377,'Monte Alegre dos Campos','RS'),(4864,4312385,'Monte Belo do Sul','RS'),(4865,4312401,'Montenegro','RS'),(4866,4312427,'Mormaço','RS'),(4867,4312443,'Morrinhos do Sul','RS'),(4868,4312450,'Morro Redondo','RS'),(4869,4312476,'Morro Reuter','RS'),(4870,4312500,'Mostardas','RS'),(4871,4312609,'Muçum','RS'),(4872,4312617,'Muitos Capões','RS'),(4873,4312625,'Muliterno','RS'),(4874,4312658,'Não-Me-Toque','RS'),(4875,4312674,'Nicolau Vergueiro','RS'),(4876,4312708,'Nonoai','RS'),(4877,4312757,'Nova Alvorada','RS'),(4878,4312807,'Nova Araçá','RS'),(4879,4312906,'Nova Bassano','RS'),(4880,4312955,'Nova Boa Vista','RS'),(4881,4313003,'Nova Bréscia','RS'),(4882,4313011,'Nova Candelária','RS'),(4883,4313037,'Nova Esperança do Sul','RS'),(4884,4313060,'Nova Hartz','RS'),(4885,4313086,'Nova Pádua','RS'),(4886,4313102,'Nova Palma','RS'),(4887,4313201,'Nova Petrópolis','RS'),(4888,4313300,'Nova Prata','RS'),(4889,4313334,'Nova Ramada','RS'),(4890,4313359,'Nova Roma do Sul','RS'),(4891,4313375,'Nova Santa Rita','RS'),(4892,4313391,'Novo Cabrais','RS'),(4893,4313409,'Novo Hamburgo','RS'),(4894,4313425,'Novo Machado','RS'),(4895,4313441,'Novo Tiradentes','RS'),(4896,4313466,'Novo Xingu','RS'),(4897,4313490,'Novo Barreiro','RS'),(4898,4313508,'Osório','RS'),(4899,4313607,'Paim Filho','RS'),(4900,4313656,'Palmares do Sul','RS'),(4901,4313706,'Palmeira das Missões','RS'),(4902,4313805,'Palmitinho','RS'),(4903,4313904,'Panambi','RS'),(4904,4313953,'Pantano Grande','RS'),(4905,4314001,'Paraí','RS'),(4906,4314027,'Paraíso do Sul','RS'),(4907,4314035,'Pareci Novo','RS'),(4908,4314050,'Parobé','RS'),(4909,4314068,'Passa Sete','RS'),(4910,4314076,'Passo do Sobrado','RS'),(4911,4314100,'Passo Fundo','RS'),(4912,4314134,'Paulo Bento','RS'),(4913,4314159,'Paverama','RS'),(4914,4314175,'Pedras Altas','RS'),(4915,4314209,'Pedro Osório','RS'),(4916,4314308,'Pejuçara','RS'),(4917,4314407,'Pelotas','RS'),(4918,4314423,'Picada Café','RS'),(4919,4314456,'Pinhal','RS'),(4920,4314464,'Pinhal da Serra','RS'),(4921,4314472,'Pinhal Grande','RS'),(4922,4314498,'Pinheirinho do Vale','RS'),(4923,4314506,'Pinheiro Machado','RS'),(4924,4314548,'Pinto Bandeira','RS'),(4925,4314555,'Pirapó','RS'),(4926,4314605,'Piratini','RS'),(4927,4314704,'Planalto','RS'),(4928,4314753,'Poço das Antas','RS'),(4929,4314779,'Pontão','RS'),(4930,4314787,'Ponte Preta','RS'),(4931,4314803,'Portão','RS'),(4932,4314902,'Porto Alegre','RS'),(4933,4315008,'Porto Lucena','RS'),(4934,4315057,'Porto Mauá','RS'),(4935,4315073,'Porto Vera Cruz','RS'),(4936,4315107,'Porto Xavier','RS'),(4937,4315131,'Pouso Novo','RS'),(4938,4315149,'Presidente Lucena','RS'),(4939,4315156,'Progresso','RS'),(4940,4315172,'Protásio Alves','RS'),(4941,4315206,'Putinga','RS'),(4942,4315305,'Quaraí','RS'),(4943,4315313,'Quatro Irmãos','RS'),(4944,4315321,'Quevedos','RS'),(4945,4315354,'Quinze de Novembro','RS'),(4946,4315404,'Redentora','RS'),(4947,4315453,'Relvado','RS'),(4948,4315503,'Restinga Seca','RS'),(4949,4315552,'Rio dos Índios','RS'),(4950,4315602,'Rio Grande','RS'),(4951,4315701,'Rio Pardo','RS'),(4952,4315750,'Riozinho','RS'),(4953,4315800,'Roca Sales','RS'),(4954,4315909,'Rodeio Bonito','RS'),(4955,4315958,'Rolador','RS'),(4956,4316006,'Rolante','RS'),(4957,4316105,'Ronda Alta','RS'),(4958,4316204,'Rondinha','RS'),(4959,4316303,'Roque Gonzales','RS'),(4960,4316402,'Rosário do Sul','RS'),(4961,4316428,'Sagrada Família','RS'),(4962,4316436,'Saldanha Marinho','RS'),(4963,4316451,'Salto do Jacuí','RS'),(4964,4316477,'Salvador das Missões','RS'),(4965,4316501,'Salvador do Sul','RS'),(4966,4316600,'Sananduva','RS'),(4967,4316709,'Santa Bárbara do Sul','RS'),(4968,4316733,'Santa Cecília do Sul','RS'),(4969,4316758,'Santa Clara do Sul','RS'),(4970,4316808,'Santa Cruz do Sul','RS'),(4971,4316907,'Santa Maria','RS'),(4972,4316956,'Santa Maria do Herval','RS'),(4973,4316972,'Santa Margarida do Sul','RS'),(4974,4317004,'Santana da Boa Vista','RS'),(4975,4317103,'Sant\'Ana do Livramento','RS'),(4976,4317202,'Santa Rosa','RS'),(4977,4317251,'Santa Tereza','RS'),(4978,4317301,'Santa Vitória do Palmar','RS'),(4979,4317400,'Santiago','RS'),(4980,4317509,'Santo Ângelo','RS'),(4981,4317558,'Santo Antônio do Palma','RS'),(4982,4317608,'Santo Antônio da Patrulha','RS'),(4983,4317707,'Santo Antônio das Missões','RS'),(4984,4317756,'Santo Antônio do Planalto','RS'),(4985,4317806,'Santo Augusto','RS'),(4986,4317905,'Santo Cristo','RS'),(4987,4317954,'Santo Expedito do Sul','RS'),(4988,4318002,'São Borja','RS'),(4989,4318051,'São Domingos do Sul','RS'),(4990,4318101,'São Francisco de Assis','RS'),(4991,4318200,'São Francisco de Paula','RS'),(4992,4318309,'São Gabriel','RS'),(4993,4318408,'São Jerônimo','RS'),(4994,4318424,'São João da Urtiga','RS'),(4995,4318432,'São João do Polêsine','RS'),(4996,4318440,'São Jorge','RS'),(4997,4318457,'São José das Missões','RS'),(4998,4318465,'São José do Herval','RS'),(4999,4318481,'São José do Hortêncio','RS'),(5000,4318499,'São José do Inhacorá','RS'),(5001,4318507,'São José do Norte','RS'),(5002,4318606,'São José do Ouro','RS'),(5003,4318614,'São José do Sul','RS'),(5004,4318622,'São José dos Ausentes','RS'),(5005,4318705,'São Leopoldo','RS'),(5006,4318804,'São Lourenço do Sul','RS'),(5007,4318903,'São Luiz Gonzaga','RS'),(5008,4319000,'São Marcos','RS'),(5009,4319109,'São Martinho','RS'),(5010,4319125,'São Martinho da Serra','RS'),(5011,4319158,'São Miguel das Missões','RS'),(5012,4319208,'São Nicolau','RS'),(5013,4319307,'São Paulo das Missões','RS'),(5014,4319356,'São Pedro da Serra','RS'),(5015,4319364,'São Pedro das Missões','RS'),(5016,4319372,'São Pedro do Butiá','RS'),(5017,4319406,'São Pedro do Sul','RS'),(5018,4319505,'São Sebastião do Caí','RS'),(5019,4319604,'São Sepé','RS'),(5020,4319703,'São Valentim','RS'),(5021,4319711,'São Valentim do Sul','RS'),(5022,4319737,'São Valério do Sul','RS'),(5023,4319752,'São Vendelino','RS'),(5024,4319802,'São Vicente do Sul','RS'),(5025,4319901,'Sapiranga','RS'),(5026,4320008,'Sapucaia do Sul','RS'),(5027,4320107,'Sarandi','RS'),(5028,4320206,'Seberi','RS'),(5029,4320230,'Sede Nova','RS'),(5030,4320263,'Segredo','RS'),(5031,4320305,'Selbach','RS'),(5032,4320321,'Senador Salgado Filho','RS'),(5033,4320354,'Sentinela do Sul','RS'),(5034,4320404,'Serafina Corrêa','RS'),(5035,4320453,'Sério','RS'),(5036,4320503,'Sertão','RS'),(5037,4320552,'Sertão Santana','RS'),(5038,4320578,'Sete de Setembro','RS'),(5039,4320602,'Severiano de Almeida','RS'),(5040,4320651,'Silveira Martins','RS'),(5041,4320677,'Sinimbu','RS'),(5042,4320701,'Sobradinho','RS'),(5043,4320800,'Soledade','RS'),(5044,4320859,'Tabaí','RS'),(5045,4320909,'Tapejara','RS'),(5046,4321006,'Tapera','RS'),(5047,4321105,'Tapes','RS'),(5048,4321204,'Taquara','RS'),(5049,4321303,'Taquari','RS'),(5050,4321329,'Taquaruçu do Sul','RS'),(5051,4321352,'Tavares','RS'),(5052,4321402,'Tenente Portela','RS'),(5053,4321436,'Terra de Areia','RS'),(5054,4321451,'Teutônia','RS'),(5055,4321469,'Tio Hugo','RS'),(5056,4321477,'Tiradentes do Sul','RS'),(5057,4321493,'Toropi','RS'),(5058,4321501,'Torres','RS'),(5059,4321600,'Tramandaí','RS'),(5060,4321626,'Travesseiro','RS'),(5061,4321634,'Três Arroios','RS'),(5062,4321667,'Três Cachoeiras','RS'),(5063,4321709,'Três Coroas','RS'),(5064,4321808,'Três de Maio','RS'),(5065,4321832,'Três Forquilhas','RS'),(5066,4321857,'Três Palmeiras','RS'),(5067,4321907,'Três Passos','RS'),(5068,4321956,'Trindade do Sul','RS'),(5069,4322004,'Triunfo','RS'),(5070,4322103,'Tucunduva','RS'),(5071,4322152,'Tunas','RS'),(5072,4322186,'Tupanci do Sul','RS'),(5073,4322202,'Tupanciretã','RS'),(5074,4322251,'Tupandi','RS'),(5075,4322301,'Tuparendi','RS'),(5076,4322327,'Turuçu','RS'),(5077,4322343,'Ubiretama','RS'),(5078,4322350,'União da Serra','RS'),(5079,4322376,'Unistalda','RS'),(5080,4322400,'Uruguaiana','RS'),(5081,4322509,'Vacaria','RS'),(5082,4322525,'Vale Verde','RS'),(5083,4322533,'Vale do Sol','RS'),(5084,4322541,'Vale Real','RS'),(5085,4322558,'Vanini','RS'),(5086,4322608,'Venâncio Aires','RS'),(5087,4322707,'Vera Cruz','RS'),(5088,4322806,'Veranópolis','RS'),(5089,4322855,'Vespasiano Correa','RS'),(5090,4322905,'Viadutos','RS'),(5091,4323002,'Viamão','RS'),(5092,4323101,'Vicente Dutra','RS'),(5093,4323200,'Victor Graeff','RS'),(5094,4323309,'Vila Flores','RS'),(5095,4323358,'Vila Lângaro','RS'),(5096,4323408,'Vila Maria','RS'),(5097,4323457,'Vila Nova do Sul','RS'),(5098,4323507,'Vista Alegre','RS'),(5099,4323606,'Vista Alegre do Prata','RS'),(5100,4323705,'Vista Gaúcha','RS'),(5101,4323754,'Vitória das Missões','RS'),(5102,4323770,'Westfalia','RS'),(5103,4323804,'Xangri-lá','RS'),(5104,5000203,'Água Clara','MS'),(5105,5000252,'Alcinópolis','MS'),(5106,5000609,'Amambai','MS'),(5107,5000708,'Anastácio','MS'),(5108,5000807,'Anaurilândia','MS'),(5109,5000856,'Angélica','MS'),(5110,5000906,'Antônio João','MS'),(5111,5001003,'Aparecida do Taboado','MS'),(5112,5001102,'Aquidauana','MS'),(5113,5001243,'Aral Moreira','MS'),(5114,5001508,'Bandeirantes','MS'),(5115,5001904,'Bataguassu','MS'),(5116,5002001,'Batayporã','MS'),(5117,5002100,'Bela Vista','MS'),(5118,5002159,'Bodoquena','MS'),(5119,5002209,'Bonito','MS'),(5120,5002308,'Brasilândia','MS'),(5121,5002407,'Caarapó','MS'),(5122,5002605,'Camapuã','MS'),(5123,5002704,'Campo Grande','MS'),(5124,5002803,'Caracol','MS'),(5125,5002902,'Cassilândia','MS'),(5126,5002951,'Chapadão do Sul','MS'),(5127,5003108,'Corguinho','MS'),(5128,5003157,'Coronel Sapucaia','MS'),(5129,5003207,'Corumbá','MS'),(5130,5003256,'Costa Rica','MS'),(5131,5003306,'Coxim','MS'),(5132,5003454,'Deodápolis','MS'),(5133,5003488,'Dois Irmãos do Buriti','MS'),(5134,5003504,'Douradina','MS'),(5135,5003702,'Dourados','MS'),(5136,5003751,'Eldorado','MS'),(5137,5003801,'Fátima do Sul','MS'),(5138,5003900,'Figueirão','MS'),(5139,5004007,'Glória de Dourados','MS'),(5140,5004106,'Guia Lopes da Laguna','MS'),(5141,5004304,'Iguatemi','MS'),(5142,5004403,'Inocência','MS'),(5143,5004502,'Itaporã','MS'),(5144,5004601,'Itaquiraí','MS'),(5145,5004700,'Ivinhema','MS'),(5146,5004809,'Japorã','MS'),(5147,5004908,'Jaraguari','MS'),(5148,5005004,'Jardim','MS'),(5149,5005103,'Jateí','MS'),(5150,5005152,'Juti','MS'),(5151,5005202,'Ladário','MS'),(5152,5005251,'Laguna Carapã','MS'),(5153,5005400,'Maracaju','MS'),(5154,5005608,'Miranda','MS'),(5155,5005681,'Mundo Novo','MS'),(5156,5005707,'Naviraí','MS'),(5157,5005806,'Nioaque','MS'),(5158,5006002,'Nova Alvorada do Sul','MS'),(5159,5006200,'Nova Andradina','MS'),(5160,5006259,'Novo Horizonte do Sul','MS'),(5161,5006275,'Paraíso das Águas','MS'),(5162,5006309,'Paranaíba','MS'),(5163,5006358,'Paranhos','MS'),(5164,5006408,'Pedro Gomes','MS'),(5165,5006606,'Ponta Porã','MS'),(5166,5006903,'Porto Murtinho','MS'),(5167,5007109,'Ribas do Rio Pardo','MS'),(5168,5007208,'Rio Brilhante','MS'),(5169,5007307,'Rio Negro','MS'),(5170,5007406,'Rio Verde de Mato Grosso','MS'),(5171,5007505,'Rochedo','MS'),(5172,5007554,'Santa Rita do Pardo','MS'),(5173,5007695,'São Gabriel do Oeste','MS'),(5174,5007703,'Sete Quedas','MS'),(5175,5007802,'Selvíria','MS'),(5176,5007901,'Sidrolândia','MS'),(5177,5007935,'Sonora','MS'),(5178,5007950,'Tacuru','MS'),(5179,5007976,'Taquarussu','MS'),(5180,5008008,'Terenos','MS'),(5181,5008305,'Três Lagoas','MS'),(5182,5008404,'Vicentina','MS'),(5183,5100102,'Acorizal','MT'),(5184,5100201,'Água Boa','MT'),(5185,5100250,'Alta Floresta','MT'),(5186,5100300,'Alto Araguaia','MT'),(5187,5100359,'Alto Boa Vista','MT'),(5188,5100409,'Alto Garças','MT'),(5189,5100508,'Alto Paraguai','MT'),(5190,5100607,'Alto Taquari','MT'),(5191,5100805,'Apiacás','MT'),(5192,5101001,'Araguaiana','MT'),(5193,5101209,'Araguainha','MT'),(5194,5101258,'Araputanga','MT'),(5195,5101308,'Arenápolis','MT'),(5196,5101407,'Aripuanã','MT'),(5197,5101605,'Barão de Melgaço','MT'),(5198,5101704,'Barra do Bugres','MT'),(5199,5101803,'Barra do Garças','MT'),(5200,5101852,'Bom Jesus do Araguaia','MT'),(5201,5101902,'Brasnorte','MT'),(5202,5102504,'Cáceres','MT'),(5203,5102603,'Campinápolis','MT'),(5204,5102637,'Campo Novo do Parecis','MT'),(5205,5102678,'Campo Verde','MT'),(5206,5102686,'Campos de Júlio','MT'),(5207,5102694,'Canabrava do Norte','MT'),(5208,5102702,'Canarana','MT'),(5209,5102793,'Carlinda','MT'),(5210,5102850,'Castanheira','MT'),(5211,5103007,'Chapada dos Guimarães','MT'),(5212,5103056,'Cláudia','MT'),(5213,5103106,'Cocalinho','MT'),(5214,5103205,'Colíder','MT'),(5215,5103254,'Colniza','MT'),(5216,5103304,'Comodoro','MT'),(5217,5103353,'Confresa','MT'),(5218,5103361,'Conquista D\'Oeste','MT'),(5219,5103379,'Cotriguaçu','MT'),(5220,5103403,'Cuiabá','MT'),(5221,5103437,'Curvelândia','MT'),(5222,5103452,'Denise','MT'),(5223,5103502,'Diamantino','MT'),(5224,5103601,'Dom Aquino','MT'),(5225,5103700,'Feliz Natal','MT'),(5226,5103809,'Figueirópolis D\'Oeste','MT'),(5227,5103858,'Gaúcha do Norte','MT'),(5228,5103908,'General Carneiro','MT'),(5229,5103957,'Glória D\'Oeste','MT'),(5230,5104104,'Guarantã do Norte','MT'),(5231,5104203,'Guiratinga','MT'),(5232,5104500,'Indiavaí','MT'),(5233,5104526,'Ipiranga do Norte','MT'),(5234,5104542,'Itanhangá','MT'),(5235,5104559,'Itaúba','MT'),(5236,5104609,'Itiquira','MT'),(5237,5104807,'Jaciara','MT'),(5238,5104906,'Jangada','MT'),(5239,5105002,'Jauru','MT'),(5240,5105101,'Juara','MT'),(5241,5105150,'Juína','MT'),(5242,5105176,'Juruena','MT'),(5243,5105200,'Juscimeira','MT'),(5244,5105234,'Lambari D\'Oeste','MT'),(5245,5105259,'Lucas do Rio Verde','MT'),(5246,5105309,'Luciara','MT'),(5247,5105507,'Vila Bela da Santíssima Trindade','MT'),(5248,5105580,'Marcelândia','MT'),(5249,5105606,'Matupá','MT'),(5250,5105622,'Mirassol D\'Oeste','MT'),(5251,5105903,'Nobres','MT'),(5252,5106000,'Nortelândia','MT'),(5253,5106109,'Nossa Senhora do Livramento','MT'),(5254,5106158,'Nova Bandeirantes','MT'),(5255,5106174,'Nova Nazaré','MT'),(5256,5106182,'Nova Lacerda','MT'),(5257,5106190,'Nova Santa Helena','MT'),(5258,5106208,'Nova Brasilândia','MT'),(5259,5106216,'Nova Canaã do Norte','MT'),(5260,5106224,'Nova Mutum','MT'),(5261,5106232,'Nova Olímpia','MT'),(5262,5106240,'Nova Ubiratã','MT'),(5263,5106257,'Nova Xavantina','MT'),(5264,5106265,'Novo Mundo','MT'),(5265,5106273,'Novo Horizonte do Norte','MT'),(5266,5106281,'Novo São Joaquim','MT'),(5267,5106299,'Paranaíta','MT'),(5268,5106307,'Paranatinga','MT'),(5269,5106315,'Novo Santo Antônio','MT'),(5270,5106372,'Pedra Preta','MT'),(5271,5106422,'Peixoto de Azevedo','MT'),(5272,5106455,'Planalto da Serra','MT'),(5273,5106505,'Poconé','MT'),(5274,5106653,'Pontal do Araguaia','MT'),(5275,5106703,'Ponte Branca','MT'),(5276,5106752,'Pontes e Lacerda','MT'),(5277,5106778,'Porto Alegre do Norte','MT'),(5278,5106802,'Porto dos Gaúchos','MT'),(5279,5106828,'Porto Esperidião','MT'),(5280,5106851,'Porto Estrela','MT'),(5281,5107008,'Poxoréo','MT'),(5282,5107040,'Primavera do Leste','MT'),(5283,5107065,'Querência','MT'),(5284,5107107,'São José dos Quatro Marcos','MT'),(5285,5107156,'Reserva do Cabaçal','MT'),(5286,5107180,'Ribeirão Cascalheira','MT'),(5287,5107198,'Ribeirãozinho','MT'),(5288,5107206,'Rio Branco','MT'),(5289,5107248,'Santa Carmem','MT'),(5290,5107263,'Santo Afonso','MT'),(5291,5107297,'São José do Povo','MT'),(5292,5107305,'São José do Rio Claro','MT'),(5293,5107354,'São José do Xingu','MT'),(5294,5107404,'São Pedro da Cipa','MT'),(5295,5107578,'Rondolândia','MT'),(5296,5107602,'Rondonópolis','MT'),(5297,5107701,'Rosário Oeste','MT'),(5298,5107743,'Santa Cruz do Xingu','MT'),(5299,5107750,'Salto do Céu','MT'),(5300,5107768,'Santa Rita do Trivelato','MT'),(5301,5107776,'Santa Terezinha','MT'),(5302,5107792,'Santo Antônio do Leste','MT'),(5303,5107800,'Santo Antônio do Leverger','MT'),(5304,5107859,'São Félix do Araguaia','MT'),(5305,5107875,'Sapezal','MT'),(5306,5107883,'Serra Nova Dourada','MT'),(5307,5107909,'Sinop','MT'),(5308,5107925,'Sorriso','MT'),(5309,5107941,'Tabaporã','MT'),(5310,5107958,'Tangará da Serra','MT'),(5311,5108006,'Tapurah','MT'),(5312,5108055,'Terra Nova do Norte','MT'),(5313,5108105,'Tesouro','MT'),(5314,5108204,'Torixoréu','MT'),(5315,5108303,'União do Sul','MT'),(5316,5108352,'Vale de São Domingos','MT'),(5317,5108402,'Várzea Grande','MT'),(5318,5108501,'Vera','MT'),(5319,5108600,'Vila Rica','MT'),(5320,5108808,'Nova Guarita','MT'),(5321,5108857,'Nova Marilândia','MT'),(5322,5108907,'Nova Maringá','MT'),(5323,5108956,'Nova Monte Verde','MT'),(5324,5200050,'Abadia de Goiás','GO'),(5325,5200100,'Abadiânia','GO'),(5326,5200134,'Acreúna','GO'),(5327,5200159,'Adelândia','GO'),(5328,5200175,'Água Fria de Goiás','GO'),(5329,5200209,'Água Limpa','GO'),(5330,5200258,'Águas Lindas de Goiás','GO'),(5331,5200308,'Alexânia','GO'),(5332,5200506,'Aloândia','GO'),(5333,5200555,'Alto Horizonte','GO'),(5334,5200605,'Alto Paraíso de Goiás','GO'),(5335,5200803,'Alvorada do Norte','GO'),(5336,5200829,'Amaralina','GO'),(5337,5200852,'Americano do Brasil','GO'),(5338,5200902,'Amorinópolis','GO'),(5339,5201108,'Anápolis','GO'),(5340,5201207,'Anhanguera','GO'),(5341,5201306,'Anicuns','GO'),(5342,5201405,'Aparecida de Goiânia','GO'),(5343,5201454,'Aparecida do Rio Doce','GO'),(5344,5201504,'Aporé','GO'),(5345,5201603,'Araçu','GO'),(5346,5201702,'Aragarças','GO'),(5347,5201801,'Aragoiânia','GO'),(5348,5202155,'Araguapaz','GO'),(5349,5202353,'Arenópolis','GO'),(5350,5202502,'Aruanã','GO'),(5351,5202601,'Aurilândia','GO'),(5352,5202809,'Avelinópolis','GO'),(5353,5203104,'Baliza','GO'),(5354,5203203,'Barro Alto','GO'),(5355,5203302,'Bela Vista de Goiás','GO'),(5356,5203401,'Bom Jardim de Goiás','GO'),(5357,5203500,'Bom Jesus de Goiás','GO'),(5358,5203559,'Bonfinópolis','GO'),(5359,5203575,'Bonópolis','GO'),(5360,5203609,'Brazabrantes','GO'),(5361,5203807,'Britânia','GO'),(5362,5203906,'Buriti Alegre','GO'),(5363,5203939,'Buriti de Goiás','GO'),(5364,5203962,'Buritinópolis','GO'),(5365,5204003,'Cabeceiras','GO'),(5366,5204102,'Cachoeira Alta','GO'),(5367,5204201,'Cachoeira de Goiás','GO'),(5368,5204250,'Cachoeira Dourada','GO'),(5369,5204300,'Caçu','GO'),(5370,5204409,'Caiapônia','GO'),(5371,5204508,'Caldas Novas','GO'),(5372,5204557,'Caldazinha','GO'),(5373,5204607,'Campestre de Goiás','GO'),(5374,5204656,'Campinaçu','GO'),(5375,5204706,'Campinorte','GO'),(5376,5204805,'Campo Alegre de Goiás','GO'),(5377,5204854,'Campo Limpo de Goiás','GO'),(5378,5204904,'Campos Belos','GO'),(5379,5204953,'Campos Verdes','GO'),(5380,5205000,'Carmo do Rio Verde','GO'),(5381,5205059,'Castelândia','GO'),(5382,5205109,'Catalão','GO'),(5383,5205208,'Caturaí','GO'),(5384,5205307,'Cavalcante','GO'),(5385,5205406,'Ceres','GO'),(5386,5205455,'Cezarina','GO'),(5387,5205471,'Chapadão do Céu','GO'),(5388,5205497,'Cidade Ocidental','GO'),(5389,5205513,'Cocalzinho de Goiás','GO'),(5390,5205521,'Colinas do Sul','GO'),(5391,5205703,'Córrego do Ouro','GO'),(5392,5205802,'Corumbá de Goiás','GO'),(5393,5205901,'Corumbaíba','GO'),(5394,5206206,'Cristalina','GO'),(5395,5206305,'Cristianópolis','GO'),(5396,5206404,'Crixás','GO'),(5397,5206503,'Cromínia','GO'),(5398,5206602,'Cumari','GO'),(5399,5206701,'Damianópolis','GO'),(5400,5206800,'Damolândia','GO'),(5401,5206909,'Davinópolis','GO'),(5402,5207105,'Diorama','GO'),(5403,5207253,'Doverlândia','GO'),(5404,5207352,'Edealina','GO'),(5405,5207402,'Edéia','GO'),(5406,5207501,'Estrela do Norte','GO'),(5407,5207535,'Faina','GO'),(5408,5207600,'Fazenda Nova','GO'),(5409,5207808,'Firminópolis','GO'),(5410,5207907,'Flores de Goiás','GO'),(5411,5208004,'Formosa','GO'),(5412,5208103,'Formoso','GO'),(5413,5208152,'Gameleira de Goiás','GO'),(5414,5208301,'Divinópolis de Goiás','GO'),(5415,5208400,'Goianápolis','GO'),(5416,5208509,'Goiandira','GO'),(5417,5208608,'Goianésia','GO'),(5418,5208707,'Goiânia','GO'),(5419,5208806,'Goianira','GO'),(5420,5208905,'Goiás','GO'),(5421,5209101,'Goiatuba','GO'),(5422,5209150,'Gouvelândia','GO'),(5423,5209200,'Guapó','GO'),(5424,5209291,'Guaraíta','GO'),(5425,5209408,'Guarani de Goiás','GO'),(5426,5209457,'Guarinos','GO'),(5427,5209606,'Heitoraí','GO'),(5428,5209705,'Hidrolândia','GO'),(5429,5209804,'Hidrolina','GO'),(5430,5209903,'Iaciara','GO'),(5431,5209937,'Inaciolândia','GO'),(5432,5209952,'Indiara','GO'),(5433,5210000,'Inhumas','GO'),(5434,5210109,'Ipameri','GO'),(5435,5210158,'Ipiranga de Goiás','GO'),(5436,5210208,'Iporá','GO'),(5437,5210307,'Israelândia','GO'),(5438,5210406,'Itaberaí','GO'),(5439,5210562,'Itaguari','GO'),(5440,5210604,'Itaguaru','GO'),(5441,5210802,'Itajá','GO'),(5442,5210901,'Itapaci','GO'),(5443,5211008,'Itapirapuã','GO'),(5444,5211206,'Itapuranga','GO'),(5445,5211305,'Itarumã','GO'),(5446,5211404,'Itauçu','GO'),(5447,5211503,'Itumbiara','GO'),(5448,5211602,'Ivolândia','GO'),(5449,5211701,'Jandaia','GO'),(5450,5211800,'Jaraguá','GO'),(5451,5211909,'Jataí','GO'),(5452,5212006,'Jaupaci','GO'),(5453,5212055,'Jesúpolis','GO'),(5454,5212105,'Joviânia','GO'),(5455,5212204,'Jussara','GO'),(5456,5212253,'Lagoa Santa','GO'),(5457,5212303,'Leopoldo de Bulhões','GO'),(5458,5212501,'Luziânia','GO'),(5459,5212600,'Mairipotaba','GO'),(5460,5212709,'Mambaí','GO'),(5461,5212808,'Mara Rosa','GO'),(5462,5212907,'Marzagão','GO'),(5463,5212956,'Matrinchã','GO'),(5464,5213004,'Maurilândia','GO'),(5465,5213053,'Mimoso de Goiás','GO'),(5466,5213087,'Minaçu','GO'),(5467,5213103,'Mineiros','GO'),(5468,5213400,'Moiporá','GO'),(5469,5213509,'Monte Alegre de Goiás','GO'),(5470,5213707,'Montes Claros de Goiás','GO'),(5471,5213756,'Montividiu','GO'),(5472,5213772,'Montividiu do Norte','GO'),(5473,5213806,'Morrinhos','GO'),(5474,5213855,'Morro Agudo de Goiás','GO'),(5475,5213905,'Mossâmedes','GO'),(5476,5214002,'Mozarlândia','GO'),(5477,5214051,'Mundo Novo','GO'),(5478,5214101,'Mutunópolis','GO'),(5479,5214408,'Nazário','GO'),(5480,5214507,'Nerópolis','GO'),(5481,5214606,'Niquelândia','GO'),(5482,5214705,'Nova América','GO'),(5483,5214804,'Nova Aurora','GO'),(5484,5214838,'Nova Crixás','GO'),(5485,5214861,'Nova Glória','GO'),(5486,5214879,'Nova Iguaçu de Goiás','GO'),(5487,5214903,'Nova Roma','GO'),(5488,5215009,'Nova Veneza','GO'),(5489,5215207,'Novo Brasil','GO'),(5490,5215231,'Novo Gama','GO'),(5491,5215256,'Novo Planalto','GO'),(5492,5215306,'Orizona','GO'),(5493,5215405,'Ouro Verde de Goiás','GO'),(5494,5215504,'Ouvidor','GO'),(5495,5215603,'Padre Bernardo','GO'),(5496,5215652,'Palestina de Goiás','GO'),(5497,5215702,'Palmeiras de Goiás','GO'),(5498,5215801,'Palmelo','GO'),(5499,5215900,'Palminópolis','GO'),(5500,5216007,'Panamá','GO'),(5501,5216304,'Paranaiguara','GO'),(5502,5216403,'Paraúna','GO'),(5503,5216452,'Perolândia','GO'),(5504,5216809,'Petrolina de Goiás','GO'),(5505,5216908,'Pilar de Goiás','GO'),(5506,5217104,'Piracanjuba','GO'),(5507,5217203,'Piranhas','GO'),(5508,5217302,'Pirenópolis','GO'),(5509,5217401,'Pires do Rio','GO'),(5510,5217609,'Planaltina','GO'),(5511,5217708,'Pontalina','GO'),(5512,5218003,'Porangatu','GO'),(5513,5218052,'Porteirão','GO'),(5514,5218102,'Portelândia','GO'),(5515,5218300,'Posse','GO'),(5516,5218391,'Professor Jamil','GO'),(5517,5218508,'Quirinópolis','GO'),(5518,5218607,'Rialma','GO'),(5519,5218706,'Rianápolis','GO'),(5520,5218789,'Rio Quente','GO'),(5521,5218805,'Rio Verde','GO'),(5522,5218904,'Rubiataba','GO'),(5523,5219001,'Sanclerlândia','GO'),(5524,5219100,'Santa Bárbara de Goiás','GO'),(5525,5219209,'Santa Cruz de Goiás','GO'),(5526,5219258,'Santa Fé de Goiás','GO'),(5527,5219308,'Santa Helena de Goiás','GO'),(5528,5219357,'Santa Isabel','GO'),(5529,5219407,'Santa Rita do Araguaia','GO'),(5530,5219456,'Santa Rita do Novo Destino','GO'),(5531,5219506,'Santa Rosa de Goiás','GO'),(5532,5219605,'Santa Tereza de Goiás','GO'),(5533,5219704,'Santa Terezinha de Goiás','GO'),(5534,5219712,'Santo Antônio da Barra','GO'),(5535,5219738,'Santo Antônio de Goiás','GO'),(5536,5219753,'Santo Antônio do Descoberto','GO'),(5537,5219803,'São Domingos','GO'),(5538,5219902,'São Francisco de Goiás','GO'),(5539,5220009,'São João D\'Aliança','GO'),(5540,5220058,'São João da Paraúna','GO'),(5541,5220108,'São Luís de Montes Belos','GO'),(5542,5220157,'São Luíz do Norte','GO'),(5543,5220207,'São Miguel do Araguaia','GO'),(5544,5220264,'São Miguel do Passa Quatro','GO'),(5545,5220280,'São Patrício','GO'),(5546,5220405,'São Simão','GO'),(5547,5220454,'Senador Canedo','GO'),(5548,5220504,'Serranópolis','GO'),(5549,5220603,'Silvânia','GO'),(5550,5220686,'Simolândia','GO'),(5551,5220702,'Sítio D\'Abadia','GO'),(5552,5221007,'Taquaral de Goiás','GO'),(5553,5221080,'Teresina de Goiás','GO'),(5554,5221197,'Terezópolis de Goiás','GO'),(5555,5221304,'Três Ranchos','GO'),(5556,5221403,'Trindade','GO'),(5557,5221452,'Trombas','GO'),(5558,5221502,'Turvânia','GO'),(5559,5221551,'Turvelândia','GO'),(5560,5221577,'Uirapuru','GO'),(5561,5221601,'Uruaçu','GO'),(5562,5221700,'Uruana','GO'),(5563,5221809,'Urutaí','GO'),(5564,5221858,'Valparaíso de Goiás','GO'),(5565,5221908,'Varjão','GO'),(5566,5222005,'Vianópolis','GO'),(5567,5222054,'Vicentinópolis','GO'),(5568,5222203,'Vila Boa','GO'),(5569,5222302,'Vila Propício','GO'),(5570,5300108,'Brasília','DF');
/*!40000 ALTER TABLE `dashboard_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_politicalparties`
--

DROP TABLE IF EXISTS `dashboard_politicalparties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_politicalparties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(6) NOT NULL,
  `name` varchar(70) NOT NULL,
  `electoral_number` varchar(3) NOT NULL,
  `affiliates_number` int(11) NOT NULL,
  `president_name` varchar(60) NOT NULL,
  `political_spectrum` varchar(100) DEFAULT NULL,
  `image_flag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_politicalparties`
--

LOCK TABLES `dashboard_politicalparties` WRITE;
/*!40000 ALTER TABLE `dashboard_politicalparties` DISABLE KEYS */;
INSERT INTO `dashboard_politicalparties` VALUES (10,'PRB','Partido Republicano Brasileiro','10',0,'Eduardo Benedito Lopes','Centro Direita',NULL),(11,'PP','Partido Progressista','11',0,'Ciro Nogueira Lima Filho','Direita',NULL),(12,'PDT','Partido Democrático Trabalhista','12',0,'Carlos Lupi','Centro Esquerda',NULL),(13,'PT','Partido dos Trabalhadores','13',0,'Gleisi Helena Hoffmann','Esquerda',NULL),(14,'PTB','Partido Trabalhista Brasileiro','14',0,'Roberto Jefferson Monteiro Francisco','Centro',NULL),(15,'PMDB','Partido do Movimento Democrático Brasileiro','15',0,'Romero Jucá Filho','Centro',NULL),(16,'PSTU','Partido Socialista dos Trabalhadores Unificado','16',0,'José Maria de Almeida','Extrema Esquerda',NULL),(17,'PSL','Partido Social Liberal','17',0,'Gustavo Bebianno Roch','Centro',NULL),(18,'REDE','Rede Sustentabilidade','18',0,'José Gustavo Fávaro Barbosa Silva','Centro Esquerda',NULL),(19,'PODEM','Podemos','19',0,'Renata Hellmeister de Abreu','Centro Direita',NULL),(20,'PSC','Partido Social Cristão','20',0,'Everaldo Dias Pereira','Centro Direita',NULL),(21,'PCB','Partido Comunista Brasileiro','21',0,'Edmilson Silva Costa','Extrema Esquerda',NULL),(22,'PR','Partido da República','22',0,'José Tadeu Candelária','Centro Direita',NULL),(23,'PPS','Partido Popular Socialista','23',0,'Roberto João Pereira Freire','Esquerda',NULL),(25,'DEM','Democratas','25',0,'Antônio Carlos Magalhães Neto','Centro',NULL),(27,'PSDC','Partido Social Democrata Cristão','27',0,'José Maria Eymael','Direita',NULL),(28,'PRTB','Partido Renovador Trabalhista Brasileiro','28',0,'José Levy Fidelix da Cruz','Direita',NULL),(29,'PCO','Partido da Causa Operária','29',0,'Rui Costa Pimenta','Esquerda',NULL),(30,'NOVO','Partido Novo','30',0,'Moisés dos Santos Jardim','Centro Direita',NULL),(31,'PHS','Partido Humanista da Solidariedade','31',0,'Marcelo Guilherme de Aro Ferreira','Centro',NULL),(33,'PMN','Partido da Mobilização Nacional','33',0,'Antônio Carlos Bosco Massarollo','Centro Esquerda',NULL),(35,'PMB','Partido da Mulher Brasileira','35',0,'Suêd Haidar Nogueira','Centro',NULL),(36,'PTC','Partido Trabalhista Cristão','36',0,'Daniel S. Tourinho','Centro',NULL),(40,'PSB','Partido Socialista Brasileiro','40',0,'Carlos Roberto Siqueira de Barros','Centro Esquerda',NULL),(43,'PV','Partido Verde','43',0,'José Luiz de França Penna','Centro',NULL),(44,'PRP','Partido Republicano Progressista','44',0,'Ovasco Roma Altimari Resende','Centro',NULL),(45,'PSDB','Partido da Social Democracia Brasileira','45',0,'Geraldo José Rodrigues Alckmin Filho','Centro Esquerda',NULL),(50,'PSOL','Partido Socialismo e Liberdade','50',0,'Juliano Medeiros','Extrema Esquerda',NULL),(51,'PEN','Partido Ecológico Nacional','51',0,'Adilson Barroso Oliveira','Centro',NULL),(54,'PPL','Partido Pátria Livre','54',0,'Sérgio Rubens de Araújo Torres','Centro Esquerda',NULL),(55,'PSD','Partido Social Democrático','55',0,'Alfredo Cotait Neto','Centro',NULL),(65,'PCdoB','Partido Comunista do Brasil','65',0,'Luciana Barbosa de Oliveira Santos','Extrema Esquerda',NULL),(70,'AVANTE','Avante','70',0,'Luis Henrique de Oliveira Resende','Centro',NULL),(77,'SD','Solidariedade','77',0,'Paulo Pereira da Silva','Centro Esquerda',NULL),(90,'PROS','Partido Republicano da Ordem Social','90',0,'Eurípedes G. de Macedo Junior','Centro Esquerda',NULL);
/*!40000 ALTER TABLE `dashboard_politicalparties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_relationshipnetwork`
--

DROP TABLE IF EXISTS `dashboard_relationshipnetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_relationshipnetwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_actor_a` int(11) NOT NULL,
  `kind_of_relationship` varchar(40) DEFAULT NULL,
  `id_actor_b` int(11) NOT NULL,
  `secondary_actor` int(11) NOT NULL,
  `kind_of_relationship_to_secondary` varchar(40) DEFAULT NULL,
  `observations` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_relationshipnetwork`
--

LOCK TABLES `dashboard_relationshipnetwork` WRITE;
/*!40000 ALTER TABLE `dashboard_relationshipnetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_relationshipnetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usuario`
--

DROP TABLE IF EXISTS `dashboard_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(1) DEFAULT NULL,
  `marital_status` varchar(1) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `birthday_date` longtext,
  `cep` varchar(9) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cellPhone` varchar(17) DEFAULT NULL,
  `landlinePhone` varchar(17) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `user_political_party` varchar(50) DEFAULT NULL,
  `user_profile_photo` varchar(100) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_status` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `user_roles_list_id` int(11) DEFAULT NULL,
  `cellPhone_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `dashboard_usuario_user_roles_list_id_c0933fc7_fk_candidato` (`user_roles_list_id`),
  CONSTRAINT `dashboard_usuario_user_id_9ab77a46_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dashboard_usuario_user_roles_list_id_c0933fc7_fk_candidato` FOREIGN KEY (`user_roles_list_id`) REFERENCES `candidato_userroleslist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usuario`
--

LOCK TABLES `dashboard_usuario` WRITE;
/*!40000 ALTER TABLE `dashboard_usuario` DISABLE KEYS */;
INSERT INTO `dashboard_usuario` VALUES (2,'M','C','','','','PB','2100154','','','','',NULL,'','','2018-06-18','2018-06-18 08:11:41.969832','aproved',1,'',6,0);
/*!40000 ALTER TABLE `dashboard_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usuario_candidates`
--

DROP TABLE IF EXISTS `dashboard_usuario_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usuario_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_usuario_candid_usuario_id_candidate_id_1fd21186_uniq` (`usuario_id`,`candidate_id`),
  KEY `dashboard_usuario_ca_candidate_id_edbca7a5_fk_candidato` (`candidate_id`),
  CONSTRAINT `dashboard_usuario_ca_candidate_id_edbca7a5_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `dashboard_usuario_ca_usuario_id_9802c472_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usuario_candidates`
--

LOCK TABLES `dashboard_usuario_candidates` WRITE;
/*!40000 ALTER TABLE `dashboard_usuario_candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usuario_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-29 01:16:40.310059','1','tulga',2,'[]',2,1),(2,'2018-05-29 03:20:23.237654','2','',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(20,'candidato','candidate'),(29,'candidato','candidaterequests'),(19,'candidato','coalitions'),(23,'candidato','committeemembers'),(21,'candidato','committees'),(28,'candidato','invites'),(32,'candidato','keyword'),(30,'candidato','proposal'),(31,'candidato','scopelist'),(22,'candidato','staff'),(33,'candidato','tempuser'),(25,'candidato','userroles'),(24,'candidato','userroleslist'),(5,'contenttypes','contenttype'),(13,'dashboard','bairro'),(17,'dashboard','estado'),(16,'dashboard','municipio'),(18,'dashboard','politicalparties'),(15,'dashboard','relationshipnetwork'),(12,'dashboard','usercandidates'),(14,'dashboard','usuario'),(27,'elections','ballot'),(34,'elections','dispute'),(26,'elections','position'),(6,'sessions','session'),(7,'social_django','association'),(9,'social_django','code'),(11,'social_django','nonce'),(10,'social_django','partial'),(8,'social_django','usersocialauth');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-22 19:32:27.649444'),(2,'auth','0001_initial','2018-03-22 19:32:28.117136'),(3,'admin','0001_initial','2018-03-22 19:32:28.220524'),(4,'admin','0002_logentry_remove_auto_add','2018-03-22 19:32:28.248106'),(5,'contenttypes','0002_remove_content_type_name','2018-03-22 19:32:28.321255'),(6,'auth','0002_alter_permission_name_max_length','2018-03-22 19:32:28.361495'),(7,'auth','0003_alter_user_email_max_length','2018-03-22 19:32:28.407411'),(8,'auth','0004_alter_user_username_opts','2018-03-22 19:32:28.424544'),(9,'auth','0005_alter_user_last_login_null','2018-03-22 19:32:28.461791'),(10,'auth','0006_require_contenttypes_0002','2018-03-22 19:32:28.470524'),(11,'auth','0007_alter_validators_add_error_messages','2018-03-22 19:32:28.486433'),(12,'auth','0008_alter_user_username_max_length','2018-03-22 19:32:28.533581'),(13,'candidato','0001_initial','2018-03-22 19:32:28.739819'),(16,'sessions','0001_initial','2018-03-22 19:32:29.247020'),(17,'default','0001_initial','2018-03-22 19:32:29.453951'),(18,'social_auth','0001_initial','2018-03-22 19:32:29.463128'),(19,'default','0002_add_related_name','2018-03-22 19:32:29.550884'),(20,'social_auth','0002_add_related_name','2018-03-22 19:32:29.560122'),(21,'default','0003_alter_email_max_length','2018-03-22 19:32:29.603662'),(22,'social_auth','0003_alter_email_max_length','2018-03-22 19:32:29.612941'),(23,'default','0004_auto_20160423_0400','2018-03-22 19:32:29.633183'),(24,'social_auth','0004_auto_20160423_0400','2018-03-22 19:32:29.642218'),(25,'social_auth','0005_auto_20160727_2333','2018-03-22 19:32:29.666076'),(26,'social_django','0006_partial','2018-03-22 19:32:29.713724'),(27,'social_django','0007_code_timestamp','2018-03-22 19:32:29.771699'),(28,'social_django','0008_partial_timestamp','2018-03-22 19:32:29.825538'),(29,'social_django','0005_auto_20160727_2333','2018-03-22 19:32:29.836918'),(30,'social_django','0004_auto_20160423_0400','2018-03-22 19:32:29.845301'),(31,'social_django','0002_add_related_name','2018-03-22 19:32:29.853745'),(32,'social_django','0001_initial','2018-03-22 19:32:29.862061'),(33,'social_django','0003_alter_email_max_length','2018-03-22 19:32:29.870197'),(39,'elections','0001_initial','2018-04-12 22:55:41.402617'),(41,'dashboard','0006_auto_20180413_0502','2018-04-13 08:03:38.674948'),(56,'candidato','0004_auto_20180413_0502','2018-04-13 09:27:28.027871'),(57,'dashboard','0006_auto_20180413_0510','2018-04-13 09:27:29.767381'),(58,'dashboard','0001_initial','2018-04-19 17:13:52.854546'),(59,'dashboard','0002_auto_20180322_0055','2018-04-19 17:13:56.208740'),(60,'candidato','0002_auto_20180323_1856','2018-04-19 17:13:59.194822'),(61,'dashboard','0003_auto_20180323_1856','2018-04-19 17:14:01.135051'),(62,'dashboard','0004_usuario_company','2018-04-19 17:14:01.612148'),(63,'dashboard','0005_auto_20180404_1219','2018-04-19 17:14:01.651644'),(64,'dashboard','0006_auto_20180419_1343','2018-04-19 17:14:03.694112'),(65,'candidato','0003_auto_20180412_1244','2018-04-19 17:21:38.399329'),(66,'candidato','0002_auto_20180419_1434','2018-04-19 17:39:21.341552'),(67,'dashboard','0006_auto_20180419_1445','2018-04-19 17:45:42.018215'),(68,'candidato','0004_auto_20180420_0628','2018-04-20 09:28:34.135440'),(69,'candidato','0004_invites','2018-04-20 14:30:29.134692'),(70,'candidato','0005_merge_20180420_1130','2018-04-20 14:30:29.167321'),(71,'candidato','0006_candidate_candidate_party','2018-04-20 16:03:40.037974'),(72,'dashboard','0007_auto_20180420_1303','2018-04-20 16:03:40.851911'),(73,'candidato','0007_auto_20180420_1538','2018-04-23 11:57:38.759189'),(74,'candidato','0008_invites_invite_status','2018-04-24 14:24:47.821737'),(75,'candidato','0009_invites_updated_at','2018-04-25 01:54:19.788116'),(76,'candidato','0010_candidaterequests','2018-04-26 03:48:46.705497'),(77,'candidato','0011_remove_candidaterequests_invited_email','2018-04-26 03:53:44.394625'),(78,'candidato','0012_candidaterequests_request_type','2018-04-26 04:12:24.771781'),(79,'candidato','0013_userroles_invite','2018-05-01 14:19:48.217150'),(80,'candidato','0014_auto_20180502_2302','2018-05-03 02:02:44.270192'),(81,'dashboard','0008_auto_20180502_2302','2018-05-03 02:02:44.323843'),(82,'dashboard','0009_auto_20180508_1536','2018-05-08 18:36:45.220543'),(83,'dashboard','0010_auto_20180509_1259','2018-05-09 15:59:54.743849'),(84,'candidato','0015_auto_20180514_0658','2018-05-14 09:58:32.321457'),(85,'candidato','0016_candidate_proposals','2018-05-14 11:09:17.294896'),(86,'candidato','0017_scopelist_user','2018-05-16 17:58:22.941737'),(87,'candidato','0018_keyword','2018-05-17 01:37:06.498731'),(88,'candidato','0019_auto_20180516_2330','2018-05-17 02:31:30.985421'),(89,'candidato','0020_auto_20180516_2331','2018-05-17 02:31:33.604896'),(90,'candidato','0021_auto_20180522_0535','2018-05-22 08:35:43.870443'),(91,'dashboard','0011_auto_20180522_0659','2018-05-22 09:59:41.354729'),(92,'candidato','0022_auto_20180522_0659','2018-05-22 09:59:49.861785'),(93,'candidato','0023_committees_name','2018-05-22 11:15:49.097823'),(94,'candidato','0024_auto_20180524_0810','2018-05-24 11:19:41.994109'),(95,'candidato','0025_auto_20180529_1407','2018-05-29 17:07:50.406080'),(96,'elections','0002_dispute','2018-06-15 04:08:58.576741'),(97,'elections','0003_auto_20180615_1324','2018-06-15 16:24:28.208922');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0sh5lzaft53houthl7v9g03lf563oyuv','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-28 18:28:27.353543'),('44ptcywru18kx9rvi5h385xjlfnt893e','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-13 01:59:03.320748'),('48n8e7vqizstosjp83xd2e54h25s8rjz','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-10 15:35:20.042406'),('696ye2q4w2iy9u7tmdr18leihc860jii','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-13 16:47:56.993722'),('6vc8ym5i3hif5di67q3lxftxk12h4qpr','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-27 16:56:04.992254'),('8y1395cvh0r41xea897znou0vdg0frrf','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-29 04:15:06.961921'),('fhb9ly5jq12kjdu2a85f8nfi3q1cbnmn','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-07-02 00:35:34.737845'),('it7vtfbgeaq52i5inki1s2ekve79s2wl','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-15 15:04:09.379785'),('mlfyl2x8xngft027xaolvfep3mksb4wp','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-11 16:12:12.744310'),('uj7vw78le7pbp9rnmittgajj13x7qcdg','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-07-02 08:23:09.716951'),('vm4llf7tk2fek84cwtqdfj8cvnmxdwo4','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-15 01:36:54.368005'),('xx7yu96o9vlujs7xf2xcrzcbuwlucvqx','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-12 04:31:11.474920'),('ywauyki4rm3o1l8hwkdo9zayf5in0zkw','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-12 17:15:15.282768'),('zuwv6p5qo50ixq9zzy3kgojxtvi56ax4','Y2QwNzMyYjIyODJhZDE0M2IwNTVhYTYzMmNiMTI0ZTcwNzVmNWQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTk5YWZlYWEzMjAxM2Q3NjBjNDM3NTRiM2I3M2FjMTgwODU0MmFmIn0=','2018-06-29 14:02:00.683828');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections_ballot`
--

DROP TABLE IF EXISTS `elections_ballot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections_ballot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `election_date` date NOT NULL,
  `created` datetime(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections_ballot`
--

LOCK TABLES `elections_ballot` WRITE;
/*!40000 ALTER TABLE `elections_ballot` DISABLE KEYS */;
/*!40000 ALTER TABLE `elections_ballot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections_dispute`
--

DROP TABLE IF EXISTS `elections_dispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections_dispute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  `facebook` varchar(40) DEFAULT NULL,
  `facebook_img` longtext,
  `facebook_url` varchar(200) DEFAULT NULL,
  `twitter` varchar(40) DEFAULT NULL,
  `twitter_img` longtext,
  `twitter_url` varchar(200) DEFAULT NULL,
  `googlep` varchar(40) DEFAULT NULL,
  `googlep_img` longtext,
  `googlep_url` varchar(200) DEFAULT NULL,
  `youtube` varchar(40) DEFAULT NULL,
  `youtube_img` longtext,
  `youtube_url` varchar(200) DEFAULT NULL,
  `instagram` varchar(40) DEFAULT NULL,
  `instagram_img` longtext,
  `instagram_url` varchar(200) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `created` datetime(6),
  `citie` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elections_dispute_candidate_id_c252f898` (`candidate_id`),
  KEY `elections_dispute_position_id_df5e24be_fk_elections_position_id` (`position_id`),
  CONSTRAINT `elections_dispute_candidate_id_c252f898_fk_candidato` FOREIGN KEY (`candidate_id`) REFERENCES `candidato_candidate` (`id`),
  CONSTRAINT `elections_dispute_position_id_df5e24be_fk_elections_position_id` FOREIGN KEY (`position_id`) REFERENCES `elections_position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections_dispute`
--

LOCK TABLES `elections_dispute` WRITE;
/*!40000 ALTER TABLE `elections_dispute` DISABLE KEYS */;
/*!40000 ALTER TABLE `elections_dispute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections_dispute_political_party`
--

DROP TABLE IF EXISTS `elections_dispute_political_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections_dispute_political_party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispute_id` int(11) NOT NULL,
  `politicalparties_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elections_dispute_politi_dispute_id_politicalpart_1a722eb2_uniq` (`dispute_id`,`politicalparties_id`),
  KEY `elections_dispute_po_politicalparties_id_e672c4cf_fk_dashboard` (`politicalparties_id`),
  CONSTRAINT `elections_dispute_po_dispute_id_3cb74f46_fk_elections` FOREIGN KEY (`dispute_id`) REFERENCES `elections_dispute` (`id`),
  CONSTRAINT `elections_dispute_po_politicalparties_id_e672c4cf_fk_dashboard` FOREIGN KEY (`politicalparties_id`) REFERENCES `dashboard_politicalparties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections_dispute_political_party`
--

LOCK TABLES `elections_dispute_political_party` WRITE;
/*!40000 ALTER TABLE `elections_dispute_political_party` DISABLE KEYS */;
/*!40000 ALTER TABLE `elections_dispute_political_party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections_position`
--

DROP TABLE IF EXISTS `elections_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elections_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) NOT NULL,
  `kind_of_position` varchar(30) NOT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `citie` varchar(255) DEFAULT NULL,
  `ballot_id` int(11) NOT NULL,
  `created` datetime(6),
  PRIMARY KEY (`id`),
  KEY `elections_position_ballot_id_8b6fe111_fk_elections_ballot_id` (`ballot_id`),
  CONSTRAINT `elections_position_ballot_id_8b6fe111_fk_elections_ballot_id` FOREIGN KEY (`ballot_id`) REFERENCES `elections_ballot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections_position`
--

LOCK TABLES `elections_position` WRITE;
/*!40000 ALTER TABLE `elections_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `elections_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pdc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18 17:05:26
