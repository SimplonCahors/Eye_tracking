-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 06 Mars 2018 à 16:07
-- Version du serveur :  5.7.21-0ubuntu0.17.10.1
-- Version de PHP :  7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `eyetracking`
--

-- --------------------------------------------------------

--
-- Structure de la table `areas`
--

CREATE TABLE `areas` (
  `are_oid` int(11) NOT NULL,
  `are_coord` varchar(255) NOT NULL,
  `are_trigger` int(11) NOT NULL,
  `fk_pag_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comics`
--

CREATE TABLE `comics` (
  `com_oid` int(11) NOT NULL,
  `com_title` varchar(255) NOT NULL,
  `com_author` varchar(255) NOT NULL,
  `com_publisher` varchar(255) NOT NULL,
  `fk_use_oid` int(11) NOT NULL,
  `com_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medias`
--

CREATE TABLE `medias` (
  `med_oid` int(11) NOT NULL,
  `med_type` varchar(255) NOT NULL,
  `med_filename` varchar(255) NOT NULL,
  `med_path` varchar(255) NOT NULL,
  `fk_are_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `pag_oid` int(11) NOT NULL,
  `pag_image` varchar(255) NOT NULL,
  `pag_number` int(11) NOT NULL,
  `fk_com_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `rol_oid` int(11) NOT NULL,
  `rol_rolname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `use_oid` int(11) NOT NULL,
  `use_username` varchar(255) NOT NULL,
  `use_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `fk_use_oid` int(11) NOT NULL,
  `fk_rol_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`are_oid`),
  ADD KEY `fk_pag_oid_idx` (`fk_pag_oid`);

--
-- Index pour la table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`com_oid`),
  ADD KEY `fk_use_oid_idx` (`fk_use_oid`);

--
-- Index pour la table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`med_oid`),
  ADD KEY `fk_are_oid_idx` (`fk_are_oid`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pag_oid`),
  ADD KEY `fk_com_oid_idx` (`fk_com_oid`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_oid`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`use_oid`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY ` 	fk_rol_oid` (`fk_rol_oid`),
  ADD KEY ` 	fk_use_oid` (`fk_use_oid`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `areas`
--
ALTER TABLE `areas`
  MODIFY `are_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `comics`
--
ALTER TABLE `comics`
  MODIFY `com_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `medias`
--
ALTER TABLE `medias`
  MODIFY `med_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `pag_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `use_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `fk_pag_oid` FOREIGN KEY (`fk_pag_oid`) REFERENCES `pages` (`pag_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `fk_use_oid` FOREIGN KEY (`fk_use_oid`) REFERENCES `users` (`use_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `fk_are_oid` FOREIGN KEY (`fk_are_oid`) REFERENCES `areas` (`are_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_com_oid` FOREIGN KEY (`fk_com_oid`) REFERENCES `comics` (`com_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT ` 	fk_rol_oid` FOREIGN KEY (`fk_rol_oid`) REFERENCES `roles` (`rol_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT ` 	fk_use_oid` FOREIGN KEY (`fk_use_oid`) REFERENCES `users` (`use_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
