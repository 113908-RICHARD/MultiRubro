-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('bc7bbbc8-2f4d-4f42-b814-3db92f1d082c','47f1296e-0047-4d11-ace0-e61aa8dae36d');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('083b3063-3fbc-4ba2-8e76-7621a6997cee',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','1083895a-752e-43f2-aacf-cb0cc2e20b1d',2,20,_binary '','92f0072a-5d2d-490e-a499-ade79b9584dc',NULL),('0a4b449e-9b19-4d32-a789-fa8d4226174e',NULL,'idp-review-profile','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','ae5fd1dc-31e5-474f-8a4e-9330b084d52e',0,10,_binary '\0',NULL,'3787893e-5cce-478d-9e0f-f3ff125a5e7b'),('0d3bb8fc-79a6-4860-85db-4683cee8a06e',NULL,'conditional-user-configured','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','0851e1c0-66a0-4134-a6ad-e0362fe1fc8e',0,10,_binary '\0',NULL,NULL),('0db54292-6225-4a3d-81f5-ba740361ccaa',NULL,'auth-username-password-form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','049f1c6d-b1d5-4948-b3c2-652a0c5502fb',0,10,_binary '\0',NULL,NULL),('0f78a95f-0f92-4041-855d-a1da64855e78',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','aabf65ca-f57c-45d6-9287-cfc2e82c8934',0,20,_binary '','1083895a-752e-43f2-aacf-cb0cc2e20b1d',NULL),('17a8feb8-d97c-42ad-bd64-f8f3895c029f',NULL,'auth-spnego','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','52e0a4b2-590c-48a7-a415-f6e8304ed33a',3,20,_binary '\0',NULL,NULL),('19aeab27-68fa-4efc-8eed-db1e0fe38292',NULL,'direct-grant-validate-username','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','91d5f20d-d389-41d0-8f37-98fd197e8f49',0,10,_binary '\0',NULL,NULL),('1b51169b-3e85-48af-a2e2-dee1da67ea6e',NULL,'registration-recaptcha-action','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','23da74f1-e00c-4442-81f9-3183a166de15',3,60,_binary '\0',NULL,NULL),('1da41f83-e1c8-4e9e-b44c-79666d80da14',NULL,'direct-grant-validate-password','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','91d5f20d-d389-41d0-8f37-98fd197e8f49',0,20,_binary '\0',NULL,NULL),('1f64c178-95c4-4f24-b7f7-485c30158828',NULL,'reset-otp','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','4554eb47-25b3-4180-898f-694855d4d206',0,20,_binary '\0',NULL,NULL),('22338060-c918-4d99-bbd8-cd69ba4b4caa',NULL,'auth-cookie','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','52e0a4b2-590c-48a7-a415-f6e8304ed33a',2,10,_binary '\0',NULL,NULL),('22a32e31-ed97-4541-876c-a7b250161222',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','2c219a00-d85f-44e6-b783-6d804a37ed94',2,20,_binary '','937676ea-a7a2-4a23-bcd6-6ac7848d2261',NULL),('2451ad9c-d554-4f09-be9e-894b18919b15',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','2892c39b-b36c-4d32-9089-25937707c0fb',1,20,_binary '','0851e1c0-66a0-4134-a6ad-e0362fe1fc8e',NULL),('246684df-ae55-409f-b6ab-464927222ffc',NULL,'auth-otp-form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','4080f6ae-10b3-4d65-bdf5-c9ca82f363e9',0,20,_binary '\0',NULL,NULL),('2b5f5f6e-36d0-48f8-9496-edd058806373',NULL,'auth-cookie','d853bfa0-17e0-4f82-8c5e-4e87c8901796','f831bb74-d013-46c4-b14b-0b861066628d',2,10,_binary '\0',NULL,NULL),('2b654942-2ef1-4430-8e12-49d95421dec2',NULL,'identity-provider-redirector','d853bfa0-17e0-4f82-8c5e-4e87c8901796','f831bb74-d013-46c4-b14b-0b861066628d',2,25,_binary '\0',NULL,NULL),('2ee4fa5c-fdd0-46de-8b48-0b932b13e2c4',NULL,'client-secret','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d4245255-f9fb-4d5d-9a51-9292e9a18eee',2,10,_binary '\0',NULL,NULL),('34aec473-827c-4a7c-b819-070018ae841f',NULL,'registration-password-action','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','23da74f1-e00c-4442-81f9-3183a166de15',0,50,_binary '\0',NULL,NULL),('3b41e309-5dc7-4914-b3d9-8e9f1c41f839',NULL,'conditional-user-configured','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','4554eb47-25b3-4180-898f-694855d4d206',0,10,_binary '\0',NULL,NULL),('3e520acb-1483-488b-a434-2f1589e887f7',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','13e7ee3c-cb00-4b02-ab22-e7a6457989f9',2,20,_binary '','93461990-cce4-4262-a695-8c364493bfad',NULL),('3e7585ac-e214-4fc9-b288-b3d2c18b3cdb',NULL,'registration-password-action','d853bfa0-17e0-4f82-8c5e-4e87c8901796','75dd240d-b080-4867-8398-1afec89b8775',0,50,_binary '\0',NULL,NULL),('3efae9b8-b87b-4da3-be9d-fd93868ccb84',NULL,'registration-user-creation','d853bfa0-17e0-4f82-8c5e-4e87c8901796','75dd240d-b080-4867-8398-1afec89b8775',0,20,_binary '\0',NULL,NULL),('3ffa44c9-0b49-4f20-9edb-dd9f352cd841',NULL,'idp-username-password-form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','7937e8df-808c-41f9-8460-e59b59eeba89',0,10,_binary '\0',NULL,NULL),('40e734d0-5255-462b-871d-cd7d15b1668b',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d7cedc2d-e18d-4372-9067-20e16b122f95',1,40,_binary '','4554eb47-25b3-4180-898f-694855d4d206',NULL),('41070a48-cb8b-4bf7-97c3-e9e9dd12d911',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','3158eb72-0639-48fc-ab1c-db68b0e76c00',1,40,_binary '','12a1e466-0c18-45c6-8a45-24231b7f39eb',NULL),('41694ebb-5fec-4675-a4d2-a87169608a0e',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','7937e8df-808c-41f9-8460-e59b59eeba89',1,20,_binary '','4080f6ae-10b3-4d65-bdf5-c9ca82f363e9',NULL),('416e8ee1-e62a-4d1b-a902-92500b5b4575',NULL,'conditional-user-configured','d853bfa0-17e0-4f82-8c5e-4e87c8901796','33d2e976-df83-4d04-b284-31b043a2a842',0,10,_binary '\0',NULL,NULL),('424388f2-c814-44c1-bcce-3cbc64908f09',NULL,'http-basic-authenticator','d853bfa0-17e0-4f82-8c5e-4e87c8901796','3bdff6e5-2380-42ed-8711-3cbd7b05ee59',0,10,_binary '\0',NULL,NULL),('43ca80a0-f424-4154-b3f5-d75f5a6bd6c3',NULL,'auth-otp-form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','0851e1c0-66a0-4134-a6ad-e0362fe1fc8e',0,20,_binary '\0',NULL,NULL),('43e7dd94-9083-4d00-a1b3-5164678509f8',NULL,'idp-create-user-if-unique','d853bfa0-17e0-4f82-8c5e-4e87c8901796','1083895a-752e-43f2-aacf-cb0cc2e20b1d',2,10,_binary '\0',NULL,'bf069cc3-73d2-47b8-81a0-509bbe175a0a'),('4c58c8dd-d3dd-4e09-804a-4030afeb9ddd',NULL,'registration-page-form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','e4e1281a-6ba3-495f-ad73-273f67ca4a68',0,10,_binary '','75dd240d-b080-4867-8398-1afec89b8775',NULL),('5e33ea52-208c-42da-a55b-93533a612084',NULL,'idp-email-verification','d853bfa0-17e0-4f82-8c5e-4e87c8901796','13e7ee3c-cb00-4b02-ab22-e7a6457989f9',2,10,_binary '\0',NULL,NULL),('606d67d4-1e5d-4a3c-8e30-d6da6d09a1a7',NULL,'client-secret-jwt','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d4245255-f9fb-4d5d-9a51-9292e9a18eee',2,30,_binary '\0',NULL,NULL),('6139e694-eb7e-4d84-bab7-908d5019aaa7',NULL,'reset-credentials-choose-user','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d7cedc2d-e18d-4372-9067-20e16b122f95',0,10,_binary '\0',NULL,NULL),('6800b22e-8d22-46ae-9bd5-95ad5aa33a3d',NULL,'idp-confirm-link','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','937676ea-a7a2-4a23-bcd6-6ac7848d2261',0,10,_binary '\0',NULL,NULL),('6df97e7c-448c-4360-8a54-6ffcf9a616a8',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','52e0a4b2-590c-48a7-a415-f6e8304ed33a',2,30,_binary '','2892c39b-b36c-4d32-9089-25937707c0fb',NULL),('6f4d2a67-9bf5-4889-a3d8-39a08211b1bb',NULL,'auth-username-password-form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','2892c39b-b36c-4d32-9089-25937707c0fb',0,10,_binary '\0',NULL,NULL),('713f8e09-01ca-47fd-98ad-5f434a4ba939',NULL,'conditional-user-configured','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','4080f6ae-10b3-4d65-bdf5-c9ca82f363e9',0,10,_binary '\0',NULL,NULL),('7388e559-a5de-4749-bbc5-98cdd10adf59',NULL,'docker-http-basic-authenticator','d853bfa0-17e0-4f82-8c5e-4e87c8901796','74017437-c096-4162-a5bf-8217fa54c71b',0,10,_binary '\0',NULL,NULL),('782aca82-c73e-4ed4-9e86-135d01090c0e',NULL,'client-jwt','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d4245255-f9fb-4d5d-9a51-9292e9a18eee',2,20,_binary '\0',NULL,NULL),('7cd3022e-01c7-4337-94af-fbceb4510f81',NULL,'client-jwt','d853bfa0-17e0-4f82-8c5e-4e87c8901796','eafbd6d8-7e94-4962-b90c-9fb8b38eac37',2,20,_binary '\0',NULL,NULL),('826a185b-45f5-4773-bfae-9f6894b56853',NULL,'idp-username-password-form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','93461990-cce4-4262-a695-8c364493bfad',0,10,_binary '\0',NULL,NULL),('82e49adc-22d3-4de8-8317-25322bf5bca7',NULL,'registration-page-form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','e72b768e-f138-45be-afb8-48e98d2c65ba',0,10,_binary '','23da74f1-e00c-4442-81f9-3183a166de15',NULL),('8407705d-327e-4471-a894-e8f0c271c096',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','937676ea-a7a2-4a23-bcd6-6ac7848d2261',0,20,_binary '','dadfe887-66db-4488-96ea-d583fc418548',NULL),('849cbbaa-6635-4964-ade7-9e8dd4ae0654',NULL,'registration-recaptcha-action','d853bfa0-17e0-4f82-8c5e-4e87c8901796','75dd240d-b080-4867-8398-1afec89b8775',3,60,_binary '\0',NULL,NULL),('92e3cc8c-196c-45ec-8153-702f4e711236',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','f831bb74-d013-46c4-b14b-0b861066628d',2,30,_binary '','049f1c6d-b1d5-4948-b3c2-652a0c5502fb',NULL),('93536a13-56f8-441c-a2c1-4df3a99a66b0',NULL,'registration-user-creation','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','23da74f1-e00c-4442-81f9-3183a166de15',0,20,_binary '\0',NULL,NULL),('94416c42-3e15-46cb-b89e-5da65d8842eb',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','dadfe887-66db-4488-96ea-d583fc418548',2,20,_binary '','7937e8df-808c-41f9-8460-e59b59eeba89',NULL),('95bdfe3a-6b93-40df-891d-82e1abcac7f0',NULL,'conditional-user-configured','d853bfa0-17e0-4f82-8c5e-4e87c8901796','c8c1acfe-9842-4755-bb19-7a7c8cf5037a',0,10,_binary '\0',NULL,NULL),('96266d02-bb9d-4d78-8e08-6afc187f9c75',NULL,'identity-provider-redirector','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','52e0a4b2-590c-48a7-a415-f6e8304ed33a',2,25,_binary '\0',NULL,NULL),('965d0295-4ef9-439d-918f-979f53154621',NULL,'idp-email-verification','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','dadfe887-66db-4488-96ea-d583fc418548',2,10,_binary '\0',NULL,NULL),('97c3cb76-f528-4b39-a3e7-d2c2c6fcc5f3',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','91d5f20d-d389-41d0-8f37-98fd197e8f49',1,30,_binary '','8eb33f2d-5456-4d03-9db9-697a3e320dea',NULL),('9c9316cd-1fba-4817-bda8-a1aab8e45c2e',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','92f0072a-5d2d-490e-a499-ade79b9584dc',0,20,_binary '','13e7ee3c-cb00-4b02-ab22-e7a6457989f9',NULL),('9dcfb759-5446-426e-8e16-01559504dcf9',NULL,'auth-otp-form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','71b84569-2694-4528-ad12-395d2f0dbf3d',0,20,_binary '\0',NULL,NULL),('a1aa21e6-02d4-45c0-bdec-de1aa3eb1420',NULL,'direct-grant-validate-otp','d853bfa0-17e0-4f82-8c5e-4e87c8901796','c8c1acfe-9842-4755-bb19-7a7c8cf5037a',0,20,_binary '\0',NULL,NULL),('a33dc569-5e8f-46ba-9b14-3e2a50db1136',NULL,'client-secret','d853bfa0-17e0-4f82-8c5e-4e87c8901796','eafbd6d8-7e94-4962-b90c-9fb8b38eac37',2,10,_binary '\0',NULL,NULL),('a689d5f8-f7da-4a3b-a85a-c594c2318834',NULL,'idp-review-profile','d853bfa0-17e0-4f82-8c5e-4e87c8901796','aabf65ca-f57c-45d6-9287-cfc2e82c8934',0,10,_binary '\0',NULL,'056d49b1-96e7-4595-b18c-2d80d0e8d26e'),('a78f057d-28d6-4601-9475-63a495e72d85',NULL,'reset-credential-email','d853bfa0-17e0-4f82-8c5e-4e87c8901796','3158eb72-0639-48fc-ab1c-db68b0e76c00',0,20,_binary '\0',NULL,NULL),('a8b74b9a-d24e-4dad-9037-c9a4c4689bf0',NULL,'auth-otp-form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','33d2e976-df83-4d04-b284-31b043a2a842',0,20,_binary '\0',NULL,NULL),('a8bca70c-c636-4f2b-970f-0a0d934853ee',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','049f1c6d-b1d5-4948-b3c2-652a0c5502fb',1,20,_binary '','71b84569-2694-4528-ad12-395d2f0dbf3d',NULL),('acfa7a71-9f34-433d-bad9-1d9d10259f65',NULL,'client-x509','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d4245255-f9fb-4d5d-9a51-9292e9a18eee',2,40,_binary '\0',NULL,NULL),('ae087659-66b1-45d2-9c62-419ace27eb11',NULL,'idp-confirm-link','d853bfa0-17e0-4f82-8c5e-4e87c8901796','92f0072a-5d2d-490e-a499-ade79b9584dc',0,10,_binary '\0',NULL,NULL),('bfc6e494-2b7c-4b07-9150-22a4bf21e44c',NULL,'conditional-user-configured','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8eb33f2d-5456-4d03-9db9-697a3e320dea',0,10,_binary '\0',NULL,NULL),('bfe26a6f-2c22-435c-80ed-3f45afe71352',NULL,'auth-spnego','d853bfa0-17e0-4f82-8c5e-4e87c8901796','f831bb74-d013-46c4-b14b-0b861066628d',3,20,_binary '\0',NULL,NULL),('c1d03458-db24-40f2-bbf6-68325f1b2a2d',NULL,'direct-grant-validate-password','d853bfa0-17e0-4f82-8c5e-4e87c8901796','bcfba7a3-bf32-496f-89b9-303f2d67ac9e',0,20,_binary '\0',NULL,NULL),('c3c586db-bd36-4780-aee9-40ff1e29a4ea',NULL,'reset-credentials-choose-user','d853bfa0-17e0-4f82-8c5e-4e87c8901796','3158eb72-0639-48fc-ab1c-db68b0e76c00',0,10,_binary '\0',NULL,NULL),('c77e50c1-835a-4c05-aa6d-7b884d4a5441',NULL,'registration-terms-and-conditions','d853bfa0-17e0-4f82-8c5e-4e87c8901796','75dd240d-b080-4867-8398-1afec89b8775',3,70,_binary '\0',NULL,NULL),('cb4658c9-d2cf-4db1-a05e-043f280c3761',NULL,'http-basic-authenticator','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','f1a90d2b-106c-4d9b-8ac9-475d81336ffe',0,10,_binary '\0',NULL,NULL),('cd955b1b-457c-4efd-824c-32dccb450eae',NULL,'reset-password','d853bfa0-17e0-4f82-8c5e-4e87c8901796','3158eb72-0639-48fc-ab1c-db68b0e76c00',0,30,_binary '\0',NULL,NULL),('cff30fa2-37d2-4adf-8b6e-6422ba141fbe',NULL,'conditional-user-configured','d853bfa0-17e0-4f82-8c5e-4e87c8901796','12a1e466-0c18-45c6-8a45-24231b7f39eb',0,10,_binary '\0',NULL,NULL),('d3ff4c2a-e233-4549-99e8-13a89755f8f1',NULL,'docker-http-basic-authenticator','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','af824982-a3b4-44a4-9e8a-6d07d7635a1c',0,10,_binary '\0',NULL,NULL),('d62a98c1-c03b-42f8-8d34-ec78a184f900',NULL,'direct-grant-validate-username','d853bfa0-17e0-4f82-8c5e-4e87c8901796','bcfba7a3-bf32-496f-89b9-303f2d67ac9e',0,10,_binary '\0',NULL,NULL),('da8f072f-cbd5-4dcc-bec6-ea1eab5924a9',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','bcfba7a3-bf32-496f-89b9-303f2d67ac9e',1,30,_binary '','c8c1acfe-9842-4755-bb19-7a7c8cf5037a',NULL),('dcc10064-9ff6-4100-b626-aecf57044a85',NULL,'direct-grant-validate-otp','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8eb33f2d-5456-4d03-9db9-697a3e320dea',0,20,_binary '\0',NULL,NULL),('de18217b-fb47-4ae3-85e8-6fa063d6fb4f',NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','93461990-cce4-4262-a695-8c364493bfad',1,20,_binary '','33d2e976-df83-4d04-b284-31b043a2a842',NULL),('e2ffd82e-9045-44d8-a384-189b08ac8595',NULL,'reset-otp','d853bfa0-17e0-4f82-8c5e-4e87c8901796','12a1e466-0c18-45c6-8a45-24231b7f39eb',0,20,_binary '\0',NULL,NULL),('ebba4d89-4aa2-4ccb-8017-040ac8bf6de3',NULL,'client-x509','d853bfa0-17e0-4f82-8c5e-4e87c8901796','eafbd6d8-7e94-4962-b90c-9fb8b38eac37',2,40,_binary '\0',NULL,NULL),('ecedb4aa-d8f7-43ad-ba85-b58805036007',NULL,'reset-credential-email','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d7cedc2d-e18d-4372-9067-20e16b122f95',0,20,_binary '\0',NULL,NULL),('f0dd6666-84d3-4169-b625-5fcc2aae54c3',NULL,'reset-password','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','d7cedc2d-e18d-4372-9067-20e16b122f95',0,30,_binary '\0',NULL,NULL),('f4017ab2-9e5b-4a8a-a537-50335857e2dc',NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','ae5fd1dc-31e5-474f-8a4e-9330b084d52e',0,20,_binary '','2c219a00-d85f-44e6-b783-6d804a37ed94',NULL),('f5b2ecda-e78e-4eab-85bb-a3bb9da5d49e',NULL,'idp-create-user-if-unique','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','2c219a00-d85f-44e6-b783-6d804a37ed94',2,10,_binary '\0',NULL,'a6f57540-c9e4-46f3-9a67-1fad931518c8'),('fc1771dd-cf6b-46a5-8ea0-14a11ddf7cf2',NULL,'client-secret-jwt','d853bfa0-17e0-4f82-8c5e-4e87c8901796','eafbd6d8-7e94-4962-b90c-9fb8b38eac37',2,30,_binary '\0',NULL,NULL),('fe86b450-f949-4ca2-a1b8-9921d3ab8c22',NULL,'conditional-user-configured','d853bfa0-17e0-4f82-8c5e-4e87c8901796','71b84569-2694-4528-ad12-395d2f0dbf3d',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('049f1c6d-b1d5-4948-b3c2-652a0c5502fb','forms','Username, password, otp and other auth forms.','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('0851e1c0-66a0-4134-a6ad-e0362fe1fc8e','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('1083895a-752e-43f2-aacf-cb0cc2e20b1d','User creation or linking','Flow for the existing/non-existing user alternatives','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('12a1e466-0c18-45c6-8a45-24231b7f39eb','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('13e7ee3c-cb00-4b02-ab22-e7a6457989f9','Account verification options','Method with which to verity the existing account','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('23da74f1-e00c-4442-81f9-3183a166de15','registration form','registration form','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','form-flow',_binary '\0',_binary ''),('2892c39b-b36c-4d32-9089-25937707c0fb','forms','Username, password, otp and other auth forms.','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('2c219a00-d85f-44e6-b783-6d804a37ed94','User creation or linking','Flow for the existing/non-existing user alternatives','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('3158eb72-0639-48fc-ab1c-db68b0e76c00','reset credentials','Reset credentials for a user if they forgot their password or something','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('33d2e976-df83-4d04-b284-31b043a2a842','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('3bdff6e5-2380-42ed-8711-3cbd7b05ee59','saml ecp','SAML ECP Profile Authentication Flow','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('4080f6ae-10b3-4d65-bdf5-c9ca82f363e9','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('4554eb47-25b3-4180-898f-694855d4d206','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('52e0a4b2-590c-48a7-a415-f6e8304ed33a','browser','browser based authentication','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('71b84569-2694-4528-ad12-395d2f0dbf3d','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('74017437-c096-4162-a5bf-8217fa54c71b','docker auth','Used by Docker clients to authenticate against the IDP','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('75dd240d-b080-4867-8398-1afec89b8775','registration form','registration form','d853bfa0-17e0-4f82-8c5e-4e87c8901796','form-flow',_binary '\0',_binary ''),('7937e8df-808c-41f9-8460-e59b59eeba89','Verify Existing Account by Re-authentication','Reauthentication of existing account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('8eb33f2d-5456-4d03-9db9-697a3e320dea','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('91d5f20d-d389-41d0-8f37-98fd197e8f49','direct grant','OpenID Connect Resource Owner Grant','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('92f0072a-5d2d-490e-a499-ade79b9584dc','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('93461990-cce4-4262-a695-8c364493bfad','Verify Existing Account by Re-authentication','Reauthentication of existing account','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('937676ea-a7a2-4a23-bcd6-6ac7848d2261','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('aabf65ca-f57c-45d6-9287-cfc2e82c8934','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('ae5fd1dc-31e5-474f-8a4e-9330b084d52e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('af824982-a3b4-44a4-9e8a-6d07d7635a1c','docker auth','Used by Docker clients to authenticate against the IDP','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('bcfba7a3-bf32-496f-89b9-303f2d67ac9e','direct grant','OpenID Connect Resource Owner Grant','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('c8c1acfe-9842-4755-bb19-7a7c8cf5037a','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '\0',_binary ''),('d4245255-f9fb-4d5d-9a51-9292e9a18eee','clients','Base authentication for clients','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','client-flow',_binary '',_binary ''),('d7cedc2d-e18d-4372-9067-20e16b122f95','reset credentials','Reset credentials for a user if they forgot their password or something','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('dadfe887-66db-4488-96ea-d583fc418548','Account verification options','Method with which to verity the existing account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '\0',_binary ''),('e4e1281a-6ba3-495f-ad73-273f67ca4a68','registration','registration flow','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary ''),('e72b768e-f138-45be-afb8-48e98d2c65ba','registration','registration flow','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('eafbd6d8-7e94-4962-b90c-9fb8b38eac37','clients','Base authentication for clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','client-flow',_binary '',_binary ''),('f1a90d2b-106c-4d9b-8ac9-475d81336ffe','saml ecp','SAML ECP Profile Authentication Flow','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','basic-flow',_binary '',_binary ''),('f831bb74-d013-46c4-b14b-0b861066628d','browser','browser based authentication','d853bfa0-17e0-4f82-8c5e-4e87c8901796','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('056d49b1-96e7-4595-b18c-2d80d0e8d26e','review profile config','d853bfa0-17e0-4f82-8c5e-4e87c8901796'),('3787893e-5cce-478d-9e0f-f3ff125a5e7b','review profile config','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522'),('a6f57540-c9e4-46f3-9a67-1fad931518c8','create unique user config','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522'),('bf069cc3-73d2-47b8-81a0-509bbe175a0a','create unique user config','d853bfa0-17e0-4f82-8c5e-4e87c8901796');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('056d49b1-96e7-4595-b18c-2d80d0e8d26e','missing','update.profile.on.first.login'),('3787893e-5cce-478d-9e0f-f3ff125a5e7b','missing','update.profile.on.first.login'),('a6f57540-c9e4-46f3-9a67-1fad931518c8','false','require.password.update.after.registration'),('bf069cc3-73d2-47b8-81a0-509bbe175a0a','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('2249ad6a-49de-4349-b85b-11acc3197fb8',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('27187fe5-3e01-4b08-9102-6c1b08fa5208',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '',_binary '\0','SPRINGBOOT-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,0,_binary '\0',_binary '\0','SPRINGBOOT Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/SPRINGBOOT/account/',_binary '\0',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/SPRINGBOOT/account/',_binary '\0',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6f15c659-2720-4413-98a2-41633903e97c',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/SPRINGBOOT/console/',_binary '\0',NULL,_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('cc34d881-61f4-4382-a436-23ee3533d063',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','d853bfa0-17e0-4f82-8c5e-4e87c8901796','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f4f80066-7dd4-4c8c-812d-6d02525b1422',_binary '',_binary '','springboot-client',0,_binary '\0','9xXfqVsbcMvxdIlhx3oKO43b6pyeUoMN','',_binary '\0','',_binary '\0','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','openid-connect',-1,_binary '',_binary '\0','',_binary '','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('2249ad6a-49de-4349-b85b-11acc3197fb8','pkce.code.challenge.method','S256'),('2249ad6a-49de-4349-b85b-11acc3197fb8','post.logout.redirect.uris','+'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','pkce.code.challenge.method','S256'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','post.logout.redirect.uris','+'),('43a97c30-c993-48ca-811b-f4f96c2bead1','post.logout.redirect.uris','+'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','post.logout.redirect.uris','+'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','pkce.code.challenge.method','S256'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','post.logout.redirect.uris','+'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','pkce.code.challenge.method','S256'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','post.logout.redirect.uris','+'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','backchannel.logout.revoke.offline.tokens','false'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','backchannel.logout.session.required','true'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','client.secret.creation.time','1725029750'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','oauth2.device.authorization.grant.enabled','false'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','oidc.ciba.grant.enabled','false'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','post.logout.redirect.uris','*##+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('11e2edfb-e674-4c6c-960a-ef7fb298eec6','acr','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('150db6a6-7ee1-485f-b7b4-ac346986bec3','address','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect built-in scope: address','openid-connect'),('1df892f9-ae31-4abd-9eac-f1e1a4427cb4','offline_access','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect built-in scope: offline_access','openid-connect'),('25d5516f-8181-4b0f-9b3d-7e8adb055e2d','web-origins','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('289a3c81-1ec2-4d56-ba88-b871fc4acd35','acr','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('3340c928-f494-4dfd-950a-c3396fa84df2','phone','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect built-in scope: phone','openid-connect'),('3eedb2a3-6c2e-47fa-badc-b350dfcd2f79','microprofile-jwt','d853bfa0-17e0-4f82-8c5e-4e87c8901796','Microprofile - JWT built-in scope','openid-connect'),('518d2bb1-2e79-4ded-8802-5be87004ffd0','web-origins','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('52cd6160-b21b-4110-988b-fa93df664304','offline_access','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect built-in scope: offline_access','openid-connect'),('5b94e0fa-9cde-4294-8e8d-ba05452fcb2d','email','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect built-in scope: email','openid-connect'),('6107c1d8-fa6d-4196-8063-119eb65237df','role_list','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','SAML role list','saml'),('746663dd-20c5-4840-bdfc-e9e94669bc4d','microprofile-jwt','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','Microprofile - JWT built-in scope','openid-connect'),('7e91d336-ea38-489b-aaa0-37463d646b27','address','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect built-in scope: address','openid-connect'),('9c3bc543-8063-4785-81a4-add8fb8cb38a','email','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect built-in scope: email','openid-connect'),('b41748a2-9198-4caf-80c2-13deefaa267b','profile','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect built-in scope: profile','openid-connect'),('be579794-ff9f-4b35-a27d-1e89d019236c','role_list','d853bfa0-17e0-4f82-8c5e-4e87c8901796','SAML role list','saml'),('cb305e6a-09fd-425e-aee2-63b661c00bb7','profile','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect built-in scope: profile','openid-connect'),('d17137ae-6d30-4623-bf25-12fbfa7ee9aa','phone','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect built-in scope: phone','openid-connect'),('e333e0bb-cc62-4322-9d32-c8e10cb6f560','roles','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','OpenID Connect scope for add user roles to the access token','openid-connect'),('f1f95ed5-742e-4928-a192-80cf9a9dfb4a','roles','d853bfa0-17e0-4f82-8c5e-4e87c8901796','OpenID Connect scope for add user roles to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('11e2edfb-e674-4c6c-960a-ef7fb298eec6','false','display.on.consent.screen'),('11e2edfb-e674-4c6c-960a-ef7fb298eec6','false','include.in.token.scope'),('150db6a6-7ee1-485f-b7b4-ac346986bec3','${addressScopeConsentText}','consent.screen.text'),('150db6a6-7ee1-485f-b7b4-ac346986bec3','true','display.on.consent.screen'),('150db6a6-7ee1-485f-b7b4-ac346986bec3','true','include.in.token.scope'),('1df892f9-ae31-4abd-9eac-f1e1a4427cb4','${offlineAccessScopeConsentText}','consent.screen.text'),('1df892f9-ae31-4abd-9eac-f1e1a4427cb4','true','display.on.consent.screen'),('25d5516f-8181-4b0f-9b3d-7e8adb055e2d','','consent.screen.text'),('25d5516f-8181-4b0f-9b3d-7e8adb055e2d','false','display.on.consent.screen'),('25d5516f-8181-4b0f-9b3d-7e8adb055e2d','false','include.in.token.scope'),('289a3c81-1ec2-4d56-ba88-b871fc4acd35','false','display.on.consent.screen'),('289a3c81-1ec2-4d56-ba88-b871fc4acd35','false','include.in.token.scope'),('3340c928-f494-4dfd-950a-c3396fa84df2','${phoneScopeConsentText}','consent.screen.text'),('3340c928-f494-4dfd-950a-c3396fa84df2','true','display.on.consent.screen'),('3340c928-f494-4dfd-950a-c3396fa84df2','true','include.in.token.scope'),('3eedb2a3-6c2e-47fa-badc-b350dfcd2f79','false','display.on.consent.screen'),('3eedb2a3-6c2e-47fa-badc-b350dfcd2f79','true','include.in.token.scope'),('518d2bb1-2e79-4ded-8802-5be87004ffd0','','consent.screen.text'),('518d2bb1-2e79-4ded-8802-5be87004ffd0','false','display.on.consent.screen'),('518d2bb1-2e79-4ded-8802-5be87004ffd0','false','include.in.token.scope'),('52cd6160-b21b-4110-988b-fa93df664304','${offlineAccessScopeConsentText}','consent.screen.text'),('52cd6160-b21b-4110-988b-fa93df664304','true','display.on.consent.screen'),('5b94e0fa-9cde-4294-8e8d-ba05452fcb2d','${emailScopeConsentText}','consent.screen.text'),('5b94e0fa-9cde-4294-8e8d-ba05452fcb2d','true','display.on.consent.screen'),('5b94e0fa-9cde-4294-8e8d-ba05452fcb2d','true','include.in.token.scope'),('6107c1d8-fa6d-4196-8063-119eb65237df','${samlRoleListScopeConsentText}','consent.screen.text'),('6107c1d8-fa6d-4196-8063-119eb65237df','true','display.on.consent.screen'),('746663dd-20c5-4840-bdfc-e9e94669bc4d','false','display.on.consent.screen'),('746663dd-20c5-4840-bdfc-e9e94669bc4d','true','include.in.token.scope'),('7e91d336-ea38-489b-aaa0-37463d646b27','${addressScopeConsentText}','consent.screen.text'),('7e91d336-ea38-489b-aaa0-37463d646b27','true','display.on.consent.screen'),('7e91d336-ea38-489b-aaa0-37463d646b27','true','include.in.token.scope'),('9c3bc543-8063-4785-81a4-add8fb8cb38a','${emailScopeConsentText}','consent.screen.text'),('9c3bc543-8063-4785-81a4-add8fb8cb38a','true','display.on.consent.screen'),('9c3bc543-8063-4785-81a4-add8fb8cb38a','true','include.in.token.scope'),('b41748a2-9198-4caf-80c2-13deefaa267b','${profileScopeConsentText}','consent.screen.text'),('b41748a2-9198-4caf-80c2-13deefaa267b','true','display.on.consent.screen'),('b41748a2-9198-4caf-80c2-13deefaa267b','true','include.in.token.scope'),('be579794-ff9f-4b35-a27d-1e89d019236c','${samlRoleListScopeConsentText}','consent.screen.text'),('be579794-ff9f-4b35-a27d-1e89d019236c','true','display.on.consent.screen'),('cb305e6a-09fd-425e-aee2-63b661c00bb7','${profileScopeConsentText}','consent.screen.text'),('cb305e6a-09fd-425e-aee2-63b661c00bb7','true','display.on.consent.screen'),('cb305e6a-09fd-425e-aee2-63b661c00bb7','true','include.in.token.scope'),('d17137ae-6d30-4623-bf25-12fbfa7ee9aa','${phoneScopeConsentText}','consent.screen.text'),('d17137ae-6d30-4623-bf25-12fbfa7ee9aa','true','display.on.consent.screen'),('d17137ae-6d30-4623-bf25-12fbfa7ee9aa','true','include.in.token.scope'),('e333e0bb-cc62-4322-9d32-c8e10cb6f560','${rolesScopeConsentText}','consent.screen.text'),('e333e0bb-cc62-4322-9d32-c8e10cb6f560','true','display.on.consent.screen'),('e333e0bb-cc62-4322-9d32-c8e10cb6f560','false','include.in.token.scope'),('f1f95ed5-742e-4928-a192-80cf9a9dfb4a','${rolesScopeConsentText}','consent.screen.text'),('f1f95ed5-742e-4928-a192-80cf9a9dfb4a','true','display.on.consent.screen'),('f1f95ed5-742e-4928-a192-80cf9a9dfb4a','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('2249ad6a-49de-4349-b85b-11acc3197fb8','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('2249ad6a-49de-4349-b85b-11acc3197fb8','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('2249ad6a-49de-4349-b85b-11acc3197fb8','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('2249ad6a-49de-4349-b85b-11acc3197fb8','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('2249ad6a-49de-4349-b85b-11acc3197fb8','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('2249ad6a-49de-4349-b85b-11acc3197fb8','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('2249ad6a-49de-4349-b85b-11acc3197fb8','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('2249ad6a-49de-4349-b85b-11acc3197fb8','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('2249ad6a-49de-4349-b85b-11acc3197fb8','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('27187fe5-3e01-4b08-9102-6c1b08fa5208','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('27187fe5-3e01-4b08-9102-6c1b08fa5208','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('27187fe5-3e01-4b08-9102-6c1b08fa5208','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('27187fe5-3e01-4b08-9102-6c1b08fa5208','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('27187fe5-3e01-4b08-9102-6c1b08fa5208','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('27187fe5-3e01-4b08-9102-6c1b08fa5208','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('27187fe5-3e01-4b08-9102-6c1b08fa5208','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('27187fe5-3e01-4b08-9102-6c1b08fa5208','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('27187fe5-3e01-4b08-9102-6c1b08fa5208','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('43a97c30-c993-48ca-811b-f4f96c2bead1','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('43a97c30-c993-48ca-811b-f4f96c2bead1','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('43a97c30-c993-48ca-811b-f4f96c2bead1','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('43a97c30-c993-48ca-811b-f4f96c2bead1','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('43a97c30-c993-48ca-811b-f4f96c2bead1','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('43a97c30-c993-48ca-811b-f4f96c2bead1','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('43a97c30-c993-48ca-811b-f4f96c2bead1','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('43a97c30-c993-48ca-811b-f4f96c2bead1','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('43a97c30-c993-48ca-811b-f4f96c2bead1','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('52b64ac4-3eaa-49fb-8875-a02e26f96364','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('52b64ac4-3eaa-49fb-8875-a02e26f96364','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('52b64ac4-3eaa-49fb-8875-a02e26f96364','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('52b64ac4-3eaa-49fb-8875-a02e26f96364','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('52b64ac4-3eaa-49fb-8875-a02e26f96364','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('635983f1-87d1-494b-948f-ac3d5aa7605b','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('635983f1-87d1-494b-948f-ac3d5aa7605b','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('635983f1-87d1-494b-948f-ac3d5aa7605b','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('635983f1-87d1-494b-948f-ac3d5aa7605b','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('635983f1-87d1-494b-948f-ac3d5aa7605b','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('635983f1-87d1-494b-948f-ac3d5aa7605b','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('635983f1-87d1-494b-948f-ac3d5aa7605b','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('635983f1-87d1-494b-948f-ac3d5aa7605b','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('635983f1-87d1-494b-948f-ac3d5aa7605b','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('6f15c659-2720-4413-98a2-41633903e97c','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('6f15c659-2720-4413-98a2-41633903e97c','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('6f15c659-2720-4413-98a2-41633903e97c','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('6f15c659-2720-4413-98a2-41633903e97c','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('6f15c659-2720-4413-98a2-41633903e97c','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('6f15c659-2720-4413-98a2-41633903e97c','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('6f15c659-2720-4413-98a2-41633903e97c','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('6f15c659-2720-4413-98a2-41633903e97c','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('6f15c659-2720-4413-98a2-41633903e97c','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('8128a839-82a5-40eb-a5a0-2d067628a96f','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('8128a839-82a5-40eb-a5a0-2d067628a96f','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('8128a839-82a5-40eb-a5a0-2d067628a96f','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('8128a839-82a5-40eb-a5a0-2d067628a96f','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('8128a839-82a5-40eb-a5a0-2d067628a96f','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('8128a839-82a5-40eb-a5a0-2d067628a96f','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('8128a839-82a5-40eb-a5a0-2d067628a96f','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('8128a839-82a5-40eb-a5a0-2d067628a96f','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('8128a839-82a5-40eb-a5a0-2d067628a96f','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('c23b07bb-08cc-4b18-a2ac-92bcba702ca6','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('cc34d881-61f4-4382-a436-23ee3533d063','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('cc34d881-61f4-4382-a436-23ee3533d063','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('cc34d881-61f4-4382-a436-23ee3533d063','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('cc34d881-61f4-4382-a436-23ee3533d063','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('cc34d881-61f4-4382-a436-23ee3533d063','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('cc34d881-61f4-4382-a436-23ee3533d063','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('cc34d881-61f4-4382-a436-23ee3533d063','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('cc34d881-61f4-4382-a436-23ee3533d063','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('cc34d881-61f4-4382-a436-23ee3533d063','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary ''),('f4f80066-7dd4-4c8c-812d-6d02525b1422','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('f4f80066-7dd4-4c8c-812d-6d02525b1422','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('f4f80066-7dd4-4c8c-812d-6d02525b1422','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('f4f80066-7dd4-4c8c-812d-6d02525b1422','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('f4f80066-7dd4-4c8c-812d-6d02525b1422','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('1df892f9-ae31-4abd-9eac-f1e1a4427cb4','07d3ee31-667b-405e-8cf5-241e590df890'),('52cd6160-b21b-4110-988b-fa93df664304','4d291806-ae61-44cb-978d-4cc012bc5753');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('060427cf-6c88-4e6a-8868-1477d37f1bd0','aes-generated','d853bfa0-17e0-4f82-8c5e-4e87c8901796','aes-generated','org.keycloak.keys.KeyProvider','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL),('097690df-76b0-4670-a866-97cb329f640c','Allowed Client Scopes','d853bfa0-17e0-4f82-8c5e-4e87c8901796','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('0d1bc0ad-8f56-444d-a9ad-5875031bf3cc','Allowed Client Scopes','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','authenticated'),('17427abc-e144-4b78-8bb5-82e1c1fb9344','Max Clients Limit','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous'),('29246bc8-8905-45ad-9738-53572f431817','hmac-generated','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','hmac-generated','org.keycloak.keys.KeyProvider','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL),('29c52f09-1227-4e15-b577-d3026a8fe89a','Full Scope Disabled','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous'),('3047a070-0956-4248-a76a-497e663496b9','Allowed Protocol Mapper Types','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','authenticated'),('4930dbfa-7753-4fce-8d7b-91e9c0e4eb11','Full Scope Disabled','d853bfa0-17e0-4f82-8c5e-4e87c8901796','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('785c73ff-a317-421a-8313-ed7fadbb2d2a','rsa-enc-generated','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','rsa-enc-generated','org.keycloak.keys.KeyProvider','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL),('8110d1bd-c303-46ae-a01e-584f3005ad77','Allowed Protocol Mapper Types','d853bfa0-17e0-4f82-8c5e-4e87c8901796','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','authenticated'),('84baf0e1-8bb2-4217-a2e0-4c154bc80137','Trusted Hosts','d853bfa0-17e0-4f82-8c5e-4e87c8901796','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('97d6565e-4784-48b7-a243-a8c1b7245ccb','Consent Required','d853bfa0-17e0-4f82-8c5e-4e87c8901796','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('a88a4c27-847f-4f3c-84e4-e51a8a8f5b96','Trusted Hosts','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous'),('ad01681f-7041-4e4d-b081-0d5f93bfeae5','rsa-enc-generated','d853bfa0-17e0-4f82-8c5e-4e87c8901796','rsa-enc-generated','org.keycloak.keys.KeyProvider','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL),('af1b5352-c811-49f4-8f88-397493b4834a','rsa-generated','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','rsa-generated','org.keycloak.keys.KeyProvider','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL),('b40c9acb-882d-4674-a8e8-988785620829','hmac-generated','d853bfa0-17e0-4f82-8c5e-4e87c8901796','hmac-generated','org.keycloak.keys.KeyProvider','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL),('bc4225e4-9bb7-4d0b-a957-290c5b117a1b','Max Clients Limit','d853bfa0-17e0-4f82-8c5e-4e87c8901796','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('cc084ad5-1ea4-4379-8405-3cab72a7e0c5','aes-generated','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','aes-generated','org.keycloak.keys.KeyProvider','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL),('d87e7bde-63b7-4419-91e7-f2103dccba9e','Allowed Client Scopes','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous'),('ddcb4cbd-aed0-42ed-ba54-5fdb82e980ab','Allowed Client Scopes','d853bfa0-17e0-4f82-8c5e-4e87c8901796','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','authenticated'),('e2e877bc-5181-49eb-a97c-da012a9fd43a','Allowed Protocol Mapper Types','d853bfa0-17e0-4f82-8c5e-4e87c8901796','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','anonymous'),('e54e8773-a075-493a-9d91-20815085f942','Allowed Protocol Mapper Types','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous'),('ec1e97c1-84be-45b2-8752-281cd2d11345','rsa-generated','d853bfa0-17e0-4f82-8c5e-4e87c8901796','rsa-generated','org.keycloak.keys.KeyProvider','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL),('ec80cea1-564b-454e-968f-5e49f528fb14','Consent Required','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0065bf2e-8c10-4b96-be5f-134b5b8be827','b40c9acb-882d-4674-a8e8-988785620829','secret','_lAFUAJPxh-GF0kbQ2yiIeVAifqh0lUJuN9h3nh6_TqSDLHeE1ukNQs0HG5qPtPikL2donpTgv7KzuCIun7R0Q'),('02b2f8a5-7f92-4b07-965d-3539c81aab73','785c73ff-a317-421a-8313-ed7fadbb2d2a','privateKey','MIIEpAIBAAKCAQEAx4FdGGvJLT+qgOk1QfyhiCAXLVucI8GVY+DIUDtPERiiUHtwuqQFl+yVf3Hz6KnQCeVQCjld1FJp4d3dY2g3kF/SR50Ikrv8QHCu7BGKTkzRtmeXVrIL5tJS6ehzdeH3MH61ljCnzWj1iV40qeHWDkqMRtzxnSdonxm1KTsUcNFYboV16pAeRpULvutRkKtV28ll3uGBDzHVG9+oDLqSqydrg3wdoGBtcZQq2XTPtZhIL9Kjr4sBr69RAr8cRimmhccGGGRliJCkHf+EIQJ434HlYlqcKOB8Tmz6HlUjlCJ4T/c+2h0+GjYUF9sUa6a4vlltoSsudpQlc8+dIYAIWQIDAQABAoIBAAbVef/QEgzW/rXvkce1dJS3YVvdehB+fSnLRXP8HXCnkEh4pgClWtyx+bVVzQYAqnPq/eN6b2n1EGlF1+N5FS2AnsZzDQa2YkUUfGVxPLSDF0xBKahfrR6Ga1krAX4oU/bpDDrSvANtBOYkSuJb2PYrMblsBZRoHm0UF3DMCYlLZFeVA1SVLdc8b+Enf9CsWnc6koi2X58srBp3Z5DeFjBhSAFEQWs/+fjpnKr0yJutpi4CvWSi6Pk1+gCuz471NQSWD8DZczVA5oPEmPAqNUEIFy/l5nnT6c7fLxKkD0Y2HMPALPR4fi99J+UJunYCtyOR7SwCPHV5hF50zmxOuAECgYEA6Pxh/3j9MJK6inNeb8shzFTtzY2KCO5/BHh5xmmrkhiCXxunm0z/UfqdMv63KTpV6SgqU9SlCv14FebVRCXXr8MpsIutwYONH5lgDJTkJ+c72BuvDqt0dPPTkoHj3Vk5G/wPSIak7O1c8OFVLJNtMKrA2xjGI3MkieKMsVgT9AECgYEA2zZX7c8NqvkWwAXvnv5kqM+Fw0ut0B6cwWYTFBhYe2vY+ehKMQSQdENwii7AoH1NM6ZT8joj63zmf3vM7YF6AKq3EUWIOzKk4Cx/r0MBS0TsVBzC+3rGF3n1u3J2W8ym+cw60tDbnVfqJs++fu7tGex+TqHQ6iqLGTpdjXUANFkCgYAed3JxL+ccBPPzyuZchBmlWK3IJWwZguaFNSPneEYBUscpnLosKsNweu83jetxrrkxRhlS4Qm8CC093/Ofd7tetoyrE3jjR0qbCTlwK8AyH6DJv8UCjBUsff36uJWNim9XY3y0JTdH7DotHao/q/+pT4rsm669T/9FMKTpQ/VIAQKBgQC6GfqwI7YAzpMn1mJF4sbmIbf3wsn/A94kulm8F6cWsMp172T9FFjmu1JRnbtfBMGD9dMSs5VHGLQ+yoWBpQhEhKoCebtcNnSO9Hg5/HKeyhawmfJWuTZvO9UIm/YrnSSssVvHGhU4ESjyZi/dZ03XUlUwwGOySQfqFQjTTN8tkQKBgQCw9PscupF64TO16I0L5+uld6FpXTCpIRf93UBtlR1T9eG53DSomlpojuSj1YVFWlIkascb7yrZaV8TXPndh+56GVe7uJZTre6eMCcEblFK9vAUb/DDw0jnYoHqdVq6tRv3zfEaP7zzHf6JMYekk/KJ229ccioB/Wmw8I8fMnZ9pg=='),('0477764e-8b4b-4469-b0e9-c817b9482c0a','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('1025c937-c1e4-4f8e-9d4d-30881910a0f8','785c73ff-a317-421a-8313-ed7fadbb2d2a','priority','100'),('1112ee44-89b3-4ed9-a6de-2f87a70da340','ad01681f-7041-4e4d-b081-0d5f93bfeae5','priority','100'),('120ad7fa-faa2-4b45-b830-a5c9e99b2f8c','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('12e7474a-e6a0-41cd-802c-771577f64351','cc084ad5-1ea4-4379-8405-3cab72a7e0c5','priority','100'),('16120040-2f48-4f11-b999-b8b902532953','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('185c5764-0010-4b2e-8a2b-e75dad27c9ca','a88a4c27-847f-4f3c-84e4-e51a8a8f5b96','client-uris-must-match','true'),('199c7f3b-688b-4963-9d9f-02396c932d94','097690df-76b0-4670-a866-97cb329f640c','allow-default-scopes','true'),('1aedb269-0e99-4f7c-8d96-41b75a81a452','ad01681f-7041-4e4d-b081-0d5f93bfeae5','certificate','MIICmzCCAYMCBgGRo8axdTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODMwMTQ1MTMzWhcNMzQwODMwMTQ1MzEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqGkMGfcE/KyZzlFnK4sReYjAotfRfWWIWuicdmGyxfu7aiPk+gO6hbRZXY47rYVrtoRhOu5Zv6TW6gHOoykkYCypgLP8omII2Lj5BRGzwOH8jH3E1Va0YwS94+ssp0KTRNrYpzJXL2siqXRqwSX8b1JRpMUk40I5FQr8pUKQBIB2brZyZG8s+l2Gqt+qkDHv3d23oyNUhChio0SPf5oEFoNazkVPIaAdMyZmbeAm29KjUxk1YW26C9wU6Olid6qduP7d3AfYi9tKYoCYNcXu1WpVH+Tly488xuvSsHik3rjmb/B9rZYEwhrZ0eWUAzuuLm8eA/b/fEeCCGshKTu5LAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIyptj7kf3OZwGUr+SextUQi13FRDIrQVtkTdenWbGHQFkLXRlgf/4p37BLa+XkvFoMh8FDd7lGv0ZBdFCnfcu4SvtPtwwouZ4UVCJw6XHGQrUkowbYKfi44iWuBB+kB+aRq2/si9984X8cJX2hv9UX/5bd1dKC4jFAdOPrcA/Ax//UOBC/QBtGuUUVAZrAeKsHEuubytYHUZyqSobiwBGKyEWnkbZmFCtZBt7V7+XbhBvgyc+gL5YeFyefStWG7E/a1kpeI/eGYCMMPSc6YDrNgCQchKQ7eIGxroKACCqntTykMM0STXnB5m0fqal82Fy27oD1awR4KHbUUxonc5XA='),('1aee9e06-940d-4e3f-b6ca-537cba885d4c','af1b5352-c811-49f4-8f88-397493b4834a','certificate','MIICozCCAYsCBgGRo8htsTANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApTUFJJTkdCT09UMB4XDTI0MDgzMDE0NTMyN1oXDTM0MDgzMDE0NTUwN1owFTETMBEGA1UEAwwKU1BSSU5HQk9PVDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKlQEhzwKrkOq8DUtPOBCJ43Ez6dBuFkhSdpfCB5qawzh8m60GiQSFw9qHdHmx/CgdbZOxYSQ7b6EEVj2rC2dNNf8J38HS1pzqZHmkI05XyXlOCQDkqql0YkeWo187SlAu8X6Pi2b1hUHTE5CNN4S8maTK/6PQG42ps1itGAHXiSl1T4wBmhCf9ldLL7ksAEb1U9++QCcJOq61CzEzBY7vP7cdnyZJ/5xghUw4Yjhyc6I5vgcNJe4oXfQQY7aPHxkb8q0CNdFxe3S75XYsy5aq34EaaRHQAru5hJguesvzPUHMvQEwp9cG8MrC2ysg6QhaBRcSnf4TG5f1bBjKelA8kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAlEtM4w+HnrnbicKEFNkbeS/vrN2eByzi5gt4UWUer3PCKN+SfAoj32rKssWWmvUlrLeqc5smkZ6tfZ5jOvD1s93R6iJG7M6gcpuGHDB/o8w4BRtl1/ETDsXWUk266wAiHUTP4Btk2Dy+OVcj5zqpAsZizAktbLSlIdwaXPvQfyPk0pjPnsfSjGleUtr35k8t5sMPlzO4doewrw6/echDoPVJijK9zS1UdDA+WurIKm3zcSaBUFEZyiSJ0Ca+Oj+/zJl3LhpZerapuBLMKo2R78dkgDYO5muDwc/+zc2Udz4GPwPj6Jci2yrNGeK9DHDQgBVd7PFYigWQlBk5yltbsg=='),('1bc52252-6980-49d2-a040-e76f1987bd03','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2034dd68-2e30-4597-8fe5-d2966b5b4de8','ec1e97c1-84be-45b2-8752-281cd2d11345','privateKey','MIIEoAIBAAKCAQEA2lMf6rFS4A9vLS2Vzyp7ipgAkcKkuSOGzm6D1LYwHNMtIxLm3xzpCd9v1rx9ewEC621FV50ppdrofVOvMYcKvBbUCmkVxEP6y7w7G46Q9SrRqOd69J1/KgW7IEVEGxhJgYsc5LLQDBtJiLJDF7RkMaRlymAe7jm+1fx52Y1FWRsk8PDUerHnIUEjmTmiyTBFP4xQ+1+pf++clk4QAKLqR/tFU+x41289jyCEwbFzgcFBXLu03S/3ta/uTPI6s2vVBSjMBhRlfAnL+lX6fT8LP3dTiYA34Om1jhn+bSb/Ok2wugUwYgL9qtb9pM/fPFH/H6Lnz0tD/ZmGm96Co3wbWwIDAQABAoIBAEF1BK+35JIa7olMDotjQFEIS7tn8T004pkH12yyBvDNe831P9UK9O+p1v053CFB518wjsa67x6z6FqS+YbO5zAHZCGO6iDDBPGKiOo1L07iPKP4awvmIJc3yqfdPJMnD/rP+6Sx2+CVWdGrKKR1yEh98qrfcMaZ95ZusRXB3lXdWMmn39GRcbsQXMmsMOT/dJDJX6DtCaqUnyEk98No8f+vdXLhC472SUK9SSnevw+5RvbOjgZWQypZxYdkHw1cY/Ogs5U6G97ABkuIdGtWQG1TdxpgqI6RqWdsDOylz1P+JHkdD1ebLcJ/IzKgYMyvAmAOgc35s212qzpwn7xiavECgYEA8AGMThZTUWY+dUIn0w3VyajncRO+dEF1dS7EYi6oHWwB+bGt6W6VrJqL7+9AyBVcVvkGUCMOqpEZSOthv7cPxabA8jIi4ZMvr7/b0qanPdpTJGEK3hIeB4zrIYOKTNLfdKslgRBJXDKXeXB75s+jS3QlckZPcniTVDAXecxxfjkCgYEA6N+yks1320ireBnz0zvtvQCOBFeQL1IsOGWYY7irN0TjOSDxDAqkRrEVuPzPeuKz9uivbbSJfCRu1P+r8GTKoVDE6WyT/ozU/UqIH3oArEt2mQ6WK7xKxkn33U6txxvvu7xN42YsXou22Y7lTKrA4EQfTYflTLdnnb/nyUk/pjMCfydgGaS2BPVV0Olr8RyvKGPtUgs7MgPguWSAR7fT78Dj927/t4iUm/m1YT/8AKTS3FNoh6CeH8ncBEnyVBcf8XZ75SvXDeH0Q96Rm37z2HxNVVailSXZ0xNqCyl0azwvXHnHml+STHbT1gYWbj1v01qNs5cL8fzVy1YEjdVttTECgYAlJmKfhsXDJsGsBD/gh+PyTd9aE/n9gpdpW9PGvNQbmhLBr16k9CGm4WM8wp/606WwEwjBcJaqRkmkEzGDxSCKQY9YSakGZ8MmsTgsBVOMKPG/kxMj4QLwxSYUmROh+vPwuCaYy1jysEk4RdKQu4DPhi6UOMS8y1ltUgsREm1j/wKBgHsqEjAQUh9PfvNFyCmYgMT8CSjgILYgWrDAwQSRIL3Dy9JzntcHfVZh4anmR9U6TCJC8FYps8xyS5Ubu1sXK7G9f6AqdX3iLYU2H8qVgMQmDiAwRuaNCI1WxWSGhMtBYYhlTj6H07OKqrzbbFQDJO3qjsST1Wc0X4GSwL0u3ZCd'),('22c63a06-f0c0-4dd0-b202-c3a0cd90ab8d','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('24dc15ac-7535-4929-9c58-05acfee10c57','bc4225e4-9bb7-4d0b-a957-290c5b117a1b','max-clients','200'),('25899b22-8fc1-4521-a53b-45b2580dd5b2','ec1e97c1-84be-45b2-8752-281cd2d11345','priority','100'),('267ded53-cd6c-4854-85ad-c638b0b65b99','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','saml-user-property-mapper'),('28a42951-6228-4d77-a0fa-ad197a3f80cf','ad01681f-7041-4e4d-b081-0d5f93bfeae5','keyUse','ENC'),('2d5a8ee6-b0d5-48ee-8047-6a963bb252be','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','oidc-address-mapper'),('32930230-0ba8-4a3a-94da-3244780487ef','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('337c22a4-b449-481b-a51e-88a3c4d7c510','29246bc8-8905-45ad-9738-53572f431817','priority','100'),('3c76ccf0-d8e2-4abb-b4d0-5921231da9a3','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','oidc-address-mapper'),('3ced8117-d3d8-48da-aa2a-e4173fb59ee5','ec1e97c1-84be-45b2-8752-281cd2d11345','keyUse','SIG'),('477567da-3975-490b-92dc-8c997852e8c0','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4bcdfbcc-a388-4123-98a0-ab011e114cd2','b40c9acb-882d-4674-a8e8-988785620829','kid','b45622c9-145e-4f41-a8bc-b3862d312a6a'),('51c4f1fb-50d4-4b18-a5da-33dc44730a3b','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','saml-role-list-mapper'),('5a615d4f-c9ae-4010-ad88-7e210ce51410','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','saml-user-property-mapper'),('5c4db0a5-3cd7-4873-8bd2-642023bba31e','785c73ff-a317-421a-8313-ed7fadbb2d2a','keyUse','ENC'),('5cbf8575-27a5-455c-b66b-0f4aee97e036','785c73ff-a317-421a-8313-ed7fadbb2d2a','algorithm','RSA-OAEP'),('5de555a9-f326-4859-93b2-a62c421e0a60','af1b5352-c811-49f4-8f88-397493b4834a','keyUse','SIG'),('5e9500c7-0c13-49fa-a47f-63da1b11e11d','ad01681f-7041-4e4d-b081-0d5f93bfeae5','algorithm','RSA-OAEP'),('65d05bb9-d0b2-421c-a066-0cecf15b0056','29246bc8-8905-45ad-9738-53572f431817','kid','97a5abc1-234e-4bd9-a63a-399413b21f51'),('679fc418-8200-4e2b-9d18-39ec3e62d49d','ad01681f-7041-4e4d-b081-0d5f93bfeae5','privateKey','MIIEogIBAAKCAQEAqhpDBn3BPysmc5RZyuLEXmIwKLX0X1liFronHZhssX7u2oj5PoDuoW0WV2OO62Fa7aEYTruWb+k1uoBzqMpJGAsqYCz/KJiCNi4+QURs8Dh/Ix9xNVWtGMEvePrLKdCk0Ta2KcyVy9rIql0asEl/G9SUaTFJONCORUK/KVCkASAdm62cmRvLPpdhqrfqpAx793dt6MjVIQoYqNEj3+aBBaDWs5FTyGgHTMmZm3gJtvSo1MZNWFtugvcFOjpYneqnbj+3dwH2IvbSmKAmDXF7tVqVR/k5cuPPMbr0rB4pN645m/wfa2WBMIa2dHllAM7ri5vHgP2/3xHgghrISk7uSwIDAQABAoIBADWNVAmgoKy68H2VuFkr4EeYoPHIKvmzwbJHA9aI7LtKq3bohZN8cuQmXFDB2rZW7ZH/VBBBdYChCpW/J+p9WNq1dS9XKzOEJAZbs6THnoZYOwp7NSBl6ztuYnwzdK+i7KijEWGCc6x8og0kh6j1UouX9utRJWy6F/hNJbKjnSZvCm+DRye8+1P6EXi2vHRLPdS2eGfKX9SUkQdEF9DEJAl10lp6TsK60Bzueuu/B5X+WaRs5PZ3KE0YoK/7gy6pFg1x3r4Yq+PDa+gk2V9d28brjCtLj4ggh5NOQeuT6Ck9muLum1Xu+p43CJHds48AeGDkgPSlNCRDmlEXT/udnfkCgYEA5fVm6KvOsyEv3nlKwLVpiaulH87fL4Vs1GIcuZl/ubvDUM0Q/Whqx4d8LWni7mJcnATlznEjH4sYCKmt/cNx/9nPhpBWgi6/8+sN9Warnqu0Btrg1mVkOhrKYqhQPNMXrvfyDKfMX/MnBt3fQ/QwdADfdgWL8bgGmcDsBqEhxmMCgYEAvV2bvhUXNQZtPtRw88XIMuJyNn+rk4r+4EKyEa+5WOvt12PNw54GwVpN48aBYXhqXqfIArxc0h0QUNLHEM8QvP0g34BYYlkvAFU1A9BaqO9HyTJeAIDCEn7P5fkWG6B57ZQe1x7D73oDmwFcJ240WjSyTqbDhKs5uSgVY2HsqPkCgYBPHDeE/+YiNd6T+MJAvahLFmO+J5scbBhekEo1h5srOG8fEw0vQIbLkc6kiPLq86fMfNraRI3CwkVIZadXz68eR75fGrTIIHEk5s5siB+ufH94hEApQcRTQPgzLJg99JkHNoFs3SUwNSRN9nJinFU28z3tCkd0psyOhJIuTayi5QKBgFcd53ZtMX39dOjAxy3+wXlXX//egEqiWVtGk7E7TGOyNnsuuQzTeHwfVVICkqcKxLTDL2rCyVkIcecc8OO0vxiSwzrPStoD+XGHwZn9kpfBbR8Mgt5sXdwwZuh/zUHsc+tuhzmkN7PGSD5ZQ9IICyGsuJMieTRhqW6bGCvecwfRAoGACUZSEBCiNN0Zscuhgrk/RduVDTMxnhrsSIigf4FZ4UdPkF5QeFEKTxmCXz2c1rIuh1Yw/d6WbwVOUI7W/bEegYn/N+YT/maeIlxN58HqsuC+dnaphS1O9CPqBkS7DQ4jONg54FQd/v+8TfiJ0DbLAsodx+I+324shlcUwEC4qUQ='),('693ecadc-0076-49b6-af3d-df95cb26db39','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','oidc-address-mapper'),('704422f6-134b-410d-bcaf-b9bc66d6893b','af1b5352-c811-49f4-8f88-397493b4834a','privateKey','MIIEpAIBAAKCAQEAqVASHPAquQ6rwNS084EInjcTPp0G4WSFJ2l8IHmprDOHybrQaJBIXD2od0ebH8KB1tk7FhJDtvoQRWPasLZ001/wnfwdLWnOpkeaQjTlfJeU4JAOSqqXRiR5ajXztKUC7xfo+LZvWFQdMTkI03hLyZpMr/o9AbjamzWK0YAdeJKXVPjAGaEJ/2V0svuSwARvVT375AJwk6rrULMTMFju8/tx2fJkn/nGCFTDhiOHJzojm+Bw0l7ihd9BBjto8fGRvyrQI10XF7dLvldizLlqrfgRppEdACu7mEmC56y/M9Qcy9ATCn1wbwysLbKyDpCFoFFxKd/hMbl/VsGMp6UDyQIDAQABAoIBAAlKnBvbcDTEoddMtPtx9tOb6SH0AxcmaYo+pzGvC4koMMj4yAwc8uOg/JhDJTeqeG6ecDgnW3D0qyTrtGojMSkSaEV7OuytlEoavtPoTDm4pdJnBWnCj9epE8Ko4E1nCtCtKrtPY6/gudNkMmBMhzgykAfOPz/Tcae32fziP3vI1MiMl1kumbacas2g4S7uHjVHh/HlFpr3vWN27PMwhMewb2IG/cUP5iTJvLK05ynJKIVU1plpgH8d9tC1NRXVqa8H7l3xV+F2Vfk66WgtvB2MZGZ9WP+iIYGifo/ZCVit0r5+JC1DtcQYZzGKj44IY8Aif/TKnQDXX5y7QD0jPkECgYEA1/kApqyd8tIWWGoGX/f1C+/gsQ7jlsqZwaNaJYSPWnbnuUumiP/pvN2OfMe/WGbhbZu3Ke3cZPVIlW7L2nzSRrru/rZ8JjIGUdhcBjeK1SsxpD6H3tjxJGlLyA+xy1PWoFifIWKIgBWBdRtZimtl/2ndWgylppNi5gdAwzknabECgYEAyLFAiFdFJz+qDKhcrB8y7thyKvLxVLW3jpilqre/eX8XIefHZ+HbWQShXs6BqRjM/2yB+PfK2g4eKrUUrIc4T8WWOW3A4wfp4693Rt3Gmq/U6oy/W8P+ij7UJYTDdCmB4xHKAVKMaI01bBrfLjcC9qPpNgVywsEMJccGSaKhqZkCgYEAr5BoOhWadFjZ91eBBSSRG/oM4oHi+qKJqQJ8doEy82wzZMqdf0LhpDlK6h6Kand/i1WI6NnGTn+iWG9v4ZWUbhDp1T9M3tPNlVzXOeqOvkjVmtmGI96g8GN0ShaQBmSJ1WEVQtNReSWCTktEV6SEjsNlQB2Fz0qCm9GLkOd2JZECgYEAqC4h7h90DBgF4OWWA4eBnzYzNlqwclR1pkG1UwL4qlAeioM5T4ytzENdF53melYWNFYx9PlyPJloHlHxKUOHpRHneejHo3mWPv9j7Tccn7SJsKSSF8x/GkrcbTR8tnOyLR9TMRiEIXl0M0uxi4D+MsHZRTP7n8k27NGEK2DmKMECgYB/z7/qFWJace1i9sHW3bIlZ1EvGiUUkHm3/89QlWCOotznyTemhUSyHyKgC3GWJYoZzzbpq1H+Utmaxogd1yByuT1LnUPyGsCg1sZqsz9hDaZCuphrxQf+LX63eMubcm7RgQxzw5wOaa7Q1tI505U5G1FXTWuR3fRW+xd/IEkYnA=='),('72f68030-7f90-4f55-b866-cb4a134c4250','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','saml-role-list-mapper'),('753cccd9-9800-4db3-900a-4c7a1127f74d','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('78eb3e04-1579-4e30-a07b-b63aecd1b9f4','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','oidc-full-name-mapper'),('8bc9bd8f-0a24-4b9e-bea9-3d84cf3b1ae1','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('90762a3e-867a-4834-9ab6-15f868991e19','29246bc8-8905-45ad-9738-53572f431817','secret','-qhPTh6qHeSBQ-T_deYu_5wEfLuRoUvfPPcHLdg6cXdAJtZ-ONgCGJQ93iEVENl2Bo-ioOAXBbsXBlAdQ33wxg'),('914e36f8-29a8-48a0-ae25-6ffea59c10a1','ec1e97c1-84be-45b2-8752-281cd2d11345','certificate','MIICmzCCAYMCBgGRo8awUzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODMwMTQ1MTMzWhcNMzQwODMwMTQ1MzEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDaUx/qsVLgD28tLZXPKnuKmACRwqS5I4bOboPUtjAc0y0jEubfHOkJ32/WvH17AQLrbUVXnSml2uh9U68xhwq8FtQKaRXEQ/rLvDsbjpD1KtGo53r0nX8qBbsgRUQbGEmBixzkstAMG0mIskMXtGQxpGXKYB7uOb7V/HnZjUVZGyTw8NR6sechQSOZOaLJMEU/jFD7X6l/75yWThAAoupH+0VT7HjXbz2PIITBsXOBwUFcu7TdL/e1r+5M8jqza9UFKMwGFGV8Ccv6Vfp9Pws/d1OJgDfg6bWOGf5tJv86TbC6BTBiAv2q1v2kz988Uf8foufPS0P9mYab3oKjfBtbAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB9u7FkN5JUHc/Fo9/d99dvnu+QQ8og3EuQu2o3IIob4rJUKp9Qy78gkebBUV4fgGsGfi9gKXuUyIe+zm2QmmUYZotkEfEW/aZ5eLDA4vmtuiRAQSOg0RZ1hvv52UoFg50B8VlfPk5jxrjYOM5UTX6bzOhJEGaN7HxITCg5H2xANOz16DWYzF25uvOA0ai6rjgnIJB2zS/tb9VcsnK6zqs9BQlD7sNg97ZpJ/oKAFckWDxXWvepoYN+pLpMRBUP4eyxtbumDzu6wPsPSl8YWGGvfFy1ARWc44HyDiH5k/Kks3Th1w1g1n6LzPajtnB+z6AMCFwgH/iGhzesn6prf4Yw='),('95d870ad-6be8-4a68-b637-08d10b813988','b40c9acb-882d-4674-a8e8-988785620829','priority','100'),('9b60f363-b2c4-4571-8392-b76001fe80d3','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9bae068c-fe62-4683-aa1e-a53d5efad599','cc084ad5-1ea4-4379-8405-3cab72a7e0c5','secret','jMeApWLVg6twyo5GvsY9EQ'),('aac7fc52-65ac-486a-bafe-0fab83a8ffd4','b40c9acb-882d-4674-a8e8-988785620829','algorithm','HS256'),('ab331067-427f-4e17-b89f-75434d2bf898','29246bc8-8905-45ad-9738-53572f431817','algorithm','HS256'),('adef57bb-a973-46ec-b99d-ce21dbd9c613','060427cf-6c88-4e6a-8868-1477d37f1bd0','priority','100'),('b17d22b4-0b7e-4313-ab71-f61014681dc5','d87e7bde-63b7-4419-91e7-f2103dccba9e','allow-default-scopes','true'),('b6f1bfc6-7039-4e1d-9211-5626b2d3cb0e','84baf0e1-8bb2-4217-a2e0-4c154bc80137','client-uris-must-match','true'),('bc15f7f5-7a3d-4c28-91cd-eacde4978282','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('bd4106ff-6f71-4207-b415-c1c25222e93b','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','oidc-address-mapper'),('be829868-e24f-4ce5-bb56-c10bc994c584','a88a4c27-847f-4f3c-84e4-e51a8a8f5b96','host-sending-registration-request-must-match','true'),('be9e5920-8385-4a07-ab09-936727da7b90','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('bf3b2b14-bcb0-4f07-af08-ec1e0078fb2d','84baf0e1-8bb2-4217-a2e0-4c154bc80137','host-sending-registration-request-must-match','true'),('c0c7814a-fef7-4506-9ec3-72d2c2b617cd','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','saml-role-list-mapper'),('c3c537fc-b5c3-4196-9ae4-bb3d7259dd21','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c8224e2c-47b7-4689-886a-1a0db05f7286','060427cf-6c88-4e6a-8868-1477d37f1bd0','secret','Nd9wIXQA1AvcthcA9xs8Bw'),('d2a15135-657e-4e46-89f9-fda72a11ae20','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('dbae4b22-9139-4a5b-b876-fe92d84e599a','17427abc-e144-4b78-8bb5-82e1c1fb9344','max-clients','200'),('dd93eac8-240a-4f01-b740-4558f5651efb','cc084ad5-1ea4-4379-8405-3cab72a7e0c5','kid','7243fa35-8415-4ca5-bc45-f9ba19f2ac15'),('e09ba4f3-577f-4dcd-a84f-018158e566a2','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','saml-user-property-mapper'),('e6bfcab5-b736-43a8-a023-c476f4fddb16','785c73ff-a317-421a-8313-ed7fadbb2d2a','certificate','MIICozCCAYsCBgGRo8huKjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApTUFJJTkdCT09UMB4XDTI0MDgzMDE0NTMyN1oXDTM0MDgzMDE0NTUwN1owFTETMBEGA1UEAwwKU1BSSU5HQk9PVDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeBXRhryS0/qoDpNUH8oYggFy1bnCPBlWPgyFA7TxEYolB7cLqkBZfslX9x8+ip0AnlUAo5XdRSaeHd3WNoN5Bf0kedCJK7/EBwruwRik5M0bZnl1ayC+bSUunoc3Xh9zB+tZYwp81o9YleNKnh1g5KjEbc8Z0naJ8ZtSk7FHDRWG6FdeqQHkaVC77rUZCrVdvJZd7hgQ8x1RvfqAy6kqsna4N8HaBgbXGUKtl0z7WYSC/So6+LAa+vUQK/HEYppoXHBhhkZYiQpB3/hCECeN+B5WJanCjgfE5s+h5VI5QieE/3PtodPho2FBfbFGumuL5ZbaErLnaUJXPPnSGACFkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAd/Zs1trnO+YO7y/08ua1wR1ZOCvrr5sGI5hRN7ryWJNIgusP9lQSpoq1au1yMEgNa5rijDUqMfVI9GGIXlWEaJuxvoc9NUdKEGnN/GwuGByUtfIjAv9np4Pu1PK5SSAYLMWQ1ctJWNRsnNIcbKxfdPl1NSFWqq/nabuxllLFaPryIZhLtH3nKW+8AISQoF0GSW0Ew88nWJB2BnAjHi8P9vHVGsSJfulIiSDiWr4uhSw6AHyBwdvLS2fD+rFFo/0VolNQJAi2xrd15KHYHSs//QpTU5R45nQH+CyRdO1iubdZxCZyLGKbUJt/ZZ5J6iqIuR7xh6M5TAuGzlhUMUbD8w=='),('eb3edaf9-69a1-4fd1-a679-4926113078d6','3047a070-0956-4248-a76a-497e663496b9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ef7552aa-b1b3-459c-9602-0f45c4dfab88','0d1bc0ad-8f56-444d-a9ad-5875031bf3cc','allow-default-scopes','true'),('ef7daa5e-415a-49e2-96d9-a43de8cef01d','af1b5352-c811-49f4-8f88-397493b4834a','priority','100'),('f0aaaa4e-6067-4559-b2c9-5370b08ce0c0','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f1a415b2-c69a-4c92-8419-be6b82a5cfb0','8110d1bd-c303-46ae-a01e-584f3005ad77','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f31408b6-008b-4647-ae69-6d5411a64725','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','saml-role-list-mapper'),('f3bd7131-4a7f-49be-a20a-71bbb746b7de','060427cf-6c88-4e6a-8868-1477d37f1bd0','kid','fbbd9980-a930-4657-ab55-1351d355d103'),('f90c8c60-8a94-413c-b2be-4e6e2ae7fa53','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f961b5d7-1de2-4f72-9534-ba1d11022260','e54e8773-a075-493a-9d91-20815085f942','allowed-protocol-mapper-types','saml-user-property-mapper'),('fab434fc-1739-48ba-9b09-f1f0bff00fa7','ddcb4cbd-aed0-42ed-ba54-5fdb82e980ab','allow-default-scopes','true'),('fb111330-592d-4a95-9261-c6376321865f','e2e877bc-5181-49eb-a97c-da012a9fd43a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0a1bfb2b-ae0e-44bc-989a-82d8849642b8','06ae5f33-8af3-40c5-ac1a-44ca96623823'),('0a1bfb2b-ae0e-44bc-989a-82d8849642b8','df16baf5-4c3c-4896-9532-e465f93eddab'),('1462194d-0988-428e-bc4a-d24295825b07','c1ae9784-90a8-4305-8741-755ee3ddc445'),('158d037c-7ae0-4df9-9f15-c49f649f7f54','86952ae1-2a3f-4701-824e-369f72935b0f'),('24be240a-2187-47a2-b277-42ad657228ba','0a1b059b-3a6f-464e-ad44-f0c23f2170e4'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','038e3317-b995-4a6e-81c9-ab8704d8da74'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','0ab8ca28-a8c5-41f3-a64b-74f8c8e3fd8f'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','0b019b06-708a-44b7-9eb3-baa67e8a2edc'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','1587ee70-e153-4bdc-9034-5ac6890b6dbd'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','158d037c-7ae0-4df9-9f15-c49f649f7f54'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','1745600c-bb9a-41c1-bc6c-4ae59deccc43'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','2035ca88-137f-4b61-b558-a00a47b0d26d'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','229ba07d-fc1e-447d-97e4-af6116f4c99c'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','4470f898-9edf-4275-b2dd-8605b955241c'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','45d3469a-899c-4779-8d99-c95b7b56525b'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','49611b53-0e2c-49d3-9fd9-eec78ccbe57e'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','5cee7f37-0dc9-44f6-9e54-13b64dc1cb8f'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','5dd46f05-0220-48cd-a4e7-b3186f0d1e37'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','6e757fe7-1ab0-420a-beac-57d267a7c935'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','863d7692-3792-4eab-866b-234ee6b137fe'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','86952ae1-2a3f-4701-824e-369f72935b0f'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','8e4dc44c-82ca-4f75-acd5-9d57a18ef7df'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','93da6cad-3ba0-46a3-828c-36eb4f6cdf12'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','98a1293c-a636-42d2-b086-4fc144613ce5'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','a126b1b0-518e-43b2-a030-0811d316ff30'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','b0bb1dcf-659c-4cd9-bd49-5484914a2ae6'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','beda2aa4-ac0a-4365-8764-b03b03bacf49'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','c9797f99-036b-4606-82b2-45dcdc2a4bf4'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','cfaeffca-0727-46d8-b19c-70de37227935'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','e2fbb413-99d3-4452-85e4-05d0862318d8'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','ed629ad7-f63d-492e-9dcb-35f97d65fc2d'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','eec1122f-8d8c-48f7-9357-4a97d1f8a5fc'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','ef50d72c-8223-4466-9909-d160f26e40d5'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','f1a59d67-0c1e-47f3-b721-8f548d8fefd0'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','fd93785c-f9c7-499a-9651-125e6473a60d'),('45d3469a-899c-4779-8d99-c95b7b56525b','5dd46f05-0220-48cd-a4e7-b3186f0d1e37'),('45d3469a-899c-4779-8d99-c95b7b56525b','a126b1b0-518e-43b2-a030-0811d316ff30'),('4cb05367-880f-46f4-8081-6e305dd132bb','f8033cc6-22a1-4ce6-ba85-fbfce582d0bb'),('688c2489-701d-4b02-a4ef-190916c00dbd','74be3124-fb44-4e0a-93c3-f84b02c30a6e'),('688c2489-701d-4b02-a4ef-190916c00dbd','daaa9247-1128-4b1d-a83d-005bccbbfe3f'),('863d7692-3792-4eab-866b-234ee6b137fe','038e3317-b995-4a6e-81c9-ab8704d8da74'),('863d7692-3792-4eab-866b-234ee6b137fe','0ab8ca28-a8c5-41f3-a64b-74f8c8e3fd8f'),('863d7692-3792-4eab-866b-234ee6b137fe','0b019b06-708a-44b7-9eb3-baa67e8a2edc'),('863d7692-3792-4eab-866b-234ee6b137fe','1587ee70-e153-4bdc-9034-5ac6890b6dbd'),('863d7692-3792-4eab-866b-234ee6b137fe','1745600c-bb9a-41c1-bc6c-4ae59deccc43'),('863d7692-3792-4eab-866b-234ee6b137fe','229ba07d-fc1e-447d-97e4-af6116f4c99c'),('863d7692-3792-4eab-866b-234ee6b137fe','4470f898-9edf-4275-b2dd-8605b955241c'),('863d7692-3792-4eab-866b-234ee6b137fe','45d3469a-899c-4779-8d99-c95b7b56525b'),('863d7692-3792-4eab-866b-234ee6b137fe','49611b53-0e2c-49d3-9fd9-eec78ccbe57e'),('863d7692-3792-4eab-866b-234ee6b137fe','5dd46f05-0220-48cd-a4e7-b3186f0d1e37'),('863d7692-3792-4eab-866b-234ee6b137fe','6e757fe7-1ab0-420a-beac-57d267a7c935'),('863d7692-3792-4eab-866b-234ee6b137fe','98a1293c-a636-42d2-b086-4fc144613ce5'),('863d7692-3792-4eab-866b-234ee6b137fe','a126b1b0-518e-43b2-a030-0811d316ff30'),('863d7692-3792-4eab-866b-234ee6b137fe','b0bb1dcf-659c-4cd9-bd49-5484914a2ae6'),('863d7692-3792-4eab-866b-234ee6b137fe','e2fbb413-99d3-4452-85e4-05d0862318d8'),('863d7692-3792-4eab-866b-234ee6b137fe','eec1122f-8d8c-48f7-9357-4a97d1f8a5fc'),('863d7692-3792-4eab-866b-234ee6b137fe','ef50d72c-8223-4466-9909-d160f26e40d5'),('863d7692-3792-4eab-866b-234ee6b137fe','f1a59d67-0c1e-47f3-b721-8f548d8fefd0'),('9638a953-4eb9-4563-908a-fd26f05818a3','06ae5f33-8af3-40c5-ac1a-44ca96623823'),('9638a953-4eb9-4563-908a-fd26f05818a3','08a23c1b-4f6e-4a61-aaf8-5a1af8c1c42d'),('9638a953-4eb9-4563-908a-fd26f05818a3','0a1bfb2b-ae0e-44bc-989a-82d8849642b8'),('9638a953-4eb9-4563-908a-fd26f05818a3','0caa86f4-541d-45c4-ab22-33211d949708'),('9638a953-4eb9-4563-908a-fd26f05818a3','143817b5-6967-49c9-b8d5-ecdef164eb28'),('9638a953-4eb9-4563-908a-fd26f05818a3','1cc62f04-e31e-46d0-a9c2-51967b04d62b'),('9638a953-4eb9-4563-908a-fd26f05818a3','206f3be3-0b22-4c93-8ea4-c47cc68148c9'),('9638a953-4eb9-4563-908a-fd26f05818a3','2c7bfe88-797a-4f78-af57-e6e2e85e1c09'),('9638a953-4eb9-4563-908a-fd26f05818a3','370f6f12-4b57-416e-9a24-716e4d2691c7'),('9638a953-4eb9-4563-908a-fd26f05818a3','49231ee1-8bda-418b-a67d-25db38a85433'),('9638a953-4eb9-4563-908a-fd26f05818a3','4c9814cc-6906-4711-8d1c-2c4895119ef2'),('9638a953-4eb9-4563-908a-fd26f05818a3','4cb05367-880f-46f4-8081-6e305dd132bb'),('9638a953-4eb9-4563-908a-fd26f05818a3','515fb5f4-bf77-4125-a6f9-bab209fa6b1d'),('9638a953-4eb9-4563-908a-fd26f05818a3','516a4770-607d-4090-b6da-71f2875f8f15'),('9638a953-4eb9-4563-908a-fd26f05818a3','5d9c94bf-4844-4b5d-a9a9-631fd5f7003b'),('9638a953-4eb9-4563-908a-fd26f05818a3','619c45ef-1b6d-4dd8-bdd2-191059143ac2'),('9638a953-4eb9-4563-908a-fd26f05818a3','64d3ec0b-b4d0-4bf4-8f97-b7f185ad7cf4'),('9638a953-4eb9-4563-908a-fd26f05818a3','688c2489-701d-4b02-a4ef-190916c00dbd'),('9638a953-4eb9-4563-908a-fd26f05818a3','6d769de1-23ef-44e0-b144-a32698055989'),('9638a953-4eb9-4563-908a-fd26f05818a3','6eb7b10c-4361-4da2-9151-cacfe1d8c163'),('9638a953-4eb9-4563-908a-fd26f05818a3','74be3124-fb44-4e0a-93c3-f84b02c30a6e'),('9638a953-4eb9-4563-908a-fd26f05818a3','7b3a50b5-bb92-4220-aed9-3d4ad6839335'),('9638a953-4eb9-4563-908a-fd26f05818a3','81d1b5d7-e1f1-4f50-bce6-0e30ea7c6ec0'),('9638a953-4eb9-4563-908a-fd26f05818a3','89f25a2d-8788-4b25-996c-243d7b7d39cc'),('9638a953-4eb9-4563-908a-fd26f05818a3','8b33316b-c8b6-4ade-95ce-23f83ed547a2'),('9638a953-4eb9-4563-908a-fd26f05818a3','8e477593-49a9-441c-ac63-fdc237978b40'),('9638a953-4eb9-4563-908a-fd26f05818a3','9380b558-6c94-41ef-86fe-dc98fc6af72a'),('9638a953-4eb9-4563-908a-fd26f05818a3','ba36e7d8-5af0-4e45-88e0-0813ff3a43be'),('9638a953-4eb9-4563-908a-fd26f05818a3','d1c2cbfc-976f-406a-8111-b6eb187b3049'),('9638a953-4eb9-4563-908a-fd26f05818a3','daaa9247-1128-4b1d-a83d-005bccbbfe3f'),('9638a953-4eb9-4563-908a-fd26f05818a3','de31da59-62dc-4a07-986e-f919cbe69616'),('9638a953-4eb9-4563-908a-fd26f05818a3','df16baf5-4c3c-4896-9532-e465f93eddab'),('9638a953-4eb9-4563-908a-fd26f05818a3','e25e175d-c959-4116-beeb-c291d62c73a9'),('9638a953-4eb9-4563-908a-fd26f05818a3','f2c15ba9-ddd5-4b0b-9d8b-6261dec0fa79'),('9638a953-4eb9-4563-908a-fd26f05818a3','f8033cc6-22a1-4ce6-ba85-fbfce582d0bb'),('9638a953-4eb9-4563-908a-fd26f05818a3','fbbf0bdc-6e52-4116-b523-dc852a3e98ad'),('9638a953-4eb9-4563-908a-fd26f05818a3','fcf32517-8061-48bd-9d20-39577f5fadc1'),('b0bb1dcf-659c-4cd9-bd49-5484914a2ae6','0ab8ca28-a8c5-41f3-a64b-74f8c8e3fd8f'),('ba36e7d8-5af0-4e45-88e0-0813ff3a43be','8b33316b-c8b6-4ade-95ce-23f83ed547a2'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','07d3ee31-667b-405e-8cf5-241e590df890'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','158d037c-7ae0-4df9-9f15-c49f649f7f54'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','b4051c8a-ef0d-43df-b939-32e9fbcae462'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','ed629ad7-f63d-492e-9dcb-35f97d65fc2d'),('fc6f7fed-055a-4700-9e7a-a60359034efc','24be240a-2187-47a2-b277-42ad657228ba'),('fc6f7fed-055a-4700-9e7a-a60359034efc','4d291806-ae61-44cb-978d-4cc012bc5753'),('fc6f7fed-055a-4700-9e7a-a60359034efc','51edafa3-2585-41ad-b485-43dc47dc555d'),('fc6f7fed-055a-4700-9e7a-a60359034efc','5efc57ae-b28c-471c-8da8-140e6b3fb667'),('fd93785c-f9c7-499a-9651-125e6473a60d','93da6cad-3ba0-46a3-828c-36eb4f6cdf12');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('d0702258-0b63-4545-8c6a-af2fd81032bf',NULL,'password','5f2fa16e-194c-467e-84db-1ab38a6e961e',1725123124843,NULL,'{\"value\":\"DWM4G+0WpcU5qKWvryJHvFMMEN6/ZB88kd4RSYBj6A4=\",\"salt\":\"irrfiffCuK6sthqwGB/BDQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('ea730aad-12ed-478f-ae4c-439796a29185',NULL,'password','6d910627-d219-4ad9-a545-ccf94bbbc77a',1725117316655,NULL,'{\"value\":\"dn77MnbKQEtgRqESGyPXmpO2+d9U4m46d7vGpbZpNz4=\",\"salt\":\"algoMCCLextqgnP4xTyJ+g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('ebb3050a-2a35-439b-ac03-57a8eab0fe21',NULL,'password','a2a0c399-dab1-4175-9e2f-536a5624083e',1725029594330,NULL,'{\"value\":\"0ETe4VCVnmId5WSQv0RQ2CZn/aA91QhswRfxDVBNf1c=\",\"salt\":\"KuG9f94Sa5A+36JMKUtgZA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-08-30 14:52:47',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-08-30 14:52:47',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-08-30 14:52:47',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-08-30 14:52:47',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-08-30 14:52:49',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-08-30 14:52:49',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-08-30 14:52:51',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-08-30 14:52:51',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-08-30 14:52:51',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-08-30 14:52:53',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-08-30 14:52:54',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-08-30 14:52:54',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-08-30 14:52:54',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-08-30 14:52:54',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-08-30 14:52:54',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-08-30 14:52:54',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-08-30 14:52:54',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-08-30 14:52:55',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-08-30 14:52:56',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-08-30 14:52:56',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-08-30 14:52:56',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-08-30 14:52:56',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-08-30 14:52:56',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-08-30 14:52:56',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-08-30 14:52:56',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-08-30 14:52:56',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-08-30 14:52:57',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-08-30 14:52:57',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-08-30 14:52:58',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-08-30 14:52:58',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-08-30 14:52:58',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-08-30 14:52:58',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-08-30 14:52:58',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-08-30 14:52:58',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-08-30 14:53:00',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-08-30 14:53:00',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-08-30 14:53:00',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'5029563284'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-08-30 14:53:00',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-08-30 14:53:00',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-08-30 14:53:00',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-08-30 14:53:00',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-08-30 14:53:00',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-08-30 14:53:01',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-08-30 14:53:01',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-08-30 14:53:01',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-08-30 14:53:01',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-08-30 14:53:01',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-08-30 14:53:02',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-08-30 14:53:02',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-08-30 14:53:03',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-08-30 14:53:04',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-08-30 14:53:04',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-08-30 14:53:04',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-08-30 14:53:04',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-08-30 14:53:04',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-08-30 14:53:04',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-08-30 14:53:04',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-08-30 14:53:06',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-08-30 14:53:07',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-08-30 14:53:07',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-08-30 14:53:07',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-08-30 14:53:07',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-08-30 14:53:07',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-08-30 14:53:07',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-08-30 14:53:07',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-08-30 14:53:07',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-08-30 14:53:07',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-08-30 14:53:07',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-08-30 14:53:07',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-08-30 14:53:08',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'5029563284'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-08-30 14:53:08',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.23.2',NULL,NULL,'5029563284'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-08-30 14:53:08',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-08-30 14:53:08',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-08-30 14:53:08',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-08-30 14:53:08',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-08-30 14:53:08',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-08-30 14:53:08',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-08-30 14:53:08',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-08-30 14:53:09',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-08-30 14:53:09',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-08-30 14:53:09',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-08-30 14:53:09',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-08-30 14:53:09',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-08-30 14:53:09',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'5029563284'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-08-30 14:53:09',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-08-30 14:53:09',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.23.2',NULL,NULL,'5029563284'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-08-30 14:53:09',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-08-30 14:53:09',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.23.2',NULL,NULL,'5029563284'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:09',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:09',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:09',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'5029563284'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:09',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:09',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:10',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.23.2',NULL,NULL,'5029563284'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:10',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-08-30 14:53:10',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'5029563284'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-08-30 14:53:10',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-08-30 14:53:10',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-08-30 14:53:10',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-08-30 14:53:10',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-08-30 14:53:10',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-08-30 14:53:10',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-08-30 14:53:10',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'5029563284'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-08-30 14:53:10',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'5029563284'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-08-30 14:53:10',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-08-30 14:53:10',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.23.2',NULL,NULL,'5029563284'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-08-30 14:53:10',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.23.2',NULL,NULL,'5029563284'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-08-30 14:53:10',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-08-30 14:53:10',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.23.2',NULL,NULL,'5029563284'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-08-30 14:53:10',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.23.2',NULL,NULL,'5029563284'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-08-30 14:53:10',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'5029563284');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','11e2edfb-e674-4c6c-960a-ef7fb298eec6',_binary ''),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','150db6a6-7ee1-485f-b7b4-ac346986bec3',_binary '\0'),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','1df892f9-ae31-4abd-9eac-f1e1a4427cb4',_binary '\0'),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','3340c928-f494-4dfd-950a-c3396fa84df2',_binary '\0'),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','518d2bb1-2e79-4ded-8802-5be87004ffd0',_binary ''),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','6107c1d8-fa6d-4196-8063-119eb65237df',_binary ''),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','746663dd-20c5-4840-bdfc-e9e94669bc4d',_binary '\0'),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','9c3bc543-8063-4785-81a4-add8fb8cb38a',_binary ''),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','b41748a2-9198-4caf-80c2-13deefaa267b',_binary ''),('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','e333e0bb-cc62-4322-9d32-c8e10cb6f560',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','25d5516f-8181-4b0f-9b3d-7e8adb055e2d',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','289a3c81-1ec2-4d56-ba88-b871fc4acd35',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','3eedb2a3-6c2e-47fa-badc-b350dfcd2f79',_binary '\0'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','52cd6160-b21b-4110-988b-fa93df664304',_binary '\0'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','5b94e0fa-9cde-4294-8e8d-ba05452fcb2d',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','7e91d336-ea38-489b-aaa0-37463d646b27',_binary '\0'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','be579794-ff9f-4b35-a27d-1e89d019236c',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','cb305e6a-09fd-425e-aee2-63b661c00bb7',_binary ''),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','d17137ae-6d30-4623-bf25-12fbfa7ee9aa',_binary '\0'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','f1f95ed5-742e-4928-a192-80cf9a9dfb4a',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('038e3317-b995-4a6e-81c9-ab8704d8da74','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_create-client}','create-client','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('06ae5f33-8af3-40c5-ac1a-44ca96623823','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_query-groups}','query-groups','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('07d3ee31-667b-405e-8cf5-241e590df890','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0','${role_offline-access}','offline_access','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL,NULL),('08a23c1b-4f6e-4a61-aaf8-5a1af8c1c42d','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-events}','manage-events','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('0a1b059b-3a6f-464e-ad44-f0c23f2170e4','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_manage-account-links}','manage-account-links','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('0a1bfb2b-ae0e-44bc-989a-82d8849642b8','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-users}','view-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('0ab8ca28-a8c5-41f3-a64b-74f8c8e3fd8f','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_query-clients}','query-clients','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('0b019b06-708a-44b7-9eb3-baa67e8a2edc','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-authorization}','view-authorization','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('0caa86f4-541d-45c4-ab22-33211d949708','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-authorization}','manage-authorization','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('143817b5-6967-49c9-b8d5-ecdef164eb28','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-realm}','manage-realm','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('1462194d-0988-428e-bc4a-d24295825b07','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_manage-consent}','manage-consent','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('1587ee70-e153-4bdc-9034-5ac6890b6dbd','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_impersonation}','impersonation','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('158d037c-7ae0-4df9-9f15-c49f649f7f54','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_manage-account}','manage-account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('1745600c-bb9a-41c1-bc6c-4ae59deccc43','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-identity-providers}','view-identity-providers','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('1cc62f04-e31e-46d0-a9c2-51967b04d62b','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_query-realms}','query-realms','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('2035ca88-137f-4b61-b558-a00a47b0d26d','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_view-applications}','view-applications','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('206f3be3-0b22-4c93-8ea4-c47cc68148c9','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-identity-providers}','manage-identity-providers','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('229ba07d-fc1e-447d-97e4-af6116f4c99c','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-events}','view-events','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('24be240a-2187-47a2-b277-42ad657228ba','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_manage-account}','manage-account','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('2c7bfe88-797a-4f78-af57-e6e2e85e1c09','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0','${role_create-realm}','create-realm','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,NULL),('370f6f12-4b57-416e-9a24-716e4d2691c7','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-events}','manage-events','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('3d293091-860e-4984-ba3d-0b1ca3e144ba','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0','','admin','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL,NULL),('4470f898-9edf-4275-b2dd-8605b955241c','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-users}','manage-users','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('45d3469a-899c-4779-8d99-c95b7b56525b','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-users}','view-users','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('49231ee1-8bda-418b-a67d-25db38a85433','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-identity-providers}','view-identity-providers','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('49611b53-0e2c-49d3-9fd9-eec78ccbe57e','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-events}','manage-events','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('4c9814cc-6906-4711-8d1c-2c4895119ef2','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-realm}','view-realm','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('4cb05367-880f-46f4-8081-6e305dd132bb','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-clients}','view-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('4d291806-ae61-44cb-978d-4cc012bc5753','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0','${role_offline-access}','offline_access','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,NULL),('515fb5f4-bf77-4125-a6f9-bab209fa6b1d','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-users}','manage-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('516a4770-607d-4090-b6da-71f2875f8f15','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_impersonation}','impersonation','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('51edafa3-2585-41ad-b485-43dc47dc555d','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0','${role_uma_authorization}','uma_authorization','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,NULL),('5cee7f37-0dc9-44f6-9e54-13b64dc1cb8f','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_delete-account}','delete-account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('5d9c94bf-4844-4b5d-a9a9-631fd5f7003b','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-authorization}','view-authorization','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('5dd46f05-0220-48cd-a4e7-b3186f0d1e37','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_query-groups}','query-groups','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('5efc57ae-b28c-471c-8da8-140e6b3fb667','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_view-profile}','view-profile','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('619c45ef-1b6d-4dd8-bdd2-191059143ac2','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_create-client}','create-client','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('6437d7ae-ddba-4d3a-9f21-1ddc99d51b1d','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_view-applications}','view-applications','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('64d3ec0b-b4d0-4bf4-8f97-b7f185ad7cf4','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-events}','view-events','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('688c2489-701d-4b02-a4ef-190916c00dbd','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-users}','view-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('6d769de1-23ef-44e0-b144-a32698055989','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-clients}','manage-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('6e757fe7-1ab0-420a-beac-57d267a7c935','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-authorization}','manage-authorization','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('6eb7b10c-4361-4da2-9151-cacfe1d8c163','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_impersonation}','impersonation','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('74be3124-fb44-4e0a-93c3-f84b02c30a6e','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_query-users}','query-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('7b3a50b5-bb92-4220-aed9-3d4ad6839335','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-authorization}','view-authorization','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('81d1b5d7-e1f1-4f50-bce6-0e30ea7c6ec0','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-realm}','manage-realm','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('863d7692-3792-4eab-866b-234ee6b137fe','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_realm-admin}','realm-admin','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('86952ae1-2a3f-4701-824e-369f72935b0f','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_manage-account-links}','manage-account-links','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('89f25a2d-8788-4b25-996c-243d7b7d39cc','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_manage-identity-providers}','manage-identity-providers','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('8b33316b-c8b6-4ade-95ce-23f83ed547a2','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_query-clients}','query-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('8e477593-49a9-441c-ac63-fdc237978b40','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-events}','view-events','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('8e4dc44c-82ca-4f75-acd5-9d57a18ef7df','27187fe5-3e01-4b08-9102-6c1b08fa5208',_binary '','${role_read-token}','read-token','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','27187fe5-3e01-4b08-9102-6c1b08fa5208',NULL),('9380b558-6c94-41ef-86fe-dc98fc6af72a','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_view-identity-providers}','view-identity-providers','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('93da6cad-3ba0-46a3-828c-36eb4f6cdf12','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_view-consent}','view-consent','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('9638a953-4eb9-4563-908a-fd26f05818a3','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0','${role_admin}','admin','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,NULL),('98a1293c-a636-42d2-b086-4fc144613ce5','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-realm}','manage-realm','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('a126b1b0-518e-43b2-a030-0811d316ff30','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_query-users}','query-users','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('a5f55b97-60ba-4028-82a1-e7f662966dd4','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_view-groups}','view-groups','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('b0bb1dcf-659c-4cd9-bd49-5484914a2ae6','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-clients}','view-clients','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('b4051c8a-ef0d-43df-b939-32e9fbcae462','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0','${role_uma_authorization}','uma_authorization','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL,NULL),('ba36e7d8-5af0-4e45-88e0-0813ff3a43be','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-clients}','view-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('beda2aa4-ac0a-4365-8764-b03b03bacf49','f4f80066-7dd4-4c8c-812d-6d02525b1422',_binary '','','multirubro-admin','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('bfb9059e-949d-4b8e-8f2d-b176c6c8014c','cc34d881-61f4-4382-a436-23ee3533d063',_binary '','${role_read-token}','read-token','d853bfa0-17e0-4f82-8c5e-4e87c8901796','cc34d881-61f4-4382-a436-23ee3533d063',NULL),('c1ae9784-90a8-4305-8741-755ee3ddc445','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_view-consent}','view-consent','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('c9797f99-036b-4606-82b2-45dcdc2a4bf4','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_view-groups}','view-groups','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('ca9a0e4f-c1f0-4a4f-8d0c-fb38a2c13515','52b64ac4-3eaa-49fb-8875-a02e26f96364',_binary '','${role_delete-account}','delete-account','d853bfa0-17e0-4f82-8c5e-4e87c8901796','52b64ac4-3eaa-49fb-8875-a02e26f96364',NULL),('cfaeffca-0727-46d8-b19c-70de37227935','f4f80066-7dd4-4c8c-812d-6d02525b1422',_binary '',NULL,'uma_protection','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('d1c2cbfc-976f-406a-8111-b6eb187b3049','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_view-realm}','view-realm','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('daaa9247-1128-4b1d-a83d-005bccbbfe3f','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_query-groups}','query-groups','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('de31da59-62dc-4a07-986e-f919cbe69616','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-clients}','manage-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('df16baf5-4c3c-4896-9532-e465f93eddab','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_query-users}','query-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('e25e175d-c959-4116-beeb-c291d62c73a9','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_create-client}','create-client','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('e2fbb413-99d3-4452-85e4-05d0862318d8','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-clients}','manage-clients','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0','${role_default-roles}','default-roles-springboot','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',NULL,NULL),('ed629ad7-f63d-492e-9dcb-35f97d65fc2d','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_view-profile}','view-profile','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL),('eec1122f-8d8c-48f7-9357-4a97d1f8a5fc','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_view-realm}','view-realm','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('ef50d72c-8223-4466-9909-d160f26e40d5','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_query-realms}','query-realms','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('f1a59d67-0c1e-47f3-b721-8f548d8fefd0','8128a839-82a5-40eb-a5a0-2d067628a96f',_binary '','${role_manage-identity-providers}','manage-identity-providers','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','8128a839-82a5-40eb-a5a0-2d067628a96f',NULL),('f2c15ba9-ddd5-4b0b-9d8b-6261dec0fa79','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-authorization}','manage-authorization','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('f8033cc6-22a1-4ce6-ba85-fbfce582d0bb','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_query-clients}','query-clients','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('fbbf0bdc-6e52-4116-b523-dc852a3e98ad','635983f1-87d1-494b-948f-ac3d5aa7605b',_binary '','${role_query-realms}','query-realms','d853bfa0-17e0-4f82-8c5e-4e87c8901796','635983f1-87d1-494b-948f-ac3d5aa7605b',NULL),('fc6f7fed-055a-4700-9e7a-a60359034efc','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0','${role_default-roles}','default-roles-master','d853bfa0-17e0-4f82-8c5e-4e87c8901796',NULL,NULL),('fcf32517-8061-48bd-9d20-39577f5fadc1','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',_binary '','${role_manage-users}','manage-users','d853bfa0-17e0-4f82-8c5e-4e87c8901796','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',NULL),('fd93785c-f9c7-499a-9651-125e6473a60d','43a97c30-c993-48ca-811b-f4f96c2bead1',_binary '','${role_manage-consent}','manage-consent','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43a97c30-c993-48ca-811b-f4f96c2bead1',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('rg7g2','23.0.2',1725029591);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('47f1296e-0047-4d11-ace0-e61aa8dae36d','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),('bc7bbbc8-2f4d-4f42-b814-3db92f1d082c','defaultResourceType','urn:springboot-client:resources:default');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0096aea2-a26c-4df6-a6ab-6edeee492e2d','address','openid-connect','oidc-address-mapper',NULL,'150db6a6-7ee1-485f-b7b4-ac346986bec3'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','locale','openid-connect','oidc-usermodel-attribute-mapper','2249ad6a-49de-4349-b85b-11acc3197fb8',NULL),('10427a79-7863-434a-ad82-ee8efab74870','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('256aea6c-061e-4c74-b05c-6607575e3149','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('2a94f8f0-3396-4a55-aaf7-2f1100a4130e','acr loa level','openid-connect','oidc-acr-mapper',NULL,'289a3c81-1ec2-4d56-ba88-b871fc4acd35'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('3b565498-2144-40db-a4d6-d45065ac721d','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'9c3bc543-8063-4785-81a4-add8fb8cb38a'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e333e0bb-cc62-4322-9d32-c8e10cb6f560'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d17137ae-6d30-4623-bf25-12fbfa7ee9aa'),('47e37490-dd80-4480-bd69-c346baa0e3ed','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'5b94e0fa-9cde-4294-8e8d-ba05452fcb2d'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('488b98d4-329a-4ec2-84e2-09e26b0df65f','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'e333e0bb-cc62-4322-9d32-c8e10cb6f560'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5b94e0fa-9cde-4294-8e8d-ba05452fcb2d'),('569a91e5-249c-4998-8e3e-a26f34524fc8','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('58569bd6-9b37-4bb2-8858-4ef3526548c5','full name','openid-connect','oidc-full-name-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('619256fb-d3de-4184-a220-445369dc4c6f','role list','saml','saml-role-list-mapper',NULL,'be579794-ff9f-4b35-a27d-1e89d019236c'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9c3bc543-8063-4785-81a4-add8fb8cb38a'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'746663dd-20c5-4840-bdfc-e9e94669bc4d'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3eedb2a3-6c2e-47fa-badc-b350dfcd2f79'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('84aa2c2a-6007-459b-8b03-62e72adae612','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'f1f95ed5-742e-4928-a192-80cf9a9dfb4a'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('90908ba5-1c68-4d23-a378-e4faa98df631','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3340c928-f494-4dfd-950a-c3396fa84df2'),('9223d2d5-fa02-479d-a114-d4e6f268516e','address','openid-connect','oidc-address-mapper',NULL,'7e91d336-ea38-489b-aaa0-37463d646b27'),('94edda93-7c0c-4bab-809f-f450f480e192','role list','saml','saml-role-list-mapper',NULL,'6107c1d8-fa6d-4196-8063-119eb65237df'),('966a2def-b513-4321-8646-303da1bff180','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f1f95ed5-742e-4928-a192-80cf9a9dfb4a'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('a3a19c76-d98c-43b1-907f-8892f48902dc','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('ab6807d3-fe3e-454e-8d42-895b22906384','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('b8b58b40-b004-41b2-8554-304d760d99db','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3340c928-f494-4dfd-950a-c3396fa84df2'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('ca3963d9-9198-476c-bd69-6853157b1656','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('d3a1faec-0ba2-4760-838d-40a81870cfad','acr loa level','openid-connect','oidc-acr-mapper',NULL,'11e2edfb-e674-4c6c-960a-ef7fb298eec6'),('d6bcd020-23d5-4104-aaae-24f27780edc3','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d17137ae-6d30-4623-bf25-12fbfa7ee9aa'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'e333e0bb-cc62-4322-9d32-c8e10cb6f560'),('dc10f94d-aba7-4677-b275-ae5255ce2672','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'3eedb2a3-6c2e-47fa-badc-b350dfcd2f79'),('e223d481-2f54-4694-aad1-70fc954fba95','full name','openid-connect','oidc-full-name-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('e76925a8-aacb-40b4-8355-5d9069a4e761','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cb305e6a-09fd-425e-aee2-63b661c00bb7'),('eae8f451-dd13-4eb3-a375-91b2788b9762','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('ec8c46c9-106f-47fe-8677-71e6eae15550','locale','openid-connect','oidc-usermodel-attribute-mapper','9e180248-a594-4bbd-a7f6-034a07c2cb1e',NULL),('ee8dd08b-eedb-4081-ae34-225e6eebb000','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'518d2bb1-2e79-4ded-8802-5be87004ffd0'),('ee99887a-40ee-405e-b30d-9db31c33e71c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('ef6beac8-6e71-4ce4-b065-35871a1f46fd','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'25d5516f-8181-4b0f-9b3d-7e8adb055e2d'),('f2ae9c61-3795-41e6-8f52-cb52b79b8f23','audience resolve','openid-connect','oidc-audience-resolve-mapper','6bd980c9-734a-40d7-b7e5-8ec8c2356c6d',NULL),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'746663dd-20c5-4840-bdfc-e9e94669bc4d'),('fa515863-3e86-4e5a-b7de-7593d219b87a','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'f1f95ed5-742e-4928-a192-80cf9a9dfb4a'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b41748a2-9198-4caf-80c2-13deefaa267b'),('fd39fd24-10f5-4c0d-90c7-262086f8cb86','audience resolve','openid-connect','oidc-audience-resolve-mapper','3e7e9bc4-d851-4b4b-9a08-6a7e514284e3',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0096aea2-a26c-4df6-a6ab-6edeee492e2d','true','access.token.claim'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','true','id.token.claim'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','true','introspection.token.claim'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','country','user.attribute.country'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','formatted','user.attribute.formatted'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','locality','user.attribute.locality'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','postal_code','user.attribute.postal_code'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','region','user.attribute.region'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','street','user.attribute.street'),('0096aea2-a26c-4df6-a6ab-6edeee492e2d','true','userinfo.token.claim'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','true','access.token.claim'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','locale','claim.name'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','true','id.token.claim'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','true','introspection.token.claim'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','String','jsonType.label'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','locale','user.attribute'),('05dcb7ce-3cb5-4d69-be24-9421cb812153','true','userinfo.token.claim'),('10427a79-7863-434a-ad82-ee8efab74870','true','access.token.claim'),('10427a79-7863-434a-ad82-ee8efab74870','locale','claim.name'),('10427a79-7863-434a-ad82-ee8efab74870','true','id.token.claim'),('10427a79-7863-434a-ad82-ee8efab74870','true','introspection.token.claim'),('10427a79-7863-434a-ad82-ee8efab74870','String','jsonType.label'),('10427a79-7863-434a-ad82-ee8efab74870','locale','user.attribute'),('10427a79-7863-434a-ad82-ee8efab74870','true','userinfo.token.claim'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','true','access.token.claim'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','clientHost','claim.name'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','true','id.token.claim'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','true','introspection.token.claim'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','String','jsonType.label'),('11f4c490-ff44-45bf-a407-25e819f8f0a1','clientHost','user.session.note'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','true','access.token.claim'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','family_name','claim.name'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','true','id.token.claim'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','true','introspection.token.claim'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','String','jsonType.label'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','lastName','user.attribute'),('1b2dd354-28d0-4c98-94eb-89e0d83768c9','true','userinfo.token.claim'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','true','access.token.claim'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','profile','claim.name'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','true','id.token.claim'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','true','introspection.token.claim'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','String','jsonType.label'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','profile','user.attribute'),('1d353bc6-8fa1-43ba-aace-c1cae678771e','true','userinfo.token.claim'),('256aea6c-061e-4c74-b05c-6607575e3149','true','access.token.claim'),('256aea6c-061e-4c74-b05c-6607575e3149','family_name','claim.name'),('256aea6c-061e-4c74-b05c-6607575e3149','true','id.token.claim'),('256aea6c-061e-4c74-b05c-6607575e3149','true','introspection.token.claim'),('256aea6c-061e-4c74-b05c-6607575e3149','String','jsonType.label'),('256aea6c-061e-4c74-b05c-6607575e3149','lastName','user.attribute'),('256aea6c-061e-4c74-b05c-6607575e3149','true','userinfo.token.claim'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','true','access.token.claim'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','zoneinfo','claim.name'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','true','id.token.claim'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','true','introspection.token.claim'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','String','jsonType.label'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','zoneinfo','user.attribute'),('29ded164-5e32-4e4a-b84e-e1048a7a00e2','true','userinfo.token.claim'),('2a94f8f0-3396-4a55-aaf7-2f1100a4130e','true','access.token.claim'),('2a94f8f0-3396-4a55-aaf7-2f1100a4130e','true','id.token.claim'),('2a94f8f0-3396-4a55-aaf7-2f1100a4130e','true','introspection.token.claim'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','true','access.token.claim'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','preferred_username','claim.name'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','true','id.token.claim'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','true','introspection.token.claim'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','String','jsonType.label'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','username','user.attribute'),('2eb5f06c-fb75-4f41-93ab-73419a24c56b','true','userinfo.token.claim'),('3b565498-2144-40db-a4d6-d45065ac721d','true','access.token.claim'),('3b565498-2144-40db-a4d6-d45065ac721d','email_verified','claim.name'),('3b565498-2144-40db-a4d6-d45065ac721d','true','id.token.claim'),('3b565498-2144-40db-a4d6-d45065ac721d','true','introspection.token.claim'),('3b565498-2144-40db-a4d6-d45065ac721d','boolean','jsonType.label'),('3b565498-2144-40db-a4d6-d45065ac721d','emailVerified','user.attribute'),('3b565498-2144-40db-a4d6-d45065ac721d','true','userinfo.token.claim'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','true','access.token.claim'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','realm_access.roles','claim.name'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','true','introspection.token.claim'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','String','jsonType.label'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','true','multivalued'),('3d1d3406-26e7-4900-bff5-3dfa88cd9f20','foo','user.attribute'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','true','access.token.claim'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','phone_number_verified','claim.name'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','true','id.token.claim'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','true','introspection.token.claim'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','boolean','jsonType.label'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','phoneNumberVerified','user.attribute'),('42ee1209-c53c-4d62-ab57-a55e9efdffca','true','userinfo.token.claim'),('47e37490-dd80-4480-bd69-c346baa0e3ed','true','access.token.claim'),('47e37490-dd80-4480-bd69-c346baa0e3ed','email_verified','claim.name'),('47e37490-dd80-4480-bd69-c346baa0e3ed','true','id.token.claim'),('47e37490-dd80-4480-bd69-c346baa0e3ed','true','introspection.token.claim'),('47e37490-dd80-4480-bd69-c346baa0e3ed','boolean','jsonType.label'),('47e37490-dd80-4480-bd69-c346baa0e3ed','emailVerified','user.attribute'),('47e37490-dd80-4480-bd69-c346baa0e3ed','true','userinfo.token.claim'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','true','access.token.claim'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','website','claim.name'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','true','id.token.claim'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','true','introspection.token.claim'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','String','jsonType.label'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','website','user.attribute'),('480ba8a2-647f-4bf9-b158-0bec0c66890c','true','userinfo.token.claim'),('488b98d4-329a-4ec2-84e2-09e26b0df65f','true','access.token.claim'),('488b98d4-329a-4ec2-84e2-09e26b0df65f','true','introspection.token.claim'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','true','access.token.claim'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','email','claim.name'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','true','id.token.claim'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','true','introspection.token.claim'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','String','jsonType.label'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','email','user.attribute'),('51459721-e96c-4405-ac8b-8ac3677ec1c6','true','userinfo.token.claim'),('569a91e5-249c-4998-8e3e-a26f34524fc8','true','access.token.claim'),('569a91e5-249c-4998-8e3e-a26f34524fc8','nickname','claim.name'),('569a91e5-249c-4998-8e3e-a26f34524fc8','true','id.token.claim'),('569a91e5-249c-4998-8e3e-a26f34524fc8','true','introspection.token.claim'),('569a91e5-249c-4998-8e3e-a26f34524fc8','String','jsonType.label'),('569a91e5-249c-4998-8e3e-a26f34524fc8','nickname','user.attribute'),('569a91e5-249c-4998-8e3e-a26f34524fc8','true','userinfo.token.claim'),('58569bd6-9b37-4bb2-8858-4ef3526548c5','true','access.token.claim'),('58569bd6-9b37-4bb2-8858-4ef3526548c5','true','id.token.claim'),('58569bd6-9b37-4bb2-8858-4ef3526548c5','true','introspection.token.claim'),('58569bd6-9b37-4bb2-8858-4ef3526548c5','true','userinfo.token.claim'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','true','access.token.claim'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','gender','claim.name'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','true','id.token.claim'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','true','introspection.token.claim'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','String','jsonType.label'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','gender','user.attribute'),('6080c7c8-a899-49e1-8c5f-53d34f5be509','true','userinfo.token.claim'),('619256fb-d3de-4184-a220-445369dc4c6f','Role','attribute.name'),('619256fb-d3de-4184-a220-445369dc4c6f','Basic','attribute.nameformat'),('619256fb-d3de-4184-a220-445369dc4c6f','false','single'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','true','access.token.claim'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','email','claim.name'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','true','id.token.claim'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','true','introspection.token.claim'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','String','jsonType.label'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','email','user.attribute'),('6af1fcc0-9c10-4c67-9453-5c16a317c15e','true','userinfo.token.claim'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','true','access.token.claim'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','gender','claim.name'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','true','id.token.claim'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','true','introspection.token.claim'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','String','jsonType.label'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','gender','user.attribute'),('6cddf76a-f5bf-41e9-ad93-69eb9be8f142','true','userinfo.token.claim'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','true','access.token.claim'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','website','claim.name'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','true','id.token.claim'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','true','introspection.token.claim'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','String','jsonType.label'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','website','user.attribute'),('70a375e9-8c79-4e7a-9b4e-ae6266979b36','true','userinfo.token.claim'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','true','access.token.claim'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','groups','claim.name'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','true','id.token.claim'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','true','introspection.token.claim'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','String','jsonType.label'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','true','multivalued'),('76267bb3-4492-47ac-8fb6-25f5bcf7883e','foo','user.attribute'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','true','access.token.claim'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','upn','claim.name'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','true','id.token.claim'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','true','introspection.token.claim'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','String','jsonType.label'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','username','user.attribute'),('7d7c5b5a-fe7a-48a3-af62-8ea4b12d9d4a','true','userinfo.token.claim'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','true','access.token.claim'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','picture','claim.name'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','true','id.token.claim'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','true','introspection.token.claim'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','String','jsonType.label'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','picture','user.attribute'),('7ec487d8-d3f5-4a15-af5f-a6e7b2012d83','true','userinfo.token.claim'),('84aa2c2a-6007-459b-8b03-62e72adae612','true','access.token.claim'),('84aa2c2a-6007-459b-8b03-62e72adae612','resource_access.${client_id}.roles','claim.name'),('84aa2c2a-6007-459b-8b03-62e72adae612','true','introspection.token.claim'),('84aa2c2a-6007-459b-8b03-62e72adae612','String','jsonType.label'),('84aa2c2a-6007-459b-8b03-62e72adae612','true','multivalued'),('84aa2c2a-6007-459b-8b03-62e72adae612','foo','user.attribute'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','true','access.token.claim'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','clientAddress','claim.name'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','true','id.token.claim'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','true','introspection.token.claim'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','String','jsonType.label'),('8d1a5d80-c7ba-4bda-bda3-3e8799c7898f','clientAddress','user.session.note'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','true','access.token.claim'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','preferred_username','claim.name'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','true','id.token.claim'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','true','introspection.token.claim'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','String','jsonType.label'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','username','user.attribute'),('8fb4489a-bb2f-484e-8ef6-3ba35e22b120','true','userinfo.token.claim'),('90908ba5-1c68-4d23-a378-e4faa98df631','true','access.token.claim'),('90908ba5-1c68-4d23-a378-e4faa98df631','phone_number_verified','claim.name'),('90908ba5-1c68-4d23-a378-e4faa98df631','true','id.token.claim'),('90908ba5-1c68-4d23-a378-e4faa98df631','true','introspection.token.claim'),('90908ba5-1c68-4d23-a378-e4faa98df631','boolean','jsonType.label'),('90908ba5-1c68-4d23-a378-e4faa98df631','phoneNumberVerified','user.attribute'),('90908ba5-1c68-4d23-a378-e4faa98df631','true','userinfo.token.claim'),('9223d2d5-fa02-479d-a114-d4e6f268516e','true','access.token.claim'),('9223d2d5-fa02-479d-a114-d4e6f268516e','true','id.token.claim'),('9223d2d5-fa02-479d-a114-d4e6f268516e','true','introspection.token.claim'),('9223d2d5-fa02-479d-a114-d4e6f268516e','country','user.attribute.country'),('9223d2d5-fa02-479d-a114-d4e6f268516e','formatted','user.attribute.formatted'),('9223d2d5-fa02-479d-a114-d4e6f268516e','locality','user.attribute.locality'),('9223d2d5-fa02-479d-a114-d4e6f268516e','postal_code','user.attribute.postal_code'),('9223d2d5-fa02-479d-a114-d4e6f268516e','region','user.attribute.region'),('9223d2d5-fa02-479d-a114-d4e6f268516e','street','user.attribute.street'),('9223d2d5-fa02-479d-a114-d4e6f268516e','true','userinfo.token.claim'),('94edda93-7c0c-4bab-809f-f450f480e192','Role','attribute.name'),('94edda93-7c0c-4bab-809f-f450f480e192','Basic','attribute.nameformat'),('94edda93-7c0c-4bab-809f-f450f480e192','false','single'),('966a2def-b513-4321-8646-303da1bff180','true','access.token.claim'),('966a2def-b513-4321-8646-303da1bff180','realm_access.roles','claim.name'),('966a2def-b513-4321-8646-303da1bff180','true','introspection.token.claim'),('966a2def-b513-4321-8646-303da1bff180','String','jsonType.label'),('966a2def-b513-4321-8646-303da1bff180','true','multivalued'),('966a2def-b513-4321-8646-303da1bff180','foo','user.attribute'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','true','access.token.claim'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','updated_at','claim.name'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','true','id.token.claim'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','true','introspection.token.claim'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','long','jsonType.label'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','updatedAt','user.attribute'),('98d78c03-30a6-43f2-b4b1-6195ff7d7163','true','userinfo.token.claim'),('a3a19c76-d98c-43b1-907f-8892f48902dc','true','access.token.claim'),('a3a19c76-d98c-43b1-907f-8892f48902dc','middle_name','claim.name'),('a3a19c76-d98c-43b1-907f-8892f48902dc','true','id.token.claim'),('a3a19c76-d98c-43b1-907f-8892f48902dc','true','introspection.token.claim'),('a3a19c76-d98c-43b1-907f-8892f48902dc','String','jsonType.label'),('a3a19c76-d98c-43b1-907f-8892f48902dc','middleName','user.attribute'),('a3a19c76-d98c-43b1-907f-8892f48902dc','true','userinfo.token.claim'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','true','access.token.claim'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','profile','claim.name'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','true','id.token.claim'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','true','introspection.token.claim'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','String','jsonType.label'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','profile','user.attribute'),('a40734b1-3bb2-4f7b-98cd-5a22485a83cd','true','userinfo.token.claim'),('ab6807d3-fe3e-454e-8d42-895b22906384','true','access.token.claim'),('ab6807d3-fe3e-454e-8d42-895b22906384','updated_at','claim.name'),('ab6807d3-fe3e-454e-8d42-895b22906384','true','id.token.claim'),('ab6807d3-fe3e-454e-8d42-895b22906384','true','introspection.token.claim'),('ab6807d3-fe3e-454e-8d42-895b22906384','long','jsonType.label'),('ab6807d3-fe3e-454e-8d42-895b22906384','updatedAt','user.attribute'),('ab6807d3-fe3e-454e-8d42-895b22906384','true','userinfo.token.claim'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','true','access.token.claim'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','birthdate','claim.name'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','true','id.token.claim'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','true','introspection.token.claim'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','String','jsonType.label'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','birthdate','user.attribute'),('aefc9e99-0666-4c97-83f0-eedd16ced1f0','true','userinfo.token.claim'),('b8b58b40-b004-41b2-8554-304d760d99db','true','access.token.claim'),('b8b58b40-b004-41b2-8554-304d760d99db','phone_number','claim.name'),('b8b58b40-b004-41b2-8554-304d760d99db','true','id.token.claim'),('b8b58b40-b004-41b2-8554-304d760d99db','true','introspection.token.claim'),('b8b58b40-b004-41b2-8554-304d760d99db','String','jsonType.label'),('b8b58b40-b004-41b2-8554-304d760d99db','phoneNumber','user.attribute'),('b8b58b40-b004-41b2-8554-304d760d99db','true','userinfo.token.claim'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','true','access.token.claim'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','client_id','claim.name'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','true','id.token.claim'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','true','introspection.token.claim'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','String','jsonType.label'),('bcfdd3b2-ee28-4c8b-9720-277fd87838e2','client_id','user.session.note'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','true','access.token.claim'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','zoneinfo','claim.name'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','true','id.token.claim'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','true','introspection.token.claim'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','String','jsonType.label'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','zoneinfo','user.attribute'),('c3d5f74b-2a42-41b8-88e2-4551b32c70c0','true','userinfo.token.claim'),('ca3963d9-9198-476c-bd69-6853157b1656','true','access.token.claim'),('ca3963d9-9198-476c-bd69-6853157b1656','picture','claim.name'),('ca3963d9-9198-476c-bd69-6853157b1656','true','id.token.claim'),('ca3963d9-9198-476c-bd69-6853157b1656','true','introspection.token.claim'),('ca3963d9-9198-476c-bd69-6853157b1656','String','jsonType.label'),('ca3963d9-9198-476c-bd69-6853157b1656','picture','user.attribute'),('ca3963d9-9198-476c-bd69-6853157b1656','true','userinfo.token.claim'),('d3a1faec-0ba2-4760-838d-40a81870cfad','true','access.token.claim'),('d3a1faec-0ba2-4760-838d-40a81870cfad','true','id.token.claim'),('d3a1faec-0ba2-4760-838d-40a81870cfad','true','introspection.token.claim'),('d6bcd020-23d5-4104-aaae-24f27780edc3','true','access.token.claim'),('d6bcd020-23d5-4104-aaae-24f27780edc3','phone_number','claim.name'),('d6bcd020-23d5-4104-aaae-24f27780edc3','true','id.token.claim'),('d6bcd020-23d5-4104-aaae-24f27780edc3','true','introspection.token.claim'),('d6bcd020-23d5-4104-aaae-24f27780edc3','String','jsonType.label'),('d6bcd020-23d5-4104-aaae-24f27780edc3','phoneNumber','user.attribute'),('d6bcd020-23d5-4104-aaae-24f27780edc3','true','userinfo.token.claim'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','true','access.token.claim'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','resource_access.${client_id}.roles','claim.name'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','true','introspection.token.claim'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','String','jsonType.label'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','true','multivalued'),('d8ec26d8-6368-4ba2-a73e-415e588f3d1d','foo','user.attribute'),('dc10f94d-aba7-4677-b275-ae5255ce2672','true','access.token.claim'),('dc10f94d-aba7-4677-b275-ae5255ce2672','middle_name','claim.name'),('dc10f94d-aba7-4677-b275-ae5255ce2672','true','id.token.claim'),('dc10f94d-aba7-4677-b275-ae5255ce2672','true','introspection.token.claim'),('dc10f94d-aba7-4677-b275-ae5255ce2672','String','jsonType.label'),('dc10f94d-aba7-4677-b275-ae5255ce2672','middleName','user.attribute'),('dc10f94d-aba7-4677-b275-ae5255ce2672','true','userinfo.token.claim'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','true','access.token.claim'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','groups','claim.name'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','true','id.token.claim'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','true','introspection.token.claim'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','String','jsonType.label'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','true','multivalued'),('dd6fc135-0728-43b0-82b0-a014c4a4b57b','foo','user.attribute'),('e223d481-2f54-4694-aad1-70fc954fba95','true','access.token.claim'),('e223d481-2f54-4694-aad1-70fc954fba95','true','id.token.claim'),('e223d481-2f54-4694-aad1-70fc954fba95','true','introspection.token.claim'),('e223d481-2f54-4694-aad1-70fc954fba95','true','userinfo.token.claim'),('e76925a8-aacb-40b4-8355-5d9069a4e761','true','access.token.claim'),('e76925a8-aacb-40b4-8355-5d9069a4e761','given_name','claim.name'),('e76925a8-aacb-40b4-8355-5d9069a4e761','true','id.token.claim'),('e76925a8-aacb-40b4-8355-5d9069a4e761','true','introspection.token.claim'),('e76925a8-aacb-40b4-8355-5d9069a4e761','String','jsonType.label'),('e76925a8-aacb-40b4-8355-5d9069a4e761','firstName','user.attribute'),('e76925a8-aacb-40b4-8355-5d9069a4e761','true','userinfo.token.claim'),('eae8f451-dd13-4eb3-a375-91b2788b9762','true','access.token.claim'),('eae8f451-dd13-4eb3-a375-91b2788b9762','given_name','claim.name'),('eae8f451-dd13-4eb3-a375-91b2788b9762','true','id.token.claim'),('eae8f451-dd13-4eb3-a375-91b2788b9762','true','introspection.token.claim'),('eae8f451-dd13-4eb3-a375-91b2788b9762','String','jsonType.label'),('eae8f451-dd13-4eb3-a375-91b2788b9762','firstName','user.attribute'),('eae8f451-dd13-4eb3-a375-91b2788b9762','true','userinfo.token.claim'),('ec8c46c9-106f-47fe-8677-71e6eae15550','true','access.token.claim'),('ec8c46c9-106f-47fe-8677-71e6eae15550','locale','claim.name'),('ec8c46c9-106f-47fe-8677-71e6eae15550','true','id.token.claim'),('ec8c46c9-106f-47fe-8677-71e6eae15550','true','introspection.token.claim'),('ec8c46c9-106f-47fe-8677-71e6eae15550','String','jsonType.label'),('ec8c46c9-106f-47fe-8677-71e6eae15550','locale','user.attribute'),('ec8c46c9-106f-47fe-8677-71e6eae15550','true','userinfo.token.claim'),('ee8dd08b-eedb-4081-ae34-225e6eebb000','true','access.token.claim'),('ee8dd08b-eedb-4081-ae34-225e6eebb000','true','introspection.token.claim'),('ee99887a-40ee-405e-b30d-9db31c33e71c','true','access.token.claim'),('ee99887a-40ee-405e-b30d-9db31c33e71c','locale','claim.name'),('ee99887a-40ee-405e-b30d-9db31c33e71c','true','id.token.claim'),('ee99887a-40ee-405e-b30d-9db31c33e71c','true','introspection.token.claim'),('ee99887a-40ee-405e-b30d-9db31c33e71c','String','jsonType.label'),('ee99887a-40ee-405e-b30d-9db31c33e71c','locale','user.attribute'),('ee99887a-40ee-405e-b30d-9db31c33e71c','true','userinfo.token.claim'),('ef6beac8-6e71-4ce4-b065-35871a1f46fd','true','access.token.claim'),('ef6beac8-6e71-4ce4-b065-35871a1f46fd','true','introspection.token.claim'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','true','access.token.claim'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','upn','claim.name'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','true','id.token.claim'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','true','introspection.token.claim'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','String','jsonType.label'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','username','user.attribute'),('f5b5c9b4-519e-40cb-ae7a-dee8ab55503c','true','userinfo.token.claim'),('fa515863-3e86-4e5a-b7de-7593d219b87a','true','access.token.claim'),('fa515863-3e86-4e5a-b7de-7593d219b87a','true','introspection.token.claim'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','true','access.token.claim'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','nickname','claim.name'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','true','id.token.claim'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','true','introspection.token.claim'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','String','jsonType.label'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','nickname','user.attribute'),('fb602ff0-9612-4340-a2ec-06f93649d8b7','true','userinfo.token.claim'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','true','access.token.claim'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','birthdate','claim.name'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','true','id.token.claim'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','true','introspection.token.claim'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','String','jsonType.label'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','birthdate','user.attribute'),('fcb9f6b5-02e8-42fb-a838-2a2d00950813','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'SPRINGBOOT',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','32ed69d8-9d89-4ca8-aa77-3dbc8285a7e0',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','52e0a4b2-590c-48a7-a415-f6e8304ed33a','e72b768e-f138-45be-afb8-48e98d2c65ba','91d5f20d-d389-41d0-8f37-98fd197e8f49','d7cedc2d-e18d-4372-9067-20e16b122f95','d4245255-f9fb-4d5d-9a51-9292e9a18eee',2592000,_binary '\0',900,_binary '',_binary '\0','af824982-a3b4-44a4-9e8a-6d07d7635a1c',0,_binary '\0',0,0,'e3f1f149-e2ea-445b-840e-936d4ff36f2e'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','635983f1-87d1-494b-948f-ac3d5aa7605b',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','f831bb74-d013-46c4-b14b-0b861066628d','e4e1281a-6ba3-495f-ad73-273f67ca4a68','bcfba7a3-bf32-496f-89b9-303f2d67ac9e','3158eb72-0639-48fc-ab1c-db68b0e76c00','eafbd6d8-7e94-4962-b90c-9fb8b38eac37',2592000,_binary '\0',900,_binary '',_binary '\0','74017437-c096-4162-a5bf-8217fa54c71b',0,_binary '\0',0,0,'fc6f7fed-055a-4700-9e7a-a60359034efc');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',''),('_browser_header.contentSecurityPolicyReportOnly','d853bfa0-17e0-4f82-8c5e-4e87c8901796',''),('_browser_header.referrerPolicy','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','no-referrer'),('_browser_header.referrerPolicy','d853bfa0-17e0-4f82-8c5e-4e87c8901796','no-referrer'),('_browser_header.strictTransportSecurity','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','d853bfa0-17e0-4f82-8c5e-4e87c8901796','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','nosniff'),('_browser_header.xContentTypeOptions','d853bfa0-17e0-4f82-8c5e-4e87c8901796','nosniff'),('_browser_header.xFrameOptions','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','SAMEORIGIN'),('_browser_header.xFrameOptions','d853bfa0-17e0-4f82-8c5e-4e87c8901796','SAMEORIGIN'),('_browser_header.xRobotsTag','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','none'),('_browser_header.xRobotsTag','d853bfa0-17e0-4f82-8c5e-4e87c8901796','none'),('_browser_header.xXSSProtection','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','1; mode=block'),('_browser_header.xXSSProtection','d853bfa0-17e0-4f82-8c5e-4e87c8901796','1; mode=block'),('actionTokenGeneratedByAdminLifespan','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43200'),('actionTokenGeneratedByUserLifespan','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','300'),('bruteForceProtected','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('bruteForceProtected','d853bfa0-17e0-4f82-8c5e-4e87c8901796','false'),('cibaAuthRequestedUserHint','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','login_hint'),('cibaBackchannelTokenDeliveryMode','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','poll'),('cibaExpiresIn','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','120'),('cibaInterval','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','5'),('defaultSignatureAlgorithm','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','RS256'),('defaultSignatureAlgorithm','d853bfa0-17e0-4f82-8c5e-4e87c8901796','RS256'),('displayName','d853bfa0-17e0-4f82-8c5e-4e87c8901796','Keycloak'),('displayNameHtml','d853bfa0-17e0-4f82-8c5e-4e87c8901796','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','30'),('failureFactor','d853bfa0-17e0-4f82-8c5e-4e87c8901796','30'),('maxDeltaTimeSeconds','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','43200'),('maxDeltaTimeSeconds','d853bfa0-17e0-4f82-8c5e-4e87c8901796','43200'),('maxFailureWaitSeconds','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','900'),('maxFailureWaitSeconds','d853bfa0-17e0-4f82-8c5e-4e87c8901796','900'),('minimumQuickLoginWaitSeconds','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','60'),('minimumQuickLoginWaitSeconds','d853bfa0-17e0-4f82-8c5e-4e87c8901796','60'),('oauth2DeviceCodeLifespan','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','600'),('oauth2DevicePollingInterval','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','5'),('offlineSessionMaxLifespan','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','5184000'),('offlineSessionMaxLifespan','d853bfa0-17e0-4f82-8c5e-4e87c8901796','5184000'),('offlineSessionMaxLifespanEnabled','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('offlineSessionMaxLifespanEnabled','d853bfa0-17e0-4f82-8c5e-4e87c8901796','false'),('parRequestUriLifespan','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','60'),('permanentLockout','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('permanentLockout','d853bfa0-17e0-4f82-8c5e-4e87c8901796','false'),('quickLoginCheckMilliSeconds','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','1000'),('quickLoginCheckMilliSeconds','d853bfa0-17e0-4f82-8c5e-4e87c8901796','1000'),('realmReusableOtpCode','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('realmReusableOtpCode','d853bfa0-17e0-4f82-8c5e-4e87c8901796','false'),('waitIncrementSeconds','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','60'),('waitIncrementSeconds','d853bfa0-17e0-4f82-8c5e-4e87c8901796','60'),('webAuthnPolicyAttestationConveyancePreference','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyAuthenticatorAttachment','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','false'),('webAuthnPolicyCreateTimeout','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','0'),('webAuthnPolicyCreateTimeoutPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','0'),('webAuthnPolicyRequireResidentKey','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyRpEntityName','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','keycloak'),('webAuthnPolicyRpId','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',''),('webAuthnPolicyRpIdPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',''),('webAuthnPolicySignatureAlgorithms','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','ES256'),('webAuthnPolicyUserVerificationRequirement','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','jboss-logging'),('d853bfa0-17e0-4f82-8c5e-4e87c8901796','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522'),('password','password',_binary '',_binary '','d853bfa0-17e0-4f82-8c5e-4e87c8901796');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('2249ad6a-49de-4349-b85b-11acc3197fb8','/admin/master/console/*'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','/realms/master/account/*'),('43a97c30-c993-48ca-811b-f4f96c2bead1','/realms/SPRINGBOOT/account/*'),('52b64ac4-3eaa-49fb-8875-a02e26f96364','/realms/master/account/*'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','/realms/SPRINGBOOT/account/*'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','/admin/SPRINGBOOT/console/*'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','*'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','+');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0202ac8c-57a2-4d6d-b286-f42f73ddc191','UPDATE_PASSWORD','Update Password','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','UPDATE_PASSWORD',30),('1f11603a-e7a3-4dcd-a429-81499ee3f285','UPDATE_PROFILE','Update Profile','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','UPDATE_PROFILE',40),('2fba9a75-2706-42c2-8a64-f6f8f1d59d14','delete_account','Delete Account','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0',_binary '\0','delete_account',60),('43e2f12d-714a-435a-9352-70822bfcb7e8','webauthn-register','Webauthn Register','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','webauthn-register',70),('6e563bb6-8ab4-4e41-a8a4-41a651d9cf08','CONFIGURE_TOTP','Configure OTP','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','CONFIGURE_TOTP',10),('89b2f6e5-3013-40c1-8ac4-c82dcdbb5d80','CONFIGURE_TOTP','Configure OTP','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','CONFIGURE_TOTP',10),('90ad5d6a-7843-470c-96de-c387a01cf43d','webauthn-register','Webauthn Register','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','webauthn-register',70),('9563f9f6-7f01-4bb4-b5e2-0c294a81423a','UPDATE_PROFILE','Update Profile','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','UPDATE_PROFILE',40),('9576ff9c-c10d-4fc5-97ae-958071dffec3','VERIFY_EMAIL','Verify Email','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','VERIFY_EMAIL',50),('95c1fdb3-ea8f-4f7a-b426-d7c6734e444b','webauthn-register-passwordless','Webauthn Register Passwordless','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','webauthn-register-passwordless',80),('95e6e62e-d2ff-493e-b89a-7d8351729e55','TERMS_AND_CONDITIONS','Terms and Conditions','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('a6a26aaf-2364-4a83-a492-7d13f2db9933','TERMS_AND_CONDITIONS','Terms and Conditions','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('a9666fdb-e035-479f-9ffb-0cf23c78b8a6','update_user_locale','Update User Locale','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','update_user_locale',1000),('bb3165a4-c015-4156-ba32-de6ae3b9a30e','update_user_locale','Update User Locale','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '',_binary '\0','update_user_locale',1000),('cfe26aae-46d4-4cb1-9076-79618c9bdc60','VERIFY_EMAIL','Verify Email','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','VERIFY_EMAIL',50),('f1dbaa2e-9400-498a-8f9a-79d331d04713','delete_account','Delete Account','d853bfa0-17e0-4f82-8c5e-4e87c8901796',_binary '\0',_binary '\0','delete_account',60),('f9c06e3e-af41-4fa1-9945-52d559428b9a','webauthn-register-passwordless','Webauthn Register Passwordless','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','webauthn-register-passwordless',80),('fb4ecc4f-04d9-4dfb-9023-15401da63a12','UPDATE_PASSWORD','Update Password','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522',_binary '',_binary '\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('f4f80066-7dd4-4c8c-812d-6d02525b1422',_binary '',0,1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('47f1296e-0047-4d11-ace0-e61aa8dae36d','Default Policy','A policy that grants access only for users within this realm','js',0,0,'f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL),('bc7bbbc8-2f4d-4f42-b814-3db92f1d082c','Default Permission','A permission that applies to the default resource type','resource',1,0,'f4f80066-7dd4-4c8c-812d-6d02525b1422',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('c02e2732-e694-4b88-bae8-e5c9e5cc7370','Default Resource','urn:springboot-client:resources:default',NULL,'f4f80066-7dd4-4c8c-812d-6d02525b1422','f4f80066-7dd4-4c8c-812d-6d02525b1422',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('c02e2732-e694-4b88-bae8-e5c9e5cc7370','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','158d037c-7ae0-4df9-9f15-c49f649f7f54'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','24be240a-2187-47a2-b277-42ad657228ba'),('3e7e9bc4-d851-4b4b-9a08-6a7e514284e3','a5f55b97-60ba-4028-82a1-e7f662966dd4'),('6bd980c9-734a-40d7-b7e5-8ec8c2356c6d','c9797f99-036b-4606-82b2-45dcdc2a4bf4');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('5f2fa16e-194c-467e-84db-1ab38a6e961e','johndoe@example.com','johndoe@example.com',_binary '',_binary '',NULL,'John','Doe','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','johndoe',1725123124715,NULL,0),('6d910627-d219-4ad9-a545-ccf94bbbc77a','genarorichard@outlook.com','genarorichard@outlook.com',_binary '',_binary '',NULL,'genaro','richard','2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','waddler',1725117260099,NULL,0),('a2a0c399-dab1-4175-9e2f-536a5624083e',NULL,'f083a8f6-3618-4a0f-a0c6-082b8913ecc9',_binary '\0',_binary '',NULL,NULL,NULL,'d853bfa0-17e0-4f82-8c5e-4e87c8901796','admin',1725029594111,NULL,0),('aeee01fa-86ae-4e7e-897b-47c905f60c16',NULL,'72106ea1-6e7b-4757-80e8-7b75e8e22030',_binary '\0',_binary '',NULL,NULL,NULL,'2dbe7f2d-566c-41a8-8f0f-c58d1ccfc522','service-account-springboot-client',1725029750950,'f4f80066-7dd4-4c8c-812d-6d02525b1422',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('beda2aa4-ac0a-4365-8764-b03b03bacf49','5f2fa16e-194c-467e-84db-1ab38a6e961e'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','5f2fa16e-194c-467e-84db-1ab38a6e961e'),('beda2aa4-ac0a-4365-8764-b03b03bacf49','6d910627-d219-4ad9-a545-ccf94bbbc77a'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','6d910627-d219-4ad9-a545-ccf94bbbc77a'),('06ae5f33-8af3-40c5-ac1a-44ca96623823','a2a0c399-dab1-4175-9e2f-536a5624083e'),('0a1bfb2b-ae0e-44bc-989a-82d8849642b8','a2a0c399-dab1-4175-9e2f-536a5624083e'),('1cc62f04-e31e-46d0-a9c2-51967b04d62b','a2a0c399-dab1-4175-9e2f-536a5624083e'),('206f3be3-0b22-4c93-8ea4-c47cc68148c9','a2a0c399-dab1-4175-9e2f-536a5624083e'),('370f6f12-4b57-416e-9a24-716e4d2691c7','a2a0c399-dab1-4175-9e2f-536a5624083e'),('49231ee1-8bda-418b-a67d-25db38a85433','a2a0c399-dab1-4175-9e2f-536a5624083e'),('619c45ef-1b6d-4dd8-bdd2-191059143ac2','a2a0c399-dab1-4175-9e2f-536a5624083e'),('64d3ec0b-b4d0-4bf4-8f97-b7f185ad7cf4','a2a0c399-dab1-4175-9e2f-536a5624083e'),('7b3a50b5-bb92-4220-aed9-3d4ad6839335','a2a0c399-dab1-4175-9e2f-536a5624083e'),('81d1b5d7-e1f1-4f50-bce6-0e30ea7c6ec0','a2a0c399-dab1-4175-9e2f-536a5624083e'),('8b33316b-c8b6-4ade-95ce-23f83ed547a2','a2a0c399-dab1-4175-9e2f-536a5624083e'),('9638a953-4eb9-4563-908a-fd26f05818a3','a2a0c399-dab1-4175-9e2f-536a5624083e'),('ba36e7d8-5af0-4e45-88e0-0813ff3a43be','a2a0c399-dab1-4175-9e2f-536a5624083e'),('d1c2cbfc-976f-406a-8111-b6eb187b3049','a2a0c399-dab1-4175-9e2f-536a5624083e'),('de31da59-62dc-4a07-986e-f919cbe69616','a2a0c399-dab1-4175-9e2f-536a5624083e'),('df16baf5-4c3c-4896-9532-e465f93eddab','a2a0c399-dab1-4175-9e2f-536a5624083e'),('f2c15ba9-ddd5-4b0b-9d8b-6261dec0fa79','a2a0c399-dab1-4175-9e2f-536a5624083e'),('fc6f7fed-055a-4700-9e7a-a60359034efc','a2a0c399-dab1-4175-9e2f-536a5624083e'),('fcf32517-8061-48bd-9d20-39577f5fadc1','a2a0c399-dab1-4175-9e2f-536a5624083e'),('3d293091-860e-4984-ba3d-0b1ca3e144ba','aeee01fa-86ae-4e7e-897b-47c905f60c16'),('cfaeffca-0727-46d8-b19c-70de37227935','aeee01fa-86ae-4e7e-897b-47c905f60c16'),('e3f1f149-e2ea-445b-840e-936d4ff36f2e','aeee01fa-86ae-4e7e-897b-47c905f60c16');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('2249ad6a-49de-4349-b85b-11acc3197fb8','+'),('9e180248-a594-4bbd-a7f6-034a07c2cb1e','+'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','*'),('f4f80066-7dd4-4c8c-812d-6d02525b1422','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-02  0:25:36
