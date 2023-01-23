-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 09:46 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resturent`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$OxOMZCA98jno6i.Ab1Ro8.cwT9GB7EeWwjlwJRkYie730ty2ya7rm', NULL, NULL, NULL, '2023-01-23 06:36:19', '2023-01-23 06:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_01_22_134812_create_sessions_table', 1),
(7, '2023_01_22_174317_create_admins_table', 1),
(8, '2023_01_22_192633_create_products_table', 1),
(10, '2023_01_22_203219_create_orders_table', 2),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(14, '2016_06_01_000004_create_oauth_clients_table', 3),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9fce729a038e7baabe5dcb3af2b2c53515d96540ee2e73da01f580de111201d18ff509e7daef229c', 12, 1, 'Laravel Password Grant Client', '[]', 0, '2023-01-23 14:40:20', '2023-01-23 14:40:22', '2024-01-23 20:40:20'),
('de0b3df03c3ea78a950dc201c3ea0caa9541171103325180ea5e4a66e1118dad5326b2649f8634d0', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2023-01-23 14:34:47', '2023-01-23 14:41:03', '2024-01-23 20:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1sB8vzTZyRuffefw9GwylmRphSrCdIrJ4CZcgRpe', NULL, 'http://localhost', 1, 0, 0, '2023-01-23 14:16:06', '2023-01-23 14:16:06'),
(2, NULL, 'Laravel Password Grant Client', 'nynxFsz4zOVYOJSC5vKVCZutmHVk44mGUAHOiluO', 'users', 'http://localhost', 0, 1, 0, '2023-01-23 14:16:07', '2023-01-23 14:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-01-23 14:16:07', '2023-01-23 14:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `status`, `payment_method`, `payment_status`, `payment_amount`, `payment_date`, `payment_currency`, `address`, `city`, `state`, `country`, `zipcode`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 'pending', 'card', '0', '53.55', NULL, 'USD', 'Dhaka', 'Dhaka', 'Dhanmondi', 'Bangladesh', '1209', '01679487265', '2023-01-23 01:32:17', '2023-01-23 01:32:17'),
(2, 1, 11, 3, 'pending', 'card', '0', '44.4', NULL, 'USD', 'Dhaka', 'Dhaka', 'Dhanmondi', 'Bangladesh', '1209', '01679487265', '2023-01-23 01:34:26', '2023-01-23 01:34:26'),
(3, 1, 11, 1, 'processing', 'card', '1', '44.4', '2023-01-23 07:44:30', 'USD', 'Dhaka', 'Dhaka', 'Dhanmondi', 'Bangladesh', '1209', '01679487265', '2023-01-23 01:42:41', '2023-01-23 01:44:30'),
(4, 1, 18, 2, 'accept', 'card', '1', '78.23', '2023-01-23 07:46:32', 'USD', 'Jigatala Rd', 'Dhaka', 'Dhaka Division', 'Bangladesh', '1205', '01679487265', '2023-01-23 01:46:01', '2023-01-23 13:11:34'),
(5, 1, 15, 1, 'processing', 'card', '1', '57.75', '2023-01-23 07:46:32', 'USD', 'Jigatala Rd', 'Dhaka', 'Dhaka Division', 'Bangladesh', '1205', '01679487265', '2023-01-23 01:46:01', '2023-01-23 01:46:32'),
(6, 1, 11, 1, 'cancel', 'card', '0', '44.4', NULL, 'USD', 'Jigatala Rd', 'Dhaka', 'Dhaka Division', 'Bangladesh', '1205', '01679487265', '2023-01-23 03:23:31', '2023-01-23 13:11:20'),
(7, 1, 11, 1, 'pending', 'card', '0', '44.4', NULL, 'USD', 'Jigatala Rd', 'Dhaka', 'Dhaka Division', 'Bangladesh', '1205', '01679487265', '2023-01-23 13:13:56', '2023-01-23 13:13:56'),
(8, 1, 15, 1, 'processing', 'card', '1', '57.75', '2023-01-23 19:27:25', 'USD', 'Dhaka', 'Dhaka', NULL, 'Bangladesh', '1209', '01679487265', '2023-01-23 13:18:12', '2023-01-23 13:27:25'),
(9, 2, 11, 1, 'processing', 'card', '1', '44.4', '2023-01-23 19:37:23', 'USD', 'ABCD', 'Australia', 'Australia', 'Australia', '1205', '0147852369', '2023-01-23 13:36:24', '2023-01-23 13:37:23'),
(10, 2, 15, 1, 'processing', 'card', '1', '57.75', '2023-01-23 19:37:23', 'USD', 'ABCD', 'Australia', 'Australia', 'Australia', '1205', '0147852369', '2023-01-23 13:36:24', '2023-01-23 13:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'User', '2bddd54ec51fd74dd2ff31b077ae1f3324590f40be1a754148a3ecbb6db717e1', '[\"read\",\"create\"]', NULL, NULL, '2023-01-23 01:50:27', '2023-01-23 01:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Jerrold Keeling', 'Omnis laborum quam sapiente voluptatem laboriosam voluptas sit. Incidunt eius illo qui quos. Quae sint quia debitis iste. Quibusdam quibusdam quidem tempora.', '8', 'https://via.placeholder.com/640x480.png/006600?text=quos', 'inactive', 'veritatis-ducimus-eaque-praesentium-iure-ratione-earum-facere', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(2, 'Thalia Hermann', 'Incidunt occaecati non fugiat exercitationem molestiae voluptatum. Dolorem vitae eos et ullam quo ipsam. Vel soluta iusto qui nisi quaerat non est fugit.', '51.03', 'https://via.placeholder.com/640x480.png/005544?text=totam', 'inactive', 'debitis-alias-amet-soluta-voluptas-sint', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(3, 'Mr. Adalberto Marvin IV', 'Nihil id eum qui voluptatibus est odio. Eius nisi sed dicta neque aut. Soluta ipsam architecto voluptatem itaque. Soluta rerum nostrum beatae.', '39.19', 'https://via.placeholder.com/640x480.png/0022ff?text=ipsam', 'inactive', 'sed-numquam-earum-aut-sed-rem-quibusdam-vitae-nam', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(4, 'Prof. Tristin Bahringer IV', 'Et tenetur eum exercitationem. Qui atque esse nobis laudantium soluta laudantium. Molestiae assumenda esse earum quod.', '10.64', 'https://via.placeholder.com/640x480.png/000000?text=est', 'inactive', 'ipsa-vel-culpa-odit', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(5, 'Yasmeen Labadie', 'Asperiores adipisci fuga eligendi ut. Et molestiae autem fugit repellendus et. Dolores quod ut nulla qui maxime ut. Quidem vitae iusto hic.', '53.55', 'https://via.placeholder.com/640x480.png/00bbff?text=quo', 'active', 'pariatur-at-doloribus-eos-reiciendis-doloremque-tempora', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(6, 'Mikel Beahan', 'Est soluta quia voluptate minima. Consequuntur qui quia consectetur.', '13.15', 'https://via.placeholder.com/640x480.png/007733?text=eum', 'inactive', 'sit-molestiae-blanditiis-velit-rerum-rerum-doloribus-unde', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(7, 'Eugenia Feest', 'Nemo ad dignissimos quasi voluptatibus vitae. Porro aliquam eum doloremque voluptatem rerum neque. Labore dolorum amet odit tempora.', '58.36', 'https://via.placeholder.com/640x480.png/00ee44?text=dolores', 'inactive', 'reprehenderit-quibusdam-sit-ullam-nemo-fuga-enim', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(8, 'Gina Schultz', 'Doloribus fuga dolor molestias vitae nulla placeat soluta est. Cumque possimus optio voluptas eum atque reiciendis. Voluptatem ex voluptatem eaque vel. Numquam esse et voluptas vitae.', '35.5', 'https://via.placeholder.com/640x480.png/00aa77?text=officiis', 'inactive', 'odio-et-et-et-maiores-et', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(9, 'Kieran Corkery', 'Omnis natus amet consequatur temporibus commodi et. Incidunt soluta maxime error asperiores tempora ullam. Accusantium voluptatem labore modi voluptas.', '5.31', 'https://via.placeholder.com/640x480.png/001100?text=praesentium', 'inactive', 'sit-aut-facere-occaecati-dolor', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(10, 'Dr. Houston Dooley', 'Ut ipsa dolorem quidem similique autem. Eos delectus accusantium occaecati et et. In est nostrum commodi quas. Qui culpa odit doloribus vel eos voluptatibus odit.', '89.5', 'https://via.placeholder.com/640x480.png/0022aa?text=atque', 'inactive', 'qui-adipisci-maxime-dolores-enim-vel', '2023-01-22 13:32:22', '2023-01-22 13:32:22'),
(11, 'Jermain Trantow III', 'Et voluptatum sequi voluptatum natus est vel aperiam animi. Ut et perferendis beatae. Nemo ea itaque aut sit harum. Similique aut quisquam quos inventore accusantium.', '44.4', 'https://via.placeholder.com/640x480.png/005555?text=sed', 'active', 'ut-aperiam-neque-autem-aut-possimus', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(12, 'Prof. Bartholome Franecki', 'Rerum accusantium tempore qui atque dolorum facilis. Assumenda laboriosam sunt placeat tempora inventore reiciendis dolor. In tenetur deleniti aut et dolores.', '28.07', 'https://via.placeholder.com/640x480.png/00ff11?text=et', 'inactive', 'pariatur-aut-occaecati-ea-cum-ratione-adipisci-qui-harum', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(13, 'Stevie Rippin', 'Et voluptas aut ut. Explicabo iusto ex enim minus optio laudantium. In saepe nam et voluptatum a. Molestiae et porro dolorum sed aut quidem aperiam.', '67.61', 'https://via.placeholder.com/640x480.png/002266?text=ipsa', 'inactive', 'aut-provident-nobis-voluptatem-dolore-natus-in', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(14, 'Prof. Kurtis Stanton', 'Iusto eius et ea pariatur fugit. Vel et dolore repellendus qui consequatur. Blanditiis dolorem velit quibusdam quis quaerat alias est sequi. Voluptatem voluptates doloremque quia non hic.', '0.03', 'https://via.placeholder.com/640x480.png/00bb55?text=accusantium', 'inactive', 'est-debitis-impedit-nemo-molestias-tempora', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(15, 'Martin Hyatt', 'Ratione voluptatem non quibusdam aperiam minima veniam id. Sunt sit non explicabo est nisi. Nam est quia aliquam ut voluptates.', '57.75', 'https://via.placeholder.com/640x480.png/00bb33?text=est', 'active', 'aperiam-odio-nostrum-temporibus-corporis-magnam', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(16, 'Dr. Anabelle Parker MD', 'Perferendis ipsum corrupti sed. Repellendus et deserunt accusamus nobis perferendis magnam. Nulla amet sed quisquam ullam qui.', '57.58', 'https://via.placeholder.com/640x480.png/005522?text=nemo', 'inactive', 'non-sed-qui-perspiciatis', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(17, 'Lillian Conroy DDS', 'Sed accusantium sit voluptatem id dolores ad. Rerum omnis dolores autem qui harum. Vel perferendis quis quia doloremque id sunt. Commodi voluptates eos excepturi vel.', '43.57', 'https://via.placeholder.com/640x480.png/0000cc?text=natus', 'active', 'et-voluptatibus-aperiam-perspiciatis-aut-voluptas-repellat', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(18, 'Julia Lebsack IV', 'Nihil omnis labore dicta maiores esse occaecati officia. Expedita ut reiciendis et dolorem nostrum. Est quo est ut cupiditate.', '78.23', 'https://via.placeholder.com/640x480.png/00ccaa?text=voluptatum', 'active', 'et-fuga-a-reiciendis-vel-ut', '2023-01-22 13:32:55', '2023-01-22 13:32:55'),
(19, 'Juston Reilly', 'Temporibus fuga qui dolorum ipsum praesentium tempora. Vel sed dolores et ratione. Tempore illo commodi qui dolor. Maiores quas cupiditate numquam ut et suscipit nemo voluptatum.', '62.59', 'https://via.placeholder.com/640x480.png/006699?text=nobis', 'active', 'dolores-enim-et-quis-sint', '2023-01-22 13:32:56', '2023-01-22 13:32:56'),
(20, 'Reece Crooks', 'Qui maiores non expedita tenetur. Enim distinctio officia dolorem sit autem.', '22.59', 'https://via.placeholder.com/640x480.png/0099dd?text=deleniti', 'active', 'nemo-vel-optio-temporibus-corrupti-consequatur-hic-voluptatem-in', '2023-01-22 13:32:56', '2023-01-22 13:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aFcy1A1IkWh7fvlE2g8rngrClJhMKt756urpccnO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/94.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXN4UHNRUFpSVUhHM25NajRQQVZMTWd6ellhT3BCajFpeTF4Ym0yRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1674506734),
('Ju06oCQXpZr82sorWlwEeSY8e8WpdIsuvoA93jIz', NULL, '127.0.0.1', 'PostmanRuntime/7.29.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHlSdnF3a3JzV0pTMnp4MUJySWRXRHJMbVFVMGJ6bFNMWTJVUXcxSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fX0=', 1674506521);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user@gmail.com', NULL, '$2y$10$oUdqEffBR.r0D7DZxr0Eb.FcSIJ3wpZM7NFE6rXF747jGa181xdqq', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-22 14:46:58', '2023-01-22 14:46:58'),
(2, 'Natasha Conn', 'mae.larkin@example.com', '2023-01-23 13:30:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'uGylkyQpwV', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(3, 'Hobart Littel', 'umarvin@example.org', '2023-01-23 13:30:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'iuGWh16ETH', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(4, 'Aubree Conn', 'cedrick60@example.org', '2023-01-23 13:30:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'cwzIRfbkLT', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(5, 'Mr. Ottis Keebler', 'colleen.braun@example.net', '2023-01-23 13:30:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bKYaFcpfhS', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(6, 'Robert Spinka', 'zita.johnson@example.com', '2023-01-23 13:30:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'cIK34szCR1', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(7, 'Demarco Huel', 'sboyer@example.com', '2023-01-23 13:30:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'FYYYBgHgOY', NULL, NULL, '2023-01-23 13:30:37', '2023-01-23 13:30:37'),
(8, 'Maria Kuhlman IV', 'natalie43@example.net', '2023-01-23 13:30:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'zOyJgx40Kx', NULL, NULL, '2023-01-23 13:30:38', '2023-01-23 13:30:38'),
(9, 'Rodolfo Glover', 'bobby.hand@example.com', '2023-01-23 13:30:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bkJgHzvktY', NULL, NULL, '2023-01-23 13:30:38', '2023-01-23 13:30:38'),
(10, 'Domenico Okuneva', 'stanton.jules@example.net', '2023-01-23 13:30:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'GvT0qP1RWv', NULL, NULL, '2023-01-23 13:30:38', '2023-01-23 13:30:38'),
(11, 'Darren Hartmann Sr.', 'caleigh.kuhn@example.org', '2023-01-23 13:30:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IqBfKoJhKf', NULL, NULL, '2023-01-23 13:30:38', '2023-01-23 13:30:38'),
(12, 'John Doe', 'john@gmail.com', NULL, '$2y$10$ZsTysS3T8RnBoeJ.qGRnvuTM7eyqL94H8JHFDWOD8Rc.odpyHhoIC', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-23 14:40:13', '2023-01-23 14:40:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
