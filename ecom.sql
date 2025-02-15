-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2025 at 06:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `cardTotal` double NOT NULL,
  `orderById` int(11) NOT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updateAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Water', '2025-02-09 11:26:09.786', '2025-02-09 11:26:09.786'),
(2, 'Daifuku', '2025-02-09 11:26:19.586', '2025-02-09 11:26:19.586'),
(3, 'Dubai Chocolate', '2025-02-09 11:26:26.345', '2025-02-09 11:26:26.345'),
(4, 'Sandwich', '2025-02-09 11:26:32.231', '2025-02-09 11:26:32.231'),
(28, 'Mochi', '2025-02-13 16:04:11.164', '2025-02-13 16:04:11.164'),
(29, 'Cake', '2025-02-13 16:15:17.723', '2025-02-13 16:15:17.723'),
(31, 'Other', '2025-02-13 19:21:38.568', '2025-02-13 19:21:38.568');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `asset_id` varchar(191) NOT NULL,
  `public_id` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `secure_url` varchar(191) NOT NULL,
  `productId` int(11) NOT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updateAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `asset_id`, `public_id`, `url`, `secure_url`, `productId`, `createAt`, `updateAt`) VALUES
(6, '0495105b469dad160da3dd4694556373', 'Dessert2025/Dessert-1739372327106', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739372332/Dessert2025/Dessert-1739372327106.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739372332/Dessert2025/Dessert-1739372327106.jpg', 49, '2025-02-12 14:58:54.760', '2025-02-12 14:58:54.760'),
(7, 'c36e07d9be1589a45e314dbdf8c7adf0', 'Dessert2025/Dessert-1739372362458', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739372369/Dessert2025/Dessert-1739372362458.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739372369/Dessert2025/Dessert-1739372362458.jpg', 50, '2025-02-12 14:59:27.563', '2025-02-12 14:59:27.563'),
(13, '392ef334e847be4f516184f63dd84592', 'Dessert2025/Dessert-1739462171173', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462185/Dessert2025/Dessert-1739462171173.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462185/Dessert2025/Dessert-1739462171173.jpg', 55, '2025-02-13 16:00:51.893', '2025-02-13 16:00:51.893'),
(14, '8eb6488a346f5ef6ecd572723f6bedda', 'Dessert2025/Dessert-1739462541786', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462546/Dessert2025/Dessert-1739462541786.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462546/Dessert2025/Dessert-1739462541786.jpg', 56, '2025-02-13 16:02:29.118', '2025-02-13 16:02:29.118'),
(15, '07a462807760df0f7888678550d6f842', 'Dessert2025/Dessert-1739462673627', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462683/Dessert2025/Dessert-1739462673627.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462683/Dessert2025/Dessert-1739462673627.jpg', 57, '2025-02-13 16:04:44.428', '2025-02-13 16:04:44.428'),
(16, '945794feb55defad6365bec01428b00e', 'Dessert2025/Dessert-1739462742010', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462750/Dessert2025/Dessert-1739462742010.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462750/Dessert2025/Dessert-1739462742010.jpg', 59, '2025-02-13 16:05:55.365', '2025-02-13 16:05:55.365'),
(17, 'd39ab3021880ee3c51ab29a5acd3a8e4', 'Dessert2025/Dessert-1739462790778', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462796/Dessert2025/Dessert-1739462790778.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462796/Dessert2025/Dessert-1739462790778.jpg', 60, '2025-02-13 16:06:38.707', '2025-02-13 16:06:38.707'),
(18, '53ee8729209b293894daf15ac7eccb68', 'Dessert2025/Dessert-1739462826627', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462831/Dessert2025/Dessert-1739462826627.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462831/Dessert2025/Dessert-1739462826627.jpg', 61, '2025-02-13 16:07:14.596', '2025-02-13 16:07:14.596'),
(19, '6d6f38374f5b886ac54f9c7d2c275d8c', 'Dessert2025/Dessert-1739462930977', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462940/Dessert2025/Dessert-1739462930977.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462940/Dessert2025/Dessert-1739462930977.jpg', 62, '2025-02-13 16:09:02.824', '2025-02-13 16:09:02.824'),
(20, 'c8323f02b9bd68fc24b57e7dd29a9968', 'Dessert2025/Dessert-1739462972587', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739462977/Dessert2025/Dessert-1739462972587.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739462977/Dessert2025/Dessert-1739462972587.jpg', 63, '2025-02-13 16:09:40.310', '2025-02-13 16:09:40.310'),
(21, '22b776b9f0fba4cd22568e90cb1d9874', 'Dessert2025/Dessert-1739463030229', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463035/Dessert2025/Dessert-1739463030229.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463035/Dessert2025/Dessert-1739463030229.jpg', 64, '2025-02-13 16:10:38.056', '2025-02-13 16:10:38.056'),
(22, '0033f9245c6ee7982b8cfffc24f47ddb', 'Dessert2025/Dessert-1739463086374', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463091/Dessert2025/Dessert-1739463086374.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463091/Dessert2025/Dessert-1739463086374.jpg', 65, '2025-02-13 16:11:35.096', '2025-02-13 16:11:35.096'),
(23, 'a987e1ed8499c3ff07da552c837068e3', 'Dessert2025/Dessert-1739463125807', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463131/Dessert2025/Dessert-1739463125807.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463131/Dessert2025/Dessert-1739463125807.jpg', 66, '2025-02-13 16:12:12.664', '2025-02-13 16:12:12.664'),
(24, '76a6193c853881a8da99436986b2aa37', 'Dessert2025/Dessert-1739463190424', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463212/Dessert2025/Dessert-1739463190424.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463212/Dessert2025/Dessert-1739463190424.jpg', 67, '2025-02-13 16:14:06.854', '2025-02-13 16:14:06.854'),
(25, 'f4fbd59378c62630c5e5d351559c11d9', 'Dessert2025/Dessert-1739463282575', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463290/Dessert2025/Dessert-1739463282575.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463290/Dessert2025/Dessert-1739463282575.jpg', 68, '2025-02-13 16:14:59.321', '2025-02-13 16:14:59.321'),
(26, '75a2f0cbe862b89c5bfefa17f89162a1', 'Dessert2025/Dessert-1739463341716', 'http://res.cloudinary.com/dbmqhndhc/image/upload/v1739463350/Dessert2025/Dessert-1739463341716.jpg', 'https://res.cloudinary.com/dbmqhndhc/image/upload/v1739463350/Dessert2025/Dessert-1739463341716.jpg', 69, '2025-02-13 16:16:02.287', '2025-02-13 16:16:02.287');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `cardTotal` double NOT NULL,
  `orderStatus` varchar(191) NOT NULL DEFAULT 'Not Process',
  `orderedById` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `cardTotal`, `orderStatus`, `orderedById`, `createdAt`, `updatedAt`) VALUES
(1, 800, 'Not Process', 1, '2025-02-10 16:14:25.559', '2025-02-10 16:14:25.559'),
(2, 800, 'Not Process', 1, '2025-02-10 16:15:14.705', '2025-02-10 16:15:14.705'),
(3, 800, 'Not Process', 1, '2025-02-10 17:41:40.810', '2025-02-10 17:41:40.810'),
(4, 800, 'Not Process', 1, '2025-02-10 17:41:44.254', '2025-02-10 17:41:44.254'),
(5, 800, 'Not Process', 1, '2025-02-10 17:43:10.316', '2025-02-10 17:43:10.316'),
(6, 800, 'Not Process', 1, '2025-02-10 17:43:13.522', '2025-02-10 17:43:13.522'),
(7, 800, 'Not Process', 1, '2025-02-10 17:46:56.166', '2025-02-10 17:46:56.166'),
(8, 800, 'Not Process', 1, '2025-02-10 17:58:35.764', '2025-02-10 17:58:35.764'),
(9, 800, 'Not Process', 1, '2025-02-10 18:00:01.192', '2025-02-10 18:00:01.192'),
(10, 800, 'Completed', 1, '2025-02-10 18:02:05.405', '2025-02-11 09:51:31.585'),
(11, 800, 'Not Process', 1, '2025-02-10 18:02:15.941', '2025-02-10 18:02:15.941'),
(12, 800, 'Not Process', 1, '2025-02-10 18:30:12.877', '2025-02-10 18:30:12.877'),
(13, 800, 'Not Process', 1, '2025-02-10 18:30:15.668', '2025-02-10 18:30:15.668'),
(14, 800, 'Not Process', 1, '2025-02-10 18:35:13.050', '2025-02-10 18:35:13.050'),
(15, 800, 'Not Process', 1, '2025-02-10 18:35:21.143', '2025-02-10 18:35:21.143'),
(16, 800, 'Not Process', 1, '2025-02-10 18:44:31.636', '2025-02-10 18:44:31.636'),
(17, 800, 'Not Process', 1, '2025-02-10 18:44:45.807', '2025-02-10 18:44:45.807'),
(18, 800, 'Not Process', 1, '2025-02-10 18:53:57.712', '2025-02-10 18:53:57.712'),
(19, 800, 'Not Process', 1, '2025-02-10 18:55:07.145', '2025-02-10 18:55:07.145'),
(20, 800, 'Not Process', 1, '2025-02-10 18:56:48.835', '2025-02-10 18:56:48.835'),
(21, 800, 'Not Process', 1, '2025-02-10 18:59:43.753', '2025-02-10 18:59:43.753'),
(22, 800, 'Not Process', 1, '2025-02-10 18:59:47.352', '2025-02-10 18:59:47.352');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `sold`, `quantity`, `createdAt`, `updatedAt`, `categoryId`) VALUES
(49, 'Strawberry Fresh Milk', 'test', 35, 0, 100, '2025-02-12 14:58:54.760', '2025-02-12 14:58:54.760', 1),
(50, 'Strawberry Matcha Fresh Milk', 'test', 35, 0, 100, '2025-02-12 14:59:27.563', '2025-02-12 14:59:27.563', 1),
(55, 'Dubai Heart Chocolate', 'test', 70, 0, 100, '2025-02-13 16:00:51.893', '2025-02-13 16:00:51.893', 3),
(56, 'Pink Heart Dubai Chocolate', 'test', 70, 0, 100, '2025-02-13 16:02:29.118', '2025-02-13 16:02:29.118', 3),
(57, 'Oreo Cream Mousse Mochi', 'test', 25, 0, 50, '2025-02-13 16:04:44.428', '2025-02-13 16:04:44.428', 28),
(59, 'Banoffee Mochi', 'test', 25, 0, 50, '2025-02-13 16:05:55.365', '2025-02-13 16:05:55.365', 28),
(60, 'Red Velvet Cake Mochi', 'test', 25, 0, 50, '2025-02-13 16:06:38.707', '2025-02-13 16:06:38.707', 28),
(61, 'Strawberry Cheesecake Mochi', 'test', 25, 0, 50, '2025-02-13 16:07:14.596', '2025-02-13 16:07:14.596', 28),
(62, 'Blueberry Cheesecake Mochi', 'test', 25, 0, 50, '2025-02-13 16:09:02.824', '2025-02-13 16:09:02.824', 28),
(63, 'Strawberry Daifuku', 'test', 30, 0, 75, '2025-02-13 16:09:40.310', '2025-02-13 16:09:40.310', 2),
(64, 'Daifuku Cake Set Box 4 Pieces', 'test', 200, 0, 40, '2025-02-13 16:10:38.056', '2025-02-13 16:10:38.056', 2),
(65, 'Daifuku Cake Set 2XL', 'test', 250, 0, 40, '2025-02-13 16:11:35.096', '2025-02-13 16:11:35.096', 2),
(66, 'Mixed Fruit Fresh Cream Sandwich', 'test', 35, 0, 70, '2025-02-13 16:12:12.664', '2025-02-13 16:12:12.664', 4),
(67, 'Trawberry Fresh Cream Sandwich', 'test', 35, 0, 50, '2025-02-13 16:14:06.854', '2025-02-13 16:14:06.854', 4),
(68, 'Grape Fresh Cream Sandwich', 'test', 35, 0, 70, '2025-02-13 16:14:59.321', '2025-02-13 16:14:59.321', 4),
(69, 'Strawberry Cream Pie', 'test', 60, 0, 85, '2025-02-13 16:16:02.287', '2025-02-13 16:16:02.287', 29);

-- --------------------------------------------------------

--
-- Table structure for table `productoncard`
--

CREATE TABLE `productoncard` (
  `id` int(11) NOT NULL,
  `cardId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productonorder`
--

CREATE TABLE `productonorder` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'user',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `address` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `picture`, `role`, `enabled`, `address`, `createdAt`, `updatedAt`) VALUES
(1, 'user@gmail.com', '$2a$10$ZQvN3BO3cT6AFzwbxKzF8uNZwaQTJSS/a4xG9n/IBxkpl8FNsDki2', NULL, NULL, 'user', 1, 'Hatyai', '2025-02-09 08:04:07.067', '2025-02-10 11:33:56.844'),
(8, 'dev@gmail.com', '$2a$10$Gy67EuxPpaGLb9n4sb9dYutBqENFVSY1tO6jzTc19kJ3faAjfhibi', NULL, NULL, 'admin', 1, NULL, '2025-02-14 11:52:39.768', '2025-02-15 16:26:44.709');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('45da129f-17db-4298-9dae-643eeda4ca99', '4f508774ec5ed24c4219963c8ac17c325fe9b15bf30274c7df1b2e78b2ad16b5', '2025-02-08 11:40:18.255', '20250208114017_ecom', NULL, NULL, '2025-02-08 11:40:17.993', 1),
('6f131663-0d61-4f40-a60d-61fce36755cf', '6cc042aa0072514d18c0ada0d7c805a9d6c7e82e1309a45e85505bdfcfdc8745', '2025-02-09 11:10:00.156', '20250209111000_updatetacegory_id', NULL, NULL, '2025-02-09 11:10:00.122', 1),
('74db584c-03c8-487c-a405-b2246e3dc7db', 'fa5eada698a689d79b9ace5fe8a67d12a33cf0212630effdef64709b3f653e55', '2025-02-10 18:25:05.245', '20250210182505_update_delete', NULL, NULL, '2025-02-10 18:25:05.174', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Card_orderById_fkey` (`orderById`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Image_productId_fkey` (`productId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_orderedById_fkey` (`orderedById`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_categoryId_fkey` (`categoryId`);

--
-- Indexes for table `productoncard`
--
ALTER TABLE `productoncard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductOnCard_cardId_fkey` (`cardId`),
  ADD KEY `ProductOnCard_productId_fkey` (`productId`);

--
-- Indexes for table `productonorder`
--
ALTER TABLE `productonorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductOnOrder_productId_fkey` (`productId`),
  ADD KEY `ProductOnOrder_orderId_fkey` (`orderId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `productoncard`
--
ALTER TABLE `productoncard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `productonorder`
--
ALTER TABLE `productonorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `Card_orderById_fkey` FOREIGN KEY (`orderById`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `Image_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_orderedById_fkey` FOREIGN KEY (`orderedById`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `productoncard`
--
ALTER TABLE `productoncard`
  ADD CONSTRAINT `ProductOnCard_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProductOnCard_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `productonorder`
--
ALTER TABLE `productonorder`
  ADD CONSTRAINT `ProductOnOrder_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProductOnOrder_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
