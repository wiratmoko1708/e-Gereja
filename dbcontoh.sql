-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: egereja
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `baptisan_airs`
--

DROP TABLE IF EXISTS `baptisan_airs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baptisan_airs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomer_kartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomer_jemaat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ayah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ibu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_baptis` date NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `baptisan_airs_nomer_kartu_unique` (`nomer_kartu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baptisan_airs`
--

LOCK TABLES `baptisan_airs` WRITE;
/*!40000 ALTER TABLE `baptisan_airs` DISABLE KEYS */;
INSERT INTO `baptisan_airs` VALUES (1,'BA-2026-0001','2','Cantika Jelita','Perempuan','Jakarta','2009-12-25','John','Aulia','2010-07-12','baptisan-air/01KGPX3GK11Y5NN0Z42Q4PY5N0.jpeg','2026-02-05 03:40:47','2026-02-05 03:40:47');
/*!40000 ALTER TABLE `baptisan_airs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('e-gereja-cache-356a192b7913b04c54574d18c28d46e6395428ab','i:1;',1770295301),('e-gereja-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1770295301;',1770295301),('e-gereja-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6','i:1;',1770291660),('e-gereja-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer','i:1770291660;',1770291660),('e-gereja-cache-spatie.permission.cache','a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}',1770380907);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daftar_pelayanans`
--

DROP TABLE IF EXISTS `daftar_pelayanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daftar_pelayanans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_ibadah_id` bigint unsigned NOT NULL,
  `jemaat_id` bigint unsigned NOT NULL,
  `talenta_id` bigint unsigned DEFAULT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `daftar_pelayanans_jadwal_ibadah_id_foreign` (`jadwal_ibadah_id`),
  KEY `daftar_pelayanans_jemaat_id_foreign` (`jemaat_id`),
  KEY `daftar_pelayanans_talenta_id_foreign` (`talenta_id`),
  CONSTRAINT `daftar_pelayanans_jadwal_ibadah_id_foreign` FOREIGN KEY (`jadwal_ibadah_id`) REFERENCES `jadwal_ibadahs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daftar_pelayanans_jemaat_id_foreign` FOREIGN KEY (`jemaat_id`) REFERENCES `jemaats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daftar_pelayanans_talenta_id_foreign` FOREIGN KEY (`talenta_id`) REFERENCES `talentas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftar_pelayanans`
--

LOCK TABLES `daftar_pelayanans` WRITE;
/*!40000 ALTER TABLE `daftar_pelayanans` DISABLE KEYS */;
/*!40000 ALTER TABLE `daftar_pelayanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exports`
--

DROP TABLE IF EXISTS `exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_rows` int NOT NULL,
  `processed_rows` int NOT NULL DEFAULT '0',
  `successful_rows` int NOT NULL DEFAULT '0',
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exports_user_id_foreign` (`user_id`),
  CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exports`
--

LOCK TABLES `exports` WRITE;
/*!40000 ALTER TABLE `exports` DISABLE KEYS */;
INSERT INTO `exports` VALUES (1,1,'App\\Filament\\Exports\\JadwalIbadahExporter',1,0,0,'local','export-1-jadwal-ibadahs',NULL,'2026-02-04 15:33:56','2026-02-04 15:33:56'),(2,1,'App\\Filament\\Exports\\JadwalIbadahExporter',1,0,0,'local','export-2-jadwal-ibadahs',NULL,'2026-02-05 02:09:11','2026-02-05 02:09:11'),(3,1,'App\\Filament\\Exports\\JemaatExporter',1,0,0,'local','export-3-jemaats',NULL,'2026-02-05 02:26:39','2026-02-05 02:26:39'),(4,1,'App\\Filament\\Exports\\UserExporter',3,0,0,'local','export-4-users',NULL,'2026-02-05 02:43:04','2026-02-05 02:43:04'),(5,1,'App\\Filament\\Exports\\UserExporter',3,0,0,'local','export-5-users',NULL,'2026-02-05 02:46:10','2026-02-05 02:46:10'),(6,1,'App\\Filament\\Exports\\UserExporter',3,3,3,'local','export-6-users','2026-02-05 02:48:52','2026-02-05 02:48:52','2026-02-05 02:48:52');
/*!40000 ALTER TABLE `exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal_ibadahs`
--

DROP TABLE IF EXISTS `jadwal_ibadahs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jadwal_ibadahs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_ibadah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_mulai` time NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_ibadahs`
--

LOCK TABLES `jadwal_ibadahs` WRITE;
/*!40000 ALTER TABLE `jadwal_ibadahs` DISABLE KEYS */;
INSERT INTO `jadwal_ibadahs` VALUES (1,'Ibadah Pagi','Minggu','06:00:00','Gedung Gereja','2026-02-04 15:31:12','2026-02-04 15:31:12'),(2,'Ibadah Pagi 2','Minggu','09:00:00','Gedung Gereja','2026-02-05 03:29:43','2026-02-05 03:29:43'),(3,'Ibadah Sore','Minggu','17:00:00','Gedung Gereja','2026-02-05 03:30:02','2026-02-05 03:30:02');
/*!40000 ALTER TABLE `jadwal_ibadahs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jemaats`
--

DROP TABLE IF EXISTS `jemaats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jemaats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pernikahan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pekerjaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `komsel_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jemaats_komsel_id_foreign` (`komsel_id`),
  CONSTRAINT `jemaats_komsel_id_foreign` FOREIGN KEY (`komsel_id`) REFERENCES `komsels` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jemaats`
--

LOCK TABLES `jemaats` WRITE;
/*!40000 ALTER TABLE `jemaats` DISABLE KEYS */;
INSERT INTO `jemaats` VALUES (1,'Bakul Impian','Jakarta','1974-12-12','L','jl mana mana aja','012349862196','bakulimpian@gmail.com','Menikah','Apa aja',1,'2026-02-05 02:24:51','2026-02-05 02:24:51'),(2,'Aulia','Jakarta','1984-10-10','P','Jakarta','02112345678','jaksmoge@gmail.com','Menikah','Pedagang',2,'2026-02-05 03:10:50','2026-02-05 03:10:50');
/*!40000 ALTER TABLE `jemaats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('a101d35e-673a-45df-bd05-4e9d5b1d78b1','',2,0,0,'[]','a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5666:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":8:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\UserExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\UserExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-02-05 11:48:52\";s:10:\"created_at\";s:19:\"2026-02-05 11:48:52\";s:2:\"id\";i:6;s:9:\"file_name\";s:14:\"export-6-users\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\UserExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-02-05 11:48:52\";s:10:\"created_at\";s:19:\"2026-02-05 11:48:52\";s:2:\"id\";i:6;s:9:\"file_name\";s:14:\"export-6-users\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-6-users\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:5:\"email\";s:5:\"Email\";s:17:\"email_verified_at\";s:17:\"Email verified at\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:6;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:5:\"email\";s:5:\"Email\";s:17:\"email_verified_at\";s:17:\"Email verified at\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:12:\"\0*\0authGuard\";s:3:\"web\";s:7:\"chained\";a:1:{i:0;s:2469:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\UserExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\UserExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-02-05 11:48:52\";s:10:\"created_at\";s:19:\"2026-02-05 11:48:52\";s:2:\"id\";i:6;s:9:\"file_name\";s:14:\"export-6-users\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\UserExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-02-05 11:48:52\";s:10:\"created_at\";s:19:\"2026-02-05 11:48:52\";s:2:\"id\";i:6;s:9:\"file_name\";s:14:\"export-6-users\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-6-users\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:5:\"email\";s:5:\"Email\";s:17:\"email_verified_at\";s:17:\"Email verified at\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:6;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:5:\"email\";s:5:\"Email\";s:17:\"email_verified_at\";s:17:\"Email verified at\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000009630000000000000000\";}\";s:4:\"hash\";s:44:\"4XjclosbUE0KXRAZTw1rhHY78JAcMAdEZo3XPsgmPrk=\";}}}}',NULL,1770292132,1770292132);
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"dc0f819c-2f6a-42aa-aa30-af495f33060d\",\"displayName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"command\":\"O:27:\\\"Illuminate\\\\Bus\\\\ChainedBatch\\\":17:{s:4:\\\"jobs\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\PrepareCsvExport\\\":7:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:668:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:23:\\\"App\\\\Models\\\\JadwalIbadah\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:1:{i:0;s:13:\\\"faith_tenancy\\\";}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:14:\\\"jadwal_ibadahs\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:17:\\\"jadwal_ibadahs.id\\\";s:9:\\\"direction\\\";s:3:\\\"asc\\\";}}}}}\\\";s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000chunkSize\\\";i:100;s:10:\\\"\\u0000*\\u0000records\\\";N;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:4:\\\"name\\\";s:0:\\\"\\\";s:7:\\\"options\\\";a:1:{s:13:\\\"allowFailures\\\";b:1;}s:7:\\\"batchId\\\";N;s:38:\\\"\\u0000Illuminate\\\\Bus\\\\ChainedBatch\\u0000fakeBatch\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:2:{i:0;s:2557:\\\"O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCompletion\\\":6:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000formats\\\";a:2:{i:0;E:47:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Csv\\\";i:1;E:48:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Xlsx\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000authGuard\\\";s:3:\\\"web\\\";}\\\";i:1;s:2382:\\\"O:44:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\CreateXlsxFile\\\":4:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 00:33:56\\\";s:2:\\\"id\\\";i:1;s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-1-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}\\\";}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";a:0:{}}\"},\"createdAt\":1770251636,\"delay\":null}',0,NULL,1770251636,1770251636),(2,'default','{\"uuid\":\"f5d2a0b5-8d94-43cc-83c8-a625b15a23ce\",\"displayName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"command\":\"O:27:\\\"Illuminate\\\\Bus\\\\ChainedBatch\\\":17:{s:4:\\\"jobs\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\PrepareCsvExport\\\":7:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:668:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:23:\\\"App\\\\Models\\\\JadwalIbadah\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:1:{i:0;s:13:\\\"faith_tenancy\\\";}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:14:\\\"jadwal_ibadahs\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:17:\\\"jadwal_ibadahs.id\\\";s:9:\\\"direction\\\";s:3:\\\"asc\\\";}}}}}\\\";s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000chunkSize\\\";i:100;s:10:\\\"\\u0000*\\u0000records\\\";N;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:4:\\\"name\\\";s:0:\\\"\\\";s:7:\\\"options\\\";a:1:{s:13:\\\"allowFailures\\\";b:1;}s:7:\\\"batchId\\\";N;s:38:\\\"\\u0000Illuminate\\\\Bus\\\\ChainedBatch\\u0000fakeBatch\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:2:{i:0;s:2557:\\\"O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCompletion\\\":6:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000formats\\\";a:2:{i:0;E:47:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Csv\\\";i:1;E:48:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Xlsx\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000authGuard\\\";s:3:\\\"web\\\";}\\\";i:1;s:2382:\\\"O:44:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\CreateXlsxFile\\\":4:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:41:\\\"App\\\\Filament\\\\Exports\\\\JadwalIbadahExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:09:11\\\";s:2:\\\"id\\\";i:2;s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:23:\\\"export-2-jadwal-ibadahs\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:11:\\\"nama_ibadah\\\";s:11:\\\"Nama Ibadah\\\";s:4:\\\"hari\\\";s:4:\\\"Hari\\\";s:11:\\\"waktu_mulai\\\";s:5:\\\"Waktu\\\";s:6:\\\"lokasi\\\";s:6:\\\"Lokasi\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}\\\";}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";a:0:{}}\"},\"createdAt\":1770289751,\"delay\":null}',0,NULL,1770289751,1770289751),(3,'default','{\"uuid\":\"6d5b3fbb-29c0-42ba-bdba-bf9a637a0051\",\"displayName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"command\":\"O:27:\\\"Illuminate\\\\Bus\\\\ChainedBatch\\\":17:{s:4:\\\"jobs\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\PrepareCsvExport\\\":7:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:679:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:17:\\\"App\\\\Models\\\\Jemaat\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:1:{i:0;s:13:\\\"faith_tenancy\\\";}s:5:\\\"casts\\\";a:2:{s:2:\\\"id\\\";s:3:\\\"int\\\";s:13:\\\"tanggal_lahir\\\";s:4:\\\"date\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:7:\\\"jemaats\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:10:\\\"jemaats.id\\\";s:9:\\\"direction\\\";s:3:\\\"asc\\\";}}}}}\\\";s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000chunkSize\\\";i:100;s:10:\\\"\\u0000*\\u0000records\\\";N;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:4:\\\"name\\\";s:0:\\\"\\\";s:7:\\\"options\\\";a:1:{s:13:\\\"allowFailures\\\";b:1;}s:7:\\\"batchId\\\";N;s:38:\\\"\\u0000Illuminate\\\\Bus\\\\ChainedBatch\\u0000fakeBatch\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:2:{i:0;s:2562:\\\"O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCompletion\\\":6:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000formats\\\";a:2:{i:0;E:47:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Csv\\\";i:1;E:48:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Xlsx\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000authGuard\\\";s:3:\\\"web\\\";}\\\";i:1;s:2387:\\\"O:44:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\CreateXlsxFile\\\":4:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:35:\\\"App\\\\Filament\\\\Exports\\\\JemaatExporter\\\";s:10:\\\"total_rows\\\";i:1;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:26:39\\\";s:2:\\\"id\\\";i:3;s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:16:\\\"export-3-jemaats\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:4:\\\"nama\\\";s:4:\\\"Nama\\\";s:13:\\\"jenis_kelamin\\\";s:13:\\\"Jenis Kelamin\\\";s:10:\\\"no_telepon\\\";s:10:\\\"No Telepon\\\";s:18:\\\"komsel.nama_komsel\\\";s:6:\\\"Komsel\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}\\\";}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";a:0:{}}\"},\"createdAt\":1770290799,\"delay\":null}',0,NULL,1770290799,1770290799),(4,'default','{\"uuid\":\"cc433b41-b194-4fea-a1c0-88ce297c9e1e\",\"displayName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Bus\\\\ChainedBatch\",\"command\":\"O:27:\\\"Illuminate\\\\Bus\\\\ChainedBatch\\\":17:{s:4:\\\"jobs\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\PrepareCsvExport\\\":7:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:708:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:1:{i:0;s:13:\\\"faith_tenancy\\\";}s:5:\\\"casts\\\";a:3:{s:2:\\\"id\\\";s:3:\\\"int\\\";s:17:\\\"email_verified_at\\\";s:8:\\\"datetime\\\";s:8:\\\"password\\\";s:6:\\\"hashed\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"users\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:8:\\\"users.id\\\";s:9:\\\"direction\\\";s:3:\\\"asc\\\";}}}}}\\\";s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000chunkSize\\\";i:100;s:10:\\\"\\u0000*\\u0000records\\\";N;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:4:\\\"name\\\";s:0:\\\"\\\";s:7:\\\"options\\\";a:1:{s:13:\\\"allowFailures\\\";b:1;}s:7:\\\"batchId\\\";N;s:38:\\\"\\u0000Illuminate\\\\Bus\\\\ChainedBatch\\u0000fakeBatch\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:2:{i:0;s:2500:\\\"O:46:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCompletion\\\":6:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000formats\\\";a:2:{i:0;E:47:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Csv\\\";i:1;E:48:\\\"Filament\\\\Actions\\\\Exports\\\\Enums\\\\ExportFormat:Xlsx\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:12:\\\"\\u0000*\\u0000authGuard\\\";s:3:\\\"web\\\";}\\\";i:1;s:2325:\\\"O:44:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\CreateXlsxFile\\\":4:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:1;s:8:\\\"exporter\\\";s:33:\\\"App\\\\Filament\\\\Exports\\\\UserExporter\\\";s:10:\\\"total_rows\\\";i:3;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:10:\\\"updated_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-02-05 11:43:04\\\";s:2:\\\"id\\\";i:4;s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:1:{s:9:\\\"file_name\\\";s:14:\\\"export-4-users\\\";}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:4:{s:2:\\\"id\\\";s:2:\\\"ID\\\";s:4:\\\"name\\\";s:4:\\\"Name\\\";s:5:\\\"email\\\";s:5:\\\"Email\\\";s:17:\\\"email_verified_at\\\";s:17:\\\"Email verified at\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}\\\";}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";a:0:{}}\"},\"createdAt\":1770291784,\"delay\":null}',0,NULL,1770291784,1770291784);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kedukaans`
--

DROP TABLE IF EXISTS `kedukaans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kedukaans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomer_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomer_jemaat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tanggal_kematian` date NOT NULL,
  `tempat_pemakaman` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pemakaman` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kedukaans_nomer_surat_unique` (`nomer_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kedukaans`
--

LOCK TABLES `kedukaans` WRITE;
/*!40000 ALTER TABLE `kedukaans` DISABLE KEYS */;
/*!40000 ALTER TABLE `kedukaans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komsels`
--

DROP TABLE IF EXISTS `komsels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komsels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_komsel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `ketua_komsel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jadwal_komsel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komsels`
--

LOCK TABLES `komsels` WRITE;
/*!40000 ALTER TABLE `komsels` DISABLE KEYS */;
INSERT INTO `komsels` VALUES (1,'Komsel A','Perumahan A ','Bpk B','12','2026-02-05 02:19:36','2026-02-05 02:19:36'),(2,'Komsel B','Perum B','Ibu C','12','2026-02-05 03:10:38','2026-02-05 03:10:38');
/*!40000 ALTER TABLE `komsels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_02_04_231644_create_talentas_table',1),(5,'2026_02_04_231645_create_komsels_table',1),(6,'2026_02_04_231646_create_jemaats_table',1),(7,'2026_02_04_231647_create_jadwal_ibadahs_table',1),(8,'2026_02_04_231648_create_daftar_pelayanans_table',1),(9,'2026_02_05_000001_create_penyerahan_anaks_table',1),(10,'2026_02_05_000002_create_baptisan_airs_table',1),(11,'2026_02_05_000003_create_pernikahans_table',1),(12,'2026_02_05_000004_create_kedukaans_table',1),(13,'2026_02_05_000005_create_profil_gerejas_table',1),(14,'2026_02_05_003243_create_exports_table',2),(15,'2026_02_05_113000_fix_jemaat_tempat_lahir_typo',3),(16,'2026_02_05_113430_create_permission_tables',4),(17,'2026_02_05_114739_add_processed_and_successful_rows_to_exports_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(2,'App\\Models\\User',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penyerahan_anaks`
--

DROP TABLE IF EXISTS `penyerahan_anaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penyerahan_anaks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomer_kartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ayah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ibu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_penyerahan` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penyerahan_anaks_nomer_kartu_unique` (`nomer_kartu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penyerahan_anaks`
--

LOCK TABLES `penyerahan_anaks` WRITE;
/*!40000 ALTER TABLE `penyerahan_anaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `penyerahan_anaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pernikahans`
--

DROP TABLE IF EXISTS `pernikahans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pernikahans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomer_pernikahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir_pria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir_pria` date NOT NULL,
  `nomer_hp_pria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_wanita` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir_wanita` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir_wanita` date NOT NULL,
  `nomer_hp_wanita` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pernikahans_nomer_pernikahan_unique` (`nomer_pernikahan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pernikahans`
--

LOCK TABLES `pernikahans` WRITE;
/*!40000 ALTER TABLE `pernikahans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pernikahans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil_gerejas`
--

DROP TABLE IF EXISTS `profil_gerejas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profil_gerejas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_gereja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_gembala` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil_gerejas`
--

LOCK TABLES `profil_gerejas` WRITE;
/*!40000 ALTER TABLE `profil_gerejas` DISABLE KEYS */;
INSERT INTO `profil_gerejas` VALUES (1,'Gereja Ajaib Benar Anugerah','jl mana mana aja','Jayapura','012349862196','bakulimpian@gmail.com','https://gerejaa.com','Pendeta A','profil-gereja/01KGPPV3E1K55N1WFVVEFPP3X8.webp','2026-02-05 01:51:20','2026-02-05 01:51:42');
/*!40000 ALTER TABLE `profil_gerejas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2026-02-05 02:35:20','2026-02-05 02:35:20'),(2,'Operator','web','2026-02-05 02:35:20','2026-02-05 02:35:20');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('FWMgqpzePxiONSYNE9UbAcEMcNv3BetcROhRWa4O',2,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRlA1THBYMTJMdFdaQ0tDcjJvOVZveFdOTnhBMk4zWm16MXdPN29TayI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vZS1nZXJlamEudGVzdC9mYWl0aCI7czo1OiJyb3V0ZSI7czozMDoiZmlsYW1lbnQuZmFpdGgucGFnZXMuZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiNTg4ZDM3OTFjZjEzMjRiNzYxODExMjNiZjliMTY1YjhhYzlmMDZlNmYyNGViOTVjN2EyOTAyNDE4MGZhZGIzNSI7fQ==',1770292011),('VVWrgvY6sRQ74APP3wWgeS6gPXZG3i8QG12gaAo6',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2ZEOFVVS2M4VFMwT3BmOUtST2JNNFNVcmFmTU5IZ1gwMHd3dmR3WiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9lLWdlcmVqYS50ZXN0L2ZhaXRoL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5mYWl0aC5hdXRoLmxvZ2luIjt9fQ==',1770298219),('w1CnpxIq3YVXQhvBW1cEW2oMmq5vTvf5pFaUatyK',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUW5aSW9SbGVwaXhYUU41RmNTdHhZRGQxMjBMdjBKYlVRNzA2TkdrSCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vZS1nZXJlamEudGVzdC9mYWl0aC9iYXB0aXNhbi1haXJzIjtzOjU6InJvdXRlIjtzOjQ0OiJmaWxhbWVudC5mYWl0aC5yZXNvdXJjZXMuYmFwdGlzYW4tYWlycy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImUxN2I1MDU2ZWIzZDQ5NTQyMjBlNzQyNGZjZDMyMDJlMDFjMDQ1MmFjYmUzMTFkNjRkOWNjZmVmMzg4ZWQyYjgiO3M6NjoidGFibGVzIjthOjE6e3M6NDA6ImUyOTNjOGRiMTk5NGJjYjI0YzQ0MzcxOWU0MGU4MmEyX2NvbHVtbnMiO2E6MTA6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToibm9tZXJfa2FydHUiO3M6NToibGFiZWwiO3M6MTE6Ik5vbWVyIEthcnR1IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoibm9tZXJfamVtYWF0IjtzOjU6ImxhYmVsIjtzOjEyOiJOb21lciBKZW1hYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWEiO3M6NToibGFiZWwiO3M6NDoiTmFtYSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6ImplbmlzX2tlbGFtaW4iO3M6NToibGFiZWwiO3M6MTM6IkplbmlzIEtlbGFtaW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJ0ZW1wYXRfbGFoaXIiO3M6NToibGFiZWwiO3M6MTI6IlRlbXBhdCBMYWhpciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InRhbmdnYWxfbGFoaXIiO3M6NToibGFiZWwiO3M6MTM6IlRhbmdnYWwgTGFoaXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6Im5hbWFfYXlhaCI7czo1OiJsYWJlbCI7czo5OiJOYW1hIEF5YWgiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6Im5hbWFfaWJ1IjtzOjU6ImxhYmVsIjtzOjg6Ik5hbWEgSWJ1IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGFuZ2dhbF9iYXB0aXMiO3M6NToibGFiZWwiO3M6MTQ6IlRhbmdnYWwgQmFwdGlzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6OTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJmb3RvIjtzOjU6ImxhYmVsIjtzOjQ6IkZvdG8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fX19',1770295507);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talentas`
--

DROP TABLE IF EXISTS `talentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talentas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_talenta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talentas`
--

LOCK TABLES `talentas` WRITE;
/*!40000 ALTER TABLE `talentas` DISABLE KEYS */;
INSERT INTO `talentas` VALUES (1,'Piano','2026-02-05 03:21:50','2026-02-05 03:21:50'),(2,'Memasak','2026-02-05 03:22:00','2026-02-05 03:22:00'),(3,'Menyanyi','2026-02-05 03:22:12','2026-02-05 03:22:12'),(4,'Multi Media','2026-02-05 03:23:38','2026-02-05 03:23:38');
/*!40000 ALTER TABLE `talentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pemegang Kunci Kerajaan','gembala@gmail.com','2026-02-04 14:18:03','$2y$12$heclcsG5v5Nwqe5wVfbTk.rE8ZFyIg8C0khhOXIKwwgKqizLF/IjC','SgKqNSsuNl5d4wsa51zIDxkvP02bxwgbF48I90ENNkyB1teCPZX9mny3nkfa','2026-02-04 14:18:03','2026-02-05 01:56:24'),(2,'Operator Test','operator@gmail.com',NULL,'$2y$12$8tNu1EEVgoR3dqQByJrUJeg97WIZu0ChVu3Ff//yL7OD1CGagCJe.','UmCoEE1qcRD6LA7sbBpSDOIJ3AWwSqK9drR4hnKCB4g4Jxk5DabdOUsfYqEf','2026-02-05 02:35:21','2026-02-05 02:35:21'),(3,'Bejo Utomo','bejo@gmail.com',NULL,'$2y$12$47YLn.SdWa0kPie5dvW4aux6o1XJ2wZmfP12FdXN1PF3hfZBlDKQS',NULL,'2026-02-05 02:42:48','2026-02-05 02:42:48');
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

-- Dump completed on 2026-02-05 22:33:15
