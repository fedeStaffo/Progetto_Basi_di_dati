-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Creato il: Dic 26, 2022 alle 20:08
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquistomacc`
--

CREATE TABLE `acquistomacc` (
  `Macchinario` int(11) NOT NULL,
  `Cliente` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `acquistomacc`
--

INSERT INTO `acquistomacc` (`Macchinario`, `Cliente`) VALUES
(16, '10128395405'),
(90, '10128395405'),
(2, '14617938604'),
(11, '15268876497'),
(12, '16058522218'),
(6, '16497514769'),
(17, '16735731623'),
(60, '22174266763'),
(7, '26041915147'),
(18, '26041915147'),
(21, '26368001629'),
(40, '26368001629'),
(150, '26956659580'),
(26, '28054881706'),
(64, '28054881706'),
(53, '31713344653'),
(5, '32142173559'),
(70, '32142173559'),
(39, '32871434744'),
(71, '32871434744'),
(13, '33315005088'),
(14, '33315005088'),
(25, '36144094207'),
(29, '41012850653'),
(30, '42454205237'),
(42, '43849287106'),
(56, '45265299447'),
(73, '48925706556'),
(41, '49335238861'),
(1, '49386669284'),
(44, '49386669284'),
(54, '54936494783'),
(9, '55429180819'),
(74, '56934816291'),
(72, '65235797314'),
(75, '66098192582'),
(76, '68249353645'),
(77, '69090775976'),
(57, '71471551684'),
(78, '72304749147'),
(79, '73586436589'),
(80, '76091394328'),
(22, '78989412550'),
(81, '81383350644'),
(82, '82026462441'),
(55, '83007757185'),
(10, '83229080007'),
(63, '89167280676'),
(83, '90452571726'),
(84, '90523111782'),
(59, '93269259186'),
(85, '95202775872'),
(86, '95890272415'),
(15, '96799763888'),
(8, '97925277933'),
(58, '97925277933'),
(87, '99528944960');

-- --------------------------------------------------------

--
-- Struttura della tabella `assistenzacons`
--

CREATE TABLE `assistenzacons` (
  `Cons` int(11) NOT NULL,
  `Ticket` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `assistenzacons`
--

INSERT INTO `assistenzacons` (`Cons`, `Ticket`) VALUES
(18, 1),
(11, 5),
(3, 6),
(7, 9),
(20, 9),
(10, 56),
(14, 63),
(2, 64),
(4, 65);

-- --------------------------------------------------------

--
-- Struttura della tabella `assistenzamacc`
--

CREATE TABLE `assistenzamacc` (
  `Ticket` int(10) NOT NULL,
  `Tecnico` int(4) NOT NULL,
  `Macchina` int(11) NOT NULL,
  `NumOre` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `assistenzamacc`
--

INSERT INTO `assistenzamacc` (`Ticket`, `Tecnico`, `Macchina`, `NumOre`) VALUES
(12, 1, 6, 6),
(12, 8, 6, 6),
(13, 1, 72, 5),
(13, 4, 72, 15),
(13, 8, 72, 3),
(14, 1, 71, 7),
(14, 3, 71, 4),
(15, 2, 54, 3),
(15, 7, 54, 1),
(17, 1, 13, 3),
(17, 7, 13, 3),
(19, 1, 6, 10),
(19, 4, 6, 8),
(20, 5, 5, 15),
(21, 1, 9, 5),
(21, 3, 9, 2),
(59, 2, 16, 5),
(59, 3, 16, 5),
(60, 1, 14, 10),
(61, 5, 11, 5),
(62, 2, 12, 7),
(69, 8, 64, 5),
(71, 5, 5, 8),
(72, 5, 13, 5),
(73, 5, 25, 6),
(75, 7, 30, 9),
(75, 8, 30, 6),
(76, 2, 42, 5),
(78, 2, 73, 5),
(78, 7, 73, 10),
(80, 3, 1, 5),
(80, 6, 1, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Partita_IVA` char(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Stato` varchar(20) NOT NULL,
  `Saldo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`Partita_IVA`, `Nome`, `Stato`, `Saldo`) VALUES
('10128395405', 'Building Omega ', 'China', '+'),
('14617938604', 'Innovation Studio', 'Italy', '+'),
('15268876497', 'Bell Star East', 'France', '+'),
('16058522218', 'Innovation Atlantic', 'Slovakia', '+'),
('16497514769', 'Bell Building', 'Denmark', '+'),
('16735731623', 'Network Atlantic', 'Portugal', '+'),
('22174266763', 'Architecture Spa', 'Italy', '+'),
('26041915147', 'Analysis Interactive', 'Italy', '-'),
('26368001629', 'Solutions Frontier', 'United Kingdom', '+'),
('26956659580', 'Resource Team', 'Italy', '-'),
('28054881706', 'Stark Industries', 'USA', '+'),
('31713344653', 'Graphics Max Source', 'USA', '-'),
('32142173559', 'Analysis Net', 'USA', '+'),
('32871434744', 'Galaxy Electronic', 'Canada', '+'),
('33315005088', 'Solutions Power', 'Germany', '+'),
('36144094207', 'Hardware Provider', 'Italy', '+'),
('41012850653', 'Star Net', 'Croatia', '-'),
('42454205237', 'Research Net East', 'Czech Republic', '+'),
('43849287106', 'Systems Interactive', 'Italy', '+'),
('45265299447', 'West Construction', 'Italy', '-'),
('48925706556', 'Samsung Italia', 'Italy', '+'),
('49335238861', 'Data Studio', 'Vatican City', '-'),
('49386669284', 'Analysis Signal', 'Saudi Arabia', '+'),
('54936494783', 'Studio Provider', 'Turkey', '+'),
('55429180819', 'General Telecom', 'Italy', '+'),
('56934816291', 'South Industries', 'India', '+'),
('65235797314', 'Net Industries', 'Japan', '+'),
('66098192582', 'Vision Graphics ', 'Luxembourg', '+'),
('68249353645', 'WestPacific Hardware', 'USA', '-'),
('69090775976', 'Advanced Frontier', 'Italy', '+'),
('71471551684', 'ConstructionWest', 'USA', '-'),
('71475599444', 'Electronic General', 'South Africa', '-'),
('72304749147', 'Advanced Source', 'Taiwan', '-'),
('73586436589', 'General Spa', 'Italy', '+'),
('76091394328', 'Contract Solutions', 'Italy', '+'),
('78989412550', 'Application Contract', 'Canada', '+'),
('81383350644', 'Machine Building', 'Italy', '+'),
('82026462441', 'Medicine Advanced', 'USA', '-'),
('83007757185', 'Adventure Direct', 'Luxembourg', '+'),
('83229080007', 'Research Vision Net', 'Austria', '-'),
('89167280676', 'Hill Application', 'Italy', '-'),
('90452571726', 'Venture Power Data', 'New Zealand', '+'),
('90523111782', 'Virtual Medicine', 'Morocco', '+'),
('93269259186', 'Power Vision', 'Italy', '-'),
('93685664951', 'Analysis Star System', 'Lithuania', '-'),
('95202775872', 'Consulting Building ', 'Albania', '+'),
('95890272415', 'Frontier Galaxy Net', 'Estonia', '+'),
('96799763888', 'Robotics Jons', 'Canada', '+'),
('97925277933', 'Bell Pacific', 'New Zealand', '+'),
('99528944960', 'Hill Net Internet', 'Austria', '+');

-- --------------------------------------------------------

--
-- Struttura della tabella `consumabile`
--

CREATE TABLE `consumabile` (
  `IDConsumabile` int(11) NOT NULL,
  `Categoria` varchar(15) NOT NULL,
  `Prezzo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `consumabile`
--

INSERT INTO `consumabile` (`IDConsumabile`, `Categoria`, `Prezzo`) VALUES
(1, 'Feltri', 15),
(2, 'Lampade', 25),
(3, 'Lampade', 25),
(4, 'Penne', 20),
(5, 'Punzoni', 40),
(6, 'Frese', 18),
(7, 'Penne', 20),
(8, 'Punzoni', 40),
(9, 'Frese', 18),
(10, 'Punzoni', 40),
(11, 'PC', 300),
(12, 'Lame di taglio', 100),
(13, 'PC', 300),
(14, 'Fustelle', 30),
(15, 'Fustelle', 30),
(16, 'Fustelle', 30),
(17, 'Lampade', 25),
(18, 'Fustelle', 30),
(19, 'Penne', 20),
(20, 'Feltri', 15),
(21, 'Feltri', 15),
(23, 'Feltri', 15),
(24, 'Feltri', 15),
(25, 'Frese', 18),
(26, 'Frese', 18),
(27, 'Frese', 18),
(28, 'Fustelle', 30),
(29, 'Lame di taglio', 100),
(30, 'Lame di taglio', 100),
(31, 'Lame di taglio', 100),
(32, 'Lame di taglio', 100),
(33, 'Lampade', 25),
(34, 'Lampade ', 25),
(35, 'PC', 300),
(36, 'PC', 300),
(37, 'PC', 300),
(38, 'Penne', 20),
(39, 'Penne', 20),
(40, 'Punzoni', 40),
(41, 'Punzoni', 40);

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

CREATE TABLE `contratto` (
  `IDContratto` int(5) NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `Canone` int(4) NOT NULL,
  `Banca` varchar(20) NOT NULL,
  `Cliente` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `contratto`
--

INSERT INTO `contratto` (`IDContratto`, `DataInizio`, `DataFine`, `Canone`, `Banca`, `Cliente`) VALUES
(1, '2020-03-14', '2023-03-14', 800, 'National Bank', '15268876497'),
(2, '2020-05-29', '2023-05-29', 1000, 'Credit Union', '16058522218'),
(3, '2020-09-01', '2023-09-01', 400, 'Evolution Bancorp', '16497514769'),
(4, '2020-12-20', '2023-12-20', 7000, 'Apex Bank', '16735731623'),
(5, '2020-12-29', '2020-12-29', 8500, 'Premium Bank', '22174266763'),
(6, '2020-12-30', '2023-12-30', 3000, 'Premium Bank', '26041915147'),
(7, '2021-05-08', '2024-05-11', 6000, 'Spring Financial', '54936494783'),
(8, '2021-05-11', '2024-05-11', 300, 'Spring Financial', '28054881706'),
(9, '2021-05-20', '2024-05-20', 100, 'Capital Trust', '76091394328'),
(10, '2021-05-25', '2024-05-25', 3500, 'Capital Trust', '81383350644'),
(11, '2021-07-30', '2024-07-30', 5000, 'Joint Credit Union', '33315005088'),
(12, '2021-07-23', '2024-07-23', 8000, 'Joint Credit Union', '95202775872'),
(13, '2021-08-16', '2024-08-16', 7600, 'Velvet Bank', '83229080007'),
(14, '2021-09-11', '2024-09-11', 3400, 'Velvet Bank', '68249353645'),
(15, '2022-12-11', '2025-12-11', 300, 'China Bank', '10128395405'),
(16, '2022-08-09', '2025-08-09', 500, 'Intesa Sanpaolo', '14617938604'),
(17, '2021-01-02', '2024-01-02', 200, 'Premium Bank', '31713344653'),
(18, '2021-01-05', '2024-01-05', 4000, 'Premium Bank', '83007757185'),
(19, '2021-02-03', '2024-02-03', 1500, 'Capital Trust', '32142173559'),
(20, '2021-02-10', '2024-02-10', 150, 'Capital Trust', '82026462441'),
(21, '2021-03-05', '2024-03-05', 3700, 'Flow Banks', '43849287106'),
(22, '2021-03-13', '2024-03-13', 2500, 'Flow Banks', '90452571726'),
(23, '2021-04-18', '2024-04-18', 8500, 'Miracle Bank', '71471551684'),
(24, '2021-04-20', '2021-04-20', 9000, 'Miracle Bank', '55429180819'),
(25, '2021-10-19', '2024-10-19', 5200, 'Grade Holdings', '26368001629'),
(26, '2021-11-30', '2024-11-30', 5000, 'Grade Holdings', '93685664951'),
(27, '2021-12-06', '2024-12-06', 800, 'Ace Bank', '99528944960'),
(28, '2022-01-15', '2025-01-15', 7000, 'Ace Bank', '41012850653'),
(29, '2022-03-17', '2025-03-17', 4500, 'Ace Bank', '49335238861'),
(30, '2022-04-10', '2025-04-10', 200, 'Ace Bank', '66098192582'),
(31, '2022-12-05', '2025-12-05', 1200, 'National Bank', '97925277933'),
(32, '2022-08-09', '2025-08-09', 2000, 'Premium Bank', '96799763888'),
(33, '2020-12-02', '2023-12-02', 400, 'Capital Trust', '95890272415'),
(34, '2019-12-31', '2022-12-31', 600, 'Joint Credit Union', '93269259186'),
(35, '2022-04-06', '2025-04-06', 800, 'Joint Credit Union', '89167280676'),
(36, '2020-12-09', '2023-12-09', 1000, 'Credit Union', '45265299447'),
(37, '2022-01-01', '2025-12-01', 450, 'Joint Credit Union', '73586436589'),
(38, '2020-03-11', '2023-03-11', 550, 'Premium Bank', '69090775976'),
(39, '2022-07-04', '2025-07-04', 600, 'Credit Union', '65235797314'),
(40, '2021-05-05', '2024-05-05', 750, 'Credit Union', '56934816291');

-- --------------------------------------------------------

--
-- Struttura della tabella `datianagrafici`
--

CREATE TABLE `datianagrafici` (
  `CodiceFiscale` char(16) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Sesso` char(1) NOT NULL,
  `DataNascita` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `datianagrafici`
--

INSERT INTO `datianagrafici` (`CodiceFiscale`, `Nome`, `Cognome`, `Sesso`, `DataNascita`) VALUES
('BNCLRA92R10H501M', 'Laura', 'Bianchi', 'F', '1992-10-10'),
('CRLGDU93S01G479I', 'Guido', 'Carli', 'M', '1993-11-01'),
('DLCLSE84C69F839X', 'Elisa', 'Di Luca', 'F', '1984-03-29'),
('DRGLDA66T19A271W', 'Aldo', 'Draghi', 'M', '1966-12-19'),
('LGUVRD90M03H501U', 'Luigi', 'Verdi', 'M', '1990-08-03'),
('RMNFNC74S31E783J', 'Franco', 'Armandi', 'M', '1983-10-05'),
('RSSMRA78E20F205O', 'Mario', 'Rossi', 'M', '1978-05-20'),
('TRLNRC96D04G482Z', 'Enrico', 'Tarli', 'M', '1996-04-04');

-- --------------------------------------------------------

--
-- Struttura della tabella `datilavorativi`
--

CREATE TABLE `datilavorativi` (
  `IDTecnico` int(4) NOT NULL,
  `Resident` varchar(2) NOT NULL,
  `CF` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `datilavorativi`
--

INSERT INTO `datilavorativi` (`IDTecnico`, `Resident`, `CF`) VALUES
(1, 'si', 'TRLNRC96D04G482Z'),
(2, 'si', 'CRLGDU93S01G479I'),
(3, 'no', 'BNCLRA92R10H501M'),
(4, 'no', 'DLCLSE84C69F839X'),
(5, 'si', 'LGUVRD90M03H501U'),
(6, 'si', 'DRGLDA66T19A271W'),
(7, 'no', 'RMNFNC74S31E783J'),
(8, 'si', 'RSSMRA78E20F205O');

-- --------------------------------------------------------

--
-- Struttura della tabella `emailcliente`
--

CREATE TABLE `emailcliente` (
  `Email` varchar(30) NOT NULL,
  `NumCliente` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `emailcliente`
--

INSERT INTO `emailcliente` (`Email`, `NumCliente`) VALUES
('buildingomega@gmail.com', '10128395405'),
('studioinn@virgilio.it', '14617938604'),
('bellstar@gmail.com', '15268876497'),
('atlanticinn@gmail.com', '16058522218'),
('bellbuilding@gmail.com', '16497514769'),
('atlnet@gmail.com', '16735731623'),
('archspa@libero.it', '22174266763'),
('analisispa@virgilio.it', '26368001629'),
('solfrontier@gmail.com', '26368001629'),
('resteam@yahoo.it', '26956659580'),
('starind@gmail.com', '28054881706'),
('graphspa@gmail.com', '31713344653'),
('analisysnet@gmail.com', '32142173559'),
('galaxyel@gmail.com', '32871434744'),
('solpow@gmail.com', '33315005088'),
('hardwareita@virgilio.it', '36144094207'),
('starnet@gmail.com', '41012850653'),
('resnet@gmail.com', '42454205237'),
('interactivesist@alice.it', '43849287106'),
('wconst@libero.it', '45265299447'),
('samsungitaly@gmail.com', '48925706556'),
('datastudio@libero.it', '49335238861'),
('ansign@gmail.com', '49386669284'),
('providerstudio@gmail.com', '55429180819'),
('telecomit@gmail.com', '55429180819'),
('southind@gmail.com', '56934816291'),
('netind@gmail.com', '65235797314'),
('visiongraph@gmail.com', '66098192582'),
('hardwarewest@gmail.com', '68249353645'),
('advfrontier@gmail.com', '69090775976'),
('constrwest@gmail.com', '71471551684'),
('electgeneral@gmail.com', '71475599444'),
('advsource@gmail.com', '72304749147'),
('generalita@alice.it', '73586436589'),
('contractsol@virgilio.it', '76091394328'),
('appcontr@gmail.com', '78989412550'),
('medbuildspa@gmail.com', '81383350644'),
('medspa@gmail.com', '82026462441'),
('adventurspa@gmail.com', '83007757185'),
('resvision@gmail.com', '83229080007'),
('hillapp@alice.it', '89167280676'),
('venturepow@gmail.com', '90452571726'),
('powvision@virgilio.it', '90523111782'),
('starsystem@gmail.com', '93269259186'),
('consbuilding@gmail.com', '95202775872'),
('frontiergalaxy@gmail.com', '95890272415'),
('roboticsjohns@gmail.com', '96799763888'),
('bellpacific@gmail.com', '97925277933'),
('hnet@gmail.com', '99528944960');

-- --------------------------------------------------------

--
-- Struttura della tabella `emailtecnico`
--

CREATE TABLE `emailtecnico` (
  `Email` varchar(30) NOT NULL,
  `NumTecnico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `emailtecnico`
--

INSERT INTO `emailtecnico` (`Email`, `NumTecnico`) VALUES
('enrico.tarli@gmail.com', 1),
('enricotarli.elitron@gmail.com', 1),
('gcarli@gmail.com', 2),
('laura.binachi@libero.it', 3),
('lbianchi@gmail.com', 3),
('edluca@libero.it', 4),
('luigi.verdi@gmail.com', 5),
('aldodraghi@alice.it', 6),
('farmandi@gmail.com', 7),
('franco.armandi@libero.it', 7),
('m.rossi@gmail.com', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `garanzia`
--

CREATE TABLE `garanzia` (
  `IDGaranzia` int(7) NOT NULL,
  `DataInstallazione` date NOT NULL DEFAULT current_timestamp(),
  `LuogoInstallazione` varchar(20) NOT NULL,
  `Scadenza` date DEFAULT NULL,
  `Macc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `garanzia`
--

INSERT INTO `garanzia` (`IDGaranzia`, `DataInstallazione`, `LuogoInstallazione`, `Scadenza`, `Macc`) VALUES
(1, '2022-12-07', 'Ancona', '2023-12-07', 60),
(2, '2022-12-07', 'Amburgo', '2023-12-07', 13),
(3, '2020-09-25', 'Calgary', '2021-09-25', 22),
(4, '2014-03-02', 'Torino', '2015-03-02', 9),
(5, '2020-12-07', 'Victoria', '2021-12-07', 71),
(6, '2021-12-16', 'Edimburgo', '2022-12-16', 40),
(7, '2018-06-08', 'Honolulu', '2019-06-08', 53),
(8, '2013-01-19', 'Liberec', '2014-01-19', 30),
(9, '2014-09-26', 'Adalia', '2015-09-26', 54),
(10, '2018-05-06', 'Ascoli', '2019-05-06', 56),
(11, '2014-03-24', 'Napoli', '2015-03-24', 42),
(12, '2014-08-13', 'Osaka', '2015-08-13', 72),
(13, '2013-06-05', 'Nitra', '2014-06-05', 12),
(14, '2020-10-07', 'Dunedin', '2021-10-07', 8),
(15, '2019-10-08', 'San Francisco', '2020-10-08', 64),
(16, '2021-07-26', 'Alessandria', '2022-07-26', 59),
(17, '2020-05-10', 'Los Angeles', '2021-05-10', 5),
(18, '2021-08-09', 'Minneapolis', '2022-08-09', 70),
(19, '2019-12-10', 'Gedda', '2020-12-10', 44),
(20, '2016-01-07', 'Ancona', '2017-01-07', 25),
(21, '2016-07-29', 'Marsiglia', '2017-07-29', 11),
(22, '2019-07-04', 'Pretoria', '2020-07-04', 57),
(23, '2018-10-23', 'Faro', '2019-10-23', 17),
(24, '2021-10-16', 'Palermo', '2022-10-16', 2),
(25, '2014-05-17', 'Findel', '2015-05-17', 55),
(26, '2013-09-10', 'Hamilton', '2014-09-10', 58),
(27, '2014-12-12', 'Windsor', '2015-12-12', 39),
(28, '2017-01-31', 'Riyad', '2018-01-31', 1),
(29, '2013-09-03', 'Manchester', '2014-09-03', 21),
(30, '2021-06-23', 'Firenze', '2022-06-23', 7),
(31, '2022-10-22', 'Shanghai', '2023-10-22', 16),
(32, '2015-11-01', 'Roma', '2016-11-01', 41),
(33, '2015-07-28', 'Copenaghen', '2016-07-28', 6),
(34, '2018-10-03', 'Linz', '2019-10-03', 10),
(35, '2020-08-19', 'Fermo', '2021-08-19', 63),
(36, '2018-03-17', 'Amburgo', '2019-03-17', 14),
(37, '2019-04-15', 'Ottawa', '2020-04-15', 15),
(38, '2017-03-18', 'Trento', '2018-03-18', 18),
(39, '2022-11-22', 'Detroit', '2023-11-22', 26),
(40, '2020-03-26', 'Pola', '2021-03-26', 29),
(42, '2022-12-21', 'Valona', '2023-12-21', 85),
(43, '2017-12-05', 'Perugia', '2018-12-05', 73),
(44, '2018-09-04', 'Varanasi', '2019-09-04', 74),
(45, '2022-11-02', 'Remich', '2023-11-02', 75),
(46, '2018-04-05', 'Chicago', '2019-04-05', 76),
(47, '2015-05-08', 'Milano', '2016-05-08', 77),
(48, '2022-12-07', 'Taipei', '2023-12-07', 78),
(49, '2013-06-01', 'Cosenza', '2014-06-01', 79),
(50, '2022-06-14', 'Genova', '2023-06-14', 80),
(51, '2022-05-05', 'Monte Giberto', '2023-05-05', 81),
(52, '2012-12-05', 'Boston', '2013-12-05', 82),
(53, '2017-06-09', 'Oban', '2018-06-09', 83),
(54, '2022-06-07', 'Rabat', '2023-06-07', 84),
(55, '2022-11-15', 'Narva', '2023-11-15', 86),
(56, '2022-12-22', 'Villaco', '2023-12-22', 87);

-- --------------------------------------------------------

--
-- Struttura della tabella `macchinario`
--

CREATE TABLE `macchinario` (
  `IDMacchinario` int(11) NOT NULL,
  `Categoria` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `macchinario`
--

INSERT INTO `macchinario` (`IDMacchinario`, `Categoria`) VALUES
(1, 'Kombo TH'),
(2, 'Kombo TAV'),
(5, 'Kombo TAV'),
(6, 'Spark'),
(7, 'Kombo TH'),
(8, 'Kombo STC'),
(9, 'Booster'),
(10, 'Spark'),
(11, 'Kombo TAV'),
(12, 'Kombo STC'),
(13, 'Booster'),
(14, 'Spark'),
(15, 'Spark'),
(16, 'Kombo TH'),
(17, 'Kombo TAV'),
(18, 'Spark'),
(21, 'Kombo TH'),
(22, 'Booster'),
(25, 'Kombo TAV'),
(26, 'Spark'),
(29, 'Spark'),
(30, 'Kombo STC'),
(39, 'Kombo TH'),
(40, 'Booster'),
(41, 'Spark'),
(42, 'Kombo STC'),
(44, 'Kombo TAV'),
(53, 'Booster'),
(54, 'Kombo STC'),
(55, 'Kombo TH'),
(56, 'Kombo STC'),
(57, 'Kombo TAV'),
(58, 'Kombo TH'),
(59, 'Kombo TAV'),
(60, 'Booster'),
(63, 'Spark'),
(64, 'Kombo STC'),
(70, 'Kombo TAV'),
(71, 'Booster'),
(72, 'Kombo STC'),
(73, 'Kombo STC'),
(74, 'Kombo TH'),
(75, 'Spark'),
(76, 'Booster'),
(77, 'Kombo TAV'),
(78, 'Kombo STC'),
(79, 'Kombo TH'),
(80, 'Booster'),
(81, 'Spark'),
(82, 'Spark'),
(83, 'Kombo TAV'),
(84, 'Kombo STC'),
(85, 'Kombo TH'),
(86, 'Booster'),
(87, 'Booster'),
(88, 'Kombo TAV'),
(89, 'Kombo STC'),
(90, 'Spark'),
(145, 'Kombo TAV'),
(146, 'Kombo TAV'),
(147, 'Kombo STC'),
(148, 'Kombo TH'),
(149, 'Spark'),
(150, 'Booster');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `ore_ticket_non_resident`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `ore_ticket_non_resident` (
`ID_Ticket` int(10)
,`Ore` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `ore_ticket_resident`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `ore_ticket_resident` (
`ID_Ticket` int(10)
,`Ore` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `specializzazione`
--

CREATE TABLE `specializzazione` (
  `Macchina` varchar(15) NOT NULL,
  `Tecnico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `specializzazione`
--

INSERT INTO `specializzazione` (`Macchina`, `Tecnico`) VALUES
('Booster', 1),
('Booster', 3),
('Booster', 5),
('Kombo STC', 2),
('Kombo STC', 7),
('Kombo STC', 8),
('Kombo TAV', 4),
('Kombo TAV', 5),
('Kombo TAV', 7),
('Kombo TH', 2),
('Kombo TH', 3),
('Kombo TH', 6),
('Kombo TH', 7),
('Spark', 1),
('Spark', 4),
('Spark', 6),
('Spark', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `telcliente`
--

CREATE TABLE `telcliente` (
  `Telefono` varchar(13) NOT NULL,
  `NumCliente` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `telcliente`
--

INSERT INTO `telcliente` (`Telefono`, `NumCliente`) VALUES
('+867410025845', '10128395405'),
('+868459321110', '10128395405'),
('+395846325965', '14617938604'),
('+338459821001', '15268876497'),
('+421856395211', '16058522218'),
('+458653203332', '16497514769'),
('+351269995127', '16735731623'),
('+396852244859', '22174266763'),
('+396523374870', '26041915147'),
('+448523496511', '26368001629'),
('+390145796426', '26956659580'),
('+111482611866', '28054881706'),
('+177095919533', '28054881706'),
('+169919923958', '31713344653'),
('+138805802387', '32142173559'),
('+167450953447', '32871434744'),
('+492284749036', '33315005088'),
('+393738297450', '36144094207'),
('+385171738154', '41012850653'),
('+420985933815', '42454205237'),
('+398231052306', '43849287106'),
('+390455940165', '45265299447'),
('+398706648324', '48925706556'),
('+379000000000', '49335238861'),
('+966747425197', '49386669284'),
('+903175939337', '54936494783'),
('+396672734501', '55429180819'),
('+912356686126', '56934816291'),
('+816598426580', '65235797314'),
('+352781012959', '66098192582'),
('+148619110484', '68249353645'),
('+398525949425', '69090775976'),
('+180519847170', '71471551684'),
('+180519847179', '71471551684'),
('+278393030160', '71475599444'),
('+886748403024', '72304749147'),
('+399349520095', '73586436589'),
('+398345499688', '76091394328'),
('+137374435110', '78989412550'),
('+394900414694', '81383350644'),
('+166322200671', '82026462441'),
('+166322200675', '82026462441'),
('+352995838638', '83007757185'),
('+431132819553', '83229080007'),
('+395851354922', '89167280676'),
('+640866950556', '90452571726'),
('+212181139851', '90523111782'),
('+394448603435', '93269259186'),
('+370044615215', '93685664951'),
('+355451947314', '95202775872'),
('+372746239502', '95890272415'),
('+115508348524', '96799763888'),
('+640313826560', '97925277933'),
('+433232859055', '99528944960');

-- --------------------------------------------------------

--
-- Struttura della tabella `teltecnico`
--

CREATE TABLE `teltecnico` (
  `Telefono` varchar(13) NOT NULL,
  `NumTecnico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `teltecnico`
--

INSERT INTO `teltecnico` (`Telefono`, `NumTecnico`) VALUES
('+395171085871', 1),
('+396149276258', 1),
('+391666957717', 2),
('+394952738127', 2),
('+397065834566', 3),
('+398364180032', 3),
('+391010743010', 4),
('+395474243083', 4),
('+391250995336', 5),
('+391899270130', 6),
('+390264624835', 7),
('+390750958932', 7),
('+397270167373', 7),
('+392333470968', 8),
('+396096706240', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `ticket`
--

CREATE TABLE `ticket` (
  `IDTicket` int(10) NOT NULL,
  `Causale` varchar(100) NOT NULL,
  `Priorita` varchar(10) DEFAULT NULL,
  `Lingua` varchar(10) DEFAULT NULL,
  `Costo` int(10) DEFAULT NULL,
  `Apertura` date NOT NULL DEFAULT current_timestamp(),
  `Chiusura` date DEFAULT NULL,
  `OreImpiegate` int(4) DEFAULT NULL,
  `Cliente` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ticket`
--

INSERT INTO `ticket` (`IDTicket`, `Causale`, `Priorita`, `Lingua`, `Costo`, `Apertura`, `Chiusura`, `OreImpiegate`, `Cliente`) VALUES
(1, 'Consumabili', 'Alta', 'Inglese', 30, '2022-12-15', '2022-12-15', 0, '10128395405'),
(2, 'Fotocamere', 'Bloccata', 'Italiano', NULL, '2022-12-15', NULL, NULL, '26956659580'),
(4, 'Consumabili', 'Bloccata', 'Inglese', NULL, '2022-10-11', NULL, NULL, '72304749147'),
(5, 'Consumabili', 'Alta', 'Inglese', 300, '2019-12-05', '2019-12-05', 0, '26368001629'),
(6, 'Consumabili', 'Alta', 'Inglese', 25, '2022-02-04', '2022-02-04', 0, '90523111782'),
(7, 'Consumabili', 'Bloccata', 'Inglese', NULL, '2018-10-11', NULL, NULL, '41012850653'),
(8, 'Consumabili', 'Bloccata', 'Inglese', NULL, '2021-04-08', NULL, NULL, '83229080007'),
(9, 'Consumabili', 'Alta', 'Italiano', 35, '2022-10-04', '2022-10-04', 0, '55429180819'),
(11, 'Consulenza software', 'Bloccata', 'Inglese', NULL, '2022-12-01', NULL, NULL, '71471551684'),
(12, 'Macchina non si avvia', 'Media', 'Inglese', 0, '2022-12-16', '2022-12-20', 12, '16497514769'),
(13, 'Fotocamere', 'Bassa', 'Inglese', 345, '2022-12-09', '2022-12-20', 18, '65235797314'),
(14, 'Teste di taglio', 'Bassa', 'Inglese', 185, '2022-12-16', '2022-12-19', 11, '32871434744'),
(15, 'Aspirazione', 'Media', 'Inglese', 0, '2022-12-16', '2022-12-17', 4, '54936494783'),
(16, 'Macchina bloccata', 'Bloccata', 'Italiano', NULL, '2022-11-04', NULL, NULL, '89167280676'),
(17, 'Fotocamere', 'Alta', 'Inglese', 0, '2022-12-23', '2022-12-23', 6, '33315005088'),
(19, 'Fotocamere', 'Media', 'Inglese', 0, '2022-12-16', '2022-12-20', 18, '16497514769'),
(20, 'Macchina bloccata', 'Media', 'Inglese', 0, '2022-12-16', '2022-12-17', 15, '32142173559'),
(21, 'Macchina ferma', 'Bassa', 'Italiano', 115, '2022-12-17', '2022-12-18', 7, '55429180819'),
(56, 'Consumabili', 'Alta', 'Italiano', 40, '2022-12-22', '2022-12-22', 0, '36144094207'),
(57, 'Consumabili', 'Bloccata', 'Inglese', NULL, '2022-12-22', NULL, NULL, '26041915147'),
(59, 'Fotocamere', 'Alta', 'Inglese', 0, '2022-12-26', '2022-12-26', 5, '10128395405'),
(60, 'Macchina ferma', 'Media', 'Italiano', 0, '2022-12-26', '2022-12-26', 10, '14617938604'),
(61, 'Teste di taglio', 'Media', 'Inglese', 0, '2022-12-26', '2022-12-26', 5, '15268876497'),
(62, 'Consulenza software', 'Media', 'Inglese', 0, '2022-12-26', '2022-12-26', 7, '16058522218'),
(63, 'Consumabili', 'Alta', 'Inglese', 30, '2022-12-26', '2022-12-26', 0, '16497514769'),
(64, 'Consumabili', 'Alta', 'Inglese', 25, '2022-12-26', '2022-12-26', 0, '16735731623'),
(65, 'Consumabili', 'Alta', 'Italiano', 20, '2022-12-26', '2022-12-26', 0, '22174266763'),
(66, 'Consumabili', 'Bloccata', 'Italiano', NULL, '2022-12-26', NULL, NULL, '26041915147'),
(67, 'Consumabili', 'Alta', 'Inglese', 40, '2022-12-26', '2022-12-26', 0, '26368001629'),
(68, 'Macchina non si avvia', 'Bloccata', 'Italiano', NULL, '2022-12-26', NULL, NULL, '26956659580'),
(69, 'Macchina non si avvia', 'Media', 'Inglese', 0, '2022-12-26', '2022-12-26', 5, '28054881706'),
(70, 'Consulenza software', 'Bloccata', 'Inglese', NULL, '2022-12-26', NULL, NULL, '31713344653'),
(71, 'Consulenza software', 'Media', 'Inglese', 0, '2022-12-26', '2022-12-26', 8, '32142173559'),
(72, 'Fotocamere', 'Alta', 'Inglese', 0, '2022-12-26', '2022-12-26', 5, '33315005088'),
(73, 'Fotocamere', 'Bassa', 'Italiano', 90, '2022-12-26', '2022-12-26', 6, '36144094207'),
(74, 'Aspirazione', 'Bloccata', 'Inglese', NULL, '2022-12-26', NULL, NULL, '41012850653'),
(75, 'Aspirazione', 'Bassa', 'Inglese', 270, '2022-12-26', '2022-12-26', 15, '42454205237'),
(76, 'Teste di taglio', 'Media', 'Italiano', 0, '2022-12-26', '2022-12-26', 5, '43849287106'),
(77, 'Teste di taglio', 'Bloccata', 'Italiano', NULL, '2022-12-26', NULL, NULL, '45265299447'),
(78, 'Teste di taglio', 'Bassa', 'Italiano', 275, '2022-12-26', '2022-12-26', 15, '48925706556'),
(79, 'Macchina ferma', 'Bloccata', 'Inglese', NULL, '2022-12-26', NULL, NULL, '49335238861'),
(80, 'Macchina ferma', 'Bassa', 'Inglese', 250, '2022-12-26', '2022-12-26', 15, '49386669284');

-- --------------------------------------------------------

--
-- Struttura per vista `ore_ticket_non_resident`
--
DROP TABLE IF EXISTS `ore_ticket_non_resident`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ore_ticket_non_resident`  AS SELECT `assistenzamacc`.`Ticket` AS `ID_Ticket`, sum(`assistenzamacc`.`NumOre`) AS `Ore` FROM (`assistenzamacc` join `datilavorativi` on(`assistenzamacc`.`Tecnico` = `datilavorativi`.`IDTecnico`)) WHERE `datilavorativi`.`Resident` = 'no' GROUP BY `assistenzamacc`.`Ticket``Ticket`  ;

-- --------------------------------------------------------

--
-- Struttura per vista `ore_ticket_resident`
--
DROP TABLE IF EXISTS `ore_ticket_resident`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ore_ticket_resident`  AS SELECT `assistenzamacc`.`Ticket` AS `ID_Ticket`, sum(`assistenzamacc`.`NumOre`) AS `Ore` FROM (`assistenzamacc` join `datilavorativi` on(`assistenzamacc`.`Tecnico` = `datilavorativi`.`IDTecnico`)) WHERE `datilavorativi`.`Resident` = 'si' GROUP BY `assistenzamacc`.`Ticket``Ticket`  ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquistomacc`
--
ALTER TABLE `acquistomacc`
  ADD PRIMARY KEY (`Macchinario`),
  ADD KEY `Cliente` (`Cliente`),
  ADD KEY `Macchinario` (`Macchinario`);

--
-- Indici per le tabelle `assistenzacons`
--
ALTER TABLE `assistenzacons`
  ADD PRIMARY KEY (`Cons`),
  ADD KEY `Ticket` (`Ticket`);

--
-- Indici per le tabelle `assistenzamacc`
--
ALTER TABLE `assistenzamacc`
  ADD PRIMARY KEY (`Ticket`,`Tecnico`),
  ADD KEY `Macchina->Macchinario.ID_Macchinario` (`Macchina`),
  ADD KEY `Tecnico->DatiLavorativi.ID_Tecnico` (`Tecnico`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Partita_IVA`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Indici per le tabelle `consumabile`
--
ALTER TABLE `consumabile`
  ADD PRIMARY KEY (`IDConsumabile`);

--
-- Indici per le tabelle `contratto`
--
ALTER TABLE `contratto`
  ADD PRIMARY KEY (`IDContratto`),
  ADD KEY `Cliente - > Cliente.PartitaIVA` (`Cliente`);

--
-- Indici per le tabelle `datianagrafici`
--
ALTER TABLE `datianagrafici`
  ADD PRIMARY KEY (`CodiceFiscale`);

--
-- Indici per le tabelle `datilavorativi`
--
ALTER TABLE `datilavorativi`
  ADD PRIMARY KEY (`IDTecnico`),
  ADD UNIQUE KEY `CF` (`CF`);

--
-- Indici per le tabelle `emailcliente`
--
ALTER TABLE `emailcliente`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `NumCliente - > Cliente.Partita_IVA` (`NumCliente`);

--
-- Indici per le tabelle `emailtecnico`
--
ALTER TABLE `emailtecnico`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `NumTecnico - > DatiLavorativi.IDTecnico` (`NumTecnico`);

--
-- Indici per le tabelle `garanzia`
--
ALTER TABLE `garanzia`
  ADD PRIMARY KEY (`IDGaranzia`),
  ADD UNIQUE KEY `Macc` (`Macc`);

--
-- Indici per le tabelle `macchinario`
--
ALTER TABLE `macchinario`
  ADD PRIMARY KEY (`IDMacchinario`);

--
-- Indici per le tabelle `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD PRIMARY KEY (`Macchina`,`Tecnico`),
  ADD KEY `Tecnico - > DatiLavorativi.IDTecnico` (`Tecnico`);

--
-- Indici per le tabelle `telcliente`
--
ALTER TABLE `telcliente`
  ADD PRIMARY KEY (`Telefono`),
  ADD KEY `NumCliente - > Cliente.PartitaIVA` (`NumCliente`);

--
-- Indici per le tabelle `teltecnico`
--
ALTER TABLE `teltecnico`
  ADD PRIMARY KEY (`Telefono`),
  ADD KEY `NumTecnico - > DatiLavorativi.ID_Tecnico` (`NumTecnico`);

--
-- Indici per le tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`IDTicket`),
  ADD KEY `Cliente - > Cliente.Partita_IVA` (`Cliente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `consumabile`
--
ALTER TABLE `consumabile`
  MODIFY `IDConsumabile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `IDContratto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT per la tabella `datilavorativi`
--
ALTER TABLE `datilavorativi`
  MODIFY `IDTecnico` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `garanzia`
--
ALTER TABLE `garanzia`
  MODIFY `IDGaranzia` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `macchinario`
--
ALTER TABLE `macchinario`
  MODIFY `IDMacchinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT per la tabella `ticket`
--
ALTER TABLE `ticket`
  MODIFY `IDTicket` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquistomacc`
--
ALTER TABLE `acquistomacc`
  ADD CONSTRAINT `Cliente` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`),
  ADD CONSTRAINT `Cliente->Cliente.Partita-IVA` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`),
  ADD CONSTRAINT `Macchinario` FOREIGN KEY (`Macchinario`) REFERENCES `macchinario` (`IDMacchinario`),
  ADD CONSTRAINT `Macchinario->Macchinario.IDMacchinario` FOREIGN KEY (`Macchinario`) REFERENCES `macchinario` (`IDMacchinario`);

--
-- Limiti per la tabella `assistenzacons`
--
ALTER TABLE `assistenzacons`
  ADD CONSTRAINT `Cons - > Consumabile.ID_Consumabile` FOREIGN KEY (`Cons`) REFERENCES `consumabile` (`IDConsumabile`),
  ADD CONSTRAINT `Ticket - > Ticket.ID_Ticket` FOREIGN KEY (`Ticket`) REFERENCES `ticket` (`IDTicket`);

--
-- Limiti per la tabella `assistenzamacc`
--
ALTER TABLE `assistenzamacc`
  ADD CONSTRAINT `Macchina - > Macchinario.ID_Macchinario` FOREIGN KEY (`Macchina`) REFERENCES `macchinario` (`IDMacchinario`),
  ADD CONSTRAINT `Tecnico - > DatiLavorativi.ID_Tecnico` FOREIGN KEY (`Tecnico`) REFERENCES `datilavorativi` (`IDTecnico`),
  ADD CONSTRAINT `Ticket - > Ticket.IDTicket` FOREIGN KEY (`Ticket`) REFERENCES `ticket` (`IDTicket`);

--
-- Limiti per la tabella `contratto`
--
ALTER TABLE `contratto`
  ADD CONSTRAINT `Cliente - > Cliente.PartitaIVA` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `datilavorativi`
--
ALTER TABLE `datilavorativi`
  ADD CONSTRAINT `CF - > DatiAnagrafici.CodiceFiscale` FOREIGN KEY (`CF`) REFERENCES `datianagrafici` (`CodiceFiscale`);

--
-- Limiti per la tabella `emailcliente`
--
ALTER TABLE `emailcliente`
  ADD CONSTRAINT `NumCliente - > Cliente.Partita_IVA` FOREIGN KEY (`NumCliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `emailtecnico`
--
ALTER TABLE `emailtecnico`
  ADD CONSTRAINT `NumTecnico - > DatiLavorativi.IDTecnico` FOREIGN KEY (`NumTecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `garanzia`
--
ALTER TABLE `garanzia`
  ADD CONSTRAINT `Macc - > Macchinario.IDMacchinario ` FOREIGN KEY (`Macc`) REFERENCES `macchinario` (`IDMacchinario`);

--
-- Limiti per la tabella `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD CONSTRAINT `Tecnico - > DatiLavorativi.IDTecnico` FOREIGN KEY (`Tecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `telcliente`
--
ALTER TABLE `telcliente`
  ADD CONSTRAINT `NumCliente - > Cliente.PartitaIVA` FOREIGN KEY (`NumCliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `teltecnico`
--
ALTER TABLE `teltecnico`
  ADD CONSTRAINT `NumTecnico - > DatiLavorativi.ID_Tecnico` FOREIGN KEY (`NumTecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `Cliente - > Cliente.Partita_IVA` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
