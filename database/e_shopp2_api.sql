-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 04:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_shopp2_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_count`, `created_at`, `updated_at`) VALUES
(1, 'Gadgets', 0, NULL, NULL),
(2, 'Cosmetics', 0, NULL, NULL),
(3, 'Apparel', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courier_name` varchar(255) NOT NULL,
  `courier_price` double(8,2) NOT NULL,
  `courier_count` int(11) NOT NULL,
  `courier_eta` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `courier_name`, `courier_price`, `courier_count`, `courier_eta`, `created_at`, `updated_at`) VALUES
(1, 'J&T', 50.00, 0, '3', NULL, NULL),
(2, 'LBC', 35.00, 0, '4', NULL, NULL);

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
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(46, 56, 3, '2023-10-03 18:48:40', '2023-10-03 18:48:40');

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
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_resets_table', 1),
(33, '2019_08_19_000000_create_failed_jobs_table', 1),
(34, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(35, '2023_09_04_101236_create_products_table', 1),
(36, '2023_09_04_102225_create_categories_table', 1),
(37, '2023_09_04_102525_create_orders_table', 1),
(38, '2023_09_04_103244_create_couriers_table', 1),
(39, '2023_09_04_103353_create_statuses_table', 1),
(40, '2023_09_04_103501_create_payments_table', 1),
(41, '2023_09_07_052704_create_order__products_table', 2),
(42, '2023_09_07_083322_create_favourites_table', 3),
(43, '2023_09_23_094338_create_sessions_table', 4),
(44, '2023_10_02_061134_create_vouchers_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_count` int(11) NOT NULL,
  `order_status` bigint(20) UNSIGNED NOT NULL,
  `order_grand_total` double(8,2) NOT NULL,
  `order_voucher` text NOT NULL,
  `order_discount` double(8,2) NOT NULL,
  `order_sub_total` double(8,2) NOT NULL,
  `order_courier` text NOT NULL,
  `order_shipping_price` double(8,2) NOT NULL,
  `order_payment_method` text NOT NULL,
  `order_delivery_address` text NOT NULL,
  `order_is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `item_count`, `order_status`, `order_grand_total`, `order_voucher`, `order_discount`, `order_sub_total`, `order_courier`, `order_shipping_price`, `order_payment_method`, `order_delivery_address`, `order_is_cancelled`, `created_at`, `updated_at`) VALUES
(56, 56, 3, 2, 64.96, '{\"shipping_discount\":0,\"price_discount\":0,\"name\":\"None\"}', 0.00, 14.96, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"323\",\"address2\":\"Caloocan\",\"zipcode\":\"2314\",\"notes\":\"\"}', 1, '2023-10-05 21:04:19', '2023-10-09 18:49:33'),
(57, 56, 3, 1, 63.18, '{\"shipping_discount\":0,\"price_discount\":0,\"name\":\"None\"}', 0.00, 13.18, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"323\",\"address2\":\"Caloocan\",\"zipcode\":\"2314\",\"notes\":\"\"}', 0, '2023-10-05 21:26:43', '2023-10-05 21:26:43'),
(58, 56, 3, 1, 67.23, '{\"shipping_discount\":0,\"price_discount\":10,\"name\":\"10% OFF\"}', 20.09, 22.32, '{\"name\":\"LBC\",\"price\":65,\"id\":2}', 65.00, '{\"name\":\"Paypal\",\"id\":2}', '{\"address1\":\"123\",\"address2\":\"Caloocan\",\"zipcode\":\"1234\",\"notes\":\"\"}', 1, '2023-10-09 18:24:25', '2023-10-09 19:02:44'),
(59, 56, 4, 1, 18.80, '{\"shipping_discount\":100,\"price_discount\":0,\"name\":\"Free Shipping\"}', 65.00, 18.80, '{\"name\":\"LBC\",\"price\":65,\"id\":2}', 0.00, '{\"name\":\"Mastercard\",\"id\":3}', '{\"address1\":\"234\",\"address2\":\"Las Piñas\",\"zipcode\":\"1234\",\"notes\":\"hello\"}', 1, '2023-10-18 18:59:00', '2023-10-18 18:59:11'),
(60, 56, 7, 1, 54.18, '{\"shipping_discount\":0,\"price_discount\":10,\"name\":\"10% OFF\"}', 37.58, 41.76, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"234\",\"address2\":\"Las Piñas\",\"zipcode\":\"1234\",\"notes\":\"hello\"}', 1, '2023-10-18 19:01:23', '2023-10-18 19:03:24'),
(61, 56, 6, 3, 51.83, '{\"shipping_discount\":0,\"price_discount\":10,\"name\":\"10% OFF\"}', 16.50, 18.33, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"234\",\"address2\":\"Las Piñas\",\"zipcode\":\"1234\",\"notes\":\"hello\"}', 1, '2023-10-18 19:06:31', '2023-10-18 19:07:26'),
(62, 56, 4, 1, 52.37, '{\"shipping_discount\":0,\"price_discount\":10,\"name\":\"10% OFF\"}', 21.30, 23.67, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"234\",\"address2\":\"Las Piñas\",\"zipcode\":\"1234\",\"notes\":\"hello\"}', 1, '2023-10-18 19:08:20', '2023-10-18 19:08:24'),
(63, 56, 4, 4, 57.02, '{\"shipping_discount\":0,\"price_discount\":25,\"name\":\"25% OFF\"}', 21.06, 28.08, '{\"name\":\"J&T\",\"price\":50,\"id\":1}', 50.00, '{\"name\":\"Cash On Delivery\",\"id\":1}', '{\"address1\":\"342\",\"address2\":\"Las Piñas\",\"zipcode\":\"3233\",\"notes\":\"\"}', 0, '2023-10-20 01:03:47', '2023-10-20 01:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `order__products`
--

CREATE TABLE `order__products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_discount` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order__products`
--

INSERT INTO `order__products` (`id`, `order_id`, `product_id`, `product_price`, `product_discount`, `total_price`, `count`, `created_at`, `updated_at`) VALUES
(39, 56, 2, 6.00, 7, 11.16, 2, '2023-10-05 21:04:19', '2023-10-05 21:04:19'),
(40, 56, 1, 4.00, 5, 3.80, 1, '2023-10-05 21:04:19', '2023-10-05 21:04:19'),
(41, 57, 2, 6.00, 7, 5.58, 1, '2023-10-05 21:26:43', '2023-10-05 21:26:43'),
(42, 58, 4, 7.00, 1, 13.86, 2, '2023-10-09 18:24:25', '2023-10-09 18:24:25'),
(43, 58, 3, 9.00, 6, 8.46, 1, '2023-10-09 18:24:25', '2023-10-09 18:24:25'),
(44, 59, 197, 5.00, 7, 13.95, 3, '2023-10-18 18:59:00', '2023-10-18 18:59:00'),
(45, 59, 198, 5.00, 3, 4.85, 1, '2023-10-18 18:59:00', '2023-10-18 18:59:00'),
(46, 60, 2, 6.00, 7, 27.90, 5, '2023-10-18 19:01:23', '2023-10-18 19:01:23'),
(47, 60, 4, 7.00, 1, 13.86, 2, '2023-10-18 19:01:23', '2023-10-18 19:01:23'),
(48, 61, 6, 4.00, 4, 15.36, 4, '2023-10-18 19:06:31', '2023-10-18 19:06:31'),
(49, 61, 7, 0.00, 4, 0.00, 1, '2023-10-18 19:06:31', '2023-10-18 19:06:31'),
(50, 61, 5, 3.00, 1, 2.97, 1, '2023-10-18 19:06:31', '2023-10-18 19:06:31'),
(51, 62, 2, 6.00, 7, 16.74, 3, '2023-10-18 19:08:20', '2023-10-18 19:08:20'),
(52, 62, 4, 7.00, 1, 6.93, 1, '2023-10-18 19:08:20', '2023-10-18 19:08:20'),
(53, 63, 2, 6.00, 7, 11.16, 2, '2023-10-20 01:03:47', '2023-10-20 01:03:47'),
(54, 63, 3, 9.00, 6, 16.92, 2, '2023-10-20 01:03:47', '2023-10-20 01:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_name` varchar(255) NOT NULL,
  `payment_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_name`, `payment_count`, `created_at`, `updated_at`) VALUES
(1, 'COD', 0, NULL, NULL),
(2, 'Paypal', 0, NULL, NULL),
(3, 'Gcash', 0, NULL, NULL);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 45, 'api_token', '69b1a19494edf07b9eab766dda977e3a78e8f81d6b6276938f4c57905320a604', '[\"*\"]', NULL, NULL, '2023-09-07 21:26:01', '2023-09-07 21:26:01'),
(2, 'App\\Models\\User', 55, 'api_token', '7101a5eeaba31e3884505d06033ec4df95ce79bf3d68ca236323de498ba1dc44', '[\"*\"]', NULL, NULL, '2023-09-07 21:39:58', '2023-09-07 21:39:58'),
(7, 'App\\Models\\User', 55, 'api_token', 'de6e0c839874bb70eb37eb3c1a29b6005f90797588c41efb73d3b2705dbb5f85', '[\"*\"]', NULL, NULL, '2023-09-10 23:07:15', '2023-09-10 23:07:15'),
(8, 'App\\Models\\User', 55, 'api_token', 'b406075787bc8acc220215cc69417bfc55001ff0b941fa2dbfda697b5d568b0b', '[\"*\"]', NULL, NULL, '2023-09-10 23:31:26', '2023-09-10 23:31:26'),
(9, 'App\\Models\\User', 55, 'api_token', '5f604c5f2c4acfa7988a617b13e633f28b8235407869c1aa9f841086e347c9c0', '[\"*\"]', NULL, NULL, '2023-09-10 23:36:55', '2023-09-10 23:36:55'),
(10, 'App\\Models\\User', 54, 'api_token', 'd83ea2723ee98668512d65146927c9e7480f330fe5586488e1948178b9021ad9', '[\"*\"]', NULL, NULL, '2023-09-10 23:45:54', '2023-09-10 23:45:54'),
(11, 'App\\Models\\User', 54, 'api_token', '20984e63abde1ee26ce8428543f2135a1abf3bedd011438f139d8e3aac063136', '[\"*\"]', NULL, NULL, '2023-09-10 23:46:05', '2023-09-10 23:46:05'),
(12, 'App\\Models\\User', 55, 'api_token', '3956166ea9db06314f90d7295120c2a49bfaae1af89d7948c8ba7b48edcb159f', '[\"*\"]', NULL, NULL, '2023-09-10 23:48:26', '2023-09-10 23:48:26'),
(13, 'App\\Models\\User', 55, 'api_token', '9e6cd0a1d8d1d31c4ab22f03eea972589e1a257d3672761ec862a18518da46bf', '[\"*\"]', NULL, NULL, '2023-09-10 23:49:18', '2023-09-10 23:49:18'),
(14, 'App\\Models\\User', 55, 'api_token', '1cfdc78d545eacaf7a5b4281e27d7a605fd51082acd4859c0a9b16220b55828a', '[\"*\"]', NULL, NULL, '2023-09-10 23:49:33', '2023-09-10 23:49:33'),
(15, 'App\\Models\\User', 55, 'api_token', '0ada7e88fdcc04eeb611310416c55d58b6b2b91943d81ea0d499bea6ab13bcd0', '[\"*\"]', NULL, NULL, '2023-09-10 23:52:21', '2023-09-10 23:52:21'),
(16, 'App\\Models\\User', 55, 'api_token', '70ff59513d1c4dcbb333ff108d09982332c15bb7ffad70ae3a2334860722a3ee', '[\"*\"]', NULL, NULL, '2023-09-10 23:53:00', '2023-09-10 23:53:00'),
(17, 'App\\Models\\User', 55, 'api_token', 'bafb6a7f1a2eda0e8bc594cd9e2bb4d7dc207af5f1453743f3681809bf819d23', '[\"*\"]', NULL, NULL, '2023-09-10 23:53:38', '2023-09-10 23:53:38'),
(18, 'App\\Models\\User', 55, 'api_token', '76e902a772ae40f551f254fb8f8a80e7abcedab9aba02589710bafd012c2f19a', '[\"*\"]', NULL, NULL, '2023-09-10 23:54:50', '2023-09-10 23:54:50'),
(19, 'App\\Models\\User', 55, 'api_token', '2b828ceb180a6cc3b99606b888823683b93a51ffd4796b5b362cfc376634bb5f', '[\"*\"]', NULL, NULL, '2023-09-10 23:58:23', '2023-09-10 23:58:23'),
(20, 'App\\Models\\User', 55, 'api_token', '86d1d678d61fe13700fe7434f7eb1a7cc715646fe7167706b28ac8313771da35', '[\"*\"]', NULL, NULL, '2023-09-11 00:03:26', '2023-09-11 00:03:26'),
(21, 'App\\Models\\User', 55, 'api_token', '919d6c8ede73a3447e3221fddd8950142768624c5d62d1d888526d27a1fab366', '[\"*\"]', NULL, NULL, '2023-09-11 00:03:49', '2023-09-11 00:03:49'),
(22, 'App\\Models\\User', 55, 'api_token', '5361226cebb19dc8dd4831f01f50d460b551e2131bcf0f76d2d3d0771b4cebe9', '[\"*\"]', NULL, NULL, '2023-09-11 00:04:12', '2023-09-11 00:04:12'),
(23, 'App\\Models\\User', 55, 'api_token', '971bf1b06481f6da05cee4a0ca43596622bb394e9951460d7fa058d879694603', '[\"*\"]', NULL, NULL, '2023-09-11 00:04:51', '2023-09-11 00:04:51'),
(24, 'App\\Models\\User', 55, 'api_token', 'afaf276284df6e0f7a0bca881b66384c9aff0ebb03a944e7ffe01a755722ad8f', '[\"*\"]', NULL, NULL, '2023-09-11 00:06:21', '2023-09-11 00:06:21'),
(25, 'App\\Models\\User', 55, 'api_token', '3260a340fd11bda5e4af9332b40a77b93f50e93759d818d9ff13f58ea822bf4a', '[\"*\"]', NULL, NULL, '2023-09-11 00:08:01', '2023-09-11 00:08:01'),
(26, 'App\\Models\\User', 55, 'api_token', '0cd521ba0eb91a34cb9e048e8b146376eea49e49fe4600c39006e5969651a828', '[\"*\"]', NULL, NULL, '2023-09-11 00:09:09', '2023-09-11 00:09:09'),
(27, 'App\\Models\\User', 55, 'api_token', '161b87db1eb49a0d1e1446a36c55e6da3c6a3f15bf32e2f87ed9836ff14076ee', '[\"*\"]', NULL, NULL, '2023-09-11 00:10:34', '2023-09-11 00:10:34'),
(28, 'App\\Models\\User', 55, 'api_token', 'f0f084dc86b008334cbd8ba54f904c92b8d89cb43d2259094dbe8416da56d803', '[\"*\"]', NULL, NULL, '2023-09-11 00:16:34', '2023-09-11 00:16:34'),
(29, 'App\\Models\\User', 55, 'api_token', '2409be7896ce341c55a7811fb631931803f7b52b3da97a7dcd9089a2b14cafbb', '[\"*\"]', NULL, NULL, '2023-09-11 00:16:49', '2023-09-11 00:16:49'),
(30, 'App\\Models\\User', 55, 'api_token', '6ed67fe8b8b8e5a1f60306709bda9676a4296cce74e8590e982301ce4774b247', '[\"*\"]', NULL, NULL, '2023-09-11 00:17:18', '2023-09-11 00:17:18'),
(31, 'App\\Models\\User', 55, 'api_token', '50e8ba1cfa0d725a9640684905b8f00d25ad333ae0fbb8e6344169c74faab71f', '[\"*\"]', NULL, NULL, '2023-09-11 00:18:33', '2023-09-11 00:18:33'),
(32, 'App\\Models\\User', 55, 'api_token', 'a0ed3f44a6c2bf24fb43b11a383cfe5ee1576704fea2e1aed351b08ced84ffab', '[\"*\"]', NULL, NULL, '2023-09-11 00:30:46', '2023-09-11 00:30:46'),
(33, 'App\\Models\\User', 55, 'api_token', 'a76a182be5096de34821bf1abce3aa5825db6cac8484b51b4188952ce4ad9100', '[\"*\"]', NULL, NULL, '2023-09-11 00:34:28', '2023-09-11 00:34:28'),
(34, 'App\\Models\\User', 55, 'api_token', 'b70ed0808f8e5e565e674b9aac60030ad9749f3b821338b200c8cf405f6433ed', '[\"*\"]', NULL, NULL, '2023-09-11 00:35:05', '2023-09-11 00:35:05'),
(35, 'App\\Models\\User', 55, 'api_token', 'f698cd83d3438f85b7e2524be8c4030bbdc54c026dbc9b29ca0f7791338ac823', '[\"*\"]', NULL, NULL, '2023-09-11 00:35:39', '2023-09-11 00:35:39'),
(36, 'App\\Models\\User', 55, 'api_token', 'a997ca2a911e170ebcc34393b1c14c5a9168c7c1f5126106f0d55897d997e536', '[\"*\"]', NULL, NULL, '2023-09-11 00:37:29', '2023-09-11 00:37:29'),
(37, 'App\\Models\\User', 55, 'api_token', '3a947a882e269d940dc1ed1775777723cbcbbc566f9466aff3b2eafd357c43c7', '[\"*\"]', NULL, NULL, '2023-09-11 00:38:02', '2023-09-11 00:38:02'),
(38, 'App\\Models\\User', 55, 'api_token', '27f099cac31927863350a03760945acafbde34b1a07f847718d1e3fac5202b41', '[\"*\"]', NULL, NULL, '2023-09-11 00:38:46', '2023-09-11 00:38:46'),
(39, 'App\\Models\\User', 55, 'api_token', 'ab3b77378847f90ff305624b9b899ff8ce1ad614c79f2c2051a8da5fcf1d9550', '[\"*\"]', NULL, NULL, '2023-09-11 01:01:02', '2023-09-11 01:01:02'),
(40, 'App\\Models\\User', 55, 'api_token', '21533f8bfadcb8cb784ed21b9e5f2ba0a031626ad11ee6c59644371d644a9d9d', '[\"*\"]', NULL, NULL, '2023-09-11 01:01:09', '2023-09-11 01:01:09'),
(41, 'App\\Models\\User', 55, 'api_token', 'cac752d49ce52bfe92f0afff1a1b3d3e2cb4f4d27f06d014007785260d32d54f', '[\"*\"]', NULL, NULL, '2023-09-11 01:04:35', '2023-09-11 01:04:35'),
(42, 'App\\Models\\User', 55, 'api_token', '3bfb03149f48019be26453dbb2043e201121bcf831ea2671b6262798b503d83b', '[\"*\"]', NULL, NULL, '2023-09-11 01:32:29', '2023-09-11 01:32:29'),
(43, 'App\\Models\\User', 55, 'api_token', 'd79e153c29465edc4804ab1887b9fadbb216383a16fe33135bd6b6ab9ad793fd', '[\"*\"]', NULL, NULL, '2023-09-11 01:32:40', '2023-09-11 01:32:40'),
(44, 'App\\Models\\User', 55, 'api_token', 'd847b996976fd192a103dd866bcd0550af603e23b986beec457e037f792b1526', '[\"*\"]', NULL, NULL, '2023-09-11 01:35:14', '2023-09-11 01:35:14'),
(45, 'App\\Models\\User', 55, 'api_token', '1ada007fa4db460dbd31eb344ad45f2efed83d6e98e0e79c69308488b9135eaf', '[\"*\"]', NULL, NULL, '2023-09-11 01:35:20', '2023-09-11 01:35:20'),
(46, 'App\\Models\\User', 55, 'api_token', '67eeeabc7671c98accf6ffe3a8c8b0134e8b069cc33a113813460f776fa0604b', '[\"*\"]', NULL, NULL, '2023-09-11 01:36:30', '2023-09-11 01:36:30'),
(47, 'App\\Models\\User', 55, 'api_token', '4c894cc3bcf931d0e444451308beba9671c0802c95418267925b15bdfbfa2aeb', '[\"*\"]', NULL, NULL, '2023-09-11 01:37:26', '2023-09-11 01:37:26'),
(48, 'App\\Models\\User', 55, 'api_token', 'e1075e7695416936e1e3c3b132a13b1dcd8cf157d21588b485eae2138c0cc276', '[\"*\"]', NULL, NULL, '2023-09-11 01:42:41', '2023-09-11 01:42:41'),
(49, 'App\\Models\\User', 55, 'api_token', '1c64c67a8c941a67db80c849b375f2607c73adf9aa707d10500baf859c4bcd63', '[\"*\"]', NULL, NULL, '2023-09-11 01:46:50', '2023-09-11 01:46:50'),
(50, 'App\\Models\\User', 55, 'api_token', '8eac9faa7d9f00fddeeb8bd7d612ee0040679174dd3d7396a6b5aaa685aa1d7d', '[\"*\"]', NULL, NULL, '2023-09-11 01:50:52', '2023-09-11 01:50:52'),
(51, 'App\\Models\\User', 55, 'api_token', 'b4bb6a72bf08e4d1b4597e8a99e374da1c027f197ab274136544449d45fcd14b', '[\"*\"]', NULL, NULL, '2023-09-11 01:53:46', '2023-09-11 01:53:46'),
(52, 'App\\Models\\User', 55, 'api_token', 'fa751586cd452de1e196458a3d5490315885a3c3277aed85f40f076bd7305af2', '[\"*\"]', NULL, NULL, '2023-09-11 01:58:03', '2023-09-11 01:58:03'),
(53, 'App\\Models\\User', 55, 'api_token', '78223db2a6496516aa44f140dc310dde75ac886c7c334c49eb2b71d2e4de42a5', '[\"*\"]', NULL, NULL, '2023-09-11 02:04:00', '2023-09-11 02:04:00'),
(54, 'App\\Models\\User', 55, 'api_token', '8f8ce7538037899b772733d7cc9b8a6899713fb57c877785a7cd4a8886896367', '[\"*\"]', NULL, NULL, '2023-09-11 02:08:34', '2023-09-11 02:08:34'),
(55, 'App\\Models\\User', 55, 'api_token', '1800da1209abc6302537df235a79a15acd7e9bf2de79b3360a3ba91fceeb2196', '[\"*\"]', NULL, NULL, '2023-09-11 02:16:51', '2023-09-11 02:16:51'),
(56, 'App\\Models\\User', 55, 'api_token', '971ac87a179fc1cf0841dceaae253283d453885588555c92d6426bc79b985886', '[\"*\"]', NULL, NULL, '2023-09-11 02:23:49', '2023-09-11 02:23:49'),
(57, 'App\\Models\\User', 55, 'api_token', '57e7dbebc78ae73fd65b2618fb02dee2a810164191050efdaa8f65a6a51810c5', '[\"*\"]', NULL, NULL, '2023-09-11 02:24:21', '2023-09-11 02:24:21'),
(58, 'App\\Models\\User', 55, 'api_token', 'ed6640166f0227f994f4d44606cae1171708e146f84a09c173b57a2800290d95', '[\"*\"]', NULL, NULL, '2023-09-11 02:28:47', '2023-09-11 02:28:47'),
(59, 'App\\Models\\User', 55, 'api_token', '05ad151d6ca0a51a3f524bb170d9e53fbe7e2bc8f330acbdb6afcc23f782bd47', '[\"*\"]', NULL, NULL, '2023-09-11 02:35:23', '2023-09-11 02:35:23'),
(60, 'App\\Models\\User', 55, 'api_token', 'd4135fbb3cf8d3da86c3d89a28a6758c7886d31de5864694f5926b6919d0afad', '[\"*\"]', NULL, NULL, '2023-09-11 02:36:18', '2023-09-11 02:36:18'),
(61, 'App\\Models\\User', 55, 'api_token', '2e306f08fa3ff1e0afb92fd21d43bf0344758adaddc74a6a51615ef13da77255', '[\"*\"]', NULL, NULL, '2023-09-11 02:37:56', '2023-09-11 02:37:56'),
(62, 'App\\Models\\User', 55, 'api_token', '68c25800bd15214d5c8be5a6ffbf35fb30b1a8863d3b3357b9afee5dd9c7b3be', '[\"*\"]', NULL, NULL, '2023-09-11 23:58:22', '2023-09-11 23:58:22'),
(63, 'App\\Models\\User', 55, 'api_token', 'a3abfc0d09eaaeea44f4631940c2b3553cf473ccfe36316d4aea5bc8a2551a7c', '[\"*\"]', NULL, NULL, '2023-09-12 22:04:28', '2023-09-12 22:04:28'),
(64, 'App\\Models\\User', 57, 'api_token', '3b83e2ce41b6451ec991c345b2e55b752d9e89f482df30eb0765dbc3c36b80f5', '[\"*\"]', NULL, NULL, '2023-09-12 23:27:08', '2023-09-12 23:27:08'),
(80, 'App\\Models\\User', 56, 'api_token', '37411d0dc3540e267dcd47833ac254fbe8df9409291e813071b7da2a67f0b582', '[\"*\"]', NULL, NULL, '2023-09-18 18:11:02', '2023-09-18 18:11:02'),
(82, 'App\\Models\\User', 54, 'api_token', '0b2ed40f2fd69b93e720e4371719b5352fd434bfcdc2516cfd679ebb01ad68e4', '[\"*\"]', '2023-09-19 18:56:06', NULL, '2023-09-19 18:48:15', '2023-09-19 18:56:06'),
(86, 'App\\Models\\User', 56, 'api_token', '9c02b9050159cc14c802f0fc9c536e5411c0cc73a483d42d7d4104998a6d98cb', '[\"*\"]', '2023-09-21 01:55:08', NULL, '2023-09-21 01:03:11', '2023-09-21 01:55:08'),
(87, 'App\\Models\\User', 54, 'api_token', '4b60b0f9942eb4eb1624942c7252c6ff35a44c7d6d6b20f699d27d9f5fa851a9', '[\"*\"]', '2023-09-21 01:37:06', NULL, '2023-09-21 01:36:36', '2023-09-21 01:37:06'),
(88, 'App\\Models\\User', 56, 'api_token', 'b827b6d59786b52f879f5395ccb4814576b846956bf3513d52963887fca9e9b8', '[\"*\"]', '2023-09-24 22:42:01', NULL, '2023-09-24 20:10:03', '2023-09-24 22:42:01'),
(90, 'App\\Models\\User', 56, 'api_token', '017d0d4e7d0f2334e31883ff4f2a690dfba5f8777261dbc89e7076289843b262', '[\"*\"]', '2023-10-02 18:39:53', NULL, '2023-10-02 18:37:54', '2023-10-02 18:39:53'),
(93, 'App\\Models\\User', 56, 'api_token', 'ce1dfe0011bdcdf2ef6eaf658426ee414dfaa94d9fb918067980d93f1db03237', '[\"*\"]', NULL, NULL, '2023-10-02 23:06:35', '2023-10-02 23:06:35'),
(94, 'App\\Models\\User', 56, 'api_token', '7bb427a5d790d4948c3782307aace3d24765ed00790a919af0afaa5e8a78a880', '[\"*\"]', '2023-10-03 18:48:43', NULL, '2023-10-03 18:48:19', '2023-10-03 18:48:43'),
(95, 'App\\Models\\User', 56, 'api_token', '1228fa124b93e4ee874556cd04db06f690557f7c41b0e80a82197ab2a5eed6a1', '[\"*\"]', '2023-10-04 21:26:07', NULL, '2023-10-04 18:39:20', '2023-10-04 21:26:07'),
(96, 'App\\Models\\User', 54, 'api_token', '16febf081dca6d841e4e367d7bc364014de1b1bb58f7f0f8818992cc301dc783', '[\"*\"]', '2023-10-04 21:23:35', NULL, '2023-10-04 21:23:21', '2023-10-04 21:23:35'),
(97, 'App\\Models\\User', 56, 'api_token', '366524df0af28ba6ccfc61cb528e754878e463589d805dcb3370910721ee66aa', '[\"*\"]', '2023-10-04 23:24:13', NULL, '2023-10-04 22:02:14', '2023-10-04 23:24:13'),
(98, 'App\\Models\\User', 56, 'api_token', 'ce4decfc3be1bbf733be430f7ba31b6fa72f15bc17ffcbfe74b05b8e6029b376', '[\"*\"]', '2023-10-05 02:09:11', NULL, '2023-10-04 23:26:09', '2023-10-05 02:09:11'),
(99, 'App\\Models\\User', 56, 'api_token', '648c14ca6d81a5bfe70563196c545358d00fea400296aa9440739f92184d04d5', '[\"*\"]', '2023-10-04 23:41:44', NULL, '2023-10-04 23:39:55', '2023-10-04 23:41:44'),
(100, 'App\\Models\\User', 56, 'api_token', '7172d1dd406d3f7fcad75cee527d0e0b529244f3d9c27e6cf16ef25ce109d78f', '[\"*\"]', '2023-10-05 21:53:41', NULL, '2023-10-05 18:32:54', '2023-10-05 21:53:41'),
(101, 'App\\Models\\User', 56, 'api_token', '3e5ca8433da924ef4c8853a39dc47420a47aae01a226420590b9718c52d2f72d', '[\"*\"]', '2023-10-09 19:09:34', NULL, '2023-10-09 18:22:55', '2023-10-09 19:09:34'),
(102, 'App\\Models\\User', 56, 'api_token', '9796bd5f0fa7a842e977134d26ab5bf5f0e7a6235dc49007a5390058cc3b33ba', '[\"*\"]', '2023-10-19 00:59:17', NULL, '2023-10-18 18:58:19', '2023-10-19 00:59:17'),
(103, 'App\\Models\\User', 56, 'api_token', 'e8b02c7155d36e3063b73606cbc2a83cb8bb6edf990de37b101004df4f85c81e', '[\"*\"]', '2023-10-19 00:39:48', NULL, '2023-10-19 00:34:16', '2023-10-19 00:39:48'),
(104, 'App\\Models\\User', 56, 'api_token', '73abc8ddf24a9f7be301ee5de67e32eab4697a8c680cbf5b709e29f7137669be', '[\"*\"]', '2023-10-20 03:00:41', NULL, '2023-10-20 01:03:03', '2023-10-20 03:00:41'),
(105, 'App\\Models\\User', 56, 'api_token', '2647f949abe9f896aea17ef2d1cf6afb2e2c3a1db089ec2d0e715a3147cb5f15', '[\"*\"]', '2023-10-31 01:27:12', NULL, '2023-10-30 22:49:07', '2023-10-31 01:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` double(11,2) NOT NULL,
  `product_discount` int(11) NOT NULL DEFAULT 0,
  `product_rating` int(11) NOT NULL DEFAULT 0,
  `product_category` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_price`, `product_discount`, `product_rating`, `product_category`, `created_at`, `updated_at`) VALUES
(1, 'Sed facere ducimus ad itaque voluptates doloremque.', 'Nobis consequatur cupiditate nemo repudiandae rerum expedita officia. Voluptatibus et ex nobis et harum officia similique.', 4.00, 5, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(2, 'Magnam nulla eum perferendis dolorum error ea.', 'Quia qui atque distinctio porro quasi provident. Nihil veritatis aut minima. Quia voluptas distinctio id quo. Beatae consequatur delectus asperiores autem amet.', 6.00, 7, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(3, 'Voluptatum dolor minima maxime sint doloribus dolor in.', 'Velit laborum nihil rerum ducimus saepe inventore similique. Est et perferendis pariatur commodi qui soluta. Animi rerum id praesentium dolor suscipit culpa.', 9.00, 6, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(4, 'Quaerat accusantium consequatur architecto eaque voluptate.', 'Et pariatur laudantium qui qui non. Laboriosam officia sint architecto nesciunt. Cumque tenetur quis et dolorem. Ut ut rerum ipsa est.', 7.00, 1, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(5, 'Deleniti voluptas et excepturi consequatur in quam.', 'Et facilis corporis in quia totam. Quam in rerum voluptatibus accusamus nam.', 3.00, 1, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(6, 'Qui ut sit voluptatem molestiae.', 'Et fuga consequuntur dignissimos veniam dignissimos. Voluptas aperiam aut dolores voluptatem odit.', 4.00, 4, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(7, 'Qui repellendus nisi dicta necessitatibus aperiam.', 'In sunt rerum odio non cum. Eos qui repudiandae eum aspernatur autem. Adipisci voluptatum nulla et reprehenderit laborum quae voluptatem. Cum nulla quia dolor qui.', 0.00, 4, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(8, 'Quis non illum dolorum laborum recusandae vero quo.', 'Nostrum possimus esse ratione est sed. Natus quas architecto ut.', 0.00, 0, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(9, 'Dicta et ut possimus dolorem.', 'Ipsam ut sit quia et aut quos. Quaerat qui qui ad explicabo ipsum ut ut. Voluptatibus quos cupiditate dolorum atque. Explicabo dolores beatae magnam amet hic reprehenderit ut esse.', 2.00, 5, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(10, 'Quia cupiditate magnam maxime sit.', 'Eveniet corporis rerum maxime. Quia nobis ducimus qui. Numquam voluptas odit repudiandae aut rerum non iusto. Soluta architecto optio nostrum minus debitis laborum aperiam.', 9.00, 1, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(11, 'Qui nemo dolorem molestias itaque quasi necessitatibus quis.', 'Animi commodi omnis voluptas reprehenderit magnam reiciendis beatae. Modi expedita reprehenderit debitis voluptatem.', 8.00, 7, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(12, 'Ducimus quia qui excepturi.', 'Vitae beatae recusandae porro architecto dolore omnis iure. Veniam sed optio corporis est eius. Optio cumque autem labore incidunt aut magnam. Sed non dolor quos atque dignissimos. Aliquam est iste placeat explicabo repellendus porro recusandae.', 2.00, 4, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(13, 'Voluptatem qui incidunt sunt aut in.', 'Praesentium minima voluptas placeat ipsam accusantium optio. Et dolores temporibus quod vel et officiis hic. Illo et dignissimos ab voluptatum ullam ea delectus.', 2.00, 0, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(14, 'Voluptatum sed autem voluptatem.', 'Inventore ut ab architecto enim laboriosam aliquam nihil. Earum et laborum quis quod est tempore eligendi. Voluptatem pariatur aliquid aperiam necessitatibus quod. Harum ut quia rerum aut voluptatibus eveniet dolorem. Nisi similique nam molestiae.', 6.00, 7, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(15, 'Enim nulla eveniet cupiditate rerum libero ullam debitis.', 'Eum quia rerum pariatur pariatur illo est voluptatem magnam. Numquam nobis at odio perferendis vero. Sed in qui repellat rerum facilis earum facere.', 8.00, 1, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(16, 'Animi provident vel ut et sunt et et dolor.', 'Eum dolorem sed animi repellat. Sit eum alias eligendi non eum. Nihil cum consequatur minima hic. Voluptate sequi sequi optio aut.', 8.00, 6, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(17, 'Porro et omnis explicabo est.', 'Ab aut nobis et et neque nihil. Error et et omnis sunt tempora est. Non maiores enim autem quo ut. Dolores culpa fugit sit accusamus distinctio aperiam.', 7.00, 8, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(18, 'Facilis tempora dolor accusamus nulla harum nobis.', 'Deserunt dolorem quasi eius assumenda et voluptatem facilis vel. Sed iure cumque sed incidunt expedita vero doloribus. Nam qui enim ipsam ducimus et modi minus.', 4.00, 9, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(19, 'Et repudiandae sapiente sit numquam accusantium.', 'Architecto dolorum et rem et molestiae recusandae. Porro expedita earum et temporibus. Corporis provident necessitatibus rerum. Et explicabo sit sit ea.', 7.00, 6, 5, 1, '2023-09-04 19:36:24', '2023-09-04 19:36:24'),
(20, 'Quis perferendis voluptas quibusdam labore non eos nisi.', 'Iusto ipsa doloremque enim autem. Explicabo illo at tempora deleniti qui adipisci in. Doloremque rerum praesentium eveniet corporis facilis dolorem ipsa. Nesciunt vitae doloribus dolor et quia fuga.', 2.00, 0, 5, 1, '2023-09-04 19:36:25', '2023-09-04 19:36:25'),
(21, 'Praesentium in aspernatur cum facilis corrupti.', 'Iure dolorum laborum ut. Occaecati voluptas saepe dicta sunt occaecati exercitationem aut. Perspiciatis est velit harum quam architecto distinctio doloribus.', 2.00, 1, 4, 1, '2023-09-04 19:36:49', '2023-09-04 19:36:49'),
(22, 'Et repellendus ipsam consectetur.', 'Et laudantium placeat delectus rerum quos repellendus. Reiciendis ut doloremque dolorum et aut qui. Quibusdam et consectetur sunt ut eligendi voluptatem pariatur molestiae.', 4.00, 3, 4, 1, '2023-09-04 19:36:49', '2023-09-04 19:36:49'),
(23, 'Cum aut iste praesentium consectetur consequuntur deserunt iste et.', 'In iure error quo qui. Nihil distinctio autem ut maiores accusamus reprehenderit dolores adipisci.', 2.00, 3, 4, 1, '2023-09-04 19:36:49', '2023-09-04 19:36:49'),
(24, 'Et reprehenderit suscipit aliquam omnis quia.', 'Quia voluptas dolores ad et exercitationem. Sed voluptas omnis voluptatem. Non ut suscipit perferendis ea et sapiente. Aliquid vel animi debitis eum eos quidem.', 3.00, 4, 4, 1, '2023-09-04 19:36:49', '2023-09-04 19:36:49'),
(25, 'Itaque molestiae veniam labore animi.', 'Expedita inventore maiores autem omnis nemo voluptates distinctio. Atque dignissimos corporis illo nulla animi odio quidem voluptatem. Consequatur praesentium aspernatur quia voluptatem animi velit expedita. Voluptatem saepe sapiente dolorem animi alias quia optio.', 3.00, 7, 4, 1, '2023-09-04 19:36:49', '2023-09-04 19:36:49'),
(26, 'Esse sed et aliquid quod excepturi enim rem.', 'Corporis quisquam consequuntur culpa et et quos. Libero tenetur vero eos omnis.', 1.00, 9, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(27, 'Impedit rerum voluptatem labore dolores quaerat corporis est aliquid.', 'Vitae quod voluptatem illum qui ullam nesciunt. Inventore impedit id quasi consequatur et adipisci. In consequatur repudiandae animi porro aut vitae.', 9.00, 6, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(28, 'Pariatur et placeat qui reprehenderit expedita illo.', 'Laudantium excepturi qui quos voluptatem sint atque. Ea quod eum inventore ut. Vitae pariatur dicta non suscipit pariatur. Et libero quidem sit voluptas ipsa.', 5.00, 8, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(29, 'Numquam quasi atque ullam voluptatibus cum atque.', 'Dignissimos sunt qui pariatur doloribus. Vel quia aut doloremque aut animi maiores magni velit. Similique nihil rem qui sit iste ut rerum.', 4.00, 0, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(30, 'Omnis aliquid accusamus et.', 'Culpa voluptatem ullam nemo maiores soluta sed et unde. Quidem et et ipsa distinctio similique laborum et ut. Et quia non sed sed. Earum repellendus qui dolores ratione sunt nesciunt doloremque.', 8.00, 4, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(31, 'Alias aut sint et eius minima sed ratione.', 'Ratione corporis illum qui libero voluptatum at. Reprehenderit quidem atque suscipit veniam numquam eius.', 6.00, 3, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(32, 'Est qui quisquam omnis molestiae quasi quo sequi.', 'Dolore beatae aspernatur expedita iste doloribus alias porro. Quam quidem et eum a sit. Quis unde est eum voluptatem vel vel officia. Et voluptatibus officiis dolorem ad est et ea.', 7.00, 9, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(33, 'Consequatur natus quo nihil explicabo ipsum.', 'Quibusdam et nulla est. Est ipsa necessitatibus distinctio aut libero nemo rerum. Ullam laboriosam occaecati fugiat fugiat.', 2.00, 0, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(34, 'Sapiente dolorum ipsam sunt.', 'Sit autem et voluptas voluptas aut. Porro nemo vel inventore et. Id rerum sunt cum.', 3.00, 7, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(35, 'Eius cupiditate similique voluptate repellat asperiores.', 'Doloribus aut enim quos nam. Quia voluptatum dignissimos in quo mollitia. Hic est velit eius minus laborum.', 0.00, 9, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(36, 'Soluta accusantium reprehenderit natus et quod.', 'Eos odit laboriosam sed omnis consectetur voluptatibus quaerat. Itaque fuga quia accusamus et laboriosam eum. Est ut recusandae ut id voluptate. Quis beatae facere enim animi ducimus eos beatae.', 7.00, 8, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(37, 'Perspiciatis nisi quia dolores nihil consequatur qui voluptate.', 'Autem ut natus excepturi at et. Praesentium veritatis officia voluptatem voluptates est quo natus. Minus corrupti veritatis omnis distinctio beatae corrupti.', 1.00, 6, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(38, 'Saepe odit tenetur et et eum et.', 'Et ut eaque amet laborum. Neque ratione rerum voluptatum ut sit est consectetur. Tempore quas aut qui et alias est.', 2.00, 8, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(39, 'Accusantium et quae recusandae laudantium.', 'Est itaque quas dolores cumque similique. Facilis cupiditate molestiae aspernatur temporibus unde fuga incidunt. Fuga porro saepe illo ut facere qui. Maxime odio ipsum dolor quis excepturi tenetur.', 3.00, 9, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(40, 'Ut minima quas laboriosam sunt non nesciunt consequatur.', 'Debitis velit quis qui labore non. Nam eum et qui earum omnis. Aperiam magni amet est quidem.', 6.00, 5, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(41, 'Id excepturi nostrum tempore aspernatur ducimus dolorum atque.', 'Molestiae dolores inventore et occaecati voluptas quo. Natus quod natus laboriosam temporibus itaque. Quia ipsum consectetur saepe ratione qui. In modi aut eaque sit ea atque. Et explicabo voluptatum minus vel.', 7.00, 8, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(42, 'Sunt iste sed repellendus autem.', 'Voluptatum aliquid iure non officiis quibusdam neque. Occaecati quaerat id est rerum. Et neque optio earum aperiam et minus est. Animi unde aut sunt voluptas consequatur quia ea.', 8.00, 6, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(43, 'Hic enim dolorum dolores ut.', 'Sequi earum voluptatem voluptas voluptate. Rem rem voluptas dolorem est. Enim nulla iusto commodi ut et. Est voluptatibus itaque voluptas recusandae praesentium.', 8.00, 2, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(44, 'Sapiente molestiae aliquid magni ad ab nobis inventore.', 'Sunt et consequatur quia expedita a. Quidem aliquid magnam suscipit in sit. Alias vero eligendi voluptate nam quidem commodi necessitatibus est. Voluptate animi tempora ut exercitationem.', 5.00, 0, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(45, 'Quidem tempora velit officiis beatae eos.', 'Assumenda cum asperiores quasi inventore eos optio possimus. Velit et neque voluptatibus. Harum numquam et soluta enim ipsa repellendus.', 0.00, 4, 4, 1, '2023-09-04 19:36:50', '2023-09-04 19:36:50'),
(46, 'Delectus sunt praesentium voluptatibus et et sint.', 'Voluptas commodi nemo est omnis vel ut. Voluptates voluptatum sit aliquid eligendi et voluptates natus. Explicabo quo non maxime corrupti sed.', 2.00, 5, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(47, 'Et est id nostrum iusto fuga aut possimus et.', 'Est et est et ea placeat. Assumenda adipisci qui dolor veritatis aspernatur quia quo. Id nostrum est illum vel ut quam est.', 9.00, 0, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(48, 'Impedit quam eos rerum dolor.', 'Voluptatem a et fugit itaque. Aut cupiditate modi quidem optio praesentium similique. Voluptas dicta commodi quod voluptatem ullam aliquid. Iusto culpa quam molestiae est.', 7.00, 4, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(49, 'Praesentium sed aspernatur illum atque sunt nihil est.', 'A animi ut illum est voluptas occaecati sed. Nisi nemo qui iste blanditiis. Impedit et assumenda deleniti quas. Enim aut deleniti aut.', 7.00, 5, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(50, 'Quia omnis neque tempore deserunt repellendus et et laboriosam.', 'Sequi consequuntur dignissimos illo ut provident. Esse occaecati sunt aut illo deserunt. Expedita eveniet incidunt adipisci ipsam. Aut animi labore asperiores iure.', 8.00, 2, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(51, 'Magnam ut maxime placeat.', 'Ex qui et rerum qui. Quibusdam itaque ea eligendi quidem.', 3.00, 6, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(52, 'Qui nam laudantium aut aut.', 'Sed autem et ipsa at nemo aliquam iusto. Necessitatibus sapiente qui aperiam sed. Impedit asperiores similique dignissimos. Dolor minus porro qui aut consequatur sint.', 4.00, 9, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(53, 'Assumenda quia culpa hic consequatur.', 'Dolores qui voluptatum consectetur architecto. Ipsam qui quibusdam magnam quam. Rerum officiis et nobis libero molestiae. Sunt quibusdam cupiditate magnam voluptatem dicta esse maiores.', 7.00, 9, 3, 1, '2023-09-04 19:36:54', '2023-09-04 19:36:54'),
(54, 'Voluptatem voluptatem tempora laudantium est.', 'Aliquid sit vel fugit vel quia suscipit enim rerum. Voluptas aperiam dolor laudantium est tenetur unde numquam. Autem repellendus assumenda illo repellat illo at rerum quos.', 1.00, 9, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(55, 'Nihil quo ad vitae iure dolores amet ut provident.', 'Aliquam et minima voluptatem aut ipsam eos iusto. Et quia ut eius est omnis ex non quis.', 5.00, 8, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(56, 'Animi quia voluptates nam quo molestiae nesciunt.', 'Dicta id sequi quas veniam. Fugiat ullam similique est et exercitationem. Rem dicta provident et ad in. Tenetur labore voluptate vero eligendi voluptas ut omnis.', 4.00, 9, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(57, 'Dolores sit eius accusamus illo et.', 'Architecto nulla facere autem vel omnis. Quo ipsam repellat deserunt maxime sed in officiis voluptas. Quod quia ea vel veritatis autem dolores corporis. Et voluptatem quam repellendus debitis sapiente error autem.', 3.00, 1, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(58, 'Vitae libero qui quae nesciunt reiciendis voluptates culpa.', 'Eum ab reiciendis et libero. Recusandae beatae aut corporis id tenetur deleniti. Neque ullam inventore ut aut.', 3.00, 7, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(59, 'Quam suscipit et voluptatem delectus suscipit omnis doloribus.', 'Molestias id magni debitis quaerat suscipit voluptate. Facilis vero harum fuga qui. Earum voluptatum temporibus id possimus adipisci id quasi. Pariatur aut ad voluptas voluptate. Facilis voluptate officiis esse sequi voluptatem.', 1.00, 6, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(60, 'Quod error rerum officia beatae iure.', 'Impedit magnam quis rerum quo labore. Facilis sunt animi velit accusamus dolor voluptatem quasi. Voluptatum voluptas est quidem amet saepe saepe a.', 4.00, 1, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(61, 'Non quo dolores magnam sunt.', 'Enim voluptas fuga id. Cum ipsam voluptates quas molestiae non. Expedita quia sint asperiores ut nemo. Perferendis et dicta sequi illum optio.', 8.00, 8, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(62, 'Quo aliquid eos quasi est dolorem quia esse.', 'Quaerat debitis blanditiis beatae laudantium dicta. Aut odio odio voluptas nihil. Cupiditate recusandae nostrum ipsum dolorem ea alias inventore.', 7.00, 0, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(63, 'Illum quo provident optio distinctio et voluptatum magni adipisci.', 'Sapiente repellat nostrum dolores numquam culpa dolores dolorem. Accusamus commodi deleniti provident facilis sunt eveniet animi.', 1.00, 3, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(64, 'Doloribus ab aut accusantium ad vitae beatae inventore.', 'Doloremque et ex voluptas dolor voluptatem. Ut sit aut ut dignissimos et. Qui unde ex placeat necessitatibus.', 1.00, 8, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(65, 'Ullam aut corporis ullam qui est eveniet.', 'Dolores non aut qui sed natus. Sunt officiis amet perferendis eaque.', 9.00, 7, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(66, 'Eum dicta ea ipsa eos sequi eaque veniam.', 'Voluptate vel consequatur praesentium praesentium. Laboriosam officia facere qui pariatur consequuntur recusandae.', 2.00, 8, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(67, 'Rem ipsa est qui minima temporibus.', 'Debitis qui alias explicabo possimus. Omnis optio eaque consequuntur sit facilis. Rerum sequi nemo aliquam iste provident. Magnam laborum vero optio ipsum autem. Et velit pariatur nisi.', 7.00, 4, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(68, 'Omnis fugit aut facere quia reiciendis ut ipsa.', 'Unde possimus repudiandae qui voluptatem. Enim consequuntur et enim natus est aut assumenda. Rerum delectus qui architecto voluptatem qui. Officia et in sint animi commodi reiciendis.', 4.00, 9, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(69, 'Velit aut sed suscipit vero.', 'Architecto dolorem laboriosam laudantium aliquam. Nobis officia pariatur consequuntur maiores in asperiores. Rerum sed nihil laudantium alias. Illum soluta magnam doloremque totam.', 1.00, 1, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(70, 'Sit quaerat atque repellat est voluptatem fuga facere.', 'Delectus quia temporibus autem est laboriosam enim. Ullam dolores omnis deserunt molestias et non harum molestiae. Eos reprehenderit quia cum quibusdam fugiat. Asperiores repellat nemo quas molestias aliquid.', 2.00, 1, 3, 1, '2023-09-04 19:36:55', '2023-09-04 19:36:55'),
(71, 'Quo quis possimus in aliquam aperiam aut aut doloremque.', 'Libero repellendus corrupti nihil labore rem minus. Aut fuga sapiente et minus omnis beatae.', 7.00, 3, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(72, 'Eum aut repellat architecto autem vero.', 'Maxime molestiae quibusdam quam. Itaque aspernatur ullam ut aspernatur eveniet et quia voluptas. Accusantium eum rerum alias beatae iusto dicta. Nam sunt voluptatem ut et consequuntur.', 5.00, 4, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(73, 'Quis id aut eos quasi quaerat sint ipsam.', 'Ad voluptates magnam optio sit. Vel iste non iure fugiat et. Adipisci aut temporibus est sit quis id saepe.', 4.00, 4, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(74, 'Et itaque et cum iusto vero.', 'Est repudiandae non iure nulla est id animi. Eligendi et ut asperiores est. Iure harum quia dolorem rem repellat et cumque distinctio.', 6.00, 5, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(75, 'Pariatur officiis ipsum quo sapiente blanditiis.', 'Voluptas et est rerum illo. Iure doloremque voluptatem autem sit et.', 3.00, 0, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(76, 'Ipsa quasi aut veniam vitae deserunt magnam.', 'Qui nostrum cupiditate error corporis esse et est. Doloremque qui error laudantium velit qui. Soluta facilis qui sequi perspiciatis accusantium est. Quam consequuntur officia sequi corporis in maxime iste.', 7.00, 2, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(77, 'Laudantium consectetur repellat est dolorum earum.', 'Incidunt distinctio alias adipisci fugit aut expedita et dolor. Voluptatem quibusdam dicta et eos. Rerum distinctio aspernatur id possimus ullam sint.', 5.00, 0, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(78, 'Eum laboriosam et repellendus suscipit aliquam quas libero.', 'Ut eaque et omnis et perferendis. Consectetur sit totam dolores qui animi totam aperiam. Soluta sit mollitia numquam doloribus tenetur eos.', 2.00, 5, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(79, 'Repudiandae quis nisi ut excepturi recusandae quod quidem sed.', 'Consequatur esse impedit unde voluptas quas natus vero fugiat. Rem omnis sapiente culpa excepturi rerum aspernatur commodi. Illo praesentium ut nam iure libero sapiente est.', 2.00, 6, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(80, 'Dolores dolor accusantium natus explicabo culpa.', 'Recusandae quam eaque et a aut. Et culpa quam quia eius dolorem. Illo quaerat sunt sunt libero aliquid enim aliquid perspiciatis.', 6.00, 5, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(81, 'Facilis dignissimos pariatur eum sint esse.', 'Doloremque consequatur velit debitis voluptatum. Necessitatibus esse a nulla beatae vero iusto quia. Perspiciatis perspiciatis ut est eveniet alias perferendis veniam dolorem. Praesentium vel est similique sunt. Eum ipsam aut est est voluptas.', 3.00, 4, 2, 1, '2023-09-04 19:36:59', '2023-09-04 19:36:59'),
(82, 'Doloremque velit quidem temporibus.', 'Vitae omnis nihil omnis id qui in. Reiciendis doloremque consequatur neque repellat voluptatem amet. Quam earum qui necessitatibus consequatur velit. Ratione corrupti saepe odio autem earum. Vitae consequatur nisi ullam eos ad placeat.', 5.00, 7, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(83, 'Accusantium quas dolorem in nobis.', 'Dolorum magni exercitationem omnis quo. Rerum aspernatur aut asperiores cum omnis esse. Expedita sit ducimus asperiores qui odio beatae. Cum est sunt non ut sit tempora ad.', 3.00, 8, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(84, 'Voluptatum cum hic odio doloribus soluta laboriosam.', 'Vel tempora asperiores eius. Non quisquam adipisci omnis aut molestias aut. Nulla est suscipit placeat autem voluptatibus alias. Excepturi voluptatem adipisci in neque quod consectetur.', 6.00, 4, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(85, 'Qui sed quod natus in.', 'Magnam porro sit aliquid deserunt ipsa voluptatem. Ut eum deleniti ut repellat corporis. Vero esse illo quod suscipit omnis. Harum nobis laboriosam nihil ab sed. Eius ipsum quaerat reiciendis necessitatibus.', 8.00, 7, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(86, 'Ut sit sit harum quod ut.', 'Officia similique est dolores eum dignissimos ad. Distinctio animi ea alias unde. Quasi quam non illum tempora et delectus dolores quo.', 6.00, 3, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(87, 'Inventore harum nisi deserunt aut perferendis.', 'Voluptates perferendis nihil corrupti et qui error autem reiciendis. Et accusantium eos amet magnam consequatur fugiat voluptatem. Consequatur est velit magni. Similique atque harum tenetur ut placeat omnis.', 9.00, 3, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(88, 'Qui vero debitis consequuntur itaque consequuntur aliquam veniam.', 'Illum et fugiat laudantium accusamus voluptas velit. Voluptates quo qui molestias consectetur expedita quidem minus. Est dolor autem esse. Ut eligendi voluptas dolore doloremque laborum corrupti tempora tenetur.', 6.00, 2, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(89, 'Libero aut et et possimus dolores et vel.', 'In quia ipsa vel optio facere. Voluptates vitae quisquam a voluptatum ea aut explicabo. Voluptas dolor laborum unde quasi.', 6.00, 9, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(90, 'Vel facilis magni qui culpa ut.', 'Consequatur temporibus sapiente inventore in. Quo voluptatibus incidunt natus sed omnis. Dolores odit quia magni eveniet autem animi. Et praesentium ut aut temporibus possimus velit. Iure consequuntur corrupti qui.', 8.00, 8, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(91, 'Iste sunt distinctio et sunt.', 'Ex veritatis in quo ipsum. Illo delectus voluptatibus expedita. Accusamus et provident molestiae nobis nam soluta. Voluptatem enim accusantium ipsa deleniti. Blanditiis autem qui et nisi odio qui natus.', 3.00, 9, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(92, 'Sit illum saepe eum sit voluptas et exercitationem.', 'Inventore nam dolore non quae. Molestiae qui odio ullam quo facilis. Reiciendis saepe sed ut aut. Necessitatibus eaque quisquam sit non ducimus consequatur.', 7.00, 5, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(93, 'Esse minima quasi et qui culpa.', 'Officiis ut sint assumenda ab. Delectus occaecati exercitationem doloremque error laboriosam quia asperiores. Iste sunt debitis ut laudantium omnis at. Architecto sed ut voluptas id rerum repudiandae non.', 1.00, 6, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(94, 'Maiores voluptatem nam sed quis aperiam quia ea quae.', 'Dignissimos et iure laboriosam eaque laboriosam rem aut. Doloremque sed aut ut iste autem ullam. Nisi fugit repellat labore in quam fugiat explicabo.', 1.00, 2, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(95, 'Eius incidunt quibusdam dicta rerum.', 'Aperiam est et totam quae. Totam iusto assumenda est eum numquam aut repudiandae ipsa. Ut facere et cum saepe quia est dolorem. Omnis minus voluptas sunt. Iste qui doloremque magni molestias minus.', 4.00, 5, 2, 1, '2023-09-04 19:37:00', '2023-09-04 19:37:00'),
(96, 'Et temporibus dolores aperiam ullam maiores reiciendis dolorum.', 'Recusandae molestias omnis illo nisi. Fugiat ullam nulla corrupti laudantium nam quis ullam. Libero laboriosam cupiditate est cumque velit nulla molestiae. Maiores et rerum ipsum et quos modi voluptas.', 2.00, 8, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(97, 'Molestias mollitia quia rerum.', 'Enim quidem commodi optio et recusandae qui tempora est. Et ullam repudiandae ut et dolores. A quia voluptatem praesentium omnis odio quisquam asperiores.', 6.00, 0, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(98, 'Eum tempora dolore nostrum explicabo fugiat aut quidem.', 'Sit est et et mollitia. Blanditiis repellendus aut at illum at. Quae incidunt qui nihil.', 6.00, 5, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(99, 'Laudantium qui nulla unde ut.', 'At velit quis eos eos illo esse. Repudiandae error labore praesentium ab.', 1.00, 3, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(100, 'Nisi quia id nulla provident voluptatibus.', 'Ut quibusdam et voluptatem porro dolor. Delectus repudiandae id voluptatem est eius eos est qui. Id repellat ratione non illum qui.', 6.00, 5, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(101, 'Occaecati perspiciatis hic eligendi architecto est enim necessitatibus.', 'Animi voluptas alias ut fugiat doloremque nostrum. Quod nesciunt minus ut et.', 3.00, 0, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(102, 'Blanditiis totam placeat excepturi praesentium laudantium.', 'Recusandae animi corrupti id rerum vel. Expedita est fugiat alias quae. Qui nemo porro expedita sequi vel adipisci iste. Velit ea explicabo soluta id nostrum.', 3.00, 1, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(103, 'Numquam delectus qui quaerat similique.', 'Libero modi inventore harum. Ut quia qui rerum et inventore non velit. Voluptas reiciendis cumque quibusdam magnam. Assumenda ut rerum nemo totam.', 1.00, 0, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(104, 'Quasi facere nostrum id quidem molestiae.', 'Qui aut inventore voluptate repudiandae aut quibusdam et. Odio dolor illum est voluptatem. Sint dignissimos sunt explicabo suscipit sint repellat. Quaerat quos ipsam nisi magnam iusto tempora blanditiis.', 5.00, 8, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(105, 'Dignissimos enim totam consequatur nemo quo incidunt.', 'Fugit unde laudantium nostrum laboriosam accusantium doloremque. Doloribus ab praesentium dolores illo voluptatem.', 5.00, 8, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(106, 'Iusto sit qui enim.', 'Optio dolorem vel in quibusdam beatae deleniti accusantium fugiat. Non velit est voluptas rerum explicabo accusamus. Delectus ipsa saepe recusandae non. Facere modi totam et aliquam.', 9.00, 1, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(107, 'Rerum minus sapiente dolores sed.', 'Voluptas nostrum optio accusamus tempora quisquam aliquam pariatur. Rem officiis itaque nulla dignissimos modi. Qui nostrum architecto sunt hic cum natus. Est nostrum hic quibusdam explicabo maxime qui tenetur. Nisi voluptatem eveniet ut animi.', 3.00, 7, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(108, 'Necessitatibus ipsam mollitia qui aut.', 'Dolor corporis ut non provident. Eos nesciunt aut laudantium vel quia. Fugiat harum possimus non.', 1.00, 5, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(109, 'Suscipit nihil et nobis veritatis et ut.', 'Temporibus nihil mollitia eveniet dignissimos. Neque accusantium sint ducimus pariatur possimus id. Cumque et blanditiis dolorum quaerat. Asperiores sint fugit corrupti ut rem perferendis.', 7.00, 6, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(110, 'Omnis eum veniam quo et dolore aut.', 'Eos qui mollitia natus distinctio tempore quos a. Laboriosam et mollitia aut. Magni est consequatur voluptas occaecati. Enim laborum tempora voluptates voluptatem mollitia sit sapiente.', 1.00, 6, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(111, 'Enim autem est et voluptatem recusandae.', 'Maiores facilis dolores necessitatibus non. Fuga porro debitis quam et. Culpa occaecati veniam quidem id sit cum sequi. Quaerat id eveniet occaecati ea nam.', 7.00, 5, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(112, 'Perspiciatis et iure ut non laudantium.', 'Explicabo libero eos cupiditate neque expedita. Quaerat sequi suscipit commodi harum in provident omnis. Atque dolorum soluta sunt perspiciatis doloribus sit. Ex et voluptas sit saepe qui facilis. Rerum dolor a repudiandae ex cumque laudantium libero.', 5.00, 6, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(113, 'Quo recusandae hic mollitia possimus dignissimos quis dolor.', 'Consequatur voluptatum id repellendus qui placeat fugiat. Recusandae saepe dolores et.', 6.00, 5, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(114, 'Quia ratione perferendis quia reiciendis vitae dicta rem.', 'Et et qui eum corporis. Eligendi dolor non et dolor. Aut labore quibusdam voluptas quos ut amet ut voluptates.', 5.00, 4, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(115, 'Est qui adipisci maxime deleniti quis commodi.', 'Nobis consequatur illum laudantium dolores dolor. Et placeat autem reprehenderit molestiae perferendis porro excepturi.', 1.00, 2, 1, 1, '2023-09-04 19:37:05', '2023-09-04 19:37:05'),
(116, 'Praesentium laudantium quia vel.', 'Sequi quia ad omnis nemo. Ducimus repellat recusandae laudantium veniam qui vel. Iste aut id tempore illum ut.', 9.00, 4, 1, 1, '2023-09-04 19:37:06', '2023-09-04 19:37:06'),
(117, 'Quibusdam a quas ullam reiciendis.', 'Omnis mollitia dolorem distinctio voluptatem animi. Fugit laborum architecto ullam saepe ratione veniam laudantium ipsa. Ut voluptatem sunt id velit nulla voluptatem non. Saepe consequatur cumque facilis dolores.', 0.00, 9, 1, 1, '2023-09-04 19:37:06', '2023-09-04 19:37:06'),
(118, 'Sed adipisci qui est.', 'Veniam labore et magnam labore qui quis quae enim. Perspiciatis nihil laudantium magni minima. Voluptas dolores voluptatem corporis id dolor nisi eaque. Voluptates architecto dolore est velit.', 7.00, 8, 1, 1, '2023-09-04 19:37:06', '2023-09-04 19:37:06'),
(119, 'Laudantium eos voluptatibus magni.', 'Sint commodi aperiam quidem vel voluptate. Consequatur molestias quod repellat ipsa quisquam et. Laborum aut repellendus sequi. Est hic qui ea cupiditate saepe quod. Unde aut provident sit et.', 5.00, 0, 1, 1, '2023-09-04 19:37:06', '2023-09-04 19:37:06'),
(120, 'Ut sequi fugiat vel.', 'Eum eos voluptas consectetur. Nostrum ipsam maxime eum eum. Ipsum reprehenderit et distinctio quos non ducimus. Aperiam tenetur ea quam magni. Ipsa necessitatibus odio et excepturi nostrum.', 1.00, 8, 1, 1, '2023-09-04 19:37:06', '2023-09-04 19:37:06'),
(121, 'Sed nostrum earum qui vero itaque quia.', 'Harum sit perspiciatis vel autem numquam. Fugit dicta dolore qui. Ea voluptatem iusto libero in. Cumque sunt omnis quisquam quaerat error est architecto.', 1.00, 3, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(122, 'Optio mollitia qui quia dolorem quam.', 'Beatae distinctio quidem et. Quaerat voluptatem ut rem vel nihil aut debitis. Vero vel earum ullam eveniet. Quam expedita nihil id illo. Eos non et architecto veritatis amet quia.', 2.00, 8, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(123, 'Dolorem omnis laudantium aut et ullam excepturi.', 'Vel sit et perferendis reiciendis voluptatem iusto. Assumenda ratione voluptatem et molestiae molestiae debitis vel. Minima et quam saepe id voluptas deleniti autem. Ratione itaque sunt quae molestias corporis.', 6.00, 0, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(124, 'Sapiente consequuntur iusto ea quo illum.', 'Quis inventore quia animi corrupti nobis nihil. Est voluptas in perferendis vel earum eum voluptatem. Maiores blanditiis est explicabo qui. Maxime debitis enim provident ut. Distinctio fuga ducimus ea dicta nostrum.', 1.00, 2, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(125, 'Minima ratione voluptas totam sit iusto.', 'In consequatur natus repellendus. Dolorum vitae occaecati corrupti et. Dolore cumque enim non pariatur aliquam facere. Similique et et numquam repudiandae illum unde. Maxime ut minima sapiente eum libero sunt.', 6.00, 9, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(126, 'Quo ut sequi labore optio incidunt blanditiis.', 'Laborum et molestiae qui numquam. Voluptas et et saepe ducimus. Aut et dolores totam amet quis architecto necessitatibus.', 9.00, 2, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(127, 'Dignissimos rerum vel voluptatem.', 'Numquam odit fugit molestiae illum consectetur est consequatur. Sed iusto inventore dolorem facere eligendi dolores qui. Ut laudantium quod rerum nostrum.', 8.00, 9, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(128, 'Molestiae modi eligendi cum perferendis.', 'Velit sunt nihil natus cumque. Sint incidunt minus numquam voluptatem assumenda. Nulla illum voluptatem ipsa itaque perferendis.', 4.00, 3, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(129, 'Quaerat reprehenderit reprehenderit possimus est voluptate sit.', 'Autem minima labore voluptatem sunt excepturi nobis maiores. Voluptatem quo delectus laboriosam dicta. Quibusdam cupiditate similique quisquam expedita quo consequatur. Vero aliquid unde quam ea earum cumque saepe tenetur. In aut ipsa vitae expedita.', 3.00, 9, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(130, 'Cupiditate est dolores atque expedita sit iusto.', 'Qui aut magnam rerum cumque eos animi corrupti. Perspiciatis ut quis iure aut.', 1.00, 9, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(131, 'Quam deleniti atque porro ea dicta et magnam.', 'Est quaerat incidunt ratione consequuntur quis magni. Nobis ut placeat ut ut autem dolore rem quas. Natus rerum accusantium alias nihil reprehenderit. Velit non aut eaque quia. Aut aperiam consequatur et inventore.', 2.00, 8, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(132, 'Qui tempora consequatur voluptatibus debitis neque numquam cupiditate.', 'Deserunt minima cumque id. Culpa magni ipsum officiis veritatis aut. Neque temporibus debitis ipsum omnis. Consectetur et porro sed voluptatem.', 8.00, 3, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(133, 'Quasi excepturi consequuntur fuga eius voluptas quas ea voluptas.', 'Sunt nesciunt exercitationem molestias eius. Voluptate quaerat perferendis et. Iure nemo maiores est laudantium aliquam.', 0.00, 0, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(134, 'Vitae totam ea et fugiat distinctio.', 'Exercitationem exercitationem quos asperiores voluptatem enim. Quis magni consequuntur neque voluptatem atque et nesciunt. Voluptatem nesciunt autem iusto eius corporis qui et odio.', 5.00, 7, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(135, 'Molestiae hic aut atque repellendus odit commodi nihil.', 'Expedita fuga ut cupiditate hic delectus dolorem. Reprehenderit aut minima labore fugiat. Aut ea sed eligendi officiis. Tenetur facere delectus ut in et modi.', 2.00, 0, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(136, 'Aut doloremque suscipit et officiis eveniet ut.', 'Omnis qui magni nemo totam possimus quo sit. Itaque et id ducimus. Cupiditate voluptatum enim qui placeat id perferendis quis. Eos illo sit eligendi qui.', 2.00, 7, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(137, 'Qui eveniet qui aspernatur facere delectus.', 'Quo quo sint hic deleniti et architecto perferendis dicta. Quibusdam distinctio beatae est cumque.', 8.00, 9, 5, 2, '2023-09-04 19:37:36', '2023-09-04 19:37:36'),
(138, 'Qui ex dolorem unde saepe.', 'Optio placeat repellendus ut sit blanditiis repellat quo dolor. Aut dolores sapiente quidem non quae dolor commodi porro. Nihil laudantium dolorem quis ab rerum.', 2.00, 3, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(139, 'Exercitationem dolorum commodi molestias provident.', 'Cum quod quis assumenda rerum voluptatum. Dicta modi omnis accusamus tempore cupiditate vitae.', 8.00, 5, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(140, 'Praesentium voluptatum sint atque repellendus non.', 'Rerum quis amet necessitatibus voluptate suscipit fuga et. Quidem et odio id temporibus molestiae. Voluptatem omnis nemo natus est.', 5.00, 2, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(141, 'Facere distinctio perferendis possimus reiciendis ducimus enim autem vel.', 'Quasi qui ut nisi repellat eos quis. Est quaerat omnis maxime impedit sit sunt. Veritatis atque suscipit totam sint eum ipsum odit dolorem.', 0.00, 1, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(142, 'Quis architecto dolor deserunt alias.', 'Blanditiis earum dolorem voluptatibus atque dolorem ipsum cum. Amet ducimus quod ut vero nihil illo fugit. Aut explicabo ipsum aliquam. Ipsam velit quas illo nulla hic.', 5.00, 3, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(143, 'Dolores neque culpa animi quia voluptatibus.', 'Dolor fugit tempora enim cum voluptatum praesentium. Et laborum molestiae ut libero ipsa saepe distinctio.', 9.00, 9, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(144, 'Itaque eum odit quo modi dolor occaecati.', 'Repellat voluptatem enim qui. Enim libero facilis architecto deleniti. Sed fuga et dolorum dolore doloremque.', 6.00, 1, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(145, 'Eius distinctio aut commodi rerum libero.', 'Voluptatem voluptate quas dolores quam eius. Quis exercitationem velit suscipit quidem. Fugit odio velit qui vel.', 4.00, 3, 5, 2, '2023-09-04 19:37:37', '2023-09-04 19:37:37'),
(146, 'Est dolorem doloribus id incidunt ratione voluptatem ea ratione.', 'Ea dolor eum ducimus qui dolorem dolore. Repellendus adipisci voluptatem non eum et ducimus. Beatae odit modi id commodi magnam et deleniti qui. Voluptatem est cumque possimus at dolorem minima.', 7.00, 7, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(147, 'Doloremque hic et aliquid quaerat.', 'Et ab harum enim autem. Sit blanditiis quidem atque et voluptatem. Tempore cum officia fuga facilis.', 9.00, 8, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(148, 'Assumenda et vel aut provident ad ut alias nemo.', 'Fuga perferendis omnis rem. Quo qui doloribus nesciunt aperiam quae et. Quis unde ut molestiae quia cupiditate.', 1.00, 0, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(149, 'Tenetur aut quis ut ut est.', 'Est qui exercitationem omnis rerum porro molestias. Eum illo molestias dolorum non. Molestiae dolorem ut autem veniam.', 2.00, 2, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(150, 'Molestiae asperiores voluptas tempora dolores necessitatibus voluptates.', 'Dolorem consequuntur dolorum neque nulla. Perspiciatis eos velit delectus. Natus voluptatum provident in.', 2.00, 7, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(151, 'Sit aut dolor illo aut aut fugiat.', 'Et aliquam qui itaque cumque culpa. Voluptates dicta molestiae nostrum alias. Doloremque eos in odit aut. Excepturi autem enim nihil est incidunt.', 0.00, 0, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(152, 'Illo voluptatibus in dolor officiis sequi ipsa.', 'Ea quam et molestias quod consectetur. Saepe qui eveniet qui ab blanditiis iste. Quae inventore repellat aut aliquid assumenda. Blanditiis voluptatem eos repudiandae debitis vel modi qui.', 2.00, 2, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(153, 'Non eius fugiat ipsam reiciendis nulla reprehenderit voluptatem.', 'Iure quia et rerum nesciunt in aut amet. Labore et repellat aut ea. Sit beatae iste quia ut quasi amet. Dolores ut temporibus et. Distinctio fugit ab velit amet.', 1.00, 1, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(154, 'Molestiae porro sit voluptatem suscipit nostrum vel.', 'Aperiam labore sapiente quos ipsam error vero pariatur deserunt. Voluptatibus vel facilis doloremque. Perspiciatis sapiente sit reprehenderit inventore maiores quidem quis.', 8.00, 5, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(155, 'Voluptate eius eveniet velit sit.', 'Sapiente voluptates ducimus quibusdam qui voluptatem. Aliquam inventore sapiente eligendi occaecati repellendus et. Libero non sed sed error vel quia ut.', 3.00, 3, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(156, 'Quae cupiditate occaecati voluptas at quia fuga.', 'Recusandae rerum accusantium consectetur incidunt vero quo et eaque. Soluta consequuntur autem temporibus unde animi in ipsa. Voluptatibus ullam odit id sed dolores perferendis officia.', 3.00, 3, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(157, 'Autem sed sit voluptatum commodi id voluptas.', 'Tempora reiciendis vel adipisci fuga. Rerum ab dolor ad qui. Qui corporis commodi voluptates nihil. Ut ducimus vitae a dolores.', 0.00, 2, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(158, 'Tempora dolorem consequatur ut non maxime vel aut.', 'Beatae consequuntur dolorem blanditiis repudiandae dolorem ipsum reiciendis eum. Deleniti omnis debitis velit officia ipsa nostrum voluptatem. Unde fugiat ipsum et architecto consequatur animi est. Et et non explicabo accusamus laudantium assumenda ipsam ipsam. Quasi fugiat dicta quos corrupti.', 5.00, 4, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(159, 'Dolore incidunt consequuntur rem.', 'Dolorum ea veritatis quo aspernatur. Et recusandae est ex id cupiditate. Corrupti enim incidunt iste dolor assumenda. Eligendi quo quia omnis veniam a.', 3.00, 9, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(160, 'Est recusandae error ut nisi rerum facere magni distinctio.', 'Non amet debitis ut modi voluptatum neque dicta. Non aspernatur libero dolore explicabo consequatur. Recusandae sed accusantium neque cupiditate aliquam. Veritatis distinctio labore voluptate nihil.', 4.00, 7, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(161, 'Corrupti animi qui velit.', 'Esse quod explicabo qui placeat dolor. Nam a odit rerum nostrum sunt ut vel. Autem qui pariatur veritatis in corrupti est mollitia.', 4.00, 5, 4, 2, '2023-09-04 19:37:42', '2023-09-04 19:37:42'),
(162, 'Hic eos qui numquam alias et sed explicabo velit.', 'Accusantium molestiae ut minima nisi harum voluptate. Molestiae qui veritatis temporibus aut atque quos nam.', 3.00, 1, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(163, 'Sed corrupti dolores sit qui et.', 'Enim vel suscipit qui est iure reiciendis. In et consequatur sed. Voluptas facere et fuga vitae ut.', 3.00, 9, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(164, 'Nemo atque inventore illo quia a.', 'Et illo non est sed minima maiores. Neque aut hic voluptas est. Numquam commodi aut qui est. Eos id in exercitationem ut error.', 9.00, 8, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(165, 'Repudiandae maxime itaque ipsum.', 'Rerum excepturi cum iste. Aspernatur nisi blanditiis nemo suscipit repudiandae. Consequatur mollitia quia ratione nobis. Asperiores molestiae recusandae culpa minus sunt accusamus. Repellendus distinctio laboriosam aut rerum.', 3.00, 1, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(166, 'Velit aut molestiae quas quis.', 'Libero consequatur aut ut aut id dolores. Nihil dicta officiis neque officia vero. Pariatur voluptas dicta qui rem sed nemo dolore ut. Facere quo deleniti quibusdam aperiam deserunt sit.', 2.00, 0, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(167, 'Blanditiis aliquam voluptatem soluta qui.', 'Voluptatum aut similique praesentium est reiciendis vel. Soluta omnis quos repellat omnis voluptas. Eligendi illo qui ipsum ut repellat. Quisquam aliquid aut distinctio id ducimus sit id.', 0.00, 4, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(168, 'Harum ullam sed eveniet libero velit est.', 'Voluptatem et natus beatae similique itaque voluptates. Quas commodi assumenda aspernatur nulla repellat velit omnis et. Occaecati cupiditate ut qui est quia ut distinctio dolores.', 0.00, 5, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(169, 'Dolorem architecto consectetur cumque.', 'Molestias iure omnis ex omnis voluptatem excepturi iste. Aliquid voluptas ut ut itaque repellat veniam. Accusamus soluta cum ullam. Voluptate qui nam quia labore. Quis dolores cupiditate quas magnam alias.', 6.00, 5, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(170, 'Magni cumque error dolor nam quas modi dolorem voluptatem.', 'Aut ea amet accusantium possimus nulla ducimus cupiditate quo. Et alias repudiandae vero libero a rerum.', 5.00, 7, 4, 2, '2023-09-04 19:37:43', '2023-09-04 19:37:43'),
(171, 'Vero est molestiae quisquam magni beatae ab.', 'Vero possimus error illo facere ipsum quibusdam est numquam. Quae nam nesciunt odio voluptas. Tempore non asperiores aliquid mollitia. Eligendi autem sit cumque sapiente minus dolores aut est.', 3.00, 8, 3, 2, '2023-09-04 19:37:45', '2023-09-04 19:37:45'),
(172, 'Consequatur nam nemo exercitationem mollitia harum tenetur.', 'Consequatur commodi qui eos blanditiis dolores. Eum consequatur eius facilis expedita. Perferendis ut accusamus reprehenderit ut. Officia quia voluptatem vel et. Quasi minima molestiae dicta vitae.', 2.00, 0, 3, 2, '2023-09-04 19:37:45', '2023-09-04 19:37:45'),
(173, 'Culpa ducimus ex cupiditate aut optio quia.', 'Qui reiciendis quasi quam molestiae. Et et ut soluta voluptatem qui pariatur. Voluptatibus accusamus adipisci rem quis autem quae libero. Numquam inventore est est.', 0.00, 2, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(174, 'Debitis aut labore eos enim sed odit.', 'Qui dignissimos iusto pariatur qui dolor quis tempore odio. Deleniti fuga cupiditate quo minus nam autem sit. Iure omnis modi quasi repellat sed voluptatem rerum.', 1.00, 3, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(175, 'Saepe dignissimos odit eos et tempore.', 'Harum totam iusto totam perferendis sit. Enim dolorem at ut dignissimos porro sequi. Vel reiciendis suscipit fugiat nostrum.', 6.00, 5, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(176, 'Totam sit quos veritatis numquam sunt tempora.', 'Ducimus similique quis quas saepe sequi odio veniam. Rerum excepturi mollitia sapiente blanditiis fugit est officia.', 7.00, 2, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(177, 'Nostrum inventore ut aspernatur adipisci id autem.', 'Accusantium occaecati explicabo impedit eum. Aliquid deserunt atque nam blanditiis occaecati. Qui sed rem cumque laudantium sint a facilis. Id et ducimus nihil. Exercitationem expedita et quaerat nobis dicta cupiditate.', 0.00, 4, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(178, 'Soluta sequi voluptatem porro at culpa.', 'Alias ipsam fuga quam ex non. Soluta nihil voluptas minima consequatur velit inventore omnis perferendis. Sint molestiae aut molestiae vel et dignissimos sed possimus. Voluptates omnis molestias doloremque esse minus.', 1.00, 1, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(179, 'Doloremque mollitia ipsa ea ratione.', 'Error qui totam ut deserunt modi. Eligendi est similique et beatae. Vel itaque et omnis atque quo. Quas laudantium qui eligendi et.', 9.00, 5, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(180, 'Quam consequatur sint vitae nobis cupiditate optio consequatur asperiores.', 'Esse laudantium eligendi recusandae nemo. Et quis suscipit eos amet ut explicabo perspiciatis. Est eius non reiciendis et commodi enim hic.', 2.00, 5, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(181, 'Quo et natus laudantium sapiente.', 'Ut cum doloribus atque. Perferendis error dolorum temporibus ab voluptas. Beatae consequatur iusto non voluptatem dolor ullam cupiditate dolorum.', 5.00, 5, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(182, 'Expedita voluptatum ut illum consequatur optio.', 'Voluptatem provident omnis a quibusdam sed aut enim maxime. Est quidem aut doloribus hic qui. Occaecati veritatis facere dolorum quasi. Repellat natus incidunt minima doloremque error rem cumque.', 2.00, 9, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46');
INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_price`, `product_discount`, `product_rating`, `product_category`, `created_at`, `updated_at`) VALUES
(183, 'Qui optio ut aperiam vero ut.', 'Qui laudantium voluptatum enim eos. Ut numquam tempore est quam adipisci repellendus rem. Sapiente est iusto unde quis.', 4.00, 9, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(184, 'Occaecati voluptatem odit vel est qui officia.', 'Inventore dolorem nihil quia laborum. Accusantium ratione est aut qui. Sed sunt a sed libero aliquam ut dolore.', 9.00, 8, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(185, 'Itaque molestiae eum quos repellat.', 'Quam quae qui iusto vero deserunt libero voluptatem id. Fugit qui fugit modi quod. Et deserunt aliquam sit tempora optio. Sunt corrupti ut magnam id soluta nisi esse odio.', 6.00, 2, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(186, 'Quo perspiciatis soluta adipisci ea id.', 'Aut maiores sequi occaecati suscipit quo labore. Id neque aspernatur et. Aut corporis deserunt ratione perferendis sed deserunt. Impedit voluptatum similique rerum exercitationem rerum repellendus repellendus. Enim in commodi quia voluptatem sunt nobis esse tempore.', 1.00, 5, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(187, 'Illum perferendis ipsum nihil facere ea.', 'Enim dolorum recusandae consequuntur non voluptate qui similique. Enim quisquam sint laborum ut dolore ut ut. Vel maxime dolores consequatur id dolor quis non et.', 8.00, 0, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(188, 'Consequatur id sint eos inventore et expedita nisi.', 'Sunt natus aut at eaque deserunt. Aspernatur voluptate aut modi atque. Molestiae laudantium est et.', 7.00, 6, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(189, 'Distinctio hic totam aspernatur et autem hic distinctio.', 'Odit tempora est hic possimus saepe eum dolores. Sit explicabo saepe ducimus et quod. Labore quia in maxime ut quod.', 0.00, 1, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(190, 'Est qui non fuga velit.', 'Porro omnis doloremque maxime at. Explicabo vitae illum voluptate et maxime ex quasi. Iusto dolor ex voluptas nulla dolores odit. Inventore quae aperiam accusantium exercitationem. Omnis sit inventore dolor molestias dicta alias molestiae omnis.', 5.00, 4, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(191, 'Cum et mollitia rem sit est quis.', 'Aut eum error impedit architecto. Minima ut quas repellat. Sed ut vitae quam qui. Ipsa non ipsa fugiat iusto eum.', 7.00, 3, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(192, 'Ipsa cumque nobis sed et.', 'Mollitia est recusandae quasi nisi qui. Sint sit quos laudantium quas quo. Facere fugit ut molestiae.', 1.00, 9, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(193, 'Non saepe quibusdam harum et tenetur.', 'Et quia consequatur magnam quod. Suscipit eaque vel est magni aut qui dolorum. Aliquam aspernatur ratione et ut ex enim.', 2.00, 0, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(194, 'Qui magnam natus voluptatem numquam similique iure.', 'Dolore est consectetur quis accusantium esse. Dolores aliquid quibusdam aliquam doloribus. Eum doloribus molestiae commodi dolore perferendis temporibus molestiae.', 9.00, 2, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(195, 'Nobis ut harum nihil natus.', 'Atque ut autem molestiae dolorum eligendi est qui. Est ad velit exercitationem rem. Quod blanditiis ea consequuntur labore.', 1.00, 6, 3, 2, '2023-09-04 19:37:46', '2023-09-04 19:37:46'),
(196, 'Adipisci saepe laboriosam nulla a corrupti aut reiciendis.', 'Ipsum eaque saepe necessitatibus et. Autem in hic vitae suscipit. Error ut et fuga est rerum sunt. Expedita tenetur reiciendis tempore unde.', 9.00, 6, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(197, 'Rerum qui praesentium nesciunt molestias est et.', 'Omnis labore neque repellendus ipsam et. Quia rerum velit illum quasi.', 5.00, 7, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(198, 'Impedit eum quae in sit.', 'Porro maiores est distinctio placeat nam blanditiis est corrupti. A rerum debitis rem. Ea eos omnis qui.', 5.00, 3, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(199, 'Aut sint rerum odit.', 'Iste maiores explicabo molestiae dolores tenetur facilis est. Quia aut at et natus. Nam et repellendus quos tempora modi nobis.', 1.00, 2, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(200, 'Esse dicta est laboriosam perferendis totam.', 'Delectus sunt mollitia deleniti et quidem amet. Veritatis qui non ipsum laborum rerum laudantium id. Itaque quos suscipit facilis non. Animi iste quia natus repellendus ad dolor.', 9.00, 0, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(201, 'Rerum eaque quas eos mollitia.', 'Ut totam nobis et eos accusamus labore. Nesciunt enim illum reprehenderit incidunt cum voluptate nisi. Molestiae saepe quas et quia repellat sed.', 2.00, 4, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(202, 'Mollitia iste officia et.', 'Rem ad necessitatibus temporibus itaque enim maiores sint. Quo deleniti et exercitationem mollitia sed. Est et atque nesciunt ut deserunt architecto deleniti cupiditate. Sed impedit vel consequatur non qui doloribus.', 3.00, 0, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(203, 'Est voluptatum eius reprehenderit reprehenderit.', 'Ipsa consequatur iste tenetur ab. Molestias accusantium qui eos dignissimos quisquam. Nihil necessitatibus et veniam nihil ea atque. Est numquam modi et quas.', 6.00, 9, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(204, 'Accusantium quisquam neque aliquam accusantium.', 'Molestiae tenetur in soluta qui. Esse ipsa totam saepe sit et autem dolorum. Quos veniam pariatur sed et quia. Officiis sit quasi omnis tenetur cum animi deleniti.', 4.00, 3, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(205, 'Molestiae dolorum minus mollitia voluptas qui debitis quo distinctio.', 'Eum sed qui suscipit atque sunt omnis accusantium dolor. Possimus aliquid odit cumque placeat omnis. Nobis ut autem ea exercitationem non. Unde natus consequatur magni asperiores molestias expedita officiis sed.', 3.00, 7, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(206, 'Officia et rem odio et eos soluta aspernatur.', 'Reiciendis atque non autem voluptates. Dignissimos et delectus repellendus non. Fugit cum amet porro beatae.', 5.00, 5, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(207, 'Fugit ut dolores aut molestiae hic sequi dignissimos.', 'Enim qui aperiam quisquam magni voluptas dicta. Nisi quisquam distinctio quaerat modi. Ab rerum nobis in ut.', 3.00, 9, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(208, 'Ad perspiciatis nemo ratione delectus et.', 'Voluptatem beatae velit pariatur hic quam quidem saepe. Ipsum praesentium rerum ipsa unde quo. Recusandae tenetur aut animi dolores. Rerum illum fuga praesentium suscipit at.', 7.00, 6, 5, 3, '2023-09-04 19:37:54', '2023-09-04 19:37:54'),
(209, 'Consequatur ipsa dolore aut natus qui repellendus.', 'Eum distinctio commodi voluptates consequuntur. Optio maiores nemo enim necessitatibus occaecati. Qui sapiente laboriosam magnam neque.', 8.00, 2, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(210, 'Non rerum qui nisi quia assumenda error.', 'Corrupti quibusdam veritatis aut. Ipsum saepe placeat ut blanditiis. Incidunt quod aut tempore nobis. Eligendi excepturi eius molestiae suscipit.', 6.00, 9, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(211, 'Excepturi consequatur et ut.', 'Tempore sapiente accusantium et numquam nobis occaecati aliquam. Esse et consequatur repudiandae tenetur quo voluptatem. Minima rerum aut non consequatur sit quia soluta provident.', 7.00, 6, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(212, 'Voluptatem qui repudiandae rerum facere at asperiores quis.', 'Aut enim modi exercitationem et. Consequatur velit vel ad sed nam architecto.', 0.00, 7, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(213, 'Eligendi velit vel cupiditate consectetur repellat.', 'Voluptatem temporibus accusantium fugiat numquam eum. Autem est et sunt culpa.', 1.00, 2, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(214, 'Autem voluptas perspiciatis maiores enim.', 'Quis et nisi optio. Qui nam aut dolor eos. Sit dignissimos sunt perferendis reprehenderit. Eos aut ducimus voluptatem placeat earum.', 6.00, 7, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(215, 'Omnis qui et aut beatae eum ea ipsam omnis.', 'Occaecati fugiat aut laborum similique. Quo dolore qui aut soluta velit ut pariatur. Dolores quisquam omnis laboriosam autem non et.', 5.00, 5, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(216, 'Nihil voluptatem enim et dolores eius.', 'Omnis ut impedit autem vel quis nemo nulla. Repellat consequatur facilis esse architecto praesentium quia est aut. Minus eligendi dolores eos dolorum.', 1.00, 4, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(217, 'Voluptatem ut quia inventore quas dolorum eos.', 'Rem officiis dolorem iure corrupti nesciunt molestias quaerat. Sint voluptatem odio excepturi. Necessitatibus optio officiis aut.', 4.00, 0, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(218, 'Error nobis ad ipsum et qui aut repellendus.', 'Et perferendis a odio porro. Voluptate sint consequatur sunt. Eaque sed voluptatem fuga id sed necessitatibus. Vitae asperiores eveniet et quae consequatur.', 1.00, 6, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(219, 'Qui occaecati quidem ut officia temporibus quisquam tempora corporis.', 'Et dolorem voluptatibus dolorem vel. Nihil velit eum ut temporibus libero provident ex aspernatur. Quae explicabo ex ut dicta aut eos. Sit cum fugit culpa natus fugiat voluptas.', 0.00, 5, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(220, 'Eius consequuntur animi dolorem.', 'Et esse aut et quae laboriosam. Adipisci eum voluptatem incidunt dolor dolores quae. Fugit voluptatem laborum porro voluptatem vel iste possimus.', 6.00, 3, 5, 3, '2023-09-04 19:37:55', '2023-09-04 19:37:55'),
(221, 'Veritatis eius sapiente veniam facilis est et praesentium occaecati.', 'Eaque quibusdam et accusantium. Ipsum et iure nulla id dolores distinctio aperiam. Voluptate sint eum quasi totam est eaque quia quia. Pariatur nihil sapiente aut totam.', 9.00, 6, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(222, 'Quas sapiente qui corporis sunt quia nihil.', 'Temporibus qui voluptates sed ad mollitia velit magni. Praesentium ipsum iste cumque est. Illo temporibus harum illo rem.', 4.00, 4, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(223, 'Maxime quam impedit numquam mollitia labore in.', 'Eaque omnis ut dolorum ex temporibus. Quas autem laborum nam iure itaque dolor odio. Deserunt quia aliquid et nam expedita aspernatur alias rerum. Inventore ad praesentium voluptatum quia itaque sed.', 5.00, 0, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(224, 'Beatae accusamus quas laudantium est qui.', 'Magnam rerum ut quia est ipsa et unde. Ipsum dolorum ipsa eos molestiae. Architecto distinctio et odio sunt vel. Repellat tenetur doloremque molestiae est quia qui aut. Qui voluptatem corporis et id dolor eos neque.', 3.00, 7, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(225, 'Rerum commodi minima reprehenderit fuga iusto est expedita non.', 'Quis corrupti impedit facilis minima voluptas reiciendis. Quae laboriosam et possimus delectus modi. Et et reiciendis aut voluptatem neque placeat quas in.', 1.00, 6, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(226, 'Corporis aut ex vel quod dolorum.', 'Sunt in facilis quia. Quisquam occaecati sunt odio illum voluptatem in. Inventore sint qui qui.', 5.00, 8, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(227, 'Debitis veritatis quia sit dignissimos asperiores.', 'Consequatur iure earum dolorem nulla. Facere ea non rerum nobis. Dolore deleniti repellat culpa tenetur ut.', 0.00, 5, 3, 3, '2023-09-04 19:37:57', '2023-09-04 19:37:57'),
(228, 'Doloribus itaque necessitatibus minus autem.', 'Explicabo adipisci at consequatur veniam. Culpa et et provident. Voluptatem soluta optio occaecati incidunt. Inventore facilis voluptatem expedita ipsa necessitatibus.', 4.00, 4, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(229, 'Expedita voluptatem accusamus qui voluptatem et sed.', 'Amet eum molestiae aut reiciendis dolorum quasi qui placeat. Dicta maxime quia consectetur nam illo nobis rem. Soluta non saepe quasi ducimus vel. Est consequuntur sunt ab eos illum cupiditate.', 9.00, 3, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(230, 'Et perferendis saepe sit illo odio iste.', 'Deserunt eos repellat explicabo. Sunt iste laboriosam sed maxime. Nostrum id blanditiis labore placeat accusantium quidem.', 7.00, 2, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(231, 'Mollitia sint placeat odio in atque.', 'Voluptates qui aut voluptas tempore dolorem rem amet architecto. Ipsum repellat consequatur fugit nulla maxime neque. Quibusdam illo aut doloribus quod culpa qui soluta.', 0.00, 8, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(232, 'Fugit id quia amet laborum.', 'Vero ut quis enim nesciunt non quo. Eos molestiae fugit omnis impedit similique qui recusandae. Aut vitae voluptas voluptatibus incidunt aliquid vel eos. Pariatur et vero temporibus repellat quo sapiente placeat. Qui consequatur laboriosam sunt natus qui voluptatibus consequuntur laborum.', 9.00, 8, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(233, 'Mollitia enim eligendi quis eos.', 'Temporibus repudiandae nesciunt maiores voluptatibus ea. Quam iste temporibus quas eaque id voluptates nulla. Necessitatibus consequatur facilis deleniti natus quibusdam dignissimos. Temporibus aut quod dolorem alias error ut saepe sint.', 4.00, 5, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(234, 'Nesciunt dolor cumque illo amet aut.', 'Labore et quaerat et minima quia est corrupti et. Et est illum natus reiciendis. Sint est et consequatur sequi molestiae optio.', 2.00, 6, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(235, 'Nihil alias enim quo consectetur.', 'Et ut animi vitae minus esse dolor. Aut sit sit in cumque enim delectus. Dolores non neque qui nulla. Ea eveniet qui hic libero amet quo eveniet.', 0.00, 6, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(236, 'Labore eligendi nam aut nesciunt praesentium quam pariatur dolor.', 'Reiciendis unde eius enim velit molestiae voluptatibus sapiente quis. Iste ratione tempore tempora minus. Aut fugit et autem optio. Veniam provident veniam aliquid esse et.', 8.00, 8, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(237, 'Aut odio qui similique voluptate omnis molestiae soluta.', 'Rerum corporis accusamus qui reprehenderit inventore aut. Provident cum autem sed quis dolorum.', 6.00, 7, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(238, 'Fugiat facere ea pariatur culpa nihil eos et.', 'Aliquam atque nostrum repudiandae fugit ullam. Voluptatem odio animi facilis reprehenderit iste maxime saepe. Eum autem temporibus ea expedita facilis ut. Non qui provident quaerat est quis et. Consequuntur quia eaque vero ipsam quis.', 3.00, 3, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(239, 'Placeat vero odit aut aut odit.', 'Omnis nulla qui impedit porro dolor ut. Distinctio doloribus nemo repellendus praesentium. Et sit quasi qui mollitia. Et alias libero dolorem deserunt quia deleniti.', 8.00, 3, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(240, 'Non aliquid ex assumenda optio.', 'Est occaecati neque sit nihil. Commodi et exercitationem ut. Rem possimus in ducimus cupiditate consequuntur labore dolore.', 3.00, 3, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(241, 'Officiis velit eos quos maiores iure illum.', 'Et voluptatem facilis magnam et. Velit est ipsam totam ut. Id numquam saepe esse qui. Et voluptas voluptatibus laborum quasi facilis porro animi.', 3.00, 5, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(242, 'Quis aut ipsum sed ut.', 'Molestiae dicta assumenda et non ut. Repudiandae eum voluptate voluptas aut deserunt consequatur. Corporis non quibusdam repudiandae eius fugiat aut.', 0.00, 2, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(243, 'Omnis eum est consequatur repellat.', 'Temporibus ducimus consequatur alias nemo sit aut eveniet. Asperiores aut hic voluptate dolores. Dignissimos quis quidem nesciunt molestias architecto ut a.', 1.00, 0, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(244, 'Sint velit explicabo qui sed sunt laboriosam.', 'Consequatur autem animi distinctio deserunt veritatis. Eos et earum rerum maiores animi quis magnam. Perspiciatis dolorem enim molestiae. Et et fuga eos molestiae nihil ducimus ratione. Aut a nihil eaque quasi explicabo.', 6.00, 6, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(245, 'Magni ea reiciendis et non dolor.', 'Blanditiis quia enim natus pariatur aliquam. Laudantium sed et magnam maiores amet consequuntur soluta dolor. Quasi sed nihil et ea maxime. Laudantium illo alias modi. Et exercitationem amet ut.', 5.00, 9, 3, 3, '2023-09-04 19:37:58', '2023-09-04 19:37:58'),
(246, 'Itaque amet eaque ab impedit quos omnis.', 'Quod voluptatem aperiam pariatur et et quaerat est eaque. Quisquam alias iste ut omnis hic quam rerum. Soluta et qui exercitationem iure ea doloribus nemo.', 8.00, 7, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(247, 'Amet voluptatem modi minus voluptatem pariatur.', 'Sit illum optio iste sunt. Fuga voluptatem rerum quisquam repellendus minus consequatur doloremque. Sunt aut iste modi earum. Incidunt est dolore eius sequi.', 5.00, 7, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(248, 'Perspiciatis libero quibusdam hic minus inventore.', 'Nulla ut rerum quos voluptatem. Eum blanditiis ducimus earum sunt in doloremque. Molestiae perferendis aut aspernatur at ab optio. Necessitatibus sit dolore tempore distinctio et nulla. Aperiam excepturi at enim autem debitis voluptatibus ut.', 1.00, 4, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(249, 'Quaerat aut dolorem voluptatum ab.', 'Quidem dignissimos fugit ut aspernatur eaque. Reiciendis est officia natus quo. Minus occaecati hic culpa.', 6.00, 3, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(250, 'Nulla commodi aut esse architecto.', 'Sed eius omnis cupiditate voluptas ipsum necessitatibus. Impedit laborum asperiores ipsum beatae assumenda et. Molestiae labore corrupti autem natus et repellat.', 4.00, 8, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(251, 'Ut recusandae officiis et quidem voluptas.', 'Voluptas rerum qui doloremque dignissimos aut. Excepturi voluptas necessitatibus iste non vero.', 5.00, 5, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(252, 'Repellendus eligendi officia voluptate fuga consequatur sunt.', 'Blanditiis et sint rerum vitae. Recusandae nobis laudantium qui provident ut qui. Recusandae iusto quidem cumque dolores autem.', 3.00, 9, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(253, 'Amet cum tempore sit dolores.', 'Atque omnis qui ratione distinctio. Quibusdam placeat rerum delectus possimus ipsam quis laboriosam. Accusantium odit excepturi pariatur quia cumque. Voluptate pariatur dolor blanditiis aut error molestias at saepe.', 7.00, 9, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(254, 'Velit eveniet vitae non dolor non velit eveniet.', 'Quo est magni perspiciatis. Accusamus at aut vitae fugiat. Accusamus quia quis minus aspernatur impedit. Qui nostrum autem optio. Accusantium a nesciunt consectetur et mollitia assumenda.', 4.00, 7, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(255, 'Magnam aut distinctio tempore autem autem similique.', 'Eaque veritatis aperiam assumenda et nobis voluptas quia. Vero est provident et et. Accusantium quaerat at dicta voluptas.', 9.00, 5, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(256, 'Voluptate exercitationem eum nisi delectus quia.', 'Accusamus aut repellat est rerum pariatur suscipit. Iure incidunt quia occaecati deleniti fugiat iusto est. Ut consequatur omnis voluptates deserunt inventore.', 1.00, 6, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(257, 'Omnis amet rerum incidunt qui tempore sint vitae.', 'Dolor qui id quo non quis. Incidunt dolor nihil nihil impedit dolorum voluptas. Pariatur labore aut perspiciatis alias deserunt dolores doloribus explicabo. Ipsam eius laborum dolorem velit. Qui aut eius vero voluptas placeat eveniet ad.', 9.00, 3, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(258, 'Aperiam harum veritatis commodi velit incidunt.', 'Voluptate aperiam doloribus nam qui maxime modi unde. Quisquam officia natus minima eum aspernatur. Ut et nemo qui ad officiis quaerat.', 8.00, 3, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(259, 'Porro dolorem et minus ea ab sit voluptatem.', 'Qui voluptatem voluptatem consequuntur beatae optio. Laborum assumenda dolorem ut porro praesentium maiores. Aut sapiente ipsam voluptatem consequatur fugit. At quo eos nam tenetur ratione enim. Cumque optio neque eum natus.', 4.00, 2, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(260, 'Atque deserunt sed autem aperiam.', 'Sequi libero atque necessitatibus. Dolorum nam odio deleniti consequatur odit. Fuga eligendi esse nostrum veniam asperiores quis fuga. Ut fuga voluptatem eum fuga eos architecto. Voluptates vel facere voluptate commodi.', 7.00, 2, 1, 3, '2023-09-04 19:38:01', '2023-09-04 19:38:01'),
(261, 'Repellat impedit fuga alias rerum minima perspiciatis.', 'Cupiditate incidunt voluptatem nobis autem aut eius harum. Sed dolorum similique consequatur nihil. Eum vel quasi tempora corrupti nam numquam rerum cumque. Quis tempora quia rerum qui sunt et nemo.', 6.00, 8, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(262, 'Pariatur harum sit velit nam eveniet.', 'Labore id cupiditate soluta tempora et. Voluptatum voluptatem est saepe sed et. Numquam quam repudiandae sequi veniam et voluptas sed eveniet. Tempore expedita non molestias aut dolorum.', 6.00, 8, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(263, 'Qui sit praesentium nobis et minima porro explicabo.', 'Eius dolore temporibus nihil sit voluptatibus earum. Eum id unde rem ut dicta. Qui totam soluta sunt quasi sint ex numquam.', 8.00, 2, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(264, 'Sunt nam iste dolorem.', 'Dolore et excepturi ullam accusamus dicta. Voluptatum quo fuga possimus. Aliquid labore et aspernatur ad minus unde. Id deleniti sunt ut quisquam facere nulla accusamus. Ipsam voluptas consequatur non.', 3.00, 5, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(265, 'Quidem ex qui at sint consectetur doloribus.', 'Sed non commodi ut qui voluptatum voluptas non. Recusandae ex sed corrupti accusamus nemo adipisci autem consequatur. Minus ea deleniti sequi laborum consequatur ad. Dignissimos dolorem omnis eaque distinctio asperiores. Cumque ipsum tenetur fugit quis voluptatum et quod.', 9.00, 2, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(266, 'Dolorem commodi totam veniam facere ipsa et consequuntur.', 'Repellat doloremque et error sint et. Repellat magni sit et atque. Officiis similique sit at voluptatem. Delectus sint blanditiis voluptates labore odio minus est. Facere itaque provident dignissimos perferendis et et.', 8.00, 8, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(267, 'Eveniet id quasi ipsam aut qui aut et ab.', 'Vitae ut corporis aut asperiores laborum ea. Deserunt fuga voluptates animi quis laborum. Ipsam numquam dolores aut labore molestiae distinctio et quis. Atque voluptatem consectetur vel.', 0.00, 1, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(268, 'Sit id sunt cupiditate modi fugit.', 'Id mollitia assumenda et. Sunt eos fuga aut. Omnis aut odio qui assumenda ea. Ut dolor ex culpa impedit explicabo praesentium iusto molestiae.', 3.00, 8, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(269, 'Unde nisi sunt eum aut sed eveniet.', 'Eum mollitia autem iure id molestiae quae. Velit corporis modi corrupti nostrum est deleniti magnam. Incidunt voluptatem et aspernatur eos accusamus ratione aut. Et et debitis qui rem occaecati nemo et.', 0.00, 4, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02'),
(270, 'Rem accusantium delectus a ut nihil ut porro.', 'Debitis consectetur quibusdam rerum aliquam itaque. Odio commodi nam aut dolor blanditiis. Ut ut nulla beatae eum blanditiis.', 3.00, 9, 1, 3, '2023-09-04 19:38:02', '2023-09-04 19:38:02');

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

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_name` varchar(255) NOT NULL,
  `status_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status_name`, `status_count`, `created_at`, `updated_at`) VALUES
(1, 'Packing', 0, NULL, NULL),
(2, 'In Transit', 0, NULL, NULL),
(3, 'Arrived', 0, NULL, NULL),
(4, 'Cancelled', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`) VALUES
(45, 'Rosario Bosco', 'customer', 'tpaucek@example.com', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4TbzTCwqWP', '2023-09-07 21:25:38', '2023-09-07 21:25:38', NULL),
(46, 'Mr. Arden Brakus', 'customer', 'qrempel@example.net', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'H7Sq7KFlcp', '2023-09-07 21:25:38', '2023-09-07 21:25:38', NULL),
(47, 'Germaine Hackett', 'customer', 'tiara.paucek@example.com', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ttfdl7YABy', '2023-09-07 21:25:38', '2023-09-07 21:25:38', NULL),
(48, 'Prof. Pierre Smith', 'customer', 'michale.mueller@example.net', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QhmZIwaJwb', '2023-09-07 21:25:38', '2023-09-07 21:25:38', NULL),
(49, 'Bradford Bayer', 'customer', 'candace69@example.org', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yIFjF35cCg', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(50, 'Jayne Ratke', 'customer', 'dfeeney@example.org', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eEBMQxnkBu', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(51, 'Miss Bettye Robel DVM', 'customer', 'oconnell.petra@example.org', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EB5JRLLRTK', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(52, 'Kimberly Kuhic', 'customer', 'harmon.wolf@example.com', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oizHh1zvFY', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(53, 'Dr. Ewell Dietrich', 'customer', 'oturner@example.net', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Jrel2KuvdJ', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(54, 'Dr. Christopher Predovic', 'customer', 'omuller@example.org', '2023-09-07 21:25:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rBOuI6aF1X', '2023-09-07 21:25:39', '2023-09-07 21:25:39', NULL),
(55, 'Renz D', 'customer', 'renz@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2023-09-07 21:39:58', '2023-09-07 21:39:58', NULL),
(56, 'mayyy', 'customer', 'may@gmail.com', NULL, '$2y$10$VGRjd.y6OLmN9pQ4K3mHW.vigiVzFgbYCEGOYP3BUkVwPjLuFEznm', NULL, '2023-09-12 23:22:20', '2023-09-12 23:22:20', NULL),
(57, 'mayyy', 'customer', 'test@gmail.com', NULL, '$2y$10$XcxDAd.8kseRrmolJie05O4O4QQC2aOC7EU6vic9YZOVAPP5qeL/e', NULL, '2023-09-12 23:27:07', '2023-09-12 23:27:07', NULL),
(58, 'mayyy', 'customer', 'mayyy@gmail.com', NULL, '$2y$10$8P4FwU.NNGZ1QjeCzQQp7.t7RkejgwNfy6X3zqnaY0WdmdskQhUFC', NULL, '2023-09-13 21:17:15', '2023-09-13 21:17:15', NULL),
(59, 'renz23', 'customer', 'renz2@gmail.com', NULL, '$2y$10$VgM6PYD1EK3vAzOePDggLea0PKDzZDTsDL0xa6.OC5Kk4OsvoKiSy', NULL, '2023-09-13 22:07:45', '2023-09-13 22:07:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_name` varchar(255) NOT NULL,
  `voucher_price_discount` int(11) NOT NULL DEFAULT 0,
  `voucher_shipping_discount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `couriers_courier_name_unique` (`courier_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_user_id_foreign` (`user_id`),
  ADD KEY `favourites_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order__products`
--
ALTER TABLE `order__products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_payment_name_unique` (`payment_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `statuses_status_name_unique` (`status_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `order__products`
--
ALTER TABLE `order__products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order__products`
--
ALTER TABLE `order__products`
  ADD CONSTRAINT `order__products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order__products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
