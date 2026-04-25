-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: urban_cacheDB
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT 'name',
  `country` varchar(50) DEFAULT 'country',
  `population` varchar(50) DEFAULT NULL,
  `x_coordinates` int DEFAULT NULL,
  `y_coordinates` int DEFAULT NULL,
  `blurb` varchar(500) DEFAULT NULL,
  `description` text,
  `imagePath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Medellín','Colombia','2,500,000',NULL,NULL,'Medellín, the “City of Eternal Spring,” is the capital of the Antioquia province, and is known for its pleasant climate, mountainous landscape, and annual Flower Festival.','Medellín is located in the Aburra Valley and is Colombia\'s second-largest city. The city is known for its year-long pleasant climate and is nicknamed “City of Eternal Spring.” Every year in late summer, Medellín hosts its ten-day flower festival, Feria de las Flores, which features the flower parade called Desfile de Silleteros. The city is home to the Plaza Botero, a public park featuring bronze sculptures created by the renowned artist Fernando Botero. Medellín is known for its traditional dish, bandeja paisa, and its vibrant nightlife in the El Poblado neighborhood.','/medellinPhoto.jpg'),(2,'Aarhus','Denmark','373, 388',NULL,NULL,'Aarhus is Denmark’s second-largest city, known for its history as a Viking settlement, innovative architecture, and seaside location.','Aarhus is a lively coastal city on the east coast of Jutland in Denmark and serves as the country’s second-largest urban area after Copenhagen. Originally founded as a Viking settlement over 1,000 years ago, Aarhus has grown into a modern cultural hub with a large student population from Aarhus University. The city blends historic charm, such as the museum Den Gamle By, with contemporary architecture like ARoS Aarhus Art Museum. Located along the Kattegat Sea, Aarhus is known for its relaxed atmosphere, bike-friendly streets, thriving arts scene, and mix of historic and modern Scandinavian design.','/aarhusPhoto.jpg'),(3,'Kuching','Malaysia','~621,700',NULL,NULL,'Kuching, located on the island of Borneo, is known for its cat-themed landmarks, orangutan sanctuaries, and national parks.','Kuching is the capital and the most populous city in the state of Sarawak, Malaysia, located on the island of Borneo. Kutching, the Malay word for cat, is home to many cat-themed landmarks, such as its multiple cat statues and the world’s first cat museum. The city is also known for its wildlife sanctuaries, which house orangutans and proboscis monkeys. Kuching is an extremely clean city, and it received the ASEAN Clean Tourist Award. Additionally, Kuching is known for its diverse selection of foods and traditional Iban tattoo art.','/kuchingPhoto.jpg'),(4,'Xalapa','Mexio','443,000',NULL,NULL,'Xalapa is a vibrant city in eastern Mexico known for its mountainous setting, coffee culture, and arts scene.','Xalapa (officially Xalapa-Enríquez) is the capital of the state of Veracruz in Mexico, located in the misty mountains between the Gulf Coast and Mexico’s central highlands. Xalapa is home to Universidad Veracruzana, one of Mexico’s major universities, which gives the city a strong student presence and lively cultural atmosphere. Visitors are drawn to its museums, historic plazas, coffeehouses, and nearby cloud forests. One of its most famous attractions is the world-class Museo de Antropología de Xalapa, which holds one of the largest collections of Olmec artifacts in the world.','/xalapaPhoto.jpg'),(5,'Ghent','Belgium','270,473',NULL,NULL,'Often overlooked for Bruges or Brussels, this city offers a vibrant, youthful energy, incredible canal-side, medieval architecture, and a rich history.','Ghent is a port and university city in the Flemish region of Belgium. It began as a small settlement at the confluence of two rivers, but grew over time, claiming a position as on of the largest and richest cities in Europe during the late Middle Ages, though it is much less important today.\nLike many cities in Europe, Ghent hosts a variety of impressive architecture. Examples of intact medieval architecture, such as St. Bavo’s Cathedral, the Gravensteen castle, and a number of impressive churches, draw many a tourist, but more modern pieces, such as the university hall of Aula, several theaters, and De Krook, a relatively new central library and media center. A number of architects from Ghent are still famous today. Other points of interest include the local delicasies in the Flemish style, including a variety of pastries, chocolates, and alcohalls. Every summer Ghent hosts a music and theater festival, with various stage events and street acts called the Ghent Festical.\nOther tourist attractions include cycling and sports. Ghent has the largest designated cyclist area in Europe, with nearly 250 miles of cycle paths. Cyclists are considered a major part of the transportation system, and in some ways are valued over cars. A famous cycling race called the Six Days of Ghent takes place annually. The city also hosts several football clubs, and a football match in the Summer Olympics of 1920 took place in the city.\n','/ghentPhoto.jpg'),(6,'Torino','Italy','853,196',NULL,NULL,' Known for its baroque architecture, refined cafes, and proximity to the Alps, this city is often bypassed by tourists rushing to Rome or Venice.','Turin is an important business and cultural center in northern italy, the capital of the Piedmont region. Historically, it was even more major, going from being the capital of the Duchy of Savoy, to the capital of the Kingdom of Sardinia, then the first capital of the Kingdom of Italy. For its role in the unification of Italy, it is sometimes referred to “the cradle of italian liberty”. It lost significant amounts of it’s influence by World War II, but it is still ranked third in economic strength in Italy as a major Europan crossroads.\nAfter diversifying its economy in the 80s, Turin is known as a center of technology and innovation. It is the home of much of the Italian car industry, and hosts the headquarters of Fiat, Lancia, and Alfa Romeo. It also has a hand in the aerospace industry, with several major aerospace companies. The International Space Station modules Harmony, Columbus, Tranquility, and the Cupola were produced in Turin.\nTurin has had no small hand in the culture of the region. As a city that once hosted royalty, it contains beautiful architecture like Palazzo Chiablese, the Royal Armoury, and the Royal Library. It also hosts several museums and the major opera house Teatro Regio de Torina where Puccini premiered his La boheme. It hosted the Eurovision Song Contest 2022. After WWII, as part of its previously mentioned diversification, it hosted a major publishing house for Italy, Giulio Einaudi.\n','/torinoPhoto.jpg'),(7,'Rīga','Latvia','~605,000',NULL,NULL,'Riga, the capital of Latvia, is known for its stunning Art Nouveau architecture, charming Old Town, and vibrant cultural scene along the Baltic Sea.','Riga, located on the Baltic Sea at the mouth of the Daugava River, is the largest city in Latvia and a cultural hub of the Baltics. Its historic center, a Old Town Riga, is a UNESCO World Heritage Site filled with cobblestone streets, medieval buildings, and lively squares. The city is especially famous for its extensive collection of Art Nouveau buildings, making it one of the best places in the world to see this ornate style. Notable landmarks include the towering Riga Cathedral and the striking House of the Black Heads. Riga is also known for its markets, especially the Riga Central Market, one of the largest in Europe.','/rigaPhoto.jpg'),(8,'Devonport','New Zealand','5,079',NULL,NULL,'Devonport is a seaside village across the harbor from Auckland known for its historic streets, volcanic cones, and some of the best views of the city skyline.\n','Devonport is a coastal town located across Waitematā Harbour and is often reached by a short ferry ride. The town is well known for its preserved Victorian and Edwardian architecture, small shops, and cafés along the waterfront. Two volcanic hills, Mount Victoria and North Head, rise above the town and provide wide views of the harbor and the surrounding area. With beaches, historic sites, and a walkable town center, Devonport has a relaxed coastal atmosphere while still being close to a large urban area.','/devonportPhoto.jpg'),(9,'Almaty','Kazakhstan','2,161,797',NULL,NULL,'Almaty, the largest city in Kazakhstan, is known for its apple trees, the Tian Shan Mountain range, and for having the world\'s highest skating rink.','Almaty, located at the foot of the Tian Shan Mountain Range, is nicknamed the “City of Apple Trees.” Almaty is known for the Medeu Skating Rink, the highest skating rink in the world. This city is home to the famous yellow colored Ascension Cathedral, one of the tallest wooden buildings in the world. Additionally, Almaty is known for its Green Bazaar, where shoppers can find fresh produce, dried fruits, and horse meat products.\n\n','/almatyPhoto.jpg'),(10,'Hormuz Island','Iran','5,800',NULL,NULL,'Hormuz Island is a small Persian Gulf island known for its striking colorful landscapes, historic ruins, and quiet seaside village.','Hormuz Island is a small, sparsely populated island in the Persian Gulf, easily reached by boat from nearby ports. Its landscapes are famous for vividly colored soils and mineral-rich cliffs, creating a rainbow of reds, yellows, and oranges that contrast with golden beaches and turquoise waters. The island is dotted with geological formations shaped over millions of years, as well as historical sites like a 16th-century Portuguese fort. Most of the island’s population lives in a single seaside village, while much of its interior remains wild and undeveloped. Visitors are drawn by its dramatic coastal bluffs, mangrove patches, salt caves, and unique natural scenery, all combined with a peaceful, off-the-beaten-path atmosphere.','/hormuzislandPhoto.jpg');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `city_id` int DEFAULT NULL,
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'This city is known for its year-long pleasant climate and is nicknamed City of Eternal Spring'),(1,2,'This city is known for its annual flower festival, Feria de las Flores, a ten-day festival held in late summer filled with concerts, antique car shows, and the pinnacle flower parade, Desfile de Silleteros.'),(1,3,'This city is home to the Plaza Botero, an outdoor public park that features 23 large-scale bronze sculptures by renowned artist Fernando Botero.'),(1,4,'This city is known for its coffee culture and its proximity to major coffee farms such as the Don Leandro Coffee Farm.'),(1,5,'This city is famous for its traditional dish, bandeja paisa, which is a huge platter of beans, rice, ground meat, chicharron (pork belly), chorizo, fried egg, plantain, arepa, soups, and fresh tropical fruits.'),(1,6,'This was the first city worldwide to integrate cable cars (Metrocable) into its public transit system to connect hillside neighborhoods. '),(1,7,'In the 90’s, this city was known for high crime, but it has since undergone a massive transformation, significantly reducing its poverty and crime. '),(1,8,'Locals of this city are known as Paisas and are recognized for their warmth and friendliness.'),(1,9,'In 2013, the Urban Land Institute awarded this city the Innovative City of the Year award for its tramways, outdoor escalators, and world-class art galleries and libraries. '),(1,10,'This city is known for El Poblado, a neighborhood with high-end restaurants, upscale shopping malls, and a vibrant nightlife.'),(2,11,'This city began as a Viking settlement called Aros founded in the 10th century.'),(2,12,'This city is known for an open-air museum with reconstructed streets from the 1700s-1900s.'),(2,13,'This city was home to a sailor rumored to have lived to be 146 years old.'),(2,14,'This city is home to the popular music festival Northside Festival.'),(2,15,'This city is known for the nearby Mols Bjerbe National Park.'),(2,16,'This city is nicknamed “The City of Smiles”'),(2,17,'This city is home to the Grauballe Man, a 2,000-year-old preserved bog body. '),(2,18,'This city was named a European Capital of Culture in 2017.'),(2,19,'This city is home to ARos Art Museum, with the famous installation “YOur Rainbow Panorama\".'),(2,20,'This city sits by the Kattegat sea.'),(3,21,'This city is known for its cat-themed landmarks, such it’s multiple cat statues, and the world’s first cat museum!'),(3,22,'This city is known for its wildlife sanctuaries, home to orangutans and proboscis monkeys, and Irrawaddy dolphins. '),(3,23,'This city is known for having diverse foods from 26 major ethnic groups, with dishes such as Sarawak Laksa and Kolo Mee'),(3,24,'This city is known for its history as the capital of the White Rajahs, which was the administrative center for the Brooke Dynasty.'),(3,25,'This city is a major hub for traditional Iban tattoo art.'),(3,26,'This city was the first in its country to allow motorists to legally turn left at traffic lights when the exit is clear.'),(3,27,'This city hosts the world-renowned Rainforest World Music Festival, which features international indigenous music performers.'),(3,28,'This city is known for being extremely clean and has received the ASEAN Clean Tourist City Standard Award. '),(3,29,'This city is known for having massive roundabouts, with one at Kenyaland Park being almost the size of 1.5 football fields. '),(3,30,'This city is known for its large and beautiful state assembly, called DUN, Dewan Undangan Negeri.'),(4,31,'This city is nicknamed the Athens of Veracruz because of its strong focus on arts, culture, and education.'),(4,32,'This city contains one of the largest collections of Olmec artifacts.'),(4,33,'This city is nicknamed City of Flowers.'),(4,34,'This city has perpetual mist, often referred to has chipi chipi.'),(4,35,'This city has the second largest anthropology museum in the world.'),(4,36,'The first people to settle in this city’s area were the Totonacs.'),(4,37,'This city is near the highest mountain in Mexico, the Pico de Orizaba, Citlaltépetl in Nahuatl'),(4,38,'The city’s name comes from Nahuatl, and translates to spring in the sand.'),(4,39,'The first hot hair balloon in the Americas was launched in this city.'),(4,40,'This city is the namesake of the popular jalapeno pepper.'),(5,41,'The population of this city 270,473.'),(5,42,'What city has an annual music and theatre festival named after the city?'),(5,43,'Louis Roelandt and Henry Van de Velde were famous architects of what city?'),(5,44,'Stoverij, a stew traditionally made with local Trappist beer and served with french fries, is served in what city?'),(5,45,'What city promotes a meat-free day on Thursdays called Donderdag Veggiedag?'),(5,46,'What city has the largest designated cyclist area of it’s continent?'),(5,47,'What city contains a famous six day cycling race?'),(5,48,'What city hosted a football match in the 1920 olympics?'),(5,49,'What city was occupied by the Germans during both world wars but escaped severe destruction until liberation by the British?'),(5,50,'What city was brought down from its position of international prominence by the Eighty Years War?'),(6,51,'Population of this city 853,196.'),(6,52,'What city was once the capital of the Kingdom that unified its home country?'),(6,53,'What city is referred to as the “cradle of _______ liberty”?'),(6,54,'What city hosts the headquarters of Fiat, Lancia, and Alfa Romeo?'),(6,55,'What city produced the International Space Station modules Harmony, Columbus, Tranquility, and the Cupola?'),(6,56,'What city is the capital of the region where the Piedmontese language is spoken?'),(6,57,'What city produces gianduiotto chocolates?'),(6,58,'In what city were tramezzini first served?'),(6,59,'What city was once ruled by the Savoys?'),(6,60,'What city was redesigned by the architect Filippo Juvarra?'),(7,61,'This city is known for its stunning Art Nouveau architecture, considered among the finest collections in the world.'),(7,62,'This city features a UNESCO-listed Old Town filled with medieval buildings and cobblestone streets.'),(7,63,'This city historically thrived as a major trading hub in the Hanseatic League.'),(7,64,'This city is located at the mouth of the Daugava River along the Baltic Sea.'),(7,65,'This city is known for its massive Central Market, located inside former Zeppelin hangars.'),(7,66,'This city is home to one of the tallest medieval churches in the Baltic region, St. Peter’s Church.'),(7,67,'This city celebrates a major Song and Dance Festival, showcasing large-scale choral performances.'),(7,68,'This city has a famous landmark called the Freedom Monument, symbolizing national independence.'),(7,69,'This city’s Old Town features the iconic House of the Blackheads, a historic guild building.'),(7,70,'This city experiences long daylight hours in summer and very short days in winter due to its northern latitude.'),(8,71,'This city is known for its well-preserved Victorian and Edwardian wooden houses.'),(8,72,'This city is known for having two volcanic hills that provide some of the best harbor viewpoints in the area.'),(8,73,'This city is known for being one of the earliest European settlements near Auckland.'),(8,74,'This city is known for historic military tunnels and coastal defense structures built during World War II inside North Head.'),(8,75,'The town is known for brightly painted mushroom-shaped structures on Mount Victoria that once hid military observation posts.'),(8,76,'The area is known for beaches with clear views of Rangitoto Island, a large volcano rising out of the harbor.'),(8,77,'This city is known for its connection to the main base of the Royal New Zealand Navy.'),(8,78,'This city is known for beaches with calm water because they face a sheltered harbor rather than the open ocean.'),(8,79,'This city is famous for their Chocolates such as truffles, brittle, handmade Gelato, and waterfront dining.'),(8,80,'This city is a peninsula but historically consisted of separate volcanic islands (Mount Victoria, North Head, and Mount Cambria) that were joined together by a narrow causeway and land reclamation.'),(9,81,'This city is known for its variety of apples and is nicknamed the City of Apple Trees.'),(9,82,'This city is known for its backdrop of the Tian Shan Mountains.'),(9,83,'This city is known for the Medeu Skating Rink, which is the highest skating rink in the world.'),(9,84,'This city is known for its famous Green Bazaar, where you can find fresh produce, dried fruits, and horse meat products. '),(9,85,'This city is home to the Ascension Cathedral, which is one of the tallest wooden buildings in the world and was built without using any nails.'),(9,86,'This city was destroyed by major earthquakes twice and was rebuilt to be much more earthquake-resistant.'),(9,87,'This city is known for its giant sculpture of the Golden Man, a Sakian leader on a winged panther.'),(9,88,'This city is known for Kok Tobe hill, which is 1,100 meters high and offers a panoramic view of the city.'),(9,89,'This city is located near the Charyn Canyon, which is nicknamed the mini-Grand Canyon.'),(9,90,'This city is known for its Mural Fest, a public art initiative that transformed areas of this city with large-scale artworks by international artists.'),(10,91,'This island is known for a natural feature nicknamed Rainbow Valley, where contrasting mineral deposits form striking bands of color.'),(10,92,'This island is known for a historic Portuguese castle built by European forces in the early 1500s.'),(10,93,'This island is known for its tiny mangrove forest, which supports fish, crustaceans, and migratory birds.'),(10,94,'This island is known to be a salt dome, meaning that rock salt has pushed up through other rock layers over millions of years.'),(10,95,'This island has only one main settlement and very few roads, so much of its interior is uninhabited natural terrain.'),(10,96,'This island is known for hosting an eco-tourism dome village that has won international architecture awards'),(10,97,'This island is known for the Valley of Statues, where natural rock formations have been shaped by erosion into unusual shapes.'),(10,98,'This island is known for being a strategic maritime trading point in history, visited by explorers like Marco Polo.'),(10,99,'This island is known for a local specialty where fresh fish are marinated and fermented into a traditional dish enjoyed by visitors.'),(10,100,'This island is known for small motorbikes and tuk-tuks being the main form of local transportation.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,1,4200),(2,1,3800),(3,1,5100),(4,4,650),(5,4,600),(6,4,400),(7,4,50),(8,4,900);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `best_score` int DEFAULT '0',
  `auth0_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `auth0_id` (`auth0_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_auth0_id` (`auth0_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','pass1234',175,NULL,NULL,'/avatar1.jpg'),(2,0,'user1','pass5678',250,NULL,NULL,'/avatar2.jpg'),(3,0,'user2','pass2357',120,NULL,NULL,'/avatar3.jpg'),(4,0,'claireking15',NULL,900,'auth0|69db19071ab9fbe897696713','claireking150@gmail.com','/avatar1.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15  1:58:21
