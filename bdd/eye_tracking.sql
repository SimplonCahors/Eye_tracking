-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2018 at 03:52 PM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eye_tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `are_oid` int(11) NOT NULL,
  `are_coord` longtext,
  `area_trigger` int(11) DEFAULT NULL,
  `fk_pag_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comics`
--

CREATE TABLE `comics` (
  `com_oid` int(11) NOT NULL,
  `com_title` varchar(255) DEFAULT NULL,
  `com_author` varchar(45) DEFAULT NULL,
  `com_publisher` varchar(45) DEFAULT NULL,
  `com_timestamp` varchar(45) DEFAULT NULL,
  `fk_use_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `med_oid` int(11) NOT NULL,
  `med_type` varchar(45) DEFAULT NULL,
  `med_filename` varchar(45) DEFAULT NULL,
  `med_path` varchar(45) DEFAULT NULL,
  `fk_are_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `pag_oid` int(11) NOT NULL,
  `pag_image` varchar(45) DEFAULT NULL,
  `pag_number` varchar(45) DEFAULT NULL,
  `fk_com_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rol_oid` int(11) NOT NULL,
  `rol_rolename` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `use_oid` int(11) NOT NULL,
  `use_username` varchar(45) DEFAULT NULL,
  `use_password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `fk_use_oid` int(11) NOT NULL,
  `fk_rol_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`are_oid`),
  ADD KEY `fk_pag_oid_idx` (`fk_pag_oid`);

--
-- Indexes for table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`com_oid`),
  ADD KEY `fk_use_oid_idx` (`fk_use_oid`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`med_oid`),
  ADD KEY `fk_are_oid_idx` (`fk_are_oid`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pag_oid`),
  ADD KEY `fk_com_oid_idx` (`fk_com_oid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_oid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`use_oid`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`fk_use_oid`,`fk_rol_oid`),
  ADD KEY `fk_rol_oid_idx` (`fk_rol_oid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `are_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comics`
--
ALTER TABLE `comics`
  MODIFY `com_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
  MODIFY `med_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pag_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `use_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `fk_pag_oid` FOREIGN KEY (`fk_pag_oid`) REFERENCES `pages` (`pag_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `fk_use_oid` FOREIGN KEY (`fk_use_oid`) REFERENCES `users` (`use_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `fk_are_oid` FOREIGN KEY (`fk_are_oid`) REFERENCES `areas` (`are_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_com_oid` FOREIGN KEY (`fk_com_oid`) REFERENCES `comics` (`com_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_rol_oid` FOREIGN KEY (`fk_rol_oid`) REFERENCES `roles` (`rol_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_oid` FOREIGN KEY (`fk_use_oid`) REFERENCES `users` (`use_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
