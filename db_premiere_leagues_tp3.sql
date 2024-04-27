-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 03:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_premiere_leagues_tp3`
--

-- --------------------------------------------------------

--
-- Table structure for table `klub`
--

CREATE TABLE `klub` (
  `klub_id` int(11) NOT NULL,
  `klub_nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klub`
--

INSERT INTO `klub` (`klub_id`, `klub_nama`) VALUES
(1, 'Arsenal'),
(2, 'Manchester City'),
(3, 'Liverpool'),
(4, 'Aston Villa'),
(5, 'Tottenham Hotspur'),
(6, 'Manchester United'),
(7, 'Newcastle United'),
(8, 'West Ham United'),
(9, 'Chelsea'),
(10, 'Bournemouth'),
(11, 'Brighton and Hove Albion'),
(12, 'Wolverhampton');

-- --------------------------------------------------------

--
-- Table structure for table `pemain`
--

CREATE TABLE `pemain` (
  `pemain_id` int(11) NOT NULL,
  `pemain_foto` varchar(255) DEFAULT NULL,
  `pemain_nama` varchar(100) DEFAULT NULL,
  `pemain_no_punggung` int(2) DEFAULT NULL,
  `pemain_tinggi` int(5) DEFAULT NULL,
  `pemain_usia` int(5) DEFAULT NULL,
  `klub_id` int(11) DEFAULT NULL,
  `posisi_id` int(11) DEFAULT NULL,
  `pemain_negara` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemain`
--

INSERT INTO `pemain` (`pemain_id`, `pemain_foto`, `pemain_nama`, `pemain_no_punggung`, `pemain_tinggi`, `pemain_usia`, `klub_id`, `posisi_id`, `pemain_negara`) VALUES
(1, 'bruno.jpg', 'Bruno Fernandes', 8, 179, 29, 6, 7, 'Portugal'),
(2, 'garnacho.jpg', 'Alejandro Garnacho Ferreyra', 17, 180, 19, 6, 9, 'Argentina'),
(3, 'salah.jpg', 'Mohamed Salah', 10, 175, 30, 3, 9, 'Egypt'),
(4, 'kevin.jpg', 'Kevin De Bruyne', 17, 181, 31, 2, 6, 'Belgium'),
(5, 'son.jpg', 'Son Heung-min', 7, 184, 31, 5, 8, 'South Korea'),
(6, 'havertz.jpg', 'Kai Lukas Havertz', 29, 193, 24, 1, 7, 'Germany'),
(7, 'watkins.jpg', 'Oliver George Arthur Watkins', 11, 180, 28, 4, 10, 'England'),
(8, 'pope.jpg', 'Oliver George Arthur Watkins', 22, 191, 32, 7, 1, 'England'),
(9, 'enzo.jpg', 'Enzo Jeremías Fernández', 8, 178, 23, 6, 9, 'Argentina'),
(10, 'traore.jpg', 'Adama Traoré Diarra', 11, 178, 28, 12, 9, 'Spain');

-- --------------------------------------------------------

--
-- Table structure for table `posisi`
--

CREATE TABLE `posisi` (
  `posisi_id` int(11) NOT NULL,
  `posisi_nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posisi`
--

INSERT INTO `posisi` (`posisi_id`, `posisi_nama`) VALUES
(1, 'Goal Keeper (GK)'),
(2, 'Center Back (CB)'),
(3, 'Left Back (LB)'),
(4, 'Right Back (RB)'),
(5, 'Defensive Midfielder (DMF)'),
(6, 'Center Midfielder (CMF)'),
(7, 'Attacking Midfielder (AMF)'),
(8, 'Left Wing Forward (LWF)'),
(9, 'Right Wing Forward (RWF)'),
(10, 'Center Forward (CF)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klub`
--
ALTER TABLE `klub`
  ADD PRIMARY KEY (`klub_id`);

--
-- Indexes for table `pemain`
--
ALTER TABLE `pemain`
  ADD PRIMARY KEY (`pemain_id`),
  ADD KEY `klub_id` (`klub_id`),
  ADD KEY `posisi_id` (`posisi_id`);

--
-- Indexes for table `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`posisi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klub`
--
ALTER TABLE `klub`
  MODIFY `klub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pemain`
--
ALTER TABLE `pemain`
  MODIFY `pemain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `posisi`
--
ALTER TABLE `posisi`
  MODIFY `posisi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemain`
--
ALTER TABLE `pemain`
  ADD CONSTRAINT `pemain_ibfk_1` FOREIGN KEY (`klub_id`) REFERENCES `klub` (`klub_id`),
  ADD CONSTRAINT `pemain_ibfk_2` FOREIGN KEY (`posisi_id`) REFERENCES `posisi` (`posisi_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;