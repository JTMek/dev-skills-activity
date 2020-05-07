-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: craftcms
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (2,1,1,1,'Step1.jpg','image',800,500,42716,NULL,NULL,NULL,'2020-05-06 23:45:13','2020-05-06 23:45:13','2020-05-06 23:45:13','b477e258-20d0-455f-a52b-8b6eab49875d'),(3,1,1,1,'Step2.jpg','image',800,500,43398,NULL,NULL,NULL,'2020-05-06 23:45:21','2020-05-06 23:45:21','2020-05-06 23:45:21','21fbf609-ddca-46b2-8d3c-eb18ea1389f0'),(4,1,1,1,'Step3.jpg','image',800,500,107746,NULL,NULL,NULL,'2020-05-06 23:45:21','2020-05-06 23:45:21','2020-05-06 23:45:21','39de40e8-930b-4062-95a9-9aad70ab6273'),(5,1,1,1,'Step4.jpg','image',800,500,77635,NULL,NULL,NULL,'2020-05-06 23:45:21','2020-05-06 23:45:21','2020-05-06 23:45:21','a6efd834-9783-4d8f-8154-6feb06148ce9');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (6,1,'fieldLayoutId','2020-05-06 23:51:11',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (6,1,1,'2020-05-06 23:53:42',0,1),(6,1,2,'2020-05-06 23:53:42',0,1),(6,1,3,'2020-05-06 23:53:42',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_pageHeader` varchar(400) DEFAULT NULL,
  `field_pageTitle` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-05-06 23:26:45','2020-05-06 23:26:45','48c5cf70-7db4-44eb-8d52-79670761a1d9',NULL,NULL),(2,2,1,'Step 1','2020-05-06 23:45:13','2020-05-06 23:45:44','21a4e0bc-7e53-46dd-8f8b-d9dbd6751fcb',NULL,NULL),(3,3,1,'Step 2','2020-05-06 23:45:21','2020-05-06 23:45:26','717b65dc-d889-4ae0-baad-5846b8a2d791',NULL,NULL),(4,4,1,'Step 3','2020-05-06 23:45:21','2020-05-06 23:45:39','2ae85e2d-c550-4385-b8d2-8a26b36f61ac',NULL,NULL),(5,5,1,'Step 4','2020-05-06 23:45:21','2020-05-06 23:45:32','901e14a5-8826-4037-bed7-977fc5c3b585',NULL,NULL),(6,6,1,'Home','2020-05-06 23:46:48','2020-05-06 23:53:42','83858ed3-3930-4c2f-b5a1-94192a48ff31','Your AC repair in 4 easy steps','Process'),(7,7,1,'Home','2020-05-06 23:46:48','2020-05-06 23:46:48','553d99c0-aa66-4f25-a07f-24d4c0ea005a',NULL,NULL),(8,8,1,'Home','2020-05-06 23:51:11','2020-05-06 23:51:11','546eb88f-8096-4cf1-a09d-12789a757261',NULL,NULL),(9,9,1,'Home','2020-05-06 23:51:34','2020-05-06 23:51:34','66fd5edc-c07f-4e24-81bb-55b631f6a2c6',NULL,NULL),(10,14,1,'Home','2020-05-06 23:53:42','2020-05-06 23:53:42','8a376b47-53ef-4f6e-a4d9-2212f824f2bc','Your AC repair in 4 easy steps','Process');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-05-06 23:26:45','2020-05-06 23:26:45',NULL,'2573ecb2-2ef5-44f6-a948-ad205db05a52'),(2,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-06 23:45:12','2020-05-06 23:45:44',NULL,'e8b7a494-d376-4615-9eb9-22a8d3614228'),(3,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-06 23:45:21','2020-05-06 23:45:26',NULL,'95df3c94-afe4-43e6-bdca-e3105e38cc6d'),(4,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-06 23:45:21','2020-05-06 23:45:39',NULL,'db08b57e-bf9c-4d03-ac24-e4f6fea2c123'),(5,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-06 23:45:21','2020-05-06 23:45:32',NULL,'8bf45608-89d6-4fc0-b4bf-5ae102c702ad'),(6,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-05-06 23:46:48','2020-05-06 23:53:42',NULL,'619de23c-04b0-4454-b489-a683cb334978'),(7,NULL,1,NULL,'craft\\elements\\Entry',1,0,'2020-05-06 23:46:48','2020-05-06 23:46:48',NULL,'f551e42a-4059-4763-8be5-91b3c8d31406'),(8,NULL,2,2,'craft\\elements\\Entry',1,0,'2020-05-06 23:51:11','2020-05-06 23:51:11',NULL,'e8471d18-739f-44a6-ba62-0ddac01fdbed'),(9,NULL,3,2,'craft\\elements\\Entry',1,0,'2020-05-06 23:51:34','2020-05-06 23:51:34',NULL,'ec21e9e1-e227-40cb-a7e3-6f3fc25b7166'),(10,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'ab46b1ce-e2de-4c79-acfb-43c8027757cc'),(11,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'ed928faf-d9fa-424d-b737-9dec9cbdd105'),(12,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'f2f6ed95-68a7-419a-bede-1b671c4e81a1'),(13,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'d3bec510-c9eb-45ea-86b6-3c88e6f6a7fd'),(14,NULL,4,2,'craft\\elements\\Entry',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'be242a63-0086-4145-9588-5ab17901a02e'),(15,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'e1698f01-3e7a-4a7a-8ff8-0ba8c6a51915'),(16,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'5f91de09-5a53-41a3-9f71-1c02ef63fc41'),(17,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'ff2563c9-98b8-4f66-a995-44092a0c490b'),(18,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2020-05-06 23:53:42','2020-05-06 23:53:42',NULL,'d6ff7432-f258-45bd-8efd-4a5d129fad79');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-05-06 23:26:45','2020-05-06 23:26:45','ac50e1c0-c8d0-4d1c-998f-ea9e63ab7790'),(2,2,1,NULL,NULL,1,'2020-05-06 23:45:12','2020-05-06 23:45:12','24787f63-904c-401f-b359-4d509eed6838'),(3,3,1,NULL,NULL,1,'2020-05-06 23:45:21','2020-05-06 23:45:21','40c138af-fc3d-4d76-896f-3f39e8cb6bf1'),(4,4,1,NULL,NULL,1,'2020-05-06 23:45:21','2020-05-06 23:45:21','342e6b84-41be-4145-b392-009ae564aa2b'),(5,5,1,NULL,NULL,1,'2020-05-06 23:45:21','2020-05-06 23:45:21','b46e95b1-9a95-4435-b256-ce64cdf71140'),(6,6,1,'home','__home__',1,'2020-05-06 23:46:48','2020-05-06 23:46:48','93d3cccf-92fd-49e4-b3d2-421441a13a20'),(7,7,1,'home','__home__',1,'2020-05-06 23:46:48','2020-05-06 23:46:48','45e6351e-c41e-46e7-9a60-251e822a1b01'),(8,8,1,'home','__home__',1,'2020-05-06 23:51:11','2020-05-06 23:51:11','7d3cb89b-23d0-40df-8a15-7527232d3d1d'),(9,9,1,'home','__home__',1,'2020-05-06 23:51:34','2020-05-06 23:51:34','fbdc2186-67eb-47c7-a356-49a374c2c373'),(10,10,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','ffad1572-f143-4bd7-bc9a-9b765c9665ba'),(11,11,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','ec1151a9-4802-4606-b68f-4c7c4c5824a4'),(12,12,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','4c2d695e-fe5e-4ab3-9baf-806437660f00'),(13,13,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','f921b043-c162-4808-95d2-3941e5fbc782'),(14,14,1,'home','__home__',1,'2020-05-06 23:53:42','2020-05-06 23:53:42','e045664c-983d-4d29-91cb-31a22cb5dce1'),(15,15,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','1023784f-64aa-4b8a-a7ac-c5299a50623a'),(16,16,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','802f76b1-f9af-47bb-9b22-39322081eb92'),(17,17,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','f9d9dbb9-6f69-4a1b-82f0-a163fcdc01fc'),(18,18,1,NULL,NULL,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','1a08decb-4527-487d-9c0e-acb57e89c3be');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (6,1,NULL,1,NULL,'2020-05-06 23:46:00',NULL,NULL,'2020-05-06 23:46:48','2020-05-06 23:46:48','ec4c4c51-5a47-4db0-9282-40d64209290e'),(7,1,NULL,1,NULL,'2020-05-06 23:46:00',NULL,NULL,'2020-05-06 23:46:48','2020-05-06 23:46:48','ae6e5be3-026a-445d-83df-6f3e22f12fd3'),(8,1,NULL,1,NULL,'2020-05-06 23:46:00',NULL,NULL,'2020-05-06 23:51:11','2020-05-06 23:51:11','fe667f0d-6423-4315-b30e-1a69ca5a4ee9'),(9,1,NULL,1,NULL,'2020-05-06 23:46:00',NULL,NULL,'2020-05-06 23:51:34','2020-05-06 23:51:34','e6a1cc02-12b1-4c4b-abd1-674c32f8e4f9'),(14,1,NULL,1,NULL,'2020-05-06 23:46:00',NULL,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','e0a5d907-959a-489d-86e5-25d380413b40');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,2,'Home','home',0,'','{section.name|raw}',1,'2020-05-06 23:46:48','2020-05-06 23:51:11',NULL,'167a7fef-411f-48be-88b3-7760de19f4b7');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-05-06 23:26:45','2020-05-06 23:26:45','62330c7a-b634-486b-845b-e4f1f3c87039');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (7,2,3,1,0,2,'2020-05-06 23:51:34','2020-05-06 23:51:34','36dabf84-f0aa-433b-9bf5-2a2b85153942'),(8,2,3,2,0,1,'2020-05-06 23:51:34','2020-05-06 23:51:34','0deec039-51fc-4357-b9c6-c9231ca6d856'),(9,2,3,3,0,3,'2020-05-06 23:51:34','2020-05-06 23:51:34','89f0a5ad-0144-4131-9dfd-631c2e1b58a5'),(10,1,4,4,1,3,'2020-05-06 23:54:36','2020-05-06 23:54:36','3d4c9a15-19da-47d7-9a83-b6700da1dc7a'),(11,1,4,5,1,2,'2020-05-06 23:54:36','2020-05-06 23:54:36','19243e67-77cd-493d-a413-d2f9fe6aeec6'),(12,1,4,6,1,1,'2020-05-06 23:54:36','2020-05-06 23:54:36','144494e4-4da3-49c0-a503-f2032813b472');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\MatrixBlock','2020-05-06 23:50:53','2020-05-06 23:50:53',NULL,'c8378163-3e4a-47a0-b538-59f4e919e3c4'),(2,'craft\\elements\\Entry','2020-05-06 23:51:11','2020-05-06 23:51:11',NULL,'cd589018-bce0-49ea-8a8e-e7e2ee449ef6');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (3,2,'Common',1,'2020-05-06 23:51:34','2020-05-06 23:51:34','9bff655b-092a-4819-94e7-80cb0e8e2055'),(4,1,'Content',1,'2020-05-06 23:54:36','2020-05-06 23:54:36','4dc0995f-eb7b-4b7f-bcac-9ffc2c6287e9');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Page Header','pageHeader','global','The header for the page.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":100,\"code\":\"\",\"columnType\":null,\"initialRows\":\"1\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-05-06 23:47:59','2020-05-06 23:47:59','11f3eec8-d866-4812-9600-c3e7239f2456'),(2,1,'Page Title','pageTitle','global','The title for the page.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":100,\"code\":\"\",\"columnType\":null,\"initialRows\":\"1\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-05-06 23:48:24','2020-05-06 23:48:24','147962d7-4669-4037-a9ad-5ebaaf92edea'),(3,1,'Step Fields','stepFields','global','The fields for each step.',1,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_stepfields}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-05-06 23:50:53','2020-05-06 23:50:53','f04b5ad2-981e-45e6-b94d-d2e10bc572dc'),(4,NULL,'Step Text','stepText','matrixBlockType:cb2b34e9-80ea-421e-a271-9fe7d6d995e8','The text for the step.',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false}','2020-05-06 23:50:53','2020-05-06 23:54:36','6552f36d-0246-424a-a1c5-30be794211b9'),(5,NULL,'Step Title','stepTitle','matrixBlockType:cb2b34e9-80ea-421e-a271-9fe7d6d995e8','The title for the step.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":100,\"code\":\"\",\"columnType\":null,\"initialRows\":\"1\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-05-06 23:50:53','2020-05-06 23:50:53','965eb1ad-93dc-4741-8ad7-6a4e33e625c4'),(6,NULL,'Step Image','stepImage','matrixBlockType:cb2b34e9-80ea-421e-a271-9fe7d6d995e8','The image for the step.',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:6a026e42-bfc3-4593-9a23-3b1c33212d54\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:6a026e42-bfc3-4593-9a23-3b1c33212d54\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-05-06 23:50:53','2020-05-06 23:50:53','e9bf0305-355b-4209-af1d-d497d3057209');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.4.11','3.4.10',0,'[]','hdDzINE3yWl8','2020-05-06 23:26:45','2020-05-06 23:54:36','ff15fcf8-a611-4620-b1ea-8fd65adc29f8');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (10,6,3,1,1,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','b26eab2d-c380-40a4-9bf2-8373d282d757'),(11,6,3,1,2,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','cc845cc6-6d22-4365-8bd0-d71d1d81c2b9'),(12,6,3,1,3,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','f0f622f0-3b4f-43b7-8363-d0d79dc13ad8'),(13,6,3,1,4,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','5436efb1-3c7a-4471-b25f-b17dc2c60f5f'),(15,14,3,1,1,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','1d7c40ae-228f-470b-a816-1ecca9903c89'),(16,14,3,1,2,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','fc0fbd1e-76e3-403f-814a-33ce94f2ed26'),(17,14,3,1,3,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','4ec212e4-476d-41ff-853c-226d81a165aa'),(18,14,3,1,4,NULL,'2020-05-06 23:53:42','2020-05-06 23:53:42','948cdfa0-16a3-4186-bf40-0c3bd8811307');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,3,1,'Step Content','stepContent',1,'2020-05-06 23:50:53','2020-05-06 23:50:53','cb2b34e9-80ea-421e-a271-9fe7d6d995e8');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_stepfields`
--

DROP TABLE IF EXISTS `matrixcontent_stepfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_stepfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_stepContent_stepText` text,
  `field_stepContent_stepTitle` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_stepfields_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_stepfields_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_stepfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_stepfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_stepfields`
--

LOCK TABLES `matrixcontent_stepfields` WRITE;
/*!40000 ALTER TABLE `matrixcontent_stepfields` DISABLE KEYS */;
INSERT INTO `matrixcontent_stepfields` VALUES (1,10,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','0e833253-656e-4ba9-976a-2d877a0108a6','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae magna a lacus ultrices dictum ut non dui. Morbi consequat ligula vitae urna volutpat hendrerit. Sed suscipit hendrerit nulla sit amet semper. Nulla maximus porttitor erat, ut faucibus lacus imperdiet malesuada. Aliquam lectus diam, bibendum quis tempor nec, convallis non ligula. Nam turpis enim, porta sed dui quis, faucibus rutrum neque. <a href=\"tel:8005555555\">(800) 555-5555.</a></p>','Schedule your repair'),(2,11,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','e1736006-7430-4e49-bd95-577001ddfa12','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lacus metus, venenatis a malesuada in, porttitor quis ligula. <strong>Praesent cursus sapien lectus, sed cursus</strong> lorem porttitor et. Mauris tincidunt scelerisque arcu sit amet finibus. In blandit nunc sit amet urna faucibus, in mattis metus dignissim. Maecenas tempor dui nec sagittis aliquam. Vivamus ultricies in massa quis suscipit. Quisque massa augue, posuere vitae ultrices id, aliquam eu odio. Etiam egestas suscipit suscipit. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>','Meet your technician'),(3,12,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','cd1c27d5-1e19-4cf9-adce-d388d67b5f9a','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id odio at nisl vehicula ornare eget tempus purus. Aliquam id molestie velit, auctor dictum libero. Nullam quis sapien tortor. Nullam consequat placerat lacus non dictum. Phasellus scelerisque nisl et mauris venenatis, dapibus malesuada neque congue. Vestibulum eget elit elementum, malesuada orci eu, consectetur sem. Etiam rutrum, diam ut rutrum tempus, est sem tincidunt magna, eu pharetra magna tortor eget mi. Nulla condimentum in tortor vel suscipit. Vestibulum ultrices fermentum orci, quis dapibus orci sagittis non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In ac tellus ex. Donec rutrum rhoncus eleifend. Sed vel varius nunc.</p>','Get your system working again'),(4,13,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','a8a5bf85-516c-4567-881c-87158eea2197','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec lectus vitae massa eleifend sollicitudin. Sed est nibh, tincidunt vel nibh varius, posuere sodales lacus. Vestibulum tempor tempus purus, id hendrerit est sollicitudin in. Praesent at scelerisque erat, a cursus augue. Ut molestie fermentum eros at finibus. Nullam sagittis sed ipsum sed finibus. Nullam sed condimentum nibh. Aenean tristique, justo et dictum luctus, lorem libero venenatis nisl, sit amet efficitur nibh velit sed arcu. Suspendisse ultricies ipsum in elit ullamcorper mollis. Curabitur porta, neque non accumsan efficitur, massa ex pulvinar elit, eget dapibus massa leo at justo.</p>','Let us know how we did'),(5,15,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','13cff315-1ba5-4990-be5d-177a8fb0f7fa','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae magna a lacus ultrices dictum ut non dui. Morbi consequat ligula vitae urna volutpat hendrerit. Sed suscipit hendrerit nulla sit amet semper. Nulla maximus porttitor erat, ut faucibus lacus imperdiet malesuada. Aliquam lectus diam, bibendum quis tempor nec, convallis non ligula. Nam turpis enim, porta sed dui quis, faucibus rutrum neque. <a href=\"tel:8005555555\">(800) 555-5555.</a></p>','Schedule your repair'),(6,16,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','4949589d-a76c-4d92-956e-d506cd8fa3ea','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lacus metus, venenatis a malesuada in, porttitor quis ligula. <strong>Praesent cursus sapien lectus, sed cursus</strong> lorem porttitor et. Mauris tincidunt scelerisque arcu sit amet finibus. In blandit nunc sit amet urna faucibus, in mattis metus dignissim. Maecenas tempor dui nec sagittis aliquam. Vivamus ultricies in massa quis suscipit. Quisque massa augue, posuere vitae ultrices id, aliquam eu odio. Etiam egestas suscipit suscipit. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>','Meet your technician'),(7,17,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','8a6ca312-000a-400c-9a4c-3df2fbc694d8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id odio at nisl vehicula ornare eget tempus purus. Aliquam id molestie velit, auctor dictum libero. Nullam quis sapien tortor. Nullam consequat placerat lacus non dictum. Phasellus scelerisque nisl et mauris venenatis, dapibus malesuada neque congue. Vestibulum eget elit elementum, malesuada orci eu, consectetur sem. Etiam rutrum, diam ut rutrum tempus, est sem tincidunt magna, eu pharetra magna tortor eget mi. Nulla condimentum in tortor vel suscipit. Vestibulum ultrices fermentum orci, quis dapibus orci sagittis non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In ac tellus ex. Donec rutrum rhoncus eleifend. Sed vel varius nunc.</p>','Get your system working again'),(8,18,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','cf0de88d-4f4d-4ec5-ba78-936f33e558bf','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec lectus vitae massa eleifend sollicitudin. Sed est nibh, tincidunt vel nibh varius, posuere sodales lacus. Vestibulum tempor tempus purus, id hendrerit est sollicitudin in. Praesent at scelerisque erat, a cursus augue. Ut molestie fermentum eros at finibus. Nullam sagittis sed ipsum sed finibus. Nullam sed condimentum nibh. Aenean tristique, justo et dictum luctus, lorem libero venenatis nisl, sit amet efficitur nibh velit sed arcu. Suspendisse ultricies ipsum in elit ullamcorper mollis. Curabitur porta, neque non accumsan efficitur, massa ex pulvinar elit, eget dapibus massa leo at justo.</p>','Let us know how we did');
/*!40000 ALTER TABLE `matrixcontent_stepfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','cfa37de6-5231-4630-9e22-3e9273727277'),(2,NULL,'app','m150403_183908_migrations_table_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4221da2b-10d4-405e-9576-043941c069bc'),(3,NULL,'app','m150403_184247_plugins_table_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','17dc52f3-a209-47c3-81c0-d87c1a24ce4a'),(4,NULL,'app','m150403_184533_field_version','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a8ad4107-f493-4927-898e-2081d8e9fa79'),(5,NULL,'app','m150403_184729_type_columns','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ffad5be6-fb18-44bc-bc93-9e5d910ea43e'),(6,NULL,'app','m150403_185142_volumes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','de4fbd15-790e-40fc-a65d-625f75ddcd61'),(7,NULL,'app','m150428_231346_userpreferences','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3df6faee-52c4-44fd-b909-1583253e3910'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a929a410-cf82-47e0-80cb-60d4992da561'),(9,NULL,'app','m150617_213829_update_email_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4020c3a4-1928-4507-a0b0-112994e52c60'),(10,NULL,'app','m150721_124739_templatecachequeries','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4a2dd1e1-8885-4c59-bf65-d044a37439cf'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','57cbd205-b0f6-4fd0-b348-2a0d3d506509'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c0f9400e-94bc-44ba-be8b-59692b45010c'),(13,NULL,'app','m151002_095935_volume_cache_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','97b38ab7-a7e0-488a-8559-7e217f830d56'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','9dcafcd3-ceb1-400f-83d9-ece6fd2e4377'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','896f38d0-6713-477b-97c0-6453493c9090'),(16,NULL,'app','m151209_000000_move_logo','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c391effa-1ae2-4b84-8895-7bedae8d632e'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','8421fb10-a86a-480a-82ab-824a9d875031'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','d458f123-4573-49ec-b071-f3b78dd05f45'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','8014fd6f-0207-47e5-a0ff-9482c91e133c'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','8dce620b-8ad1-4529-848e-389cf51fc33c'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','f057f38a-ff01-4845-9890-89d037c23763'),(22,NULL,'app','m160727_194637_column_cleanup','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a7e50dbc-7ce1-4ccc-bb5b-c23ca1c36148'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','04812ff6-bdd5-44ef-9bb7-faa5d825d086'),(24,NULL,'app','m160807_144858_sites','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ba217ed3-21f9-4e9f-8b8c-9c22320b30e9'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','18b8ef27-5c61-45bf-8976-9ae48e0ac9a7'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','575ee857-97bf-423c-848f-0bf0ffed26d8'),(27,NULL,'app','m160912_230520_require_entry_type_id','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','df08104d-f3b0-458c-93e7-f9d3b8fa689b'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6e92f08d-6553-49bb-990d-bb080bfbf438'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a68854d0-7c32-4d26-8c34-aa100a9edd88'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6fde42fb-e86c-4583-afca-76c7212285ff'),(31,NULL,'app','m160925_113941_route_uri_parts','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6b0da924-21c4-45c5-bede-e19858ec212a'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','dbf86eef-3ba6-4eb3-81a9-c3ba93841131'),(33,NULL,'app','m161007_130653_update_email_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c72c2586-3195-4664-90c7-0ba64412f8af'),(34,NULL,'app','m161013_175052_newParentId','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','cfba7c86-05a5-4222-90c8-8195c9edf928'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2e3653c9-947f-43d2-885b-8568bd4c20e5'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ff267091-769b-41bc-9701-408741d66a4d'),(37,NULL,'app','m161025_000000_fix_char_columns','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','f1ee831e-fd50-4f54-80cc-5fd8988d3564'),(38,NULL,'app','m161029_124145_email_message_languages','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','679bb477-4fb7-4e92-871b-ea58a911d4c8'),(39,NULL,'app','m161108_000000_new_version_format','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1960cb12-1936-4513-8d36-962f60928968'),(40,NULL,'app','m161109_000000_index_shuffle','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','d54d3b56-026a-4b6d-b617-d6c24aa9809f'),(41,NULL,'app','m161122_185500_no_craft_app','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1d40dc1b-d3b1-4c77-b34f-da59388e6eab'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2c450dad-ecb7-438d-8f3e-24ef884bae7e'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','eedf59d5-e5a6-4ae3-84b5-2ede71bb7dc1'),(44,NULL,'app','m170114_161144_udates_permission','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6b36ea03-6586-4b7b-8a09-5b3151d011c3'),(45,NULL,'app','m170120_000000_schema_cleanup','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','db6a12bb-720c-4fb7-b279-e90afbc35a0b'),(46,NULL,'app','m170126_000000_assets_focal_point','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4adaf4b1-f40e-44b4-ae2b-6fa245b67ca2'),(47,NULL,'app','m170206_142126_system_name','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c52a14bc-e652-4f27-af13-0f343d20ccd3'),(48,NULL,'app','m170217_044740_category_branch_limits','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b2bf10ff-7fe3-42b2-a6a9-a91877baff2e'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','acaea82d-6d8f-40f0-a492-f325d92c8701'),(50,NULL,'app','m170223_224012_plain_text_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','27072a20-6bce-4851-a75b-22595c53b9b3'),(51,NULL,'app','m170227_120814_focal_point_percentage','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','887e4409-52cf-4206-aadc-f2c936651d9c'),(52,NULL,'app','m170228_171113_system_messages','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','31dc7344-5085-46dd-8f06-361c462548a4'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1e756105-6be2-4009-b791-759baf1b0210'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','5a2a729b-b66f-446f-bdc0-81da4371c063'),(55,NULL,'app','m170523_190652_element_field_layout_ids','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','845d9fdb-c8db-4b22-a87c-ef03be528f19'),(56,NULL,'app','m170612_000000_route_index_shuffle','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a9395a22-6e66-4b67-bec9-dcec4393c030'),(57,NULL,'app','m170621_195237_format_plugin_handles','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','785392b1-0c18-4636-9837-e7c364d9c4ba'),(58,NULL,'app','m170630_161027_deprecation_line_nullable','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','5440eba7-8595-4cfe-a5e3-94dbc21d917d'),(59,NULL,'app','m170630_161028_deprecation_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3ac246a8-c57d-44a1-8200-ebe4cacc3cef'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2d580dca-059b-44c5-84a5-f249023bef09'),(61,NULL,'app','m170704_134916_sites_tables','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','269b4ed8-b533-4b66-95e7-bb5c430986b2'),(62,NULL,'app','m170706_183216_rename_sequences','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','0346916b-38a9-4b69-b1dc-d162705b6e7f'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4a78ee6a-a0ea-4919-8925-c1c133232cf6'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4b9782f9-ca53-4a23-b531-91a114f3b0c8'),(65,NULL,'app','m170810_201318_create_queue_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6f7dc132-44d2-4219-bb57-1d5f1f912ee2'),(66,NULL,'app','m170903_192801_longblob_for_queue_jobs','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4b609406-5110-4ab4-8560-a43d0993de9e'),(67,NULL,'app','m170914_204621_asset_cache_shuffle','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','20bac924-d04b-465a-b53b-9b2195a24bf8'),(68,NULL,'app','m171011_214115_site_groups','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','e5408532-2e8f-4f69-a4fd-41d72e45fe93'),(69,NULL,'app','m171012_151440_primary_site','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3e03bd42-35c4-47a6-9a96-38e078dc9ac4'),(70,NULL,'app','m171013_142500_transform_interlace','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','5a054bd0-b581-49b4-afac-41dc06987850'),(71,NULL,'app','m171016_092553_drop_position_select','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','22a659d4-9a5e-4b8e-a99f-326c3dafa943'),(72,NULL,'app','m171016_221244_less_strict_translation_method','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b1d23adf-3f00-45c4-ad08-41aad8ddb41d'),(73,NULL,'app','m171107_000000_assign_group_permissions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','63d238fb-c330-499c-a641-b4052d6ca9d0'),(74,NULL,'app','m171117_000001_templatecache_index_tune','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','36b1bbdb-a888-412b-9542-6cd6f1bb4b1a'),(75,NULL,'app','m171126_105927_disabled_plugins','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','48e1c713-2c85-4624-a2b7-95c4cb224869'),(76,NULL,'app','m171130_214407_craftidtokens_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','15ee29ee-c9fa-4a06-ae89-5bc75c6e143f'),(77,NULL,'app','m171202_004225_update_email_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c99317f1-e0ff-4d4c-8109-b237386fa90d'),(78,NULL,'app','m171204_000001_templatecache_index_tune_deux','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b5515f63-4eb8-4da8-8770-4b1cec3ac984'),(79,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2b6621c4-ea7d-4fcd-beb5-fdc980166e78'),(80,NULL,'app','m171218_143135_longtext_query_column','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','00216945-df58-420f-bce6-711313db7960'),(81,NULL,'app','m171231_055546_environment_variables_to_aliases','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c80850e3-40a0-445d-bdb7-46613a80ec9a'),(82,NULL,'app','m180113_153740_drop_users_archived_column','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','806cb432-0390-457f-809b-a1982b4a2b47'),(83,NULL,'app','m180122_213433_propagate_entries_setting','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','f3e9480c-0144-404f-900d-b8d8f264e747'),(84,NULL,'app','m180124_230459_fix_propagate_entries_values','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2049cab2-fed7-4802-be77-288f03dca508'),(85,NULL,'app','m180128_235202_set_tag_slugs','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','0a4ea1e5-b890-4ec4-a123-1097d429bc8c'),(86,NULL,'app','m180202_185551_fix_focal_points','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b5b96c0f-ee09-4b22-96f1-f3cec14ec7ed'),(87,NULL,'app','m180217_172123_tiny_ints','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','626ef4d5-5aa4-4405-9300-56e614bac866'),(88,NULL,'app','m180321_233505_small_ints','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','452aa1f4-2756-49f7-86df-e432eede70f1'),(89,NULL,'app','m180328_115523_new_license_key_statuses','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','97d9b33e-5dfe-4d1f-b456-835150c8e8d9'),(90,NULL,'app','m180404_182320_edition_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b1477c8c-e8d3-4a6b-8dcf-1a508592a825'),(91,NULL,'app','m180411_102218_fix_db_routes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ce3e7eb9-8bdd-49b6-b12e-9efc8a08b4d7'),(92,NULL,'app','m180416_205628_resourcepaths_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','00589d2d-7ab1-4c60-941d-4517a986d5a7'),(93,NULL,'app','m180418_205713_widget_cleanup','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','7670410c-be64-4b7c-be1c-64795ed6c0f2'),(94,NULL,'app','m180425_203349_searchable_fields','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4b4350e5-602b-4418-9753-7da3a77e7839'),(95,NULL,'app','m180516_153000_uids_in_field_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','5ca3a43a-9cbb-470e-af5c-14598267bad0'),(96,NULL,'app','m180517_173000_user_photo_volume_to_uid','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','9fbffef3-c1d4-474b-aefe-d34b13ac30f5'),(97,NULL,'app','m180518_173000_permissions_to_uid','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','83fac583-e257-423b-b7b7-37e568397885'),(98,NULL,'app','m180520_173000_matrix_context_to_uids','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','37d1f590-811c-4351-9cc1-3d55c10518c1'),(99,NULL,'app','m180521_172900_project_config_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2d192eec-0c4a-4e55-a96d-fef49f2b765f'),(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','99fe9148-34b1-401d-a897-3d0daf829e5a'),(101,NULL,'app','m180731_162030_soft_delete_sites','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','df377bf0-6c09-4b72-934f-7a9092f229dc'),(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','b794cd5c-0b75-49c6-b7e3-a202c027e3f5'),(103,NULL,'app','m180810_214439_soft_delete_elements','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','353d8107-bf8d-4dbe-8d81-1e7bc7d32f53'),(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','fab9097f-f7dc-4f0f-88b8-df4959a68853'),(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','6a5f5de5-9ece-4b6d-ae40-8e066544b84c'),(106,NULL,'app','m180904_112109_permission_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','61ed1dea-8ed1-4833-8c9d-09071bd2979b'),(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','dac39e0c-1929-47cd-bd7a-05b6656f3668'),(108,NULL,'app','m181011_160000_soft_delete_asset_support','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ba019936-46ff-40eb-ac73-072eace8e108'),(109,NULL,'app','m181016_183648_set_default_user_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','58605919-6866-4bfc-bf45-4d9954ad8596'),(110,NULL,'app','m181017_225222_system_config_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','80c0065a-493e-44be-bc42-9fa419593497'),(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','71a8089d-e466-4543-a35a-a2f933853878'),(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1e284ed0-78aa-438f-9862-2e4c6ac053a7'),(113,NULL,'app','m181112_203955_sequences_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','e2cb2ccc-f906-4818-b301-c7b874b8a0b9'),(114,NULL,'app','m181121_001712_cleanup_field_configs','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','df2b53f4-ee62-446d-b626-417930f848ae'),(115,NULL,'app','m181128_193942_fix_project_config','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a07ebd4f-2381-402e-a6bc-7e5a8e84fa5e'),(116,NULL,'app','m181130_143040_fix_schema_version','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c776de3f-e70f-43a2-89f4-ce55dbe4fb2d'),(117,NULL,'app','m181211_143040_fix_entry_type_uids','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','d16f7f80-d245-4aca-bf5e-48107041c75a'),(118,NULL,'app','m181213_102500_config_map_aliases','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a26ff337-9e24-43c8-beea-7925c0543705'),(119,NULL,'app','m181217_153000_fix_structure_uids','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','e669cd72-9f9c-442d-a1e5-150374f43714'),(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','7ec3c040-8fe2-447f-a474-cc48afa9586d'),(121,NULL,'app','m190108_110000_cleanup_project_config','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','8dc89602-74b6-436b-8188-33f5ab99a744'),(122,NULL,'app','m190108_113000_asset_field_setting_change','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4bc76a77-8cfd-41e5-892f-70b93fdc879f'),(123,NULL,'app','m190109_172845_fix_colspan','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','45bc4fbc-6f57-43c2-bad5-3a64a8e641de'),(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3c4fbf8a-2d83-4990-8f56-0fc7ce782414'),(125,NULL,'app','m190110_214819_soft_delete_volumes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','8fe4cd34-e400-4daf-842c-289f8d76192a'),(126,NULL,'app','m190112_124737_fix_user_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','404e7f89-80e1-4123-97d8-90e3785df643'),(127,NULL,'app','m190112_131225_fix_field_layouts','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3b4c0918-51dc-484f-8cec-751ad3984ed9'),(128,NULL,'app','m190112_201010_more_soft_deletes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','05ba68a4-d84e-4995-b36d-2b0dd0784865'),(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','2d42f0b1-34a7-46e2-8d7d-769ccbe5ea11'),(130,NULL,'app','m190121_120000_rich_text_config_setting','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','54bfc795-387e-4c84-a4ff-782d82776c0b'),(131,NULL,'app','m190125_191628_fix_email_transport_password','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','c1bf1606-ff67-4068-ad12-bdeac9bdbcf1'),(132,NULL,'app','m190128_181422_cleanup_volume_folders','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','eec34648-fc1d-4b7c-a85d-d501eb68ae36'),(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','be1ce2e5-5a35-467d-923a-6d8fb3829323'),(134,NULL,'app','m190208_140000_reset_project_config_mapping','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','cc8b6258-6ff5-46a0-a2ed-646bd07d5179'),(135,NULL,'app','m190218_143000_element_index_settings_uid','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','3e307a5d-745a-4bf2-b568-828a557a3433'),(136,NULL,'app','m190312_152740_element_revisions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','fa43d301-4c8c-460c-b753-e249765f4a2b'),(137,NULL,'app','m190327_235137_propagation_method','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','734ecaba-bd54-45dc-80bf-77a3121ea8f9'),(138,NULL,'app','m190401_223843_drop_old_indexes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','13e3c24f-9f91-4ea4-8141-4103772c56f0'),(139,NULL,'app','m190416_014525_drop_unique_global_indexes','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ebf13bc7-2eb3-417d-b591-91d9702f4ec9'),(140,NULL,'app','m190417_085010_add_image_editor_permissions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','aac13c57-02b8-49e4-961a-2274beb71aee'),(141,NULL,'app','m190502_122019_store_default_user_group_uid','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','507b9a14-1eca-40c7-a4ca-02f2f51e06ec'),(142,NULL,'app','m190504_150349_preview_targets','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','418d9f74-574d-49e0-938e-4b5fa3770b2a'),(143,NULL,'app','m190516_184711_job_progress_label','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','356135d9-7fd0-4bcb-896a-878dc4959247'),(144,NULL,'app','m190523_190303_optional_revision_creators','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','d36583e3-fbd4-4245-b234-adf8c673a784'),(145,NULL,'app','m190529_204501_fix_duplicate_uids','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4a257523-67d0-496f-aee1-f6a5ad2d9df5'),(146,NULL,'app','m190605_223807_unsaved_drafts','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','a69ff0cb-84d1-46ab-be00-169c98a70b65'),(147,NULL,'app','m190607_230042_entry_revision_error_tables','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','01c6435b-4347-4d2a-b10e-a2637865411e'),(148,NULL,'app','m190608_033429_drop_elements_uid_idx','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','4463a488-afdd-4c7b-b86a-ddf0698f07f3'),(149,NULL,'app','m190617_164400_add_gqlschemas_table','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','077b12ba-60aa-443c-b61d-345e9fd16fca'),(150,NULL,'app','m190624_234204_matrix_propagation_method','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','518eddb5-6986-42c3-955c-194d92cb39ad'),(151,NULL,'app','m190711_153020_drop_snapshots','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1f53d6ee-2b35-4f07-befb-b2d8a9142dcc'),(152,NULL,'app','m190712_195914_no_draft_revisions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','00f07d3b-bdb7-478f-bdee-20983e954bf5'),(153,NULL,'app','m190723_140314_fix_preview_targets_column','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','5c1a123b-258a-4613-ac3f-7d1605d96727'),(154,NULL,'app','m190820_003519_flush_compiled_templates','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','7498847b-48a1-494d-981f-7e5dbfd66e90'),(155,NULL,'app','m190823_020339_optional_draft_creators','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','01531fa2-8607-4921-983a-faddedbd15ae'),(156,NULL,'app','m190913_152146_update_preview_targets','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','40ee1413-e4c4-4caa-9fec-cfdf24b1eba8'),(157,NULL,'app','m191107_122000_add_gql_project_config_support','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','ed834487-0d4d-43d7-a509-ae10a5acf42f'),(158,NULL,'app','m191204_085100_pack_savable_component_settings','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','e511db8c-e414-4409-a65e-91ed09180b05'),(159,NULL,'app','m191206_001148_change_tracking','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','f0276d35-f6f4-4e93-872b-804292cf793e'),(160,NULL,'app','m191216_191635_asset_upload_tracking','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','cb0b2322-42dc-4ad6-bc4e-98ecf7d377b2'),(161,NULL,'app','m191222_002848_peer_asset_permissions','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','1c307c62-a8ec-4d08-8193-350b31acdb8b'),(162,NULL,'app','m200127_172522_queue_channels','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','27c8ebd0-aff7-47db-ade8-00f93fe2b5f6'),(163,NULL,'app','m200211_175048_truncate_element_query_cache','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','be1cee47-574b-48f3-b46a-f5ee996b1663'),(164,NULL,'app','m200213_172522_new_elements_index','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','718692aa-9d3c-469c-952d-36e03379b222'),(165,NULL,'app','m200228_195211_long_deprecation_messages','2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:46','0061e7e0-ccb9-4dfb-b35e-c19c4e19eee3'),(166,1,'plugin','m180430_204710_remove_old_plugins','2020-05-06 23:33:49','2020-05-06 23:33:49','2020-05-06 23:33:49','27183dc3-9005-4ac1-852a-68be68dc7c5a'),(167,1,'plugin','Install','2020-05-06 23:33:49','2020-05-06 23:33:49','2020-05-06 23:33:49','aa7f31d3-5e94-4bce-9dba-0e2970a01f9a'),(168,1,'plugin','m190225_003922_split_cleanup_html_settings','2020-05-06 23:33:49','2020-05-06 23:33:49','2020-05-06 23:33:49','8d92e5a0-3636-42ec-94d3-96bb374f7fe0');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.6.1','2.3.0','unknown',NULL,'2020-05-06 23:33:49','2020-05-06 23:33:49','2020-05-06 23:33:50','d07a7531-f8bc-4360-89fd-eef1b06b782c');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1588809276'),('email.fromEmail','\"jason.mekelburg@gmail.com\"'),('email.fromName','\"Server\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.62330c7a-b634-486b-845b-e4f1f3c87039.name','\"Common\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.contentColumnType','\"string(400)\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.fieldGroup','\"62330c7a-b634-486b-845b-e4f1f3c87039\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.handle','\"pageHeader\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.instructions','\"The header for the page.\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.name','\"Page Header\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.searchable','true'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.byteLimit','null'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.charLimit','100'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.code','\"\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.columnType','null'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.initialRows','\"1\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.multiline','\"1\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.settings.placeholder','\"\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.translationKeyFormat','null'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.translationMethod','\"none\"'),('fields.11f3eec8-d866-4812-9600-c3e7239f2456.type','\"craft\\\\fields\\\\PlainText\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.contentColumnType','\"string(400)\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.fieldGroup','\"62330c7a-b634-486b-845b-e4f1f3c87039\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.handle','\"pageTitle\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.instructions','\"The title for the page.\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.name','\"Page Title\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.searchable','true'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.byteLimit','null'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.charLimit','100'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.code','\"\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.columnType','null'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.initialRows','\"1\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.multiline','\"1\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.settings.placeholder','\"\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.translationKeyFormat','null'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.translationMethod','\"none\"'),('fields.147962d7-4669-4037-a9ad-5ebaaf92edea.type','\"craft\\\\fields\\\\PlainText\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.contentColumnType','\"string\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.fieldGroup','\"62330c7a-b634-486b-845b-e4f1f3c87039\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.handle','\"stepFields\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.instructions','\"The fields for each step.\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.name','\"Step Fields\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.searchable','true'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.settings.contentTable','\"{{%matrixcontent_stepfields}}\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.settings.maxBlocks','\"\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.settings.minBlocks','\"\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.settings.propagationMethod','\"all\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.translationKeyFormat','null'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.translationMethod','\"site\"'),('fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.type','\"craft\\\\fields\\\\Matrix\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.field','\"f04b5ad2-981e-45e6-b94d-d2e10bc572dc\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.6552f36d-0246-424a-a1c5-30be794211b9.required','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.6552f36d-0246-424a-a1c5-30be794211b9.sortOrder','3'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.required','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.sortOrder','2'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.e9bf0305-355b-4209-af1d-d497d3057209.required','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.fields.e9bf0305-355b-4209-af1d-d497d3057209.sortOrder','1'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.name','\"Content\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fieldLayouts.c8378163-3e4a-47a0-b538-59f4e919e3c4.tabs.0.sortOrder','1'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.contentColumnType','\"text\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.fieldGroup','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.handle','\"stepText\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.instructions','\"The text for the step.\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.name','\"Step Text\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.searchable','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.availableTransforms','\"*\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.availableVolumes','\"*\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.cleanupHtml','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.columnType','\"text\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.purifierConfig','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.purifyHtml','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.redactorConfig','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.removeNbsp','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.showUnpermittedFiles','false'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.translationKeyFormat','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.translationMethod','\"none\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.6552f36d-0246-424a-a1c5-30be794211b9.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.contentColumnType','\"string(400)\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.fieldGroup','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.handle','\"stepTitle\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.instructions','\"The title for the step.\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.name','\"Step Title\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.searchable','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.byteLimit','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.charLimit','100'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.code','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.columnType','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.initialRows','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.multiline','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.settings.placeholder','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.translationKeyFormat','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.translationMethod','\"none\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.965eb1ad-93dc-4741-8ad7-6a4e33e625c4.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.contentColumnType','\"string\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.fieldGroup','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.handle','\"stepImage\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.instructions','\"The image for the step.\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.name','\"Step Image\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.searchable','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.defaultUploadLocationSource','\"volume:6a026e42-bfc3-4593-9a23-3b1c33212d54\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.limit','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.localizeRelations','false'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.restrictFiles','\"1\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.selectionLabel','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.showUnpermittedFiles','false'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.singleUploadLocationSource','\"volume:6a026e42-bfc3-4593-9a23-3b1c33212d54\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.source','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.sources','\"*\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.targetSiteId','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.useSingleFolder','true'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.validateRelatedElements','\"\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.settings.viewMode','\"list\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.translationKeyFormat','null'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.translationMethod','\"site\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.fields.e9bf0305-355b-4209-af1d-d497d3057209.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.handle','\"stepContent\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.name','\"Step Content\"'),('matrixBlockTypes.cb2b34e9-80ea-421e-a271-9fe7d6d995e8.sortOrder','1'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.enableVersioning','true'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.11f3eec8-d866-4812-9600-c3e7239f2456.required','false'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.11f3eec8-d866-4812-9600-c3e7239f2456.sortOrder','2'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.147962d7-4669-4037-a9ad-5ebaaf92edea.required','false'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.147962d7-4669-4037-a9ad-5ebaaf92edea.sortOrder','1'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.required','false'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.fields.f04b5ad2-981e-45e6-b94d-d2e10bc572dc.sortOrder','3'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.name','\"Common\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.fieldLayouts.cd589018-bce0-49ea-8a8e-e7e2ee449ef6.tabs.0.sortOrder','1'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.handle','\"home\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.hasTitleField','false'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.name','\"Home\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.sortOrder','1'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.titleFormat','\"{section.name|raw}\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.entryTypes.167a7fef-411f-48be-88b3-7760de19f4b7.titleLabel','\"\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.handle','\"home\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.name','\"Home\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.propagationMethod','\"all\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.siteSettings.00677e57-c3a3-42e5-b456-36e65fed8f59.enabledByDefault','true'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.siteSettings.00677e57-c3a3-42e5-b456-36e65fed8f59.hasUrls','true'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.siteSettings.00677e57-c3a3-42e5-b456-36e65fed8f59.template','\"_singles/home\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.siteSettings.00677e57-c3a3-42e5-b456-36e65fed8f59.uriFormat','\"__home__\"'),('sections.d1283d8a-198e-4865-91bb-52ebe00e76c7.type','\"single\"'),('siteGroups.5e4f79e1-142d-4de4-87ae-44bc08f2d95c.name','\"Server\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.baseUrl','\"$DEFAULT_SITE_URL\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.handle','\"default\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.hasUrls','true'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.language','\"en-US\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.name','\"Server\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.primary','true'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.siteGroup','\"5e4f79e1-142d-4de4-87ae-44bc08f2d95c\"'),('sites.00677e57-c3a3-42e5-b456-36e65fed8f59.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Server\"'),('system.schemaVersion','\"3.4.10\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.handle','\"images\"'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.hasUrls','true'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.name','\"Images\"'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.settings.path','\"@webroot/assets/images\"'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.sortOrder','1'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.type','\"craft\\\\volumes\\\\Local\"'),('volumes.6a026e42-bfc3-4593-9a23-3b1c33212d54.url','\"@web/assets/images\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,6,10,NULL,2,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','765d0b10-2f77-4e4c-9402-db89db5ace9f'),(2,6,11,NULL,3,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','b1ca6b18-81cb-4dc0-8d8b-b78cb0c85034'),(3,6,12,NULL,4,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','228a6d8b-aee7-4f4d-b105-40dbe70c3e6d'),(4,6,13,NULL,5,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','82a3822c-b473-403c-9b0e-7897e26e1cd7'),(5,6,15,NULL,2,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','a4122aae-fdc0-40e2-bdaa-356b272e43e2'),(6,6,16,NULL,3,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','4976b877-a1c7-4350-aea8-a3111e8e3302'),(7,6,17,NULL,4,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','d0d27a1a-fa0c-4407-86c2-c21fdb423139'),(8,6,18,NULL,5,1,'2020-05-06 23:53:42','2020-05-06 23:53:42','872bec6d-5ca4-4975-ab10-fe232d8286fc');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('26a94552','@bower/jquery/dist'),('27b6c578','@craft/redactor/assets/field/dist'),('2973a37b','@app/web/assets/tablesettings/dist'),('2b011dc7','@lib/jquery.payment'),('3726b22f','@lib/velocity'),('3b39c40b','@app/web/assets/feed/dist'),('42228fb5','@app/web/assets/cp/dist'),('591ac29e','@app/web/assets/pluginstore/dist'),('5aec58f8','@vendor/craftcms/redactor/lib/redactor'),('5eb3cab6','@lib/vue'),('5f6fa838','@app/web/assets/recententries/dist'),('61d5ea56','@app/web/assets/updateswidget/dist'),('6f474697','@app/web/assets/craftsupport/dist'),('7180b869','@app/web/assets/updater/dist'),('735869c3','@lib/axios'),('798f298a','@lib/jquery-ui'),('812fc1f9','@app/web/assets/dashboard/dist'),('825d9a3c','@lib/fabric'),('8648efb7','@app/web/assets/fields/dist'),('939eea7','@lib/element-resize-detector'),('971b4e02','@lib/garnishjs'),('a18903f9','@app/web/assets/editentry/dist'),('a4a65984','@lib/d3'),('aa0379d5','@lib/picturefill'),('ada74517','@lib/jquery-touch-events'),('aeab21cd','@app/web/assets/matrix/dist'),('af214f9e','@lib/prismjs'),('af39064','@app/web/assets/matrixsettings/dist'),('b2eb782b','@lib/fileupload'),('c3e48cea','@app/web/assets/plugins/dist'),('c9db47d2','@app/web/assets/editsection/dist'),('cbee48ae','@lib/timepicker'),('dfea05a9','@app/web/assets/admintable/dist'),('f41110db','@lib/xregexp'),('fe7d5451','@lib/selectize');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,6,1,1,NULL),(2,6,1,2,NULL),(3,6,1,3,NULL),(4,6,1,4,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' jtmek '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' jason mekelburg gmail com '),(1,'slug',0,1,''),(2,'kind',0,1,' image '),(2,'extension',0,1,' jpg '),(2,'filename',0,1,' step1 jpg '),(3,'kind',0,1,' image '),(3,'extension',0,1,' jpg '),(3,'filename',0,1,' step2 jpg '),(4,'kind',0,1,' image '),(4,'extension',0,1,' jpg '),(4,'filename',0,1,' step3 jpg '),(5,'kind',0,1,' image '),(5,'extension',0,1,' jpg '),(5,'filename',0,1,' step4 jpg '),(3,'slug',0,1,''),(3,'title',0,1,' step 2 '),(5,'slug',0,1,''),(5,'title',0,1,' step 4 '),(4,'slug',0,1,''),(4,'title',0,1,' step 3 '),(2,'slug',0,1,''),(2,'title',0,1,' step 1 '),(6,'slug',0,1,' home '),(6,'title',0,1,' home '),(10,'slug',0,1,''),(10,'field',6,1,' step 1 '),(10,'field',5,1,' schedule your repair '),(10,'field',4,1,' lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse vitae magna a lacus ultrices dictum ut non dui morbi consequat ligula vitae urna volutpat hendrerit sed suscipit hendrerit nulla sit amet semper nulla maximus porttitor erat ut faucibus lacus imperdiet malesuada aliquam lectus diam bibendum quis tempor nec convallis non ligula nam turpis enim porta sed dui quis faucibus rutrum neque 800 555 5555 '),(11,'slug',0,1,''),(11,'field',6,1,' step 2 '),(11,'field',5,1,' meet your technician '),(11,'field',4,1,' lorem ipsum dolor sit amet consectetur adipiscing elit integer lacus metus venenatis a malesuada in porttitor quis ligula praesent cursus sapien lectus sed cursus lorem porttitor et mauris tincidunt scelerisque arcu sit amet finibus in blandit nunc sit amet urna faucibus in mattis metus dignissim maecenas tempor dui nec sagittis aliquam vivamus ultricies in massa quis suscipit quisque massa augue posuere vitae ultrices id aliquam eu odio etiam egestas suscipit suscipit interdum et malesuada fames ac ante ipsum primis in faucibus '),(12,'slug',0,1,''),(12,'field',6,1,' step 3 '),(12,'field',5,1,' get your system working again '),(12,'field',4,1,' lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse id odio at nisl vehicula ornare eget tempus purus aliquam id molestie velit auctor dictum libero nullam quis sapien tortor nullam consequat placerat lacus non dictum phasellus scelerisque nisl et mauris venenatis dapibus malesuada neque congue vestibulum eget elit elementum malesuada orci eu consectetur sem etiam rutrum diam ut rutrum tempus est sem tincidunt magna eu pharetra magna tortor eget mi nulla condimentum in tortor vel suscipit vestibulum ultrices fermentum orci quis dapibus orci sagittis non class aptent taciti sociosqu ad litora torquent per conubia nostra per inceptos himenaeos in ac tellus ex donec rutrum rhoncus eleifend sed vel varius nunc '),(13,'slug',0,1,''),(13,'field',6,1,' step 4 '),(13,'field',5,1,' let us know how we did '),(13,'field',4,1,' lorem ipsum dolor sit amet consectetur adipiscing elit quisque nec lectus vitae massa eleifend sollicitudin sed est nibh tincidunt vel nibh varius posuere sodales lacus vestibulum tempor tempus purus id hendrerit est sollicitudin in praesent at scelerisque erat a cursus augue ut molestie fermentum eros at finibus nullam sagittis sed ipsum sed finibus nullam sed condimentum nibh aenean tristique justo et dictum luctus lorem libero venenatis nisl sit amet efficitur nibh velit sed arcu suspendisse ultricies ipsum in elit ullamcorper mollis curabitur porta neque non accumsan efficitur massa ex pulvinar elit eget dapibus massa leo at justo '),(6,'field',2,1,' process '),(6,'field',1,1,' your ac repair in 4 easy steps '),(6,'field',3,1,' lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse vitae magna a lacus ultrices dictum ut non dui morbi consequat ligula vitae urna volutpat hendrerit sed suscipit hendrerit nulla sit amet semper nulla maximus porttitor erat ut faucibus lacus imperdiet malesuada aliquam lectus diam bibendum quis tempor nec convallis non ligula nam turpis enim porta sed dui quis faucibus rutrum neque 800 555 5555 step 1 schedule your repair lorem ipsum dolor sit amet consectetur adipiscing elit integer lacus metus venenatis a malesuada in porttitor quis ligula praesent cursus sapien lectus sed cursus lorem porttitor et mauris tincidunt scelerisque arcu sit amet finibus in blandit nunc sit amet urna faucibus in mattis metus dignissim maecenas tempor dui nec sagittis aliquam vivamus ultricies in massa quis suscipit quisque massa augue posuere vitae ultrices id aliquam eu odio etiam egestas suscipit suscipit interdum et malesuada fames ac ante ipsum primis in faucibus step 2 meet your technician lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse id odio at nisl vehicula ornare eget tempus purus aliquam id molestie velit auctor dictum libero nullam quis sapien tortor nullam consequat placerat lacus non dictum phasellus scelerisque nisl et mauris venenatis dapibus malesuada neque congue vestibulum eget elit elementum malesuada orci eu consectetur sem etiam rutrum diam ut rutrum tempus est sem tincidunt magna eu pharetra magna tortor eget mi nulla condimentum in tortor vel suscipit vestibulum ultrices fermentum orci quis dapibus orci sagittis non class aptent taciti sociosqu ad litora torquent per conubia nostra per inceptos himenaeos in ac tellus ex donec rutrum rhoncus eleifend sed vel varius nunc step 3 get your system working again lorem ipsum dolor sit amet consectetur adipiscing elit quisque nec lectus vitae massa eleifend sollicitudin sed est nibh tincidunt vel nibh varius posuere sodales lacus vestibulum tempor tempus purus id hendrerit est sollicitudin in praesent at scelerisque erat a cursus augue ut molestie fermentum eros at finibus nullam sagittis sed ipsum sed finibus nullam sed condimentum nibh aenean tristique justo et dictum luctus lorem libero venenatis nisl sit amet efficitur nibh velit sed arcu suspendisse ultricies ipsum in elit ullamcorper mollis curabitur porta neque non accumsan efficitur massa ex pulvinar elit eget dapibus massa leo at justo step 4 let us know how we did ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all',NULL,'2020-05-06 23:46:48','2020-05-06 23:46:48',NULL,'d1283d8a-198e-4865-91bb-52ebe00e76c7');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','_singles/home',1,'2020-05-06 23:46:48','2020-05-06 23:46:48','48748a67-8580-47e0-b15c-aee04d4e1554');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'mwuTiGneI7uaCv5hsHzbqUr_UDhjShT0DG8vgnqKI0Fr08_JE1i_We8JY86NfbtRkUFV2FdRGjw-zo667b0E1BRiBZZads7ev4wO','2020-05-06 23:26:46','2020-05-06 23:55:09','00a4143d-a22b-45cd-a23e-b01d1bef77c0');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Server','2020-05-06 23:26:45','2020-05-06 23:26:45',NULL,'5e4f79e1-142d-4de4-87ae-44bc08f2d95c');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'Server','default','en-US',1,'$DEFAULT_SITE_URL',1,'2020-05-06 23:26:45','2020-05-06 23:26:45',NULL,'00677e57-c3a3-42e5-b456-36e65fed8f59');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jtmek',NULL,NULL,NULL,'jason.mekelburg@gmail.com','$2y$13$liiBfGGX7jxDL./1C/oDm.BwuP8VrzDe1INMF9N23kTsuwPW6Osaa',1,0,0,0,'2020-05-06 23:26:46',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2020-05-06 23:26:46','2020-05-06 23:26:46','2020-05-06 23:26:48','c8395957-5653-416d-95f3-c1506f6f7e67');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2020-05-06 23:43:33','2020-05-06 23:43:33','cdc7d6b3-f68d-4c0f-a752-5790a095fb46'),(2,NULL,NULL,'Temporary source',NULL,'2020-05-06 23:43:38','2020-05-06 23:43:38','83db214c-8c7e-4e3f-b2b7-a5303131c48e'),(3,2,NULL,'user_1','user_1/','2020-05-06 23:43:38','2020-05-06 23:43:38','6edd81e3-c5d6-41be-affe-edbb5cb21116');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,NULL,'Images','images','craft\\volumes\\Local',1,'@web/assets/images','{\"path\":\"@webroot/assets/images\"}',1,'2020-05-06 23:43:33','2020-05-06 23:43:33',NULL,'6a026e42-bfc3-4593-9a23-3b1c33212d54');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2020-05-06 23:26:48','2020-05-06 23:26:48','38da992e-6d90-4fba-8845-4c72a3dbfe6f'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-05-06 23:26:48','2020-05-06 23:26:48','30ba6419-23a7-4d8e-9842-10ed99a21b57'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-05-06 23:26:48','2020-05-06 23:26:48','f30d2f79-72ed-46e2-b0f7-e811ec2b2405'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-05-06 23:26:48','2020-05-06 23:26:48','dc2db158-4cdc-46ac-aed5-8c516bde5a0b');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 23:56:42
