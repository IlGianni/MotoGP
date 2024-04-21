-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2024 alle 20:12
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
-- Indici per le tabelle `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`idTrack`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `track`
--
ALTER TABLE `track`
  MODIFY `idTrack` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
