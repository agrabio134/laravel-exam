-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 12:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(5, 1, 'test12', 'test12', '2024-07-15 23:13:16', '2024-07-15 23:13:16'),
(6, 1, 'test12', 'test12', '2024-07-15 23:13:16', '2024-07-15 23:13:16'),
(11, 3, 'dassda', 'asdsdasad', '2024-07-16 01:24:17', '2024-07-16 01:24:17'),
(12, 3, 'dassda', 'asdsdasad', '2024-07-16 01:24:23', '2024-07-16 01:24:23'),
(13, 3, 'TEST123', 'TEST123', '2024-07-16 01:34:53', '2024-07-16 01:34:53');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_16_065028_create_blog_posts_table', 2);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '4a0ae0dde6047c8c8b0ea574b0c8f6243e8b7c8ca4733d8f4fc4ec2eeaac7c9d', '[\"*\"]', NULL, NULL, '2024-07-15 22:35:40', '2024-07-15 22:35:40'),
(2, 'App\\Models\\User', 1, 'auth_token', 'e6e762682e9cf450bcc2535e63bda9d237fac9968ca237d811e4e969873676f7', '[\"*\"]', NULL, NULL, '2024-07-15 22:36:36', '2024-07-15 22:36:36'),
(3, 'App\\Models\\User', 1, 'auth_token', '1dc521f315d68e11960947f3ed7699dd2ac8c983128df169a9d97e589d600bd4', '[\"*\"]', NULL, NULL, '2024-07-15 22:36:52', '2024-07-15 22:36:52'),
(4, 'App\\Models\\User', 1, 'auth_token', '151088a3d0efc1b803a3e8adc7b0d445f3cb1edfafbe90c9c818a2ce783f3747', '[\"*\"]', NULL, NULL, '2024-07-15 22:37:28', '2024-07-15 22:37:28'),
(5, 'App\\Models\\User', 1, 'auth_token', 'bff2da31838f096e137e50347296886b4b97423f6f00686309dbabac936daea8', '[\"*\"]', NULL, NULL, '2024-07-15 22:37:44', '2024-07-15 22:37:44'),
(6, 'App\\Models\\User', 1, 'auth_token', '536e69d73cd5a84651e5f754c88ea4a39db8c73bf79d41642165e1a0d62afd0f', '[\"*\"]', NULL, NULL, '2024-07-15 22:38:08', '2024-07-15 22:38:08'),
(7, 'App\\Models\\User', 1, 'auth_token', '55fee7fdd1337564df431b3dc09be24ca183f2886dd8c5848d2aa89acfed5173', '[\"*\"]', NULL, NULL, '2024-07-15 22:52:43', '2024-07-15 22:52:43'),
(8, 'App\\Models\\User', 2, 'auth_token', 'ec1ff36e78356cf45feb21e75a54bc3ff090648b65c75228e2e0e0b7c05f7742', '[\"*\"]', NULL, NULL, '2024-07-15 23:44:10', '2024-07-15 23:44:10'),
(9, 'App\\Models\\User', 2, 'auth_token', 'd024611a1366c1757f65f8d33f58a76ece9c1f0474c0ac8cdfd99548b3a391cb', '[\"*\"]', NULL, NULL, '2024-07-15 23:44:45', '2024-07-15 23:44:45');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Harvey', 'agrabioharvey4@gmail.com', NULL, '$2y$12$rhDo49hIJ91l2Cz36tOo3urTwAagmJ67lakfgHp1IIPaLecE/4pkC', NULL, '2024-07-15 22:35:40', '2024-07-15 22:35:40'),
(2, 'Harvey', '202010364@gordoncollege.edu.ph', NULL, '$2y$12$kh/cEnbxW7joZ.ZDmZ.NIeDjMGK4Pb8EHgl1myn1yp1O1vXLDdpKK', NULL, '2024-07-15 23:44:10', '2024-07-15 23:44:10'),
(3, 'testharvey', 'agrabioharvey@gmail.com', NULL, '$2y$12$WEaPQ2YC/YS869FEPElx3OOGKQDCuUvsjfd04QA0GtBkBrgOEf3lG', NULL, '2024-07-15 23:58:00', '2024-07-15 23:58:00'),
(4, 'testharveyasdsa', 'agrabioharvey21321@gmail.com', NULL, '$2y$12$gRtB64otf13Wj3lNtLaICuOUBd.TARHobxIgook5qWlV6S30Ki6u.', NULL, '2024-07-16 01:40:21', '2024-07-16 01:40:21'),
(5, 'testharvey', 'agrabioharvedsadsay@gmail.com', NULL, '$2y$12$LUN4rSqqlJLoqMgdpcUlwOESt2g/EE5h6YppcfXUZ0mkpQlYg0sn.', NULL, '2024-07-16 02:11:14', '2024-07-16 02:11:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
