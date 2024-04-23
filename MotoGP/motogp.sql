-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2024 alle 22:15
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motogp`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `idCategory` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage_race_distance` int(11) NOT NULL,
  `lap_slower` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`idCategory`, `name`, `percentage_race_distance`, `lap_slower`) VALUES
(1, 'MotoGP', 100, 100),
(2, 'Moto2', 90, 95),
(3, 'Moto3', 75, 89);

-- --------------------------------------------------------

--
-- Struttura della tabella `meteo`
--

CREATE TABLE `meteo` (
  `idMeteo` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage_difference` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `meteo`
--

INSERT INTO `meteo` (`idMeteo`, `name`, `percentage_difference`) VALUES
(1, 'Sunny', 0),
(2, 'Light Rain', 25),
(3, 'Heavy Rain', 50);

-- --------------------------------------------------------

--
-- Struttura della tabella `points`
--

CREATE TABLE `points` (
  `points` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `session` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `points`
--

INSERT INTO `points` (`points`, `position`, `session`) VALUES
(0, 10, 'Sprint'),
(0, 11, 'Sprint'),
(0, 12, 'Sprint'),
(0, 13, 'Sprint'),
(0, 14, 'Sprint'),
(0, 15, 'Sprint'),
(0, 16, 'Race'),
(0, 16, 'Sprint'),
(0, 17, 'Race'),
(0, 17, 'Sprint'),
(0, 18, 'Race'),
(0, 18, 'Sprint'),
(0, 19, 'Race'),
(0, 19, 'Sprint'),
(0, 20, 'Race'),
(0, 20, 'Sprint'),
(0, 21, 'Race'),
(0, 21, 'Sprint'),
(0, 22, 'Race'),
(0, 22, 'Sprint'),
(0, 23, 'Race'),
(0, 24, 'Race'),
(0, 25, 'Race'),
(0, 26, 'Race'),
(0, 27, 'Race'),
(0, 28, 'Race'),
(0, 29, 'Race'),
(0, 30, 'Race'),
(1, 9, 'Sprint'),
(1, 15, 'Race'),
(2, 8, 'Sprint'),
(2, 14, 'Race'),
(3, 7, 'Sprint'),
(3, 13, 'Race'),
(4, 6, 'Sprint'),
(4, 12, 'Race'),
(5, 5, 'Sprint'),
(5, 11, 'Race'),
(6, 4, 'Sprint'),
(6, 10, 'Race'),
(7, 3, 'Sprint'),
(7, 9, 'Race'),
(8, 8, 'Race'),
(9, 2, 'Sprint'),
(9, 7, 'Race'),
(10, 6, 'Race'),
(11, 5, 'Race'),
(12, 1, 'Sprint'),
(13, 4, 'Race'),
(16, 3, 'Race'),
(20, 2, 'Race'),
(25, 1, 'Race');

-- --------------------------------------------------------

--
-- Struttura della tabella `qualifying`
--

CREATE TABLE `qualifying` (
  `idRider` bigint(20) NOT NULL,
  `idRace` bigint(20) NOT NULL,
  `lap_time` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `session` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `race`
--

CREATE TABLE `race` (
  `idRace` bigint(20) NOT NULL,
  `idTrack` bigint(20) NOT NULL,
  `idMeteo` bigint(20) DEFAULT NULL,
  `idSeason` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `race`
--

INSERT INTO `race` (`idRace`, `idTrack`, `idMeteo`, `idSeason`, `status`, `category`) VALUES
(1, 1, NULL, 1, 'Pre_Qualifying', 'Moto3');

-- --------------------------------------------------------

--
-- Struttura della tabella `race_results`
--

CREATE TABLE `race_results` (
  `idRider` bigint(20) NOT NULL,
  `idRace` bigint(20) NOT NULL,
  `session` varchar(255) NOT NULL,
  `total_time` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lap` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `DNF` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `rider`
--

CREATE TABLE `rider` (
  `idRider` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `race_performance` bigint(20) DEFAULT NULL,
  `qualy_performance` bigint(20) DEFAULT NULL,
  `wet_performance` bigint(20) DEFAULT NULL,
  `crash_possibility` float DEFAULT NULL,
  `idTeam` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `rider`
--

INSERT INTO `rider` (`idRider`, `name`, `surname`, `number`, `nation`, `race_performance`, `qualy_performance`, `wet_performance`, `crash_possibility`, `idTeam`) VALUES
(1, 'Francesco', 'Bagnaia', 63, 'Italy', 2, 4, 2, 6, 2),
(2, 'Enea', 'Bastianini', 23, 'Italy', 4, 8, 10, 1.5, 2),
(3, 'Jorge', 'Martin', 89, 'Spain', 1, 1, 13, 10.5, 7),
(4, 'Franco', 'Morbidelli', 21, 'Italy', 17, 20, 17, 21, 7),
(5, 'Alex', 'Marquez', 73, 'Spain', 11, 12, 16, 27, 3),
(6, 'Marc', 'Marquez', 93, 'Spain', 5, 3, 5, 18, 3),
(7, 'Luca', 'Marini', 10, 'Italy', 18, 16, 14, 4.5, 10),
(8, 'Joan', 'Mir', 36, 'Spain', 22, 18, 22, 33, 10),
(9, 'Fabio', 'Quartararo', 20, 'France', 8, 5, 15, 19.5, 5),
(10, 'Alex', 'Rins', 42, 'Spain', 16, 19, 8, 22.5, 5),
(11, 'Marco', 'Bezzecchi', 72, 'Italy', 9, 9, 6, 15, 6),
(12, 'Fabio', 'Di Giannantonio', 49, 'Italy', 14, 10, 12, 9, 6),
(13, 'Aleix', 'Espargaro', 41, 'Spain', 10, 5, 4, 7.5, 1),
(14, 'Maverick', 'Vinales', 12, 'Spain', 3, 2, 11, 13.5, 1),
(15, 'Raul', 'Fernandez', 25, 'Spain', 15, 15, 20, 24, 11),
(16, 'Miguel', 'Oliveira', 88, 'Portugal', 13, 14, 3, 12, 11),
(17, 'Johann', 'Zarco', 5, 'France', 20, 17, 9, 25.5, 4),
(18, 'Takaaki', 'Nakagami', 30, 'Japan', 21, 21, 19, 31.5, 4),
(19, 'Pedro', 'Acosta', 37, 'Spain', 7, 7, 18, 3, 8),
(20, 'Augusto', 'Fernandez', 89, 'Spain', 19, 22, 21, 30, 8),
(21, 'Brad', 'Binder', 33, 'South Africa', 6, 13, 1, 16.5, 9),
(22, 'Jack', 'Miller', 43, 'Australia', 12, 11, 7, 28.5, 9),
(23, 'David', 'Munoz', 64, 'Spain', 5, 14, 20, 20, 12),
(24, 'Joel', 'Kelso', 66, 'Australia', 4, 7, 1, 1, 12),
(25, 'Joel', 'Esteban', 78, 'Spain', 13, 17, 25, 15, 13),
(26, 'David', 'Alonso', 80, 'Spain', 2, 2, 10, 3, 13),
(27, 'Riccardo', 'Rossi', 54, 'Italy', 11, 5, 4, 26, 14),
(28, 'Noah', 'Dettwiler', 55, 'Switzerland', 25, 25, 17, 18, 14),
(29, 'Tatchakorn', 'Buasri', 5, 'Thailand', 26, 22, 15, 9, 15),
(30, 'Taiyo', 'Furusato', 72, 'Japan', 18, 19, 5, 12, 15),
(31, 'Adrian', 'Fernandez', 31, 'Spain', 16, 20, 3, 25, 16),
(32, 'Angel', 'Piqueras', 36, 'Spain', 6, 15, 26, 13, 16),
(33, 'Tatsuki', 'Suzuki', 24, 'Japan', 24, 26, 7, 10, 17),
(34, 'Collin', 'Veijer', 96, 'Netherlands', 3, 1, 2, 19, 17),
(35, 'Scott', 'Ogden', 19, 'United Kingdom', 19, 23, 16, 22, 18),
(36, 'Joshua', 'Whatley', 70, 'United Kingdom', 22, 24, 18, 16, 18),
(37, 'Ryusei', 'Yamanaka', 6, 'Japan', 14, 6, 23, 4, 19),
(38, 'Ivan', 'Ortola', 48, 'Spain', 12, 13, 13, 6, 19),
(39, 'Nicola', 'Carraro', 10, 'Italy', 23, 21, 8, 17, 20),
(40, 'Stefano', 'Nepa', 82, 'Italy', 10, 9, 9, 2, 20),
(41, 'Jacob', 'Roulstone', 12, 'United Kingdom', 15, 18, 19, 5, 21),
(42, 'Daniel', 'Holgado', 96, 'Spain', 1, 3, 12, 8, 21),
(43, 'Xabi', 'Zurutuza', 85, 'Spain', 21, 12, 24, 11, 22),
(44, 'Jose Antonio', 'Rueda', 99, 'Spain', 7, 4, 11, 21, 22),
(45, 'Matteo', 'Bertelle', 18, 'Italy', 9, 8, 6, 7, 23),
(46, 'David', 'Almansa', 22, 'Spain', 8, 16, 14, 14, 23),
(47, 'Filippo', 'Farioli', 7, 'Italy', 17, 10, 22, 24, 24),
(48, 'Luca', 'Lunetta', 58, 'Italy', 20, 11, 21, 23, 24),
(49, 'Sergio', 'Garcia', 3, 'Spain', 2, 3, 15, 3, 32),
(50, 'Jaume', 'Masia', 5, 'Spain', 27, 28, 30, 22, 34),
(51, 'Barry', 'Baltus', 7, 'Belgium', 19, 16, 19, 19, 37),
(52, 'Diogo', 'Moreira', 10, 'Brasil', 17, 17, 20, 12, 30),
(53, 'Filip', 'Salač', 12, 'Cech Republic', 13, 12, 17, 15, 26),
(54, 'Celestino', 'Vietti', 13, 'Italy', 6, 8, 16, 2, 36),
(55, 'Tony', 'Arbolino', 14, 'Italy', 10, 13, 1, 1, 26),
(56, 'Darryn', 'Binder', 15, 'South Africa', 21, 26, 21, 24, 31),
(57, 'Joe', 'Roberts', 16, 'USA', 5, 6, 5, 14, 33),
(58, 'Alex', 'Escrig', 17, 'Spain', 25, 27, 23, 9, 28),
(59, 'Manuel', 'Gonzalez', 18, 'Spain', 8, 14, 10, 17, 35),
(60, 'Xavi', 'Cardelus', 20, 'Andorra', 29, 30, 25, 27, 27),
(61, 'Alonso', 'Lopez', 21, 'Spain', 3, 5, 14, 13, 38),
(62, 'Ayumu', 'Sasaki', 22, 'Japan', 26, 23, 29, 28, 39),
(63, 'Marcos', 'Ramírez', 24, 'Spain', 9, 10, 9, 7, 33),
(64, 'Izan', 'Guevara', 28, 'Spain', 24, 24, 6, 26, 25),
(65, 'Mario', 'Aji', 34, 'Indonesia', 30, 29, 24, 30, 29),
(66, 'Somkiat', 'Chantra', 35, 'Thailand', 20, 15, 7, 25, 29),
(67, 'Xavier', 'Artigas', 43, 'Spain', 28, 22, 28, 23, 28),
(68, 'Aron', 'Canet', 44, 'Spain', 4, 1, 2, 4, 27),
(69, 'Jeremy', 'Alcoba', 52, 'Spain', 14, 19, 4, 21, 39),
(70, 'Deniz', 'Oncu', 53, 'Turkey', 23, 21, 22, 10, 36),
(71, 'Fermin', 'Aldeguer', 54, 'Spain', 1, 2, 3, 5, 38),
(72, 'Bo', 'Bendsneyder', 64, 'Netherlands', 18, 20, 8, 20, 34),
(73, 'Dennis', 'Foggia', 71, 'Italy', 12, 7, 13, 6, 30),
(74, 'Albert', 'Arenas', 75, 'Spain', 11, 4, 11, 16, 35),
(75, 'Ai', 'Ogura', 79, 'Japan', 7, 9, 12, 8, 32),
(76, 'Senna', 'Agius', 81, 'Australia', 22, 25, 27, 18, 31),
(77, 'Zonta', 'V d Goorbergh', 84, 'Netherlands', 16, 18, 26, 11, 37),
(78, 'Jake', 'Dixon', 96, 'United Kingdom', 15, 11, 18, 29, 25);

-- --------------------------------------------------------

--
-- Struttura della tabella `season`
--

CREATE TABLE `season` (
  `idSeason` bigint(20) NOT NULL,
  `year` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `season`
--

INSERT INTO `season` (`idSeason`, `year`) VALUES
(1, 2024),
(2, 2025);

-- --------------------------------------------------------

--
-- Struttura della tabella `standings`
--

CREATE TABLE `standings` (
  `idRider` bigint(20) NOT NULL,
  `idSeason` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `idCategory` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `standings`
--

INSERT INTO `standings` (`idRider`, `idSeason`, `points`, `idCategory`) VALUES
(1, 1, 0, 1),
(2, 1, 0, 1),
(3, 1, 0, 1),
(4, 1, 0, 1),
(5, 1, 0, 1),
(6, 1, 0, 1),
(7, 1, 0, 1),
(8, 1, 0, 1),
(9, 1, 0, 1),
(10, 1, 0, 1),
(11, 1, 0, 1),
(12, 1, 0, 1),
(13, 1, 0, 1),
(14, 1, 0, 1),
(15, 1, 0, 1),
(16, 1, 0, 1),
(17, 1, 0, 1),
(18, 1, 0, 1),
(19, 1, 0, 1),
(20, 1, 0, 1),
(21, 1, 0, 1),
(22, 1, 0, 1),
(23, 1, 0, 3),
(24, 1, 0, 3),
(25, 1, 0, 3),
(26, 1, 0, 3),
(27, 1, 0, 3),
(28, 1, 0, 3),
(29, 1, 0, 3),
(30, 1, 0, 3),
(31, 1, 0, 3),
(32, 1, 0, 3),
(33, 1, 0, 3),
(34, 1, 0, 3),
(35, 1, 0, 3),
(36, 1, 0, 3),
(37, 1, 0, 3),
(38, 1, 0, 3),
(39, 1, 0, 3),
(40, 1, 0, 3),
(41, 1, 0, 3),
(42, 1, 0, 3),
(43, 1, 0, 3),
(44, 1, 0, 3),
(45, 1, 0, 3),
(46, 1, 0, 3),
(47, 1, 0, 3),
(48, 1, 0, 3),
(49, 1, 0, 2),
(50, 1, 0, 2),
(51, 1, 0, 2),
(52, 1, 0, 2),
(53, 1, 0, 2),
(54, 1, 0, 2),
(55, 1, 0, 2),
(56, 1, 0, 2),
(57, 1, 0, 2),
(58, 1, 0, 2),
(59, 1, 0, 2),
(60, 1, 0, 2),
(61, 1, 0, 2),
(62, 1, 0, 2),
(63, 1, 0, 2),
(64, 1, 0, 2),
(65, 1, 0, 2),
(66, 1, 0, 2),
(67, 1, 0, 2),
(68, 1, 0, 2),
(69, 1, 0, 2),
(70, 1, 0, 2),
(71, 1, 0, 2),
(72, 1, 0, 2),
(73, 1, 0, 2),
(74, 1, 0, 2),
(75, 1, 0, 2),
(76, 1, 0, 2),
(77, 1, 0, 2),
(78, 1, 0, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `team`
--

CREATE TABLE `team` (
  `idTeam` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `performance` bigint(20) DEFAULT NULL,
  `idCategory` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `team`
--

INSERT INTO `team` (`idTeam`, `name`, `nation`, `color`, `performance`, `idCategory`) VALUES
(1, 'Aprilia Racing', 'Italy', '5cb33a', 3, 1),
(2, 'Ducati Lenovo Team', 'Italy', 'cc0000', 1, 1),
(3, 'Gresini Racing', 'Italy', '9db4d9', 5, 1),
(4, 'LCR Honda', 'Japan', 'ffffff', 10, 1),
(5, 'Monster Energy Yamaha', 'Japan', '0c368c', 8, 1),
(6, 'Pertamina Enduro VR46 Racing Team', 'Italy', 'dbff03', 6, 1),
(7, 'Prima Pramac Racing', 'Italy', '8234c2', 2, 1),
(8, 'Red Bull GASGAS Tech3', 'Austria', '990726', 6, 1),
(9, 'Red Bull KTM Factory Racing', 'Austria', 'ff6600', 4, 1),
(10, 'Repsol Honda Team', 'Japan', 'ffa00f', 9, 1),
(11, 'Trackhouse Racing', 'USA', '0066cc', 7, 1),
(12, 'BOE Motorsports', 'Spain', 'd1ff18', NULL, 3),
(13, 'CFMOTO Aspar Team', 'Spain', '007984', NULL, 3),
(14, 'CIP Green Power\r\n', 'France', '77d25c', NULL, 3),
(15, 'Honda Team Asia', 'Japan', 'ffffff', NULL, 3),
(16, 'Leopard Racing', 'Luxembourg', '75cbd1', NULL, 3),
(17, 'Liqui Moly Husqvarna Intact GP', 'Germany', '344966', NULL, 3),
(18, 'MLav Racing\r\n', 'United Kingdom', '00a19c', NULL, 3),
(19, 'MT Helmets MSI', 'Spain', 'eb9354', NULL, 3),
(20, 'MTA Team', 'Italy', 'fe1a8b', NULL, 3),
(21, 'Red Bull GASGAS Tech3', 'Austria', 'eb9354', NULL, 3),
(22, 'Red Bull KTM Ajo\r\n', 'Austria', 'ff6600', NULL, 3),
(23, 'Rivacold Snipers Team\r\n', 'Italy', 'ffe000', NULL, 3),
(24, 'SIC58 Squadra Corse', 'Italy', 'e42327', NULL, 3),
(25, 'CFMOTO Aspar Team', 'Spain', '007984', NULL, 2),
(26, 'ELF Marc VDS Racing Team', 'Belgium', '682a38', NULL, 2),
(27, 'Fantic Racing', 'Italy', 'e4032c', NULL, 2),
(28, 'Forward Team', 'Italy', '7bdcb5', NULL, 2),
(29, 'IDEMITSU Honda Team Asia', 'Japan', 'a39a65', NULL, 2),
(30, 'Italtrans Racing Team', 'Italy', '106ba9', NULL, 2),
(31, 'Liqui Moly Husqvarna Intact GP', 'Germany', '344966', NULL, 2),
(32, 'MT Helmets MSI', 'Spain\r\n', 'eb9354\r\n', NULL, 2),
(33, 'OnlyFans American Racing Team', 'USA', '0a28a3', NULL, 2),
(34, 'Pertamina Mandalika GAS UP Team', 'Indonesia', 'd83a3b', NULL, 2),
(35, 'QJMOTOR Gresini Moto2', 'Italy', '9db4d9', NULL, 2),
(36, 'Red Bull KTM Ajo', 'Austria', 'ff6600', NULL, 2),
(37, 'RW Racing GP', 'Netherlands', 'ffffff', NULL, 2),
(38, 'SpeedUp Racing', 'Italy', 'f08019', NULL, 2),
(39, 'Yamaha VR46 Master Camp Team', 'Japan', 'e0ff00', NULL, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `track`
--

CREATE TABLE `track` (
  `idTrack` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lap_time` bigint(20) NOT NULL,
  `race_distance` int(11) NOT NULL,
  `percentage_rain` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `track`
--

INSERT INTO `track` (`idTrack`, `name`, `lap_time`, `race_distance`, `percentage_rain`) VALUES
(1, 'Qatar Airways Grand Prix of Qatar', 110759, 21, 2),
(2, 'Grande Premio Tissot de Portugal', 97706, 25, 15),
(3, 'Red Bull Grand Prix of The Americas', 120864, 20, 8),
(4, 'Gran Premio Estrella Galicia 0,0 de Espana', 97216, 25, 10),
(5, 'Michelin Grand Prix de France', 90705, 27, 20),
(6, 'Gran Premi Monster Energy de Catalunya', 98639, 24, 15),
(7, 'Gran Premio d\'Italia', 104855, 23, 20),
(8, 'Grand Prix of Kazakhstan', 96404, 26, 10),
(9, 'Motul TT Assen', 91472, 26, 20),
(10, 'Liqui Moly Motorrad Grand Prix Deutschland', 81409, 30, 25),
(11, 'Monster Energy British Grand Prix', 117767, 20, 30),
(12, 'Motorrad Grand Prix von Osterreich', 88539, 28, 15),
(13, 'Gran Premio GoPro de Aragon', 106069, 23, 10),
(14, 'Gran Premio Red Bull di San Marino e della Riviera di Rimini', 90390, 27, 15),
(15, 'Grand Prix of India', 103947, 22, 20),
(16, 'Pertamina Grand Prix of Indonesia', 89978, 27, 35),
(17, 'Motul Grand Prix of Japan', 103198, 24, 25),
(18, 'Australian Motorcycle Grand Prix', 87246, 27, 15),
(19, 'OR Thalland Grand Prix', 89287, 26, 20),
(20, 'PETRONAS Grand Prix of Malaysia', 117491, 20, 15),
(21, 'Gran Premio Motul de la Comunitat Valenciana', 88931, 27, 5);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indici per le tabelle `meteo`
--
ALTER TABLE `meteo`
  ADD PRIMARY KEY (`idMeteo`);

--
-- Indici per le tabelle `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`points`,`position`,`session`);

--
-- Indici per le tabelle `qualifying`
--
ALTER TABLE `qualifying`
  ADD PRIMARY KEY (`idRace`,`idRider`,`session`) USING BTREE,
  ADD KEY `idRider` (`idRider`);

--
-- Indici per le tabelle `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`idRace`),
  ADD KEY `idMeteo` (`idMeteo`),
  ADD KEY `idSeason` (`idSeason`),
  ADD KEY `idTrack` (`idTrack`);

--
-- Indici per le tabelle `race_results`
--
ALTER TABLE `race_results`
  ADD PRIMARY KEY (`idRider`,`idRace`,`session`,`lap`) USING BTREE,
  ADD KEY `idRace` (`idRace`);

--
-- Indici per le tabelle `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`idRider`),
  ADD KEY `idTeam` (`idTeam`);

--
-- Indici per le tabelle `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`idSeason`);

--
-- Indici per le tabelle `standings`
--
ALTER TABLE `standings`
  ADD PRIMARY KEY (`idSeason`,`idRider`),
  ADD KEY `idRider` (`idRider`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Indici per le tabelle `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idTeam`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Indici per le tabelle `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`idTrack`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `meteo`
--
ALTER TABLE `meteo`
  MODIFY `idMeteo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `race`
--
ALTER TABLE `race`
  MODIFY `idRace` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `rider`
--
ALTER TABLE `rider`
  MODIFY `idRider` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT per la tabella `season`
--
ALTER TABLE `season`
  MODIFY `idSeason` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `team`
--
ALTER TABLE `team`
  MODIFY `idTeam` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT per la tabella `track`
--
ALTER TABLE `track`
  MODIFY `idTrack` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `qualifying`
--
ALTER TABLE `qualifying`
  ADD CONSTRAINT `qualifying_ibfk_1` FOREIGN KEY (`idRace`) REFERENCES `race` (`idRace`),
  ADD CONSTRAINT `qualifying_ibfk_2` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`);

--
-- Limiti per la tabella `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `race_ibfk_1` FOREIGN KEY (`idMeteo`) REFERENCES `meteo` (`idMeteo`),
  ADD CONSTRAINT `race_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`),
  ADD CONSTRAINT `race_ibfk_3` FOREIGN KEY (`idTrack`) REFERENCES `track` (`idTrack`);

--
-- Limiti per la tabella `race_results`
--
ALTER TABLE `race_results`
  ADD CONSTRAINT `race_results_ibfk_1` FOREIGN KEY (`idRace`) REFERENCES `race` (`idRace`),
  ADD CONSTRAINT `race_results_ibfk_2` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`);

--
-- Limiti per la tabella `rider`
--
ALTER TABLE `rider`
  ADD CONSTRAINT `rider_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `team` (`idTeam`);

--
-- Limiti per la tabella `standings`
--
ALTER TABLE `standings`
  ADD CONSTRAINT `standings_ibfk_1` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`),
  ADD CONSTRAINT `standings_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`),
  ADD CONSTRAINT `standings_ibfk_3` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`);

--
-- Limiti per la tabella `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
