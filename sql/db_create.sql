-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'https://dummyimage.com/800x400/89a0a1/ffffff',
  `content` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (23,'What is Lorem Ipsum?','What-is-Lorem-Ipsum','https://dummyimage.com/800x400/89a0a1/ffffff','Lorem Ipsum is fish text often used in print and web design. Lorem Ipsum has been the standard \"fish\" for Latin texts since the early 16th century. At the time, an unnamed printer created a large collection of font sizes and shapes, using Lorem Ipsum to print samples. Lorem Ipsum not only successfully survived five centuries without noticeable changes, but also stepped into electronic design. It has been popularized in modern times by the publication of Letraset sheets with Lorem Ipsum patterns in the 60s and, more recently, by layout programs such as Aldus PageMaker, which use Lorem Ipsum in their templates.  ','2020-12-09 12:00:00'),(24,'Why is it used? ','Why-is-it-used','https://dummyimage.com/800x400/89a0a1/ffffff','It has long been found that when evaluating design and composition, readable text makes it difficult to concentrate. Lorem Ipsum is used because it provides more or less standard template padding, as well as actual distribution of letters and spaces in paragraphs, which is not obtained by simply duplicating \"Here is your text.. Here is your text.. Here is your text..\" Many web page layout programs and HTML editors use Lorem Ipsum as their default text, so a search for the keyword \"lorem ipsum\" immediately reveals how many web pages are still waiting to be born. Over the years, the text of Lorem Ipsum has received many versions. Some versions appeared by mistake, some - intentionally (for example, humorous versions).  ','2020-12-09 12:00:00'),(25,'Where did he come from? ','Where-did-he-come-from','https://dummyimage.com/800x400/89a0a1/ffffff','Many people think that Lorem Ipsum is a pseudo-Latin set of words taken from the ceiling, but this is not entirely true. Its roots go back to a single fragment of classical Latin from 45 AD, that is, more than two millennia ago. Richard McClintock, professor of Latin at Hampden-Sydney College, Virginia, took one of the strangest words in Lorem Ipsum, \"consectetur\", and searched for it in classical Latin literature. As a result, he found the undisputed original source of Lorem Ipsum in sections 1.10.32 and 1.10.33 of the book \"de Finibus Bonorum et Malorum\" (\"On the limits of good and evil\"), written by Cicero in 45 AD. This treatise on the theory of ethics was very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from one of the lines in section 1.10.32  ','2020-12-09 12:00:00'),(26,'Where to get it? ','Where-to-get-it','https://dummyimage.com/800x400/89a0a1/ffffff','There are many variants of Lorem Ipsum, but most of them have not always acceptable modifications, such as humorous inserts or words that do not even remotely resemble Latin. If you need Lorem Ipsum for a serious project, you probably dont want some joke hidden in the middle of a paragraph. Also, all other well-known Lorem Ipsum generators use the same text, which they simply repeat until they reach the desired volume. This makes the generator offered here the only true Lorem Ipsum generator. It uses a dictionary of over 200 Latin words as well as a set of sentence patterns. As a result, the generated Lorem Ipsum looks believable, has no repeated paragraphs or \"impossible\" words.  ','2020-12-09 12:00:00'),(27,'Lorem nisi adipiscing','Lorem-nisi-adipiscing','https://dummyimage.com/800x400/89a0a1/ffffff','Aenean sit molestie cursus vel tortor, ultricies. Non habitasse sit dapibus nec in dictum dictum vel non amet vestibulum mattis amet, vulputate odio. Leo, venenatis nisi sodales nisi integer dictumst. Ex. Dictum orci, ut. Habitasse integer mauris sit arcu et et morbi integer mollis dui in interdum eleifend lectus urna interdum et. Lorem elit. Faucibus. Sit aenean et. Odio. Dictum consectetur molestie morbi consectetur sed libero, vel amet, risus non molestie vitae dapibus hac mauris ipsum et dictumst. Cursus efficitur amet, in ultricies. Molestie nulla amet platea arcu risus risus elit. Est. Sodales pellentesque mattis dui interdum amet venenatis e.','2022-04-18 03:11:21');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_art` int unsigned NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'https://dummyimage.com/200x200/89a0a1/ffffff',
  `content` text,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (21,'Fahidur',24,'https://dummyimage.com/200x200/89a0a1/ffffff','Ornare arcu sit risus sed tempus vulputate quam, venenatis mauris in lectus ornare molestie nisi justo augue justo mattis ultricies. Aenean elit. Cras non est. In sit pulvinar urna cras tempus et sed vel et. Sapien dolor adipiscing urna nis ','2020-12-09 12:00:00'),(22,'Risanyow',24,'https://dummyimage.com/200x200/89a0a1/ffffff','Luctus non est. Ornare molestie adipiscing quam, amet, mattis nec orci, integer vitae habitasse vel venenatis luctus leo, nulla accumsan non sapien dictumst. Pellentesque nisi vulputate morbi velit interdum nisi arcu lorem dolor faucibus. Risus non orci, dui interdum no. ','2020-12-09 12:00:00'),(23,'Auzarana',24,'https://dummyimage.com/200x200/89a0a1/ffffff','Non nisi vulputate venenatis leo, lacinia ornare imperdiet augue justo dictum. Tortor, morbi sapien orci, vulputate eleifend in id dolor sit non pulvinar amet, ultricies. Non mattis consectetur accumsan ornare tortor, in amet, vestibulum accumsan luctus sit pellentesque ut. Lore. ','2020-12-09 12:00:00'),(25,'Bynkertav',23,'https://dummyimage.com/200x200/89a0a1/ffffff','Lacinia malesuada consectetur velit et. Nunc hac ornare amet, non imperdiet vestibulum non dictum cursus arcu velit risus mauris non mattis in sodales in hac amet, vulputate luctus est. Efficitur interdum in vel lorem efficitur et in integer libero, lore. ','2020-12-09 12:00:00'),(26,'Sira',23,'https://dummyimage.com/200x200/89a0a1/ffffff','Adipiscing nunc lacinia hac ipsum nec adipiscing velit nec eget urna amet sed dapibus orci, nisi lorem arcu morbi aenean libero, nec faucibus. Ornare pellentesque leo, nulla nec urna non nulla non et. Dictum molestie dictum. In vulputate habitasse molesti. ','2020-12-09 12:00:00'),(27,'Ubishaco',23,'https://dummyimage.com/200x200/89a0a1/ffffff','Molestie molestie in platea vestibulum in ultricies. Molestie in venenatis accumsan justo ornare risus venenatis venenatis quam, faucibus. Sit cursus molestie sed sapien et in vulputate aenean ornare in in ornare elit. Urna lectus est. Mauris dictumst. Elit. Vestibulum odio. ','2020-12-09 12:00:00'),(28,'Odanaro',25,'https://dummyimage.com/200x200/89a0a1/ffffff','Efficitur hac accumsan cursus interdum in sit ex. Tempus et sapien elit. Habitasse sit accumsan nec in vel leo, nisi vitae tortor, justo ultricies. Velit sit non et in sit dictumst. Ultricies. Nunc aenean mattis amet, odio. Non efficitur i. ','2020-12-09 12:00:00'),(29,'Yba',26,'https://dummyimage.com/200x200/89a0a1/ffffff','Pellentesque efficitur nunc sed urna dictum. Vulputate quis, accumsan odio. Risus ornare sed amet, lorem eleifend quis, arcu pulvinar amet ex. Sapien sit orci, vulputate malesuada molestie in sit pellentesque ornare amet quam, mattis arcu et pellentesque platea et ne. ','2020-12-09 12:00:00'),(30,'Iemest',26,'https://dummyimage.com/200x200/89a0a1/ffffff','Hac venenatis non dapibus dui id nulla aenean non vel venenatis id amet mattis mauris ornare ornare ex. Quis, justo dui in malesuada vulputate ornare urna dolor ultricies. Est. Lectus ornare tortor, imperdiet venenatis luctus nulla eget dictum. Nunc risu. ','2020-12-09 12:00:00');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18  3:20:58
