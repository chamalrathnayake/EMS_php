-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 05:09 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `t1_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t1_price` double NOT NULL,
  `t1_count` int(11) NOT NULL,
  `t1_sold` int(11) NOT NULL,
  `t2_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t2_price` double NOT NULL,
  `t2_count` int(11) NOT NULL,
  `t2_sold` int(11) NOT NULL,
  `t3_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t3_price` double NOT NULL,
  `t3_count` int(11) NOT NULL,
  `t3_sold` int(11) NOT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `date`, `time`, `location`, `description`, `category`, `approved`, `user_id`, `t1_name`, `t1_price`, `t1_count`, `t1_sold`, `t2_name`, `t2_price`, `t2_count`, `t2_sold`, `t3_name`, `t3_price`, `t3_count`, `t3_sold`, `photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Concert in the Park', '2023-10-15', '18:00', 'Central Park', 'An amazing outdoor concert featuring various artists. Join us for a night of music under the stars.', 'Music', 1, 1, 'General Admission', 20, 100, 50, 'VIP Pass', 50, 50, 25, 'Backstage Experience', 100, 10, 5, 'images/thumbnail/1.webp', '2023-10-10 14:55:08', '2023-10-10 14:55:08'),
(2, 'Shakespearean Drama', '2023-09-25', '19:30', 'Globe Theater', 'Experience the magic of Shakespeare live on stage. Our talented actors will transport you to another era with their exceptional performances.', 'Drama', 1, 2, 'Regular Ticket', 25, 200, 150, 'VIP Ticket', 50, 50, 30, 'Premium Ticket', 75, 20, 10, 'images/thumbnail/2.webp', '2023-10-10 14:55:08', '2023-10-10 14:55:08'),
(3, 'Rock Music Festival', '2023-11-05', '15:00', 'Rock Arena', 'Get ready to rock! Join us for a day of high-energy performances by your favorite bands. Food, drinks, and music - it\'s a perfect combination for a memorable experience.', 'Music', 1, 3, 'General Admission', 30, 500, 300, 'VIP Pass', 75, 100, 60, 'Ultimate Fan Ticket', 150, 25, 15, 'images/thumbnail/default.jpg', '2023-10-10 14:55:08', '2023-10-10 14:55:08'),
(4, 'Drama Workshop', '2023-10-10', '14:00', 'Arts Center', 'Unlock your acting potential with our intensive drama workshop. From beginners to advanced actors, everyone is welcome. Dive deep into the world of theater with us.', 'Drama', 1, 4, 'Beginner Workshop', 50, 50, 30, 'Advanced Workshop', 75, 30, 20, 'Masterclass', 100, 10, 5, 'images/thumbnail/default.jpg', '2023-10-10 14:55:08', '2023-10-10 14:55:08'),
(5, 'Classical Music Concert', '2023-11-20', '19:00', 'Symphony Hall', 'Immerse yourself in the enchanting melodies of classical music. Renowned musicians will perform timeless compositions, creating a magical evening for all music lovers.', 'Music', 1, 5, 'Balcony Seat', 40, 300, 200, 'Orchestra Seat', 60, 100, 70, 'VIP Box', 100, 20, 10, 'images/thumbnail/default.jpg', '2023-10-10 14:55:08', '2023-10-10 14:55:08'),
(6, 'Comedy Night', '2023-09-30', '20:00', 'Laugh Lounge', 'Prepare to laugh until your sides hurt! Our comedy night features a lineup of hilarious comedians who will keep you entertained throughout the evening. Don\'t miss this night of laughter and fun.', 'Drama', 1, 6, 'General Admission', 35, 200, 150, 'VIP Ticket', 60, 50, 30, 'Premium Experience', 80, 15, 8, 'images/thumbnail/default.jpg', '2023-10-10 14:55:08', '2023-10-10 14:55:08');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_07_170733_add_location_to_events_table', 1),
(6, '2023_10_07_182314_create_events_table', 1),
(7, '2023_10_07_212157_create_bookings_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL,
  `approve_code` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `mobile`, `district`, `approved`, `approve_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Laverne Murphy', 'terry.frederique@example.net', '2023-10-10 09:24:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '(619) 581-7303', 'kegalle', 0, 123456, 'FHbolIGgSK', '2023-10-10 09:24:55', '2023-10-10 09:24:55'),
(2, 'Myrtie Rice', 'ztorphy@example.org', '2023-10-10 09:24:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '463-578-1368', 'kegalle', 0, 123456, '5Q5oBcNDsl', '2023-10-10 09:24:55', '2023-10-10 09:24:55'),
(3, 'Shaina Douglas', 'qmann@example.org', '2023-10-10 09:24:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '+13304770493', 'kegalle', 0, 123456, 'RLdqeUasnR', '2023-10-10 09:24:55', '2023-10-10 09:24:55'),
(4, 'Prof. Darian Hahn MD', 'lillie45@example.org', '2023-10-10 09:24:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '1-702-933-4677', 'kegalle', 0, 123456, 'oWWn7L7Oaw', '2023-10-10 09:24:55', '2023-10-10 09:24:55'),
(5, 'Blake Padberg', 'nat70@example.net', '2023-10-10 09:24:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '+14706963329', 'kegalle', 0, 123456, 'qKJaC0EALG', '2023-10-10 09:24:55', '2023-10-10 09:24:55'),
(6, 'Prabuddhika', 'prabu@gmail.com', NULL, '$2y$10$728/7I8Sk8NLxXWT3LhsAOhly73b0iyB8WwoQasN9SqKEmtBLqtqi', 'admin', '0719246621', 'Kandy', 0, 123456, NULL, '2023-10-10 09:26:09', '2023-10-10 09:26:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
