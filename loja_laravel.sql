
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `loja_laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `loja_laravel`;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorias_nome_unique` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Eletrônicos','Celulares, tablets e dispositivos eletrônicos','2026-09-23 20:04:26','2026-09-23 20:04:26'),(2,'Informática','Computadores, notebooks e periféricos','2026-09-23 20:04:26','2026-09-23 20:04:26'),(3,'Áudio','Fones, caixas de som e equipamentos de áudio','2026-09-23 20:04:26','2026-09-23 20:04:26'),(4,'Acessórios','Capas, cabos, carregadores e demais acessórios','2026-09-23 20:04:26','2026-09-23 20:04:26'),(5,'Casa Inteligente','Lâmpadas, tomadas e dispositivos domóticos','2026-09-23 20:04:26','2026-09-23 20:04:26');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_email_unique` (`email`),
  UNIQUE KEY `clientes_cpf_unique` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Mariana Souza Silva','mariana.souza@email.com','123.456.789-01','São Paulo','2026-09-23 20:04:26','2026-09-23 20:04:26'),(2,'Rafael Oliveira Lima','rafael.oliveira@email.com','234.567.890-12','Rio de Janeiro','2026-09-23 20:04:26','2026-09-23 20:04:26'),(3,'Camila Pereira Costa','camila.costa@email.com','345.678.901-23','Belo Horizonte','2026-09-23 20:04:26','2026-09-23 20:04:26'),(4,'Lucas Martins Rocha','lucas.martins@email.com','456.789.012-34','Curitiba','2026-09-23 20:04:26','2026-09-23 20:04:26'),(5,'Juliana Alves Souza','juliana.alves@email.com','567.890.123-45','Porto Alegre','2026-09-23 20:04:26','2026-09-23 20:04:26'),(6,'Pedro Henrique Ramos','pedro.ramos@email.com','678.901.234-56','Salvador','2026-09-23 20:04:26','2026-09-23 20:04:26'),(7,'Ana Beatriz Ferreira','ana.ferreira@email.com','789.012.345-67','Fortaleza','2026-09-23 20:04:26','2026-09-23 20:04:26'),(8,'Gabriel Santos Pinto','gabriel.santos@email.com','890.123.456-78','Recife','2026-09-23 20:04:26','2026-09-23 20:04:26');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_23_170239_create_categorias_table',1),(5,'2026_09_23_170239_create_clientes_table',1),(6,'2026_09_23_170239_create_produtos_table',1),(7,'2026_09_23_170240_create_pedidos_table',1),(8,'2026_09_23_170241_create_pedido_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pedido_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint(20) unsigned NOT NULL,
  `produto_id` bigint(20) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_items_pedido_id_foreign` (`pedido_id`),
  KEY `pedido_items_produto_id_foreign` (`produto_id`),
  CONSTRAINT `pedido_items_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_items_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pedido_items` WRITE;
/*!40000 ALTER TABLE `pedido_items` DISABLE KEYS */;
INSERT INTO `pedido_items` VALUES (1,1,1,1,2199.90,2199.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(2,1,11,2,59.90,119.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(3,1,12,1,49.90,49.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(4,2,4,1,3899.00,3899.00,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(5,2,5,1,89.90,89.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(6,2,6,1,199.90,199.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(7,3,8,2,299.90,599.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(8,3,9,1,249.00,249.00,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(9,4,7,1,799.00,799.00,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(10,4,5,2,89.90,179.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(11,5,3,1,749.90,749.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(12,5,8,1,299.90,299.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(13,5,11,1,59.90,59.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(14,6,13,4,79.90,319.60,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(15,6,14,2,99.90,199.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(16,7,2,1,1099.00,1099.00,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(17,7,10,1,349.90,349.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(18,7,12,2,49.90,99.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(19,8,1,1,2199.90,2199.90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(20,8,4,1,3899.00,3899.00,'2026-09-23 20:04:26','2026-09-23 20:04:26');
/*!40000 ALTER TABLE `pedido_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint(20) unsigned NOT NULL,
  `data_pedido` date NOT NULL,
  `status` enum('pendente','pago','enviado','entregue','cancelado') NOT NULL DEFAULT 'pendente',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2026-08-05','entregue',2369.60,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(2,2,'2026-08-12','entregue',4188.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(3,3,'2026-08-20','pago',848.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(4,4,'2026-08-28','enviado',978.80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(5,5,'2026-09-03','pago',1109.70,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(6,6,'2026-09-10','pendente',519.40,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(7,7,'2026-09-15','pendente',1548.70,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(8,8,'2026-09-18','cancelado',6098.90,'2026-09-23 20:04:26','2026-09-23 20:04:26');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `nome` varchar(150) NOT NULL,
  `sku` varchar(40) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produtos_sku_unique` (`sku`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,'Smartphone Galaxy A55 5G 256GB','ELE-001',2199.90,35,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(2,1,'Tablet Lenovo Tab M10 64GB','ELE-002',1099.00,22,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(3,1,'Smartwatch Amazfit GTS 4','ELE-003',749.90,40,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(4,2,'Notebook Dell Inspiron 15 i5 512GB','INF-001',3899.00,15,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(5,2,'Mouse Logitech M170 Sem Fio','INF-002',89.90,120,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(6,2,'Teclado Mecânico Redragon Kumara','INF-003',199.90,60,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(7,2,'Monitor LG 24\" Full HD IPS','INF-004',799.00,30,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(8,3,'Fone Bluetooth JBL Tune 520BT','AUD-001',299.90,80,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(9,3,'Caixa de Som JBL Go 3 Portátil','AUD-002',249.00,55,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(10,3,'Headset Gamer HyperX Cloud Stinger','AUD-003',349.90,45,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(11,4,'Capa de Silicone para iPhone 15','ACE-001',59.90,200,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(12,4,'Cabo USB-C 100W Braçado 2m','ACE-002',49.90,150,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(13,5,'Lâmpada Inteligente Wi-Fi 9W','CAS-001',79.90,90,'2026-09-23 20:04:26','2026-09-23 20:04:26'),(14,5,'Tomada Inteligente Wi-Fi 16A','CAS-002',99.90,70,'2026-09-23 20:04:26','2026-09-23 20:04:26');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

