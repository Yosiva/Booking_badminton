-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 07:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kita`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_code` varchar(255) NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `is_abandoned` tinyint(1) NOT NULL DEFAULT 0,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_service`
--

CREATE TABLE `cart_service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Skin', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(2, 'Makeup', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(3, 'Hair', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(4, 'Nails', '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `name`, `description`, `discount`, `start_date`, `end_date`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Deal 1', 'Deal 1 description', 10, '2023-07-16', '2023-07-20', 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"145b46a4-1654-47b8-b593-993089a0544b\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(2, 'default', '{\"uuid\":\"ee3e360a-11da-4c03-9795-fb32319275c4\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(3, 'default', '{\"uuid\":\"3e67d5ff-5db7-4e94-b102-70524df16bf3\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(4, 'default', '{\"uuid\":\"693bbb8f-541d-44c7-9bf3-8e48c519a595\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(5, 'default', '{\"uuid\":\"00840bbe-9818-4d48-8d08-f57616e9a4c9\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(6, 'default', '{\"uuid\":\"e4a81853-0be7-470d-9dc4-49e31c90c762\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(7, 'default', '{\"uuid\":\"4839a1a4-3b65-409c-ae11-8c0cef3a8c1d\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(8, 'default', '{\"uuid\":\"f09d8083-2c7d-47d6-a99f-4873f406837f\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(9, 'default', '{\"uuid\":\"9eb07703-c2c1-47c1-9379-9c075cae473b\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(10, 'default', '{\"uuid\":\"099eb6e8-0be1-440e-a6e1-6c286f90688c\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(11, 'default', '{\"uuid\":\"5d6dc481-f618-4532-92f6-488951734bdc\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555),
(12, 'default', '{\"uuid\":\"12a3bd75-2989-476c-92ae-807bdf7b5eee\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":null}', 0, NULL, 1717736555, 1717736555);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `telephone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Location 1', 'Address 1', '1234567890', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(2, 'Location 2', 'Address 2', '1234567890', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(3, 'Location 3', 'Address 3', '1234567890', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(4, 'Location 4', 'Address 4', '1234567890', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_05_08_135614_create_sessions_table', 1),
(8, '2023_05_13_144600_create_roles_table', 1),
(9, '2023_05_13_155544_add_role_id_to_users_table', 1),
(10, '2023_06_01_114923_create_locations_table', 1),
(11, '2023_06_03_121845_create_services_table', 1),
(12, '2023_06_07_091657_create_deals_table', 1),
(13, '2023_09_18_134208_create_categories_table', 1),
(14, '2023_09_26_040647_create_jobs_table', 1),
(15, '2023_09_26_085642_create_service_hits_table', 1),
(16, '2023_09_26_185410_create_time_slots_table', 1),
(17, '2023_09_27_021712_create_carts_table', 1),
(18, '2023_09_27_023637_create_appointments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(2, 'Employee', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(3, 'Customer', 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `allergens` varchar(255) DEFAULT NULL,
  `benefits` varchar(255) DEFAULT NULL,
  `aftercare_tips` varchar(255) DEFAULT NULL,
  `cautions` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `description`, `image`, `price`, `notes`, `allergens`, `benefits`, `aftercare_tips`, `cautions`, `category_id`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Nail Extensions', 'nail-extensions', 'Get beautiful nail extensions for a stylish look.', 'hair.jpg', 1250.00, 'Choose from a variety of nail designs and colors.', NULL, 'Adds length and beauty to your nails.', 'Avoid harsh chemicals on your nails to maintain the extensions.', NULL, 2, 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(2, 'Hair Coloring - Highlights', 'hair-coloring-highlights', 'Add vibrant highlights to your hair for a stunning effect.', 'hair_coloring_highlights.jpg', 3000.00, 'Consult with our colorist for the best shade selection.', 'Hair dye may contain allergens; inform us of any allergies.', 'Transform your look with beautifully colored highlights.', 'Use color-safe shampoos and conditioners to preserve color.', 'Patch test required for new clients with allergies.', 3, 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(3, 'Hair Treatment - Deep Conditioning', 'hair-treatment-deep-conditioning', 'Revitalize your hair with deep conditioning treatment.', 'hair_treatment_deep_conditioning.jpg', 4000.00, 'Recommended for dry and damaged hair.', NULL, 'Nourish and repair your hair for improved texture and shine.', 'Use recommended hair masks for ongoing maintenance.', NULL, 3, 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(4, 'Hair Treatment - Scalp Massage', 'hair-treatment-scalp-massage', 'Relaxing scalp massage to rejuvenate your hair and mind.', 'hair_treatment_scalp_massage.jpg', 3500.00, 'Enjoy a soothing massage with aromatic oils.', 'Massage oils may contain allergens; inform us of any allergies.', 'Promote scalp health and reduce stress with this pampering treatment.', 'Take time to relax and destress after the treatment.', NULL, 3, 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `service_hits`
--

CREATE TABLE `service_hits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `hit_time` timestamp NOT NULL DEFAULT '2024-06-07 03:32:35',
  `analytic_data_type` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 CCleaner/125.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0p5YUxVcUtYNFNPZVZSZU9TQVNMbEZUVm9jSzRrSHBsTUVkYURBRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717736807);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(255) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '9c3a2d00-4ce8-4767-b7e0-c5902802dc98', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\' limit 1\",\"time\":\"8.29\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(2, '9c3a2d00-54c0-42df-85ed-9e5e6d2ff765', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `deals` where `end_date` > \'2024-06-07 10:36:10\' and `is_hidden` = 0 order by `end_date` asc limit 3\",\"time\":\"1.08\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\app\\\\Http\\\\Controllers\\\\HomePageController.php\",\"line\":14,\"hash\":\"0a1621741ac44581e61b066f7d11bd0a\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(3, '9c3a2d00-5765-45c7-8b14-88e6a1c7ec24', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `services`.*, (select count(*) from `appointments` where `services`.`id` = `appointments`.`service_id`) as `appointments_count` from `services` where `is_hidden` = 0 order by `appointments_count` desc limit 3\",\"time\":\"0.88\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\app\\\\Http\\\\Controllers\\\\HomePageController.php\",\"line\":21,\"hash\":\"7f0861d98385a78596884c5a776dac50\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(4, '9c3a2d00-57e9-4fdc-9749-b225787f859a', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Service\",\"count\":3,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(5, '9c3a2d00-58c8-4ee3-baff-926006a8e7cd', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"web.home\",\"path\":\"\\\\resources\\\\views\\/web\\/home.blade.php\",\"data\":[\"deals\",\"popularServices\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(6, '9c3a2d00-5c7f-4bea-aeb1-bd2077f8ad3c', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(7, '9c3a2d00-5db0-46d6-87ca-74e53c75a05d', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(8, '9c3a2d00-5e87-4a33-9634-b9457ea29c26', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(9, '9c3a2d00-5ee6-42af-ba17-67c1f21ae4dc', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(10, '9c3a2d00-5f22-4ef3-9a48-d5c8ff321a63', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(11, '9c3a2d00-5f5d-4b5e-ba10-786ebfecde83', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(12, '9c3a2d00-5f89-429a-9e1c-8f0c7b1c5d83', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[\"componentName\",\"attributes\",\"slot\",\"mainLogoRoute\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(13, '9c3a2d00-60e9-42e1-afd8-29fc485e5601', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.banner\",\"path\":\"\\\\resources\\\\views\\/components\\/banner.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(14, '9c3a2d00-6189-4f38-a69c-a7d06d2debb1', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.navigation-menu\",\"path\":\"\\\\resources\\\\views\\/components\\/navigation-menu.blade.php\",\"data\":[\"attributes\",\"slot\",\"mainLogoRoute\",\"navlinks\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(15, '9c3a2d00-683f-45dd-8365-5058d9a0ecba', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.application-mark\",\"path\":\"\\\\resources\\\\views\\/components\\/application-mark.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(16, '9c3a2d00-69fa-48f6-becb-cc8b3f2560a6', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(17, '9c3a2d00-6a85-432e-af14-01d65a7ad5b2', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.web.navlinks\",\"path\":\"\\\\resources\\\\views\\/components\\/web\\/navlinks.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(18, '9c3a2d00-6b54-4d58-aace-2f336427ebc9', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(19, '9c3a2d00-6b91-48f8-a6b6-154fdcb2d05f', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(20, '9c3a2d00-6bcc-4d4d-9db0-4991cae610bf', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(21, '9c3a2d00-6c04-42ba-8ed0-f5fdb62bad91', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(22, '9c3a2d00-6c34-4f11-8847-a2c9f031260b', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(23, '9c3a2d00-6ca4-43fb-9a16-a048a0887fc2', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(24, '9c3a2d00-6cd0-4097-bc13-a2fb07edcdc2', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(25, '9c3a2d00-6cff-4f24-8bec-6a6e4bb9a9bc', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(26, '9c3a2d00-6d2d-407e-903a-ff58dd048caf', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(27, '9c3a2d00-6e1e-4f8f-945d-9dc860b9eb5d', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\' limit 1\",\"time\":\"0.64\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(28, '9c3a2d00-6f55-487b-ad5a-689b926549fb', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `sessions` (`payload`, `last_activity`, `user_id`, `ip_address`, `user_agent`, `id`) values (\'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0p5YUxVcUtYNFNPZVZSZU9TQVNMbEZUVm9jSzRrSHBsTUVkYURBRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=\', 1717736770, null, \'127.0.0.1\', \'Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\', \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\')\",\"time\":\"1.87\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"566661626de27be35c0f28e73b1dccf0\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(29, '9c3a2d00-729f-4797-bf1d-2044537268de', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\' limit 1\",\"time\":\"0.84\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(30, '9c3a2d00-73f5-4b14-8dbe-4e41e40fbb25', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'debugbar', '{\"requestId\":\"Xf18b72f8a7c69040ec1f64e32de27fae\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(31, '9c3a2d00-7526-401b-b1ba-35443c34cbc3', '9c3a2d00-7615-4f61-8cf6-3f417824a848', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomePageController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6Ik1oSktmMlNHcjZZV1hwS2gzdnhxNnc9PSIsInZhbHVlIjoiTWdaWjBub0VnbGFWWndrbFVlY3Awa1RzQkJTempYQU51clpXQ1ZXeHpyamhmN3NRYUV4eloyaUxPaXBsbDF3YjF1ZEswQjYwbHpIK1FTMlI3eHJqeEgzNGUzU09JWE5VVFMzMHB2UVFtMThpT1J5dkw2RnIvMENwYlVFVExabnMiLCJtYWMiOiJlNWU2ZmYyN2RhNGZjMGFmODM4NGNjZDdhMzIzNmE1MWMzODFkNTcxNGNkMjJlZmEyNDIxMmU3MTUzYzk1MTNiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImNEYjF6czZuSjlCdXhoSFpkSmE5dmc9PSIsInZhbHVlIjoiQ0lJWnRRRFhHbHJCQld5Mlk0V3pVV2hYeFV1bzR0L3ZFa05MWXJWYldnNTBlZXAzQ0VYNGpmd2l6WXVHYlgyY1RtR3hxOVY5YzhyODd6RzU0TWM5WWxaTE00NndkZkl2MXFWSjRtQnAvRzVkdVBaQm53bm9EMVcwMU9sdTVkRlQiLCJtYWMiOiI4MTFkZGU0Y2JiMzY0OGExMzk0OTI0Y2YyYzUwNTg3OThhMGUwNGVmYjBkMjRiMjI5OWNhMTk5NGZlZTk1YmM0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"oJyaLUqKX4SOeVReOSASLlFTVocK4kHplMEdaDAE\",\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"},\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\resources\\\\views\\/web\\/home.blade.php\",\"data\":{\"deals\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[]},\"popularServices\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"Nail Extensions\",\"slug\":\"nail-extensions\",\"description\":\"Get beautiful nail extensions for a stylish look.\",\"image\":\"hair.jpg\",\"price\":\"1250.00\",\"notes\":\"Choose from a variety of nail designs and colors.\",\"allergens\":null,\"benefits\":\"Adds length and beauty to your nails.\",\"aftercare_tips\":\"Avoid harsh chemicals on your nails to maintain the extensions.\",\"cautions\":null,\"category_id\":2,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0},{\"id\":2,\"name\":\"Hair Coloring - Highlights\",\"slug\":\"hair-coloring-highlights\",\"description\":\"Add vibrant highlights to your hair for a stunning effect.\",\"image\":\"hair_coloring_highlights.jpg\",\"price\":\"3000.00\",\"notes\":\"Consult with our colorist for the best shade selection.\",\"allergens\":\"Hair dye may contain allergens; inform us of any allergies.\",\"benefits\":\"Transform your look with beautifully colored highlights.\",\"aftercare_tips\":\"Use color-safe shampoos and conditioners to preserve color.\",\"cautions\":\"Patch test required for new clients with allergies.\",\"category_id\":3,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0},{\"id\":3,\"name\":\"Hair Treatment - Deep Conditioning\",\"slug\":\"hair-treatment-deep-conditioning\",\"description\":\"Revitalize your hair with deep conditioning treatment.\",\"image\":\"hair_treatment_deep_conditioning.jpg\",\"price\":\"4000.00\",\"notes\":\"Recommended for dry and damaged hair.\",\"allergens\":null,\"benefits\":\"Nourish and repair your hair for improved texture and shine.\",\"aftercare_tips\":\"Use recommended hair masks for ongoing maintenance.\",\"cautions\":null,\"category_id\":3,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0}]}}},\"duration\":329,\"memory\":28,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:10'),
(32, '9c3a2d03-54f2-4b0d-8a89-829fc247221b', '9c3a2d03-60b3-4698-a23f-f6f83a5f47e8', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(33, '9c3a2d03-57e4-4131-b690-f410ede64be7', '9c3a2d03-60b3-4698-a23f-f6f83a5f47e8', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(34, '9c3a2d03-5bc9-41e6-9faf-4def957a10f2', '9c3a2d03-60b3-4698-a23f-f6f83a5f47e8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'mm9A2PprvY49RarRNVzEI7z1IyBQzxEN0thlK2Qa\' limit 1\",\"time\":\"2.56\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(35, '9c3a2d03-5f7b-4801-837f-11cfea8d59d9', '9c3a2d03-60b3-4698-a23f-f6f83a5f47e8', NULL, 1, 'debugbar', '{\"requestId\":\"X30085d92b3b41f4416c496b690da529d\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(36, '9c3a2d03-6004-4ab7-90d4-f8808419f75d', '9c3a2d03-60b3-4698-a23f-f6f83a5f47e8', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IlorT0NMMjI2Z3hURDFKTnU0U1ZtdXc9PSIsInZhbHVlIjoiQ0dEK2htbGtlZkMyVGs3bmFSUlZyZEtyWWE2bFU0dzV2UWFrc0ozZ2tFb3pYVUhFNzRoS0VFSGsvenpKR21COXBhR0V0ODlkeDZ3VDA1SUVqcHcrTFRFNjFyQ0crR1NxTVZRUVpFUXBaUGpwWU5iTDRmbytYcjZSRHdaYjVnUHEiLCJtYWMiOiIyNzM5ZGVjMDE1OWY5OWRjYTYxNDI4ZjZlZTAxNDRkNWQ5YzMwMTMwOTA4ZjUwNGMxODY2ZjdjNDNkYmU3ZTFkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImRQREtrY3B6QUk1aVJyTVQvcVJZbnc9PSIsInZhbHVlIjoiN2tPYTNJbEdPUERFZW5DbEphaFFjYTJpRUYyZHNudUJmbVhHZ3JoSWp2V0ZGdjNGZE9nYmhabGZVZVlxcDMwT1hCSDFPb0M3QkdQdWFvTE85emR3RUR2QXVPMG1FNDhPc0ZBK0hpT2hmYnYxNklWWDJLUHV5eFdtT3lnR2ZVTVciLCJtYWMiOiJjZGUwYjZiMzgxOTEzNmMzYzZjMThjZWExNGYwZWMxMjFmY2FiOWQxM2EzZWNkNjU3MTQ4MjA4MDFiYzNjYzA0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":202,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(37, '9c3a2d03-9ece-40c3-9d34-1aa8d3b371b1', '9c3a2d03-a9bb-452a-948c-1b3691861e56', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(38, '9c3a2d03-a113-4653-82a7-137b1314471d', '9c3a2d03-a9bb-452a-948c-1b3691861e56', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(39, '9c3a2d03-a4ac-4496-940c-62bf31dcd1d0', '9c3a2d03-a9bb-452a-948c-1b3691861e56', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'bURhx7im0Fy0E6iOQgmiVfyT2WiEWYhGlq0a1sIf\' limit 1\",\"time\":\"2.38\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(40, '9c3a2d03-a816-49de-aac0-80395c37aa2c', '9c3a2d03-a9bb-452a-948c-1b3691861e56', NULL, 1, 'debugbar', '{\"requestId\":\"Xb73451ee801b87bbdf4fe246264f22eb\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(41, '9c3a2d03-a8f8-4f3e-aac5-de87cb689b69', '9c3a2d03-a9bb-452a-948c-1b3691861e56', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair_coloring_highlights.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IlorT0NMMjI2Z3hURDFKTnU0U1ZtdXc9PSIsInZhbHVlIjoiQ0dEK2htbGtlZkMyVGs3bmFSUlZyZEtyWWE2bFU0dzV2UWFrc0ozZ2tFb3pYVUhFNzRoS0VFSGsvenpKR21COXBhR0V0ODlkeDZ3VDA1SUVqcHcrTFRFNjFyQ0crR1NxTVZRUVpFUXBaUGpwWU5iTDRmbytYcjZSRHdaYjVnUHEiLCJtYWMiOiIyNzM5ZGVjMDE1OWY5OWRjYTYxNDI4ZjZlZTAxNDRkNWQ5YzMwMTMwOTA4ZjUwNGMxODY2ZjdjNDNkYmU3ZTFkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImRQREtrY3B6QUk1aVJyTVQvcVJZbnc9PSIsInZhbHVlIjoiN2tPYTNJbEdPUERFZW5DbEphaFFjYTJpRUYyZHNudUJmbVhHZ3JoSWp2V0ZGdjNGZE9nYmhabGZVZVlxcDMwT1hCSDFPb0M3QkdQdWFvTE85emR3RUR2QXVPMG1FNDhPc0ZBK0hpT2hmYnYxNklWWDJLUHV5eFdtT3lnR2ZVTVciLCJtYWMiOiJjZGUwYjZiMzgxOTEzNmMzYzZjMThjZWExNGYwZWMxMjFmY2FiOWQxM2EzZWNkNjU3MTQ4MjA4MDFiYzNjYzA0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":179,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(42, '9c3a2d03-e88f-4cd9-8893-5bbc47f64414', '9c3a2d04-249d-4af4-bfdb-b6275274d5bb', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(43, '9c3a2d03-eb51-4d25-a01b-89bce47a1118', '9c3a2d04-249d-4af4-bfdb-b6275274d5bb', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(44, '9c3a2d03-ef29-4844-8f88-bdbfa150081b', '9c3a2d04-249d-4af4-bfdb-b6275274d5bb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'nRicP9Cqo1Ry4ifwtcxFj7veaydz1cEgmhW4xaJ2\' limit 1\",\"time\":\"2.59\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(45, '9c3a2d03-f2f7-4aac-8ff1-ece3a5741ad1', '9c3a2d04-249d-4af4-bfdb-b6275274d5bb', NULL, 1, 'debugbar', '{\"requestId\":\"X7cad2930d2d937c9ca241f575751308b\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(46, '9c3a2d04-23b4-4263-9610-793868d16ce6', '9c3a2d04-249d-4af4-bfdb-b6275274d5bb', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair_treatment_deep_conditioning.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IlorT0NMMjI2Z3hURDFKTnU0U1ZtdXc9PSIsInZhbHVlIjoiQ0dEK2htbGtlZkMyVGs3bmFSUlZyZEtyWWE2bFU0dzV2UWFrc0ozZ2tFb3pYVUhFNzRoS0VFSGsvenpKR21COXBhR0V0ODlkeDZ3VDA1SUVqcHcrTFRFNjFyQ0crR1NxTVZRUVpFUXBaUGpwWU5iTDRmbytYcjZSRHdaYjVnUHEiLCJtYWMiOiIyNzM5ZGVjMDE1OWY5OWRjYTYxNDI4ZjZlZTAxNDRkNWQ5YzMwMTMwOTA4ZjUwNGMxODY2ZjdjNDNkYmU3ZTFkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImRQREtrY3B6QUk1aVJyTVQvcVJZbnc9PSIsInZhbHVlIjoiN2tPYTNJbEdPUERFZW5DbEphaFFjYTJpRUYyZHNudUJmbVhHZ3JoSWp2V0ZGdjNGZE9nYmhabGZVZVlxcDMwT1hCSDFPb0M3QkdQdWFvTE85emR3RUR2QXVPMG1FNDhPc0ZBK0hpT2hmYnYxNklWWDJLUHV5eFdtT3lnR2ZVTVciLCJtYWMiOiJjZGUwYjZiMzgxOTEzNmMzYzZjMThjZWExNGYwZWMxMjFmY2FiOWQxM2EzZWNkNjU3MTQ4MjA4MDFiYzNjYzA0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":307,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:12'),
(47, '9c3a2d38-990a-400b-adc8-f210b41bb63b', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\' limit 1\",\"time\":\"3.20\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(48, '9c3a2d38-9f3e-4ddc-80c2-8f70235c9e43', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `deals` where `end_date` > \'2024-06-07 10:36:47\' and `is_hidden` = 0 order by `end_date` asc limit 3\",\"time\":\"0.68\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\app\\\\Http\\\\Controllers\\\\HomePageController.php\",\"line\":14,\"hash\":\"0a1621741ac44581e61b066f7d11bd0a\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(49, '9c3a2d38-a146-45f6-af01-e235487423b3', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `services`.*, (select count(*) from `appointments` where `services`.`id` = `appointments`.`service_id`) as `appointments_count` from `services` where `is_hidden` = 0 order by `appointments_count` desc limit 3\",\"time\":\"0.72\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\app\\\\Http\\\\Controllers\\\\HomePageController.php\",\"line\":21,\"hash\":\"7f0861d98385a78596884c5a776dac50\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(50, '9c3a2d38-a1b7-4bc1-9ec2-d00f081a970a', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Service\",\"count\":3,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(51, '9c3a2d38-a266-40de-8f9d-38a33b94285c', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"web.home\",\"path\":\"\\\\resources\\\\views\\/web\\/home.blade.php\",\"data\":[\"deals\",\"popularServices\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(52, '9c3a2d38-a3c6-4a6d-8a16-8ef1ce0468df', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(53, '9c3a2d38-a419-4e20-833d-59344762098d', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(54, '9c3a2d38-a453-425c-b265-479be5421ad5', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(55, '9c3a2d38-a493-4999-8a5c-0371c59a17eb', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(56, '9c3a2d38-a4c0-4327-b6e6-614fba21976a', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.service-card\",\"path\":\"\\\\resources\\\\views\\/components\\/service-card.blade.php\",\"data\":[\"service\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(57, '9c3a2d38-a4ff-406b-b566-0cafece47db6', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.button\",\"path\":\"\\\\resources\\\\views\\/components\\/button.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(58, '9c3a2d38-a536-4a10-8b47-2651319c56b6', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"layouts.app\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app.blade.php\",\"data\":[\"componentName\",\"attributes\",\"slot\",\"mainLogoRoute\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(59, '9c3a2d38-a5f0-499c-bdab-eaea30a72e48', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.banner\",\"path\":\"\\\\resources\\\\views\\/components\\/banner.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(60, '9c3a2d38-a639-42f4-a85c-7021be6fd368', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.navigation-menu\",\"path\":\"\\\\resources\\\\views\\/components\\/navigation-menu.blade.php\",\"data\":[\"attributes\",\"slot\",\"mainLogoRoute\",\"navlinks\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(61, '9c3a2d38-a71b-4ea9-b4ae-92272b86cece', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.application-mark\",\"path\":\"\\\\resources\\\\views\\/components\\/application-mark.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(62, '9c3a2d38-a813-4240-baf3-456cc4d70a05', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(63, '9c3a2d38-a856-495d-96db-14748d3dcf00', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.web.navlinks\",\"path\":\"\\\\resources\\\\views\\/components\\/web\\/navlinks.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(64, '9c3a2d38-a8a4-46e1-86b1-f56a162e477f', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(65, '9c3a2d38-a8eb-4de5-be68-7f0179b8228c', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(66, '9c3a2d38-a92f-4b09-b221-36c4ae054b66', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(67, '9c3a2d38-a970-4ed5-b369-28a37006b834', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(68, '9c3a2d38-a9aa-46eb-b96a-9bbc4aac6c3e', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(69, '9c3a2d38-a9e1-4b55-a827-acd1a8853dde', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(70, '9c3a2d38-aa11-40f6-9948-f647fc48cd99', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(71, '9c3a2d38-aa47-44aa-a75c-d5db1572ea76', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(72, '9c3a2d38-aa78-48a6-ab20-c42ae05bca6f', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'view', '{\"name\":\"components.responsive-nav-link\",\"path\":\"\\\\resources\\\\views\\/components\\/responsive-nav-link.blade.php\",\"data\":[\"href\",\"active\",\"attributes\",\"slot\",\"__laravel_slots\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(73, '9c3a2d38-ac50-4a2a-aac9-4db51cd430df', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `sessions` set `payload` = \'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0p5YUxVcUtYNFNPZVZSZU9TQVNMbEZUVm9jSzRrSHBsTUVkYURBRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=\', `last_activity` = 1717736807, `user_id` = null, `ip_address` = \'127.0.0.1\', `user_agent` = \'Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\' where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\'\",\"time\":\"2.93\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"8ca748303d971bd62c762f74392caa83\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(74, '9c3a2d38-aece-4623-bc53-b4c864d72ee8', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'c4kQuVY6deWnchvN990nou3F2dSyXUff8IqN6eNj\' limit 1\",\"time\":\"0.58\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(75, '9c3a2d38-b021-4a90-84cb-d6da099e69e9', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'debugbar', '{\"requestId\":\"Xcd19df84150fe37cf6c79365e3758733\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(76, '9c3a2d38-b373-43c7-ad22-c598136607d0', '9c3a2d38-b46b-40bc-b9ba-668bba1f0d0b', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomePageController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"sec-ch-ua-mobile\":\"?0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\",\"sec-fetch-site\":\"none\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-user\":\"?1\",\"sec-fetch-dest\":\"document\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IlorT0NMMjI2Z3hURDFKTnU0U1ZtdXc9PSIsInZhbHVlIjoiQ0dEK2htbGtlZkMyVGs3bmFSUlZyZEtyWWE2bFU0dzV2UWFrc0ozZ2tFb3pYVUhFNzRoS0VFSGsvenpKR21COXBhR0V0ODlkeDZ3VDA1SUVqcHcrTFRFNjFyQ0crR1NxTVZRUVpFUXBaUGpwWU5iTDRmbytYcjZSRHdaYjVnUHEiLCJtYWMiOiIyNzM5ZGVjMDE1OWY5OWRjYTYxNDI4ZjZlZTAxNDRkNWQ5YzMwMTMwOTA4ZjUwNGMxODY2ZjdjNDNkYmU3ZTFkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImRQREtrY3B6QUk1aVJyTVQvcVJZbnc9PSIsInZhbHVlIjoiN2tPYTNJbEdPUERFZW5DbEphaFFjYTJpRUYyZHNudUJmbVhHZ3JoSWp2V0ZGdjNGZE9nYmhabGZVZVlxcDMwT1hCSDFPb0M3QkdQdWFvTE85emR3RUR2QXVPMG1FNDhPc0ZBK0hpT2hmYnYxNklWWDJLUHV5eFdtT3lnR2ZVTVciLCJtYWMiOiJjZGUwYjZiMzgxOTEzNmMzYzZjMThjZWExNGYwZWMxMjFmY2FiOWQxM2EzZWNkNjU3MTQ4MjA4MDFiYzNjYzA0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"oJyaLUqKX4SOeVReOSASLlFTVocK4kHplMEdaDAE\",\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\"},\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\resources\\\\views\\/web\\/home.blade.php\",\"data\":{\"deals\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[]},\"popularServices\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"Nail Extensions\",\"slug\":\"nail-extensions\",\"description\":\"Get beautiful nail extensions for a stylish look.\",\"image\":\"hair.jpg\",\"price\":\"1250.00\",\"notes\":\"Choose from a variety of nail designs and colors.\",\"allergens\":null,\"benefits\":\"Adds length and beauty to your nails.\",\"aftercare_tips\":\"Avoid harsh chemicals on your nails to maintain the extensions.\",\"cautions\":null,\"category_id\":2,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0},{\"id\":2,\"name\":\"Hair Coloring - Highlights\",\"slug\":\"hair-coloring-highlights\",\"description\":\"Add vibrant highlights to your hair for a stunning effect.\",\"image\":\"hair_coloring_highlights.jpg\",\"price\":\"3000.00\",\"notes\":\"Consult with our colorist for the best shade selection.\",\"allergens\":\"Hair dye may contain allergens; inform us of any allergies.\",\"benefits\":\"Transform your look with beautifully colored highlights.\",\"aftercare_tips\":\"Use color-safe shampoos and conditioners to preserve color.\",\"cautions\":\"Patch test required for new clients with allergies.\",\"category_id\":3,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0},{\"id\":3,\"name\":\"Hair Treatment - Deep Conditioning\",\"slug\":\"hair-treatment-deep-conditioning\",\"description\":\"Revitalize your hair with deep conditioning treatment.\",\"image\":\"hair_treatment_deep_conditioning.jpg\",\"price\":\"4000.00\",\"notes\":\"Recommended for dry and damaged hair.\",\"allergens\":null,\"benefits\":\"Nourish and repair your hair for improved texture and shine.\",\"aftercare_tips\":\"Use recommended hair masks for ongoing maintenance.\",\"cautions\":null,\"category_id\":3,\"is_hidden\":false,\"created_at\":\"2024-06-07T05:02:35.000000Z\",\"updated_at\":\"2024-06-07T05:02:35.000000Z\",\"appointments_count\":0}]}}},\"duration\":264,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:47'),
(77, '9c3a2d3b-c0aa-4853-a3f8-900b7376c2a0', '9c3a2d3b-d1c2-4d14-9573-4f9ecc67cd5a', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(78, '9c3a2d3b-c3d9-48e5-a5da-d067144eb3bc', '9c3a2d3b-d1c2-4d14-9573-4f9ecc67cd5a', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(79, '9c3a2d3b-c8b7-4d7e-ba97-ddea3cad2bfe', '9c3a2d3b-d1c2-4d14-9573-4f9ecc67cd5a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'AhYx1ozlP0kQowBiq6cvEqmfJgUmJTYA1GtZHdmC\' limit 1\",\"time\":\"3.32\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(80, '9c3a2d3b-cd8e-416c-ac0d-a3c3b169af1f', '9c3a2d3b-d1c2-4d14-9573-4f9ecc67cd5a', NULL, 1, 'debugbar', '{\"requestId\":\"X7cffe5ecfcd3b1452b592d75151e0fd7\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(81, '9c3a2d3b-d0e9-4ac9-99cc-28a1143bd37b', '9c3a2d3b-d1c2-4d14-9573-4f9ecc67cd5a', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IkpnVDVqTmFqazBqMjFGazFKc0RkSWc9PSIsInZhbHVlIjoiODQ0bzIyemxOWXRsTERWYTRQbk5jSkR0aUgxS0s1ckh5LzZqd2tFOHZLQTFPSmtPajNTWlZENGo5WHk5dTErU0QvVEovT21EcWFHYXpPMWRWQ1htcmpaZlNlV1pmY0JTMGlpTWVyWWNoTWorbi8zM0ZRaHJwZVBsUEZNTjgxeUciLCJtYWMiOiJhNTNiZWVkMzY0NmZkNTBlNDgzYjNlZDg4YjIxOWIyMzgzYzliODU0MjUwMTY2MjA2ZGQzZjViYTk2M2YyMGQ0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InEvL20yQW1hdWg2RWROYmd1emZqb1E9PSIsInZhbHVlIjoiMGh4U0dYSG54WW05dTFEQ3VoYytPTzI3LzhNS0xlZFVDZkYyMjNUVG0yYTJrNnNHOEZZSDJNVFFMSTFTT1BERitsSy9VTnRiTHdMdzlBV3FNZ25ac2RTQWpucW5Ddll3bkQvdm1LdHZ3bkdWL0I4U2FzK3pXVFc2cW40dmlGRGwiLCJtYWMiOiJjMzUwNzZhMWFhYWRlYWUzMTViYjVkYTBjZDVlYjVkOWNmOTg0YjlhMTcyOWY3NWZhMzkwMWVhYTAwNWU0YTU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":262,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(82, '9c3a2d3c-1710-4473-ab2d-c7767f4d12b3', '9c3a2d3c-23e3-4206-a727-c80926f07aaf', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(83, '9c3a2d3c-1988-4db1-937c-ef7214299cc0', '9c3a2d3c-23e3-4206-a727-c80926f07aaf', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(84, '9c3a2d3c-1e1c-4d4c-8bc0-277943f103a4', '9c3a2d3c-23e3-4206-a727-c80926f07aaf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'4jVjyyyvcsfm9RPlBGaGXe3rQqtYoe8iRndUgvFA\' limit 1\",\"time\":\"2.63\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(85, '9c3a2d3c-21b4-4175-885b-aa0c0c9c217e', '9c3a2d3c-23e3-4206-a727-c80926f07aaf', NULL, 1, 'debugbar', '{\"requestId\":\"Xe281f31f177610c38d0d3750664973a4\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(86, '9c3a2d3c-22d5-4c41-b629-98b511e001ad', '9c3a2d3c-23e3-4206-a727-c80926f07aaf', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair_coloring_highlights.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IkpnVDVqTmFqazBqMjFGazFKc0RkSWc9PSIsInZhbHVlIjoiODQ0bzIyemxOWXRsTERWYTRQbk5jSkR0aUgxS0s1ckh5LzZqd2tFOHZLQTFPSmtPajNTWlZENGo5WHk5dTErU0QvVEovT21EcWFHYXpPMWRWQ1htcmpaZlNlV1pmY0JTMGlpTWVyWWNoTWorbi8zM0ZRaHJwZVBsUEZNTjgxeUciLCJtYWMiOiJhNTNiZWVkMzY0NmZkNTBlNDgzYjNlZDg4YjIxOWIyMzgzYzliODU0MjUwMTY2MjA2ZGQzZjViYTk2M2YyMGQ0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InEvL20yQW1hdWg2RWROYmd1emZqb1E9PSIsInZhbHVlIjoiMGh4U0dYSG54WW05dTFEQ3VoYytPTzI3LzhNS0xlZFVDZkYyMjNUVG0yYTJrNnNHOEZZSDJNVFFMSTFTT1BERitsSy9VTnRiTHdMdzlBV3FNZ25ac2RTQWpucW5Ddll3bkQvdm1LdHZ3bkdWL0I4U2FzK3pXVFc2cW40dmlGRGwiLCJtYWMiOiJjMzUwNzZhMWFhYWRlYWUzMTViYjVkYTBjZDVlYjVkOWNmOTg0YjlhMTcyOWY3NWZhMzkwMWVhYTAwNWU0YTU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":202,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(87, '9c3a2d3c-6bb5-4710-9c78-79accf6f4a78', '9c3a2d3c-7889-40a5-9924-bfe681d81e4e', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(88, '9c3a2d3c-6e60-4ba2-94f0-336d6ff7c009', '9c3a2d3c-7889-40a5-9924-bfe681d81e4e', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[240:242]\",\"type\":\"composer\"}],\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(89, '9c3a2d3c-7284-495c-9410-e5487658b943', '9c3a2d3c-7889-40a5-9924-bfe681d81e4e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `sessions` where `id` = \'qj5gum7IIgYqcqHi778i6q8CUI96t3HSsxlePjQ1\' limit 1\",\"time\":\"2.59\",\"slow\":false,\"file\":\"D:\\\\laravel_field_booking\\\\laravel_field_booking\\\\public\\\\index.php\",\"line\":51,\"hash\":\"f48fa5df8fd323d753d03a2e0070fcde\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(90, '9c3a2d3c-7617-4e5f-9914-edd87b3cf427', '9c3a2d3c-7889-40a5-9924-bfe681d81e4e', NULL, 1, 'debugbar', '{\"requestId\":\"Xaa1b0932ef3b1a6f84c73130019dd337\",\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49'),
(91, '9c3a2d3c-77b5-4e53-9b4e-89495ad754fd', '9c3a2d3c-7889-40a5-9924-bfe681d81e4e', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/storage\\/hair_treatment_deep_conditioning.jpg\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\"CCleaner Browser\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\",\"dnt\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 CCleaner\\/125.0.0.0\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.690920007.1717349353; _ga_X2PX0RL88B=GS1.1.1717349353.1.1.1717349539.0.0.0; XSRF-TOKEN=eyJpdiI6IkpnVDVqTmFqazBqMjFGazFKc0RkSWc9PSIsInZhbHVlIjoiODQ0bzIyemxOWXRsTERWYTRQbk5jSkR0aUgxS0s1ckh5LzZqd2tFOHZLQTFPSmtPajNTWlZENGo5WHk5dTErU0QvVEovT21EcWFHYXpPMWRWQ1htcmpaZlNlV1pmY0JTMGlpTWVyWWNoTWorbi8zM0ZRaHJwZVBsUEZNTjgxeUciLCJtYWMiOiJhNTNiZWVkMzY0NmZkNTBlNDgzYjNlZDg4YjIxOWIyMzgzYzliODU0MjUwMTY2MjA2ZGQzZjViYTk2M2YyMGQ0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InEvL20yQW1hdWg2RWROYmd1emZqb1E9PSIsInZhbHVlIjoiMGh4U0dYSG54WW05dTFEQ3VoYytPTzI3LzhNS0xlZFVDZkYyMjNUVG0yYTJrNnNHOEZZSDJNVFFMSTFTT1BERitsSy9VTnRiTHdMdzlBV3FNZ25ac2RTQWpucW5Ddll3bkQvdm1LdHZ3bkdWL0I4U2FzK3pXVFc2cW40dmlGRGwiLCJtYWMiOiJjMzUwNzZhMWFhYWRlYWUzMTViYjVkYTBjZDVlYjVkOWNmOTg0YjlhMTcyOWY3NWZhMzkwMWVhYTAwNWU0YTU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":208,\"memory\":26,\"hostname\":\"LAPTOP-HORDBH1M\"}', '2024-06-07 10:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('9c3a2d00-57e9-4fdc-9749-b225787f859a', 'App\\Models\\Service'),
('9c3a2d38-a1b7-4bc1-9ec2-d00f081a970a', 'App\\Models\\Service');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '09:00:00', '10:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(2, '10:00:00', '11:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(3, '11:00:00', '12:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(4, '12:00:00', '13:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(5, '13:00:00', '14:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(6, '14:00:00', '15:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(7, '15:00:00', '16:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(8, '16:00:00', '17:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35'),
(9, '17:00:00', '18:00:00', '2024-06-07 03:32:35', '2024-06-07 03:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `phone_number`, `remember_token`, `current_team_id`, `profile_photo_path`, `status`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Yos ivan', 'ivan@gmail.com', NULL, '$2y$10$ho84nHBAdTN2vvrdmNZOKOhUVO2a0LaVWYAiXZDA3vJsY43BVaL0y', NULL, NULL, NULL, '1234569990', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 1),
(2, 'yos', 'yos@gmail.com', NULL, '$2y$10$G.gpzy0Oa/3b5LAEjZ05uusLXlXecms6emabQTxNQph3zzWnlKVza', NULL, NULL, NULL, '1299567890', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 3),
(3, 'tus', 'kita@gmail.com', NULL, '$2y$10$RGd4EVRksKA4aJeFs3Js9.lGJwnhLQlwKdymItZD1dEP4JqRq9L9u', NULL, NULL, NULL, '1277567890', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 3),
(4, 'vanbok', 'van@gmail.com', NULL, '$2y$10$8x7PzhIcPGYAgqI/EWtgj.hBRv2uLQgk94HO62axIGswUpxJsFVYq', NULL, NULL, NULL, '1234998890', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 3),
(5, 'ivan', 'ivan1@gmail.com', NULL, '$2y$10$.irZGCqBkCy2L1v1aoOQbu1CVFxCpaJ54P7Hw5M1C5pBY4Xy7JZdS', NULL, NULL, NULL, '1644567890', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 2),
(6, 'Employee 2', 'emp2@gmails.com', NULL, '$2y$10$lbflLfYKitrUSU42mtOdtuIIKjuxJ4EXE3VCv2VFi5yFFvQ71JA5m', NULL, NULL, NULL, '1234523890', NULL, NULL, NULL, 1, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 2),
(7, 'Employee 3', 'emp3@gmail.com', NULL, '$2y$10$TOLosqsvrdkiyhHX6W46te/o.rl0LbKSoXv8Y3.bZsGPk877OL.ea', NULL, NULL, NULL, '0034567890', NULL, NULL, NULL, 0, '2024-06-07 03:32:35', '2024-06-07 03:32:35', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointments_appointment_code_unique` (`appointment_code`),
  ADD KEY `appointments_cart_id_foreign` (`cart_id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`),
  ADD KEY `appointments_service_id_foreign` (`service_id`),
  ADD KEY `appointments_time_slot_id_foreign` (`time_slot_id`),
  ADD KEY `appointments_location_id_foreign` (`location_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_uuid_unique` (`uuid`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_service`
--
ALTER TABLE `cart_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_service_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_service_service_id_foreign` (`service_id`),
  ADD KEY `cart_service_time_slot_id_foreign` (`time_slot_id`),
  ADD KEY `cart_service_location_id_foreign` (`location_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_category_id_index` (`category_id`);

--
-- Indexes for table `service_hits`
--
ALTER TABLE `service_hits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_service`
--
ALTER TABLE `cart_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_hits`
--
ALTER TABLE `service_hits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `appointments_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `appointments_time_slot_id_foreign` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`),
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_service`
--
ALTER TABLE `cart_service`
  ADD CONSTRAINT `cart_service_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_service_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `cart_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `cart_service_time_slot_id_foreign` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`);

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
