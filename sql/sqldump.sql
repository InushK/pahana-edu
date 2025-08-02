-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 02, 2025 at 08:00 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pahana-edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `account_number` int NOT NULL,
                                       `total_amount` decimal(10,2) NOT NULL,
    `bill_date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `account_number` (`account_number`)
    ) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `account_number`, `total_amount`, `bill_date`) VALUES
                                                                              (4, 3, 2780.00, '2025-07-27 16:07:49'),
                                                                              (2, 4, 3500.00, '2025-07-25 11:30:00'),
                                                                              (3, 3, 1850.00, '2025-07-25 12:15:00'),
                                                                              (6, 2, 14500.00, '2025-07-27 21:22:21'),
                                                                              (7, 9, 2780.00, '2025-07-28 23:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE IF NOT EXISTS `bill_items` (
                                            `id` int NOT NULL AUTO_INCREMENT,
                                            `bill_id` int DEFAULT NULL,
                                            `item_id` int DEFAULT NULL,
                                            `quantity` int NOT NULL,
                                            `price` decimal(10,2) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `bill_id` (`bill_id`),
    KEY `item_id` (`item_id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `bill_id`, `item_id`, `quantity`, `price`) VALUES
                                                                               (1, 1, 2, 1, 1290.00),
                                                                               (2, 1, 4, 1, 1390.00),
                                                                               (11, 2, 5, 2, 1750.00),
                                                                               (8, 4, 4, 2, 1390.00),
                                                                               (6, 4, 4, 1, 1390.00),
                                                                               (12, 6, 3, 10, 1450.00),
                                                                               (13, 7, 4, 2, 1390.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
                                           `account_number` int NOT NULL AUTO_INCREMENT,
                                           `name` varchar(100) NOT NULL,
    `address` text NOT NULL,
    `telephone` varchar(20) DEFAULT NULL,
    `units_consumed` int DEFAULT '0',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`account_number`)
    ) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`account_number`, `name`, `address`, `telephone`, `units_consumed`, `created_at`) VALUES
                                                                                                               (1, 'punura', '149/4c,Koswaththa', '1200', 0, '2025-07-19 00:38:03'),
                                                                                                               (2, 'chandupa', '726', '1990', 0, '2025-07-19 01:03:26'),
                                                                                                               (3, 'customer1', '234', '242', 0, '2025-07-19 01:04:33'),
                                                                                                               (4, 'customer1', 'vve', '234', 0, '2025-07-19 01:05:45'),
                                                                                                               (7, 'Thakshila Dilrukshi', 'Kagalla', '01123', 0, '2025-07-19 21:00:21'),
                                                                                                               (9, 'test', 'www', '111', 0, '2025-07-28 17:49:52'),
                                                                                                               (8, 'deepana', 'Angoda, Mulleriyawa', '0112223', 0, '2025-07-24 14:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
                                       `item_id` int NOT NULL AUTO_INCREMENT,
                                       `item_name` varchar(100) NOT NULL,
    `item_description` text,
    `unit_price` decimal(10,2) NOT NULL,
    `stock_quantity` int DEFAULT '0',
    PRIMARY KEY (`item_id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_description`, `unit_price`, `stock_quantity`) VALUES
                                                                                                     (2, 'The Great Gatsby', 'A classic novel by F. Scott Fitzgerald set in the Roaring Twenties.', 1290.00, 15),
                                                                                                     (3, 'To Kill a Mockingbird', 'Harper Lee\'s timeless story of racial injustice and childhood in the Deep South.', 1450.00, 20),
(4, '1984', 'Dystopian novel by George Orwell about totalitarianism and surveillance.', 1390.00, 18),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki\'s personal finance classic.', 1750.00, 25),
                                                                                                     (6, 'Harry Potter and the Sorcerer\'s Stone', 'The first book in J.K. Rowling\'s Harry Potter series.', 1600.00, 30),
                                                                                                     (7, 'The Alchemist', 'A philosophical novel by Paulo Coelho about finding one\'s destiny.', 1350.00, 12),
(8, 'Atomic Habits', 'James Clear\'s guide to building good habits and breaking bad ones.', 1850.00, 22),
                                                                                                     (9, 'Pride and Prejudice', 'Jane Austen\'s romantic novel of manners.', 1200.00, 10),
(10, 'The Lean Startup', 'A guide to building startups by Eric Ries.', 1950.00, 14),
(11, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari\'s best-seller exploring the history of humanity.', 2100.00, 17);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `username` varchar(50) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
    ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
    (1, 'admin', 'admin@123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
