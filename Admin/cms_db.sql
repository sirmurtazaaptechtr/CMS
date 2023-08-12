-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2023 at 05:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `bill_date` date NOT NULL DEFAULT current_timestamp(),
  `center_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `receiver_address` varchar(200) NOT NULL,
  `courier_type` varchar(50) NOT NULL DEFAULT 'Normal',
  `delievery_date` date DEFAULT NULL,
  `courier_id` int(11) NOT NULL,
  `courier_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city`) VALUES
(2, 'Karachi'),
(10, 'Lahore');

-- --------------------------------------------------------

--
-- Table structure for table `couriercompanies`
--

CREATE TABLE `couriercompanies` (
  `courier_company_id` int(11) NOT NULL,
  `courier_company_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `couriercompanies`
--

INSERT INTO `couriercompanies` (`courier_company_id`, `courier_company_name`) VALUES
(1, 'PostEx'),
(2, 'TCS'),
(3, 'Leopard'),
(4, 'Swift');

-- --------------------------------------------------------

--
-- Table structure for table `deliverystatus`
--

CREATE TABLE `deliverystatus` (
  `status_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retailcenter`
--

CREATE TABLE `retailcenter` (
  `center_id` int(11) NOT NULL,
  `center_name` varchar(200) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `center_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retailcenter`
--

INSERT INTO `retailcenter` (`center_id`, `center_name`, `city_id`, `user_id`, `center_address`) VALUES
(1, 'Tariq Road Center', 2, 5, 'Tariq Road');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'admin'),
(2, 'agent'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `shippeditem`
--

CREATE TABLE `shippeditem` (
  `courier_id` int(11) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `dimension` varchar(100) NOT NULL,
  `insuranceamount` varchar(100) NOT NULL,
  `destination` int(11) NOT NULL,
  `finaldeliverydate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `trackin_no` int(11) NOT NULL,
  `dateofarrival` date NOT NULL,
  `dateofdispach` date NOT NULL,
  `city_id` int(11) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `middlename`, `lastname`, `gender`, `phonenumber`, `email`, `street`, `city`, `state`, `country`, `username`, `password`, `role_id`) VALUES
(2, 'Muhammad', 'Saad', 'Khurram', 'male', '0315-2491621', 'saadkhurram9@gmail.com', 'hose#5', 'Karachi', 'Sindh', 'Pakistan', 'saad', 'saad123', 1),
(4, 'Syed', 'Murtaza', 'Hussain', 'male', '0314-2308332', 'sirmurtazaaptechtr@outlook.com', 'Stadium Road', 'Karachi', 'Sindh', 'Pakistan', 'admin', 'admin@123', 1),
(5, 'Muhammad', 'Taha', 'Tehseen', 'male', '0333-3670546', 'mtahamtehseen@gmail.com', 'Jamshed Road', 'Karachi', 'Sindh', 'Pakistan', 'taha', 'tehseen', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD KEY `courier_company_id` (`courier_company_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `center_id` (`center_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `couriercompanies`
--
ALTER TABLE `couriercompanies`
  ADD PRIMARY KEY (`courier_company_id`);

--
-- Indexes for table `deliverystatus`
--
ALTER TABLE `deliverystatus`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `retailcenter`
--
ALTER TABLE `retailcenter`
  ADD PRIMARY KEY (`center_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `shippeditem`
--
ALTER TABLE `shippeditem`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `destination` (`destination`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`trackin_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `couriercompanies`
--
ALTER TABLE `couriercompanies`
  MODIFY `courier_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deliverystatus`
--
ALTER TABLE `deliverystatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retailcenter`
--
ALTER TABLE `retailcenter`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shippeditem`
--
ALTER TABLE `shippeditem`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `trackin_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `retailcenter` (`center_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`courier_company_id`) REFERENCES `couriercompanies` (`courier_company_id`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bill_ibfk_4` FOREIGN KEY (`center_id`) REFERENCES `shippeditem` (`courier_id`);

--
-- Constraints for table `retailcenter`
--
ALTER TABLE `retailcenter`
  ADD CONSTRAINT `retailcenter_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `retailcenter_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `shippeditem`
--
ALTER TABLE `shippeditem`
  ADD CONSTRAINT `shippeditem_ibfk_1` FOREIGN KEY (`destination`) REFERENCES `cities` (`city_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
