-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2024 alle 20:11
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
  `idTeam` bigint(20) NOT NULL
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

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`idRider`),
  ADD KEY `idTeam` (`idTeam`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `rider`
--
ALTER TABLE `rider`
  MODIFY `idRider` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `rider`
--
ALTER TABLE `rider`
  ADD CONSTRAINT `rider_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `team` (`idTeam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
