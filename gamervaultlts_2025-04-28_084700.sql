-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gamervaultlts
-- ------------------------------------------------------
-- Server version	8.0.32

--
-- Table structure for table `categories`
--
CREATE DATABASE gamervaultlts;

USE gamervaultlts;


DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `name` varchar(50) NOT NULL,
  `description` json DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--

INSERT INTO `categories` VALUES ('db0aaa38-1351-11f0-b8a1-0e1f5b06a03f','videogame','[\"Free Fire\", \"Call of Duty\", \"Clash Royale\"]'),('db0aaed7-1351-11f0-b8a1-0e1f5b06a03f','coins','[\"Free Fire Coins\", \"COD Points\", \"Clash Royale Gems\"]');

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `user_id` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `savings` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `description` json DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--


INSERT INTO `orders` VALUES ('0ad02837-c548-483e-b223-65521d839f20','22480e7a-4755-46b0-9cfb-983d2a56c348',87.00,0.06,'2025-04-27 19:57:45','pending','[{\"id\": \"ab1412a2-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg\"}, {\"id\": \"ab141062-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Minecraft\", \"price\": 26.95, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/mc.jpg\"}]',''),('1da9092d-fda7-4514-92db-77221aab4903','2c096699-119b-11f0-95ba-0e1f5b06a03f',0.00,0.00,'2025-04-22 18:43:24','pending','[{\"id\": \"a13ad7d4-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"Valorant\", \"price\": 0, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Valorant.webp\"}]',''),('2d8306b1-7e4f-4dae-8054-d6b4dd80ea1e','2c095f28-119b-11f0-95ba-0e1f5b06a03f',50.00,0.01,'2025-04-23 13:58:34','pending','[{\"id\": \"ab13eab4-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Cyberpunk 2077\", \"price\": 49.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Cyberpunk_2077_box_art.jpg\"}]',''),('397a0ede-ea1e-4dd6-8353-8ef4ead54e58','2c095f28-119b-11f0-95ba-0e1f5b06a03f',60.00,0.02,'2025-04-22 18:32:49','pending','[{\"id\": \"ab13f5ca-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Witcher 3: Wild Hunt\", \"price\": 39.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Witcher_3_cover_art.jpg\"}, {\"id\": \"a13a5554-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"Roblox\", \"price\": 0, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Roblox.jpg\"}, {\"id\": \"a13ae121-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"World of Warcraft\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg\"}]',''),('531263ed-152b-43c5-8dfc-680c845f4cfa','22480e7a-4755-46b0-9cfb-983d2a56c348',0.00,0.00,'2025-04-27 19:39:48','pending','[]',''),('548e06de-39f0-4aaa-a647-2cec31f242c8','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',90.00,0.02,'2025-04-22 18:26:34','pending','[{\"id\": \"ab140504-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Legend of Zelda: Breath of the Wild\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Zelda.jpg\"}, {\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}]',''),('5f010fa0-41d8-4eed-a5ae-69c9bf10c658','2c095f28-119b-11f0-95ba-0e1f5b06a03f',60.00,0.01,'2025-04-27 19:42:09','pending','[{\"id\": \"ab13f963-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Red Dead Redemption II\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Red_Dead_Redemption_II.jpg\"}]',''),('64b82490-295e-4c81-8dd5-bc4429dd1ac4','22480e7a-4755-46b0-9cfb-983d2a56c348',0.00,0.00,'2025-04-27 19:43:46','pending','[]',''),('70e66a49-4c1a-47a7-8e61-d0113ec6314d','7447f1c4-2d7d-4703-86f1-0edc7bf40be5',60.00,0.01,'2025-04-23 14:01:08','pending','[{\"id\": \"ab1412a2-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg\"}]',''),('78ac57d7-33bc-4391-85d0-55fd88251bde','2c096699-119b-11f0-95ba-0e1f5b06a03f',150.00,0.03,'2025-04-22 18:28:56','completed','[{\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}, {\"id\": \"ab13f963-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Red Dead Redemption II\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Red_Dead_Redemption_II.jpg\"}, {\"id\": \"ab1412a2-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg\"}]',''),('867962be-a26d-4675-aa5b-3beda1500f29','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',70.00,0.03,'2025-04-22 19:44:00','pending','[{\"id\": \"a13adee5-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"League of Legends\", \"price\": 0, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/League_of_Legends.jpeg\"}, {\"id\": \"aefef6cd-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Apex Legends Coins 1000\", \"price\": 9.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/apex-coin.png\"}, {\"id\": \"ab13f5ca-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Witcher 3: Wild Hunt\", \"price\": 39.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Witcher_3_cover_art.jpg\"}, {\"id\": \"a13ae121-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"World of Warcraft\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg\"}]',''),('9ca5bcde-cfcc-4269-9042-2bc9b10f7401','2c096699-119b-11f0-95ba-0e1f5b06a03f',30.00,0.01,'2025-04-22 18:42:19','pending','[{\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}]',''),('b9474539-be3d-4b48-b722-8c56384dd132','7447f1c4-2d7d-4703-86f1-0edc7bf40be5',20.00,0.01,'2025-04-23 14:28:05','pending','[{\"id\": \"a13ae121-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"World of Warcraft\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg\"}]',''),('bef3591e-10c7-4a79-8a3a-633d171d66cb','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',137.00,0.09,'2025-04-27 20:13:14','pending','[{\"id\": \"ab141062-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Minecraft\", \"price\": 26.95, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/mc.jpg\"}, {\"id\": \"ab13f963-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Red Dead Redemption II\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Red_Dead_Redemption_II.jpg\"}, {\"id\": \"aefef479-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"GTA Online Shark Card ($1M)\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/GTA_Shark_Card.jpg\"}, {\"id\": \"aefef86e-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Call of Duty Points 2400\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/cod.webp\"}, {\"id\": \"aeff0c29-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"League of Legends RP 1380\", \"price\": 9.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/LoL_RP.png\"}]',''),('d67d5969-fd2e-445d-aafc-68dedb13b06d','2c096699-119b-11f0-95ba-0e1f5b06a03f',30.00,0.01,'2025-04-22 18:16:13','pending','[{\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}]',''),('dc0be19c-55a8-4763-80cc-49c1690eb368','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',297.00,0.14,'2025-04-27 20:47:25','completed','[{\"id\": \"aefeed4d-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Fortnite V-Bucks 1000\", \"price\": 9.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/Fortnite_VBucks.webp\"}, {\"id\": \"aefef479-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"GTA Online Shark Card ($1M)\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/GTA_Shark_Card.jpg\"}, {\"id\": \"aefefa85-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23 Ultimate Points 1600\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/fifapoints.jpg\"}, {\"id\": \"aeff0819-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Valorant Points 1000\", \"price\": 9.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/Valorant_Points.webp\"}, {\"id\": \"ab13f5ca-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Witcher 3: Wild Hunt\", \"price\": 39.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Witcher_3_cover_art.jpg\"}, {\"id\": \"ab140504-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Legend of Zelda: Breath of the Wild\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Zelda.jpg\"}, {\"id\": \"ab141062-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Minecraft\", \"price\": 26.95, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/mc.jpg\"}, {\"id\": \"a13ae121-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"World of Warcraft\", \"price\": 19.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg\"}, {\"id\": \"ab1412a2-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg\"}, {\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}]',''),('f02fcbe8-52f3-4937-8b77-d9959f43d318','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',90.00,0.02,'2025-04-22 18:28:51','pending','[{\"id\": \"ab140504-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Legend of Zelda: Breath of the Wild\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Zelda.jpg\"}, {\"id\": \"ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Grand Theft Auto V\", \"price\": 29.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png\"}]',''),('f9b9201a-4a54-4b24-8020-8e2816d12f0e','7447f1c4-2d7d-4703-86f1-0edc7bf40be5',0.00,0.00,'2025-04-23 14:27:35','pending','[{\"id\": \"a13ad7d4-1b45-11f0-ab33-0e1f5b06a03f\", \"name\": \"Valorant\", \"price\": 0, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Valorant.webp\"}]',''),('fc25fb2c-6ac9-4a48-9c00-17e70bbe8ec0','2c096699-119b-11f0-95ba-0e1f5b06a03f',40.00,0.01,'2025-04-22 18:40:24','pending','[{\"id\": \"ab13f5ca-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"The Witcher 3: Wild Hunt\", \"price\": 39.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Witcher_3_cover_art.jpg\"}]','');


--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `prod_name` varchar(50) NOT NULL,
  `prod_description` json DEFAULT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--


INSERT INTO `products` VALUES ('a13a5554-1b45-11f0-ab33-0e1f5b06a03f','Roblox','{\"genre\": \"Sandbox\", \"developer\": \"Roblox Corporation\", \"platforms\": [\"PC\", \"Xbox One\", \"Mobile\"], \"free_to_play\": true, \"release_year\": 2006}',0.00,'2025-04-17 04:37:12','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Roblox.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('a13ad7d4-1b45-11f0-ab33-0e1f5b06a03f','Valorant','{\"genre\": \"Tactical Shooter\", \"developer\": \"Riot Games\", \"platforms\": [\"PC\"], \"free_to_play\": true, \"release_year\": 2020}',0.00,'2025-04-17 04:37:12','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Valorant.webp','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('a13adee5-1b45-11f0-ab33-0e1f5b06a03f','League of Legends','{\"genre\": \"MOBA\", \"developer\": \"Riot Games\", \"platforms\": [\"PC\"], \"free_to_play\": true, \"release_year\": 2009}',0.00,'2025-04-17 04:37:12','https://d1th0hc7ymkxpv.cloudfront.net/videogames/League_of_Legends.jpeg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('a13ae121-1b45-11f0-ab33-0e1f5b06a03f','World of Warcraft','{\"genre\": \"MMORPG\", \"developer\": \"Blizzard Entertainment\", \"platforms\": [\"PC\"], \"free_to_play\": false, \"release_year\": 2004}',19.99,'2025-04-17 04:37:12','https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab13eab4-1352-11f0-b8a1-0e1f5b06a03f','Cyberpunk 2077','{\"genre\": \"RPG\", \"developer\": \"CD Projekt Red\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"], \"release_year\": 2020}',49.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Cyberpunk_2077_box_art.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab13f5ca-1352-11f0-b8a1-0e1f5b06a03f','The Witcher 3: Wild Hunt','{\"genre\": \"RPG\", \"developer\": \"CD Projekt Red\", \"platforms\": [\"PC\", \"PS4\", \"Xbox One\", \"Switch\"], \"release_year\": 2015}',39.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Witcher_3_cover_art.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab13f963-1352-11f0-b8a1-0e1f5b06a03f','Red Dead Redemption II','{\"genre\": \"Action-Adventure\", \"developer\": \"Rockstar Games\", \"platforms\": [\"PC\", \"PS4\", \"Xbox One\"], \"release_year\": 2018}',59.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Red_Dead_Redemption_II.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab13fc1a-1352-11f0-b8a1-0e1f5b06a03f','Grand Theft Auto V','{\"genre\": \"Action-Adventure\", \"developer\": \"Rockstar Games\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"], \"release_year\": 2013}',29.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Grand_Theft_Auto_V.png','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab13fe56-1352-11f0-b8a1-0e1f5b06a03f','Call of Duty: Modern Warfare','{\"genre\": \"FPS\", \"developer\": \"Infinity Ward\", \"platforms\": [\"PC\", \"PS4\", \"Xbox One\"], \"release_year\": 2019}',59.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Call_of_Duty.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab140504-1352-11f0-b8a1-0e1f5b06a03f','The Legend of Zelda: Breath of the Wild','{\"genre\": \"Action-Adventure\", \"developer\": \"Nintendo\", \"platforms\": [\"Switch\"], \"release_year\": 2017}',59.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/Zelda.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab140d63-1352-11f0-b8a1-0e1f5b06a03f','Fortnite','{\"genre\": \"Battle Royale\", \"developer\": \"Epic Games\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\", \"Mobile\"], \"free_to_play\": true, \"release_year\": 2017}',0.00,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/fortnite.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab141062-1352-11f0-b8a1-0e1f5b06a03f','Minecraft','{\"genre\": \"Sandbox\", \"developer\": \"Mojang\", \"platforms\": [\"PC\", \"PS4\", \"Xbox One\", \"Switch\", \"Mobile\"], \"release_year\": 2011}',26.95,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/mc.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab1412a2-1352-11f0-b8a1-0e1f5b06a03f','FIFA 23','{\"genre\": \"Sports\", \"developer\": \"EA Sports\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"], \"release_year\": 2022}',59.99,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('ab141480-1352-11f0-b8a1-0e1f5b06a03f','Apex Legends','{\"genre\": \"Battle Royale\", \"developer\": \"Respawn Entertainment\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"], \"free_to_play\": true, \"release_year\": 2019}',0.00,'2025-04-07 01:50:22','https://d1th0hc7ymkxpv.cloudfront.net/videogames/apex.jpg','db0aaa38-1351-11f0-b8a1-0e1f5b06a03f'),('aefeed4d-1352-11f0-b8a1-0e1f5b06a03f','Fortnite V-Bucks 1000','{\"game\": \"Fortnite\", \"currency\": \"V-Bucks\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\", \"Mobile\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/Fortnite_VBucks.webp','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aefef479-1352-11f0-b8a1-0e1f5b06a03f','GTA Online Shark Card ($1M)','{\"game\": \"Grand Theft Auto V\", \"currency\": \"GTA$\", \"delivery\": \"24h\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"]}',19.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/GTA_Shark_Card.jpg','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aefef6cd-1352-11f0-b8a1-0e1f5b06a03f','Apex Legends Coins 1000','{\"game\": \"Apex Legends\", \"currency\": \"Apex Coins\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/apex-coin.png','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aefef86e-1352-11f0-b8a1-0e1f5b06a03f','Call of Duty Points 2400','{\"game\": \"Call of Duty: Modern Warfare\", \"currency\": \"COD Points\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"]}',19.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/cod.webp','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aefefa85-1352-11f0-b8a1-0e1f5b06a03f','FIFA 23 Ultimate Points 1600','{\"game\": \"FIFA 23\", \"currency\": \"FIFA Points\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"PS5\", \"Xbox Series X\"]}',19.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/fifapoints.jpg','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aeff0275-1352-11f0-b8a1-0e1f5b06a03f','Minecraft Coins 5000','{\"game\": \"Minecraft\", \"currency\": \"Minecoins\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"Mobile\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/Minecoins.png','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aeff05a0-1352-11f0-b8a1-0e1f5b06a03f','Robux 800','{\"game\": \"Roblox\", \"currency\": \"Robux\", \"delivery\": \"instant\", \"platforms\": [\"PC\", \"Mobile\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/Robux.png','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aeff0819-1352-11f0-b8a1-0e1f5b06a03f','Valorant Points 1000','{\"game\": \"Valorant\", \"currency\": \"VP\", \"delivery\": \"instant\", \"platforms\": [\"PC\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/Valorant_Points.webp','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aeff0a1b-1352-11f0-b8a1-0e1f5b06a03f','World of Warcraft Token','{\"game\": \"World of Warcraft\", \"currency\": \"WoW Token\", \"delivery\": \"instant\", \"game_time\": \"30 days\", \"platforms\": [\"PC\"]}',19.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/WoW_Token.png','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f'),('aeff0c29-1352-11f0-b8a1-0e1f5b06a03f','League of Legends RP 1380','{\"game\": \"League of Legends\", \"currency\": \"Riot Points\", \"delivery\": \"instant\", \"platforms\": [\"PC\"]}',9.99,'2025-04-07 01:50:29','https://d1th0hc7ymkxpv.cloudfront.net/coins/LoL_RP.png','db0aaed7-1351-11f0-b8a1-0e1f5b06a03f');

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `cart_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `user_id` varchar(50) NOT NULL,
  `products` json NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `shopping_cart`
--


INSERT INTO `shopping_cart` VALUES ('12872b22-22fd-11f0-9d83-0e1f5b06a03f','03efef89-2d96-46e7-8a75-a6292fad4c45','[]','2025-04-27 00:17:58','2025-04-27 00:17:58'),('574fbd78-2323-11f0-9d83-0e1f5b06a03f','22480e7a-4755-46b0-9cfb-983d2a56c348','[]','2025-04-27 04:51:54','2025-04-27 19:57:45'),('5abdde36-204a-11f0-9d83-0e1f5b06a03f','7447f1c4-2d7d-4703-86f1-0edc7bf40be5','[]','2025-04-23 13:53:37','2025-04-23 14:39:09'),('5ed465ec-1afc-11f0-ab33-0e1f5b06a03f','2c096699-119b-11f0-95ba-0e1f5b06a03f','[{\"id\": \"ab13eab4-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Cyberpunk 2077\", \"price\": 49.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Cyberpunk_2077_box_art.jpg\"}, {\"id\": \"aeff0275-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Minecraft Coins 5000\", \"price\": 9.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/coins/Minecoins.png\"}]','2025-04-16 19:52:47','2025-04-22 22:25:55'),('75ee383d-1f89-11f0-9d83-0e1f5b06a03f','2c095f28-119b-11f0-95ba-0e1f5b06a03f','[{\"id\": \"ab141480-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Apex Legends\", \"price\": 0, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/apex.jpg\"}]','2025-04-22 14:52:49','2025-04-28 02:19:12'),('89454630-1fb4-11f0-9d83-0e1f5b06a03f','29cbec7e-d372-4982-99a5-5767bb5c9b68','[]','2025-04-22 20:01:10','2025-04-22 20:01:10'),('966deed0-231e-11f0-9d83-0e1f5b06a03f','87f15397-d3ee-4ebf-83f4-2c11e8a744c8','[{\"id\": \"ab13fe56-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Call of Duty: Modern Warfare\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Call_of_Duty.jpg\"}]','2025-04-27 04:17:52','2025-04-27 05:37:01'),('a15ac434-1f89-11f0-9d83-0e1f5b06a03f','2c096491-119b-11f0-95ba-0e1f5b06a03f','[{\"id\": \"ab1412a2-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"FIFA 23\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/fifa23.jpg\"}]','2025-04-22 14:54:02','2025-04-22 16:40:33'),('bb39d765-1f89-11f0-9d83-0e1f5b06a03f','2c0967c1-119b-11f0-95ba-0e1f5b06a03f','[{\"id\": \"ab141062-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Minecraft\", \"price\": 26.95, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/mc.jpg\"}, {\"id\": \"ab13f963-1352-11f0-b8a1-0e1f5b06a03f\", \"name\": \"Red Dead Redemption II\", \"price\": 59.99, \"quantity\": 1, \"image_url\": \"https://d1th0hc7ymkxpv.cloudfront.net/videogames/Red_Dead_Redemption_II.jpg\"}]','2025-04-22 14:54:46','2025-04-28 03:59:10'),('c7bd26f2-1f89-11f0-9d83-0e1f5b06a03f','2c095a54-119b-11f0-95ba-0e1f5b06a03f','null','2025-04-22 14:55:07','2025-04-22 14:55:07');


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `users`
--


INSERT INTO `users` VALUES ('03efef89-2d96-46e7-8a75-a6292fad4c45',NULL,NULL,'prueba1','jason3@example.com','$2b$12$kxzJQX3y89.7uCvn7LSCteottLdds5sQIhYjx2rSGuzRNJI2Y9Lyy','6001-0099','2002-06-19','2025-04-27 00:17:57',NULL,0),('22480e7a-4755-46b0-9cfb-983d2a56c348',NULL,NULL,'admin','admin@example.com','$2b$12$pkE6JpcdzczYLZGYatA9zOACdoeJ91qdGxDK7uIXPZSDubrXXyYqe','12345678','2002-01-26','2025-04-27 04:51:54',NULL,1),('2c095a54-119b-11f0-95ba-0e1f5b06a03f','Jack','Lee','jack','jack@example.com','$2a$12$1jplF2S.vseoYiRM4xBEXeMXUKD.PTR2ujeNpanzqCY3kTxbNKQKG','1234567890','1990-01-01','2025-04-04 21:24:20','https://images.pexels.com/photos/31492768/pexels-photo-31492768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1),('2c095f28-119b-11f0-95ba-0e1f5b06a03f','Jeremy','Scotte','jeremy','jeremy@example.com','$2b$12$xf3bvDi5qMV1bArBmgNW6eR5Kg5iWW53nU8IFyr1AKd4ckDPJ8nRC','0987654321','1992-02-02','2025-04-04 21:24:20','https://images.pexels.com/photos/15835620/pexels-photo-15835620/free-photo-of-hombre-modelo-maqueta-en-pie.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1),('2c096491-119b-11f0-95ba-0e1f5b06a03f','Carlos','Gonzáles','carlos','carlos@example.com','$2a$12$JaVynvxUKSfZk4g3OBqJmePCTdSVac5WB5E5mh/yvhcpDpHxXpJtK','1122334455','1985-03-03','2025-04-04 21:24:20','https://images.pexels.com/photos/31456022/pexels-photo-31456022.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1),('2c096699-119b-11f0-95ba-0e1f5b06a03f','Adriana','Sanches','adriana','adriana@example.com','$2a$12$DowOjwjrU1qbp2q4X7ykVuWbHFGnEv7b3PqtyoiGoNKs9QhStMmBS','2233445566','1995-04-04','2025-04-04 21:24:20','https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1),('2c0967c1-119b-11f0-95ba-0e1f5b06a03f','Jason','Núñez','jason','jason@example.com','$2a$12$gsdTCY389hWiGgpHpThaG.QbpxRgi.yWqerB4Nlk0Pigmf35QyYGm','3344556677','1988-05-05','2025-04-04 21:24:20','',1),('7447f1c4-2d7d-4703-86f1-0edc7bf40be5',NULL,NULL,'pepito','pepito@gmail.com','$2b$12$Mezj0dZ3a9UVjHacplyv/OujhVxrx3lU/zURij1rohbryTVcI1uFG','66666666','2000-11-11','2025-04-23 13:53:37',NULL,1),('87f15397-d3ee-4ebf-83f4-2c11e8a744c8',NULL,NULL,'prueba2','prueba2@example.com','$2b$12$xD.BWD61wrcplLQC87gRYuQJ7TK7cmdQ1.AB2vPgarUEX1Jp/C6Ca','6001-0099','2002-06-19','2025-04-27 04:17:52',NULL,1);


--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;

CREATE TABLE `wallet` (
  `wallet_id` varchar(50) NOT NULL DEFAULT (uuid()),
  `user_id` varchar(50) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` VALUES ('162f51a3-fd39-4ccc-95bc-f46a91d537d2','7447f1c4-2d7d-4703-86f1-0edc7bf40be5',0.02,'2025-04-23 13:53:37'),('16c51bac-5f43-4828-84ab-edf62f0b71bb','29cbec7e-d372-4982-99a5-5767bb5c9b68',0.00,'2025-04-22 20:01:10'),('1919eddd-e81a-4861-b19d-5ebf28baf632','03efef89-2d96-46e7-8a75-a6292fad4c45',0.00,'2025-04-27 00:17:58'),('3684346c-46e8-4794-ab32-9628dd0bf2b6','2c096491-119b-11f0-95ba-0e1f5b06a03f',0.00,'2025-04-21 21:27:31'),('48c8a25b-0978-45e0-b696-07f7ee5c8fa4','2c095f28-119b-11f0-95ba-0e1f5b06a03f',15.99,'2025-04-21 14:22:32'),('851413d3-1fa4-11f0-9d83-0e1f5b06a03f','2c096699-119b-11f0-95ba-0e1f5b06a03f',0.06,'2025-04-22 18:06:31'),('d1de662c-68d7-4cbc-91bc-c029eae4a5ac','87f15397-d3ee-4ebf-83f4-2c11e8a744c8',0.00,'2025-04-27 04:17:52'),('d5652ba0-3469-492c-ba71-c896aa000eac','22480e7a-4755-46b0-9cfb-983d2a56c348',0.06,'2025-04-27 04:51:54'),('f8153d67-b4db-49d7-a91b-5c0ab911a13a','2c0967c1-119b-11f0-95ba-0e1f5b06a03f',0.50,'2025-04-21 17:41:31'),('fd8baeff-cf52-46d2-8d06-a1697f683a45','2c095a54-119b-11f0-95ba-0e1f5b06a03f',0.00,'2025-04-22 13:16:59');


