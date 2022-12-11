-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 11, 2022 alle 18:06
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
-- Database: `progetto_ticket`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assistenzacons`
--

CREATE TABLE `assistenzacons` (
  `Ticket` int(10) NOT NULL,
  `Cons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `assistenzamacc`
--

CREATE TABLE `assistenzamacc` (
  `Ticket` int(10) NOT NULL,
  `Macchina` int(11) NOT NULL,
  `Tecnico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('16735731623', 'Network Atlantic', 'Portugal', '-'),
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
(1, 'Lame di taglio', 100),
(2, 'Lampade', 25),
(3, 'Lampade', 25),
(4, 'Penne', 20),
(5, 'Punzoni', 20),
(6, 'Frese', 18),
(7, 'Penne', 20),
(8, 'Punzoni', 20),
(9, 'Frese', 18),
(10, 'Punzoni', 18),
(11, 'PC', 300),
(12, 'Lame di taglio', 100),
(13, 'PC', 300),
(14, 'Fustelle', 30),
(15, 'Fustelle', 30),
(16, 'Fustelle', 30),
(17, 'Lampade', 25),
(18, 'Fustelle', 30),
(19, 'Penne', 20),
(20, 'Feltri', 15);

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
(30, '2022-04-10', '2025-04-10', 200, 'Ace Bank', '66098192582');

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
  `NumCliente` char(11) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `emailcliente`
--

INSERT INTO `emailcliente` (`NumCliente`, `Email`) VALUES
('10128395405', 'buildingomega@gmail.com'),
('14617938604', 'studioinn@virgilio.it'),
('15268876497', 'bellstar@gmail.com'),
('16058522218', 'atlanticinn@gmail.com'),
('16497514769', 'bellbuilding@gmail.com'),
('16735731623', 'atlnet@gmail.com'),
('22174266763', 'archspa@libero.it'),
('26368001629', 'analisispa@virgilio.it'),
('26368001629', 'solfrontier@gmail.com'),
('26956659580', 'resteam@yahoo.it'),
('28054881706', 'starind@gmail.com'),
('31713344653', 'graphspa@gmail.com'),
('32142173559', 'analisysnet@gmail.com'),
('32871434744', 'galaxyel@gmail.com'),
('33315005088', 'solpow@gmail.com'),
('36144094207', 'hardwareita@virgilio.it'),
('41012850653', 'starnet@gmail.com'),
('42454205237', 'resnet@gmail.com'),
('43849287106', 'interactivesist@alice.it'),
('45265299447', 'wconst@libero.it'),
('48925706556', 'samsungitaly@gmail.com'),
('49335238861', 'datastudio@libero.it'),
('49386669284', 'ansign@gmail.com'),
('55429180819', 'providerstudio@gmail.com'),
('55429180819', 'telecomit@gmail.com'),
('56934816291', 'southind@gmail.com'),
('65235797314', 'netind@gmail.com'),
('66098192582', 'visiongraph@gmail.com'),
('68249353645', 'hardwarewest@gmail.com'),
('69090775976', 'advfrontier@gmail.com'),
('71471551684', 'constrwest@gmail.com'),
('71475599444', 'electgeneral@gmail.com'),
('72304749147', 'advsource@gmail.com'),
('73586436589', 'generalita@alice.it'),
('76091394328', 'contractsol@virgilio.it'),
('78989412550', 'appcontr@gmail.com'),
('81383350644', 'medbuildspa@gmail.com'),
('82026462441', 'medspa@gmail.com'),
('83007757185', 'adventurspa@gmail.com'),
('83229080007', 'resvision@gmail.com'),
('89167280676', 'hillapp@alice.it'),
('90452571726', 'venturepow@gmail.com'),
('90523111782', 'powvision@virgilio.it'),
('93269259186', 'starsystem@gmail.com'),
('95202775872', 'consbuilding@gmail.com'),
('95890272415', 'frontiergalaxy@gmail.com'),
('96799763888', 'roboticsjohns@gmail.com'),
('97925277933', 'bellpacific@gmail.com'),
('99528944960', 'hnet@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `emailtecnico`
--

CREATE TABLE `emailtecnico` (
  `NumTecnico` int(4) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `emailtecnico`
--

INSERT INTO `emailtecnico` (`NumTecnico`, `Email`) VALUES
(1, 'enrico.tarli@gmail.com'),
(1, 'enricotarli.elitron@gmail.com'),
(2, 'gcarli@gmail.com'),
(3, 'laura.binachi@libero.it'),
(3, 'lbianchi@gmail.com'),
(4, 'edluca@libero.it'),
(5, 'luigi.verdi@gmail.com'),
(6, 'aldodraghi@alice.it'),
(7, 'farmandi@gmail.com'),
(7, 'franco.armandi@libero.it'),
(8, 'm.rossi@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `garanzia`
--

CREATE TABLE `garanzia` (
  `IDGaranzia` int(7) NOT NULL,
  `DataInstallazione` date NOT NULL DEFAULT current_timestamp(),
  `LuogoInstallazione` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `garanzia`
--

INSERT INTO `garanzia` (`IDGaranzia`, `DataInstallazione`, `LuogoInstallazione`) VALUES
(1, '2022-12-07', 'Ancona'),
(2, '2022-12-07', 'Fermo');

-- --------------------------------------------------------

--
-- Struttura della tabella `macchinario`
--

CREATE TABLE `macchinario` (
  `IDMacchinario` int(11) NOT NULL,
  `Categoria` varchar(15) NOT NULL,
  `Gar` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `macchinario`
--

INSERT INTO `macchinario` (`IDMacchinario`, `Categoria`, `Gar`) VALUES
(1, 'Kombo TH', 1),
(2, 'kombo tav', 2);

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
('Booster', 6),
('Kombo STC', 2),
('Kombo STC', 5),
('Kombo STC', 7),
('Kombo TAV', 4),
('Kombo TAV', 5),
('Kombo TAV', 7),
('Kombo TH', 2),
('Kombo TH', 3),
('Kombo TH', 6),
('Kombo TH', 7),
('Spark', 1),
('Spark', 4),
('Spark', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `telcliente`
--

CREATE TABLE `telcliente` (
  `NumCliente` char(11) NOT NULL,
  `Telefono` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `telcliente`
--

INSERT INTO `telcliente` (`NumCliente`, `Telefono`) VALUES
('10128395405', '+867410025845'),
('10128395405', '+868459321110'),
('14617938604', '+395846325965'),
('15268876497', '+338459821001'),
('16058522218', '+421856395211'),
('16497514769', '+458653203332'),
('16735731623', '+351269995127'),
('22174266763', '+396852244859'),
('26041915147', '+396523374870'),
('26368001629', '+448523496511'),
('26956659580', '+390145796426'),
('28054881706', '+111482611866'),
('28054881706', '+177095919533'),
('31713344653', '+169919923958'),
('32142173559', '+138805802387'),
('32871434744', '+167450953447'),
('33315005088', '+492284749036'),
('36144094207', '+393738297450'),
('41012850653', '+385171738154'),
('42454205237', '+420985933815'),
('43849287106', '+398231052306'),
('45265299447', '+390455940165'),
('48925706556', '+398706648324'),
('49335238861', '+379000000000'),
('49386669284', '+966747425197'),
('54936494783', '+903175939337'),
('55429180819', '+396672734501'),
('56934816291', '+912356686126'),
('65235797314', '+816598426580'),
('66098192582', '+352781012959'),
('68249353645', '+148619110484'),
('69090775976', '+398525949425'),
('71471551684', '+180519847170'),
('71471551684', '+180519847179'),
('71475599444', '+278393030160'),
('72304749147', '+886748403024'),
('73586436589', '+399349520095'),
('76091394328', '+398345499688'),
('78989412550', '+137374435110'),
('81383350644', '+394900414694'),
('82026462441', '+166322200671'),
('82026462441', '+166322200675'),
('83007757185', '+352995838638'),
('83229080007', '+431132819553'),
('89167280676', '+395851354922'),
('90452571726', '+640866950556'),
('90523111782', '+212181139851'),
('93269259186', '+394448603435'),
('93685664951', '+370044615215'),
('95202775872', '+355451947314'),
('95890272415', '+372746239502'),
('96799763888', '+115508348524'),
('97925277933', '+640313826560'),
('99528944960', '+433232859055');

-- --------------------------------------------------------

--
-- Struttura della tabella `teltecnico`
--

CREATE TABLE `teltecnico` (
  `NumTecnico` int(4) NOT NULL,
  `Telefono` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ticket`
--

CREATE TABLE `ticket` (
  `IDTicket` int(10) NOT NULL,
  `Causale` varchar(100) NOT NULL,
  `Priorita` varchar(10) NOT NULL,
  `Lingua` varchar(10) NOT NULL,
  `Costo` int(10) DEFAULT NULL,
  `Apertura` date NOT NULL DEFAULT current_timestamp(),
  `Chiusura` date DEFAULT NULL,
  `OreImpiegate` int(4) DEFAULT NULL,
  `Cliente` char(11) NOT NULL,
  `Macchina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `assistenzacons`
--
ALTER TABLE `assistenzacons`
  ADD PRIMARY KEY (`Ticket`,`Cons`),
  ADD KEY `Cons->Consumabile.ID_Consumabile` (`Cons`);

--
-- Indici per le tabelle `assistenzamacc`
--
ALTER TABLE `assistenzamacc`
  ADD PRIMARY KEY (`Ticket`),
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
  ADD UNIQUE KEY `Cliente` (`Cliente`);

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
  ADD PRIMARY KEY (`NumCliente`,`Email`);

--
-- Indici per le tabelle `emailtecnico`
--
ALTER TABLE `emailtecnico`
  ADD PRIMARY KEY (`NumTecnico`,`Email`);

--
-- Indici per le tabelle `garanzia`
--
ALTER TABLE `garanzia`
  ADD PRIMARY KEY (`IDGaranzia`);

--
-- Indici per le tabelle `macchinario`
--
ALTER TABLE `macchinario`
  ADD PRIMARY KEY (`IDMacchinario`),
  ADD UNIQUE KEY `Gar` (`Gar`),
  ADD KEY `Gar->Garanzia.IDGaranzia` (`Gar`);

--
-- Indici per le tabelle `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD PRIMARY KEY (`Macchina`,`Tecnico`),
  ADD KEY `Tecnico->DatiLavorativi.IDTecnico` (`Tecnico`);

--
-- Indici per le tabelle `telcliente`
--
ALTER TABLE `telcliente`
  ADD PRIMARY KEY (`NumCliente`,`Telefono`);

--
-- Indici per le tabelle `teltecnico`
--
ALTER TABLE `teltecnico`
  ADD PRIMARY KEY (`NumTecnico`,`Telefono`);

--
-- Indici per le tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`IDTicket`),
  ADD KEY `Macchina->Macchinario.IDMacchinario` (`Macchina`),
  ADD KEY `Cliente->Cliente.Partita_IVA` (`Cliente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `consumabile`
--
ALTER TABLE `consumabile`
  MODIFY `IDConsumabile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `IDContratto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `datilavorativi`
--
ALTER TABLE `datilavorativi`
  MODIFY `IDTecnico` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `garanzia`
--
ALTER TABLE `garanzia`
  MODIFY `IDGaranzia` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `macchinario`
--
ALTER TABLE `macchinario`
  MODIFY `IDMacchinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `ticket`
--
ALTER TABLE `ticket`
  MODIFY `IDTicket` int(10) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `assistenzacons`
--
ALTER TABLE `assistenzacons`
  ADD CONSTRAINT `Cons->Consumabile.ID_Consumabile` FOREIGN KEY (`Cons`) REFERENCES `consumabile` (`IDConsumabile`),
  ADD CONSTRAINT `Ticket->Ticket.ID_Ticket` FOREIGN KEY (`Ticket`) REFERENCES `ticket` (`IDTicket`);

--
-- Limiti per la tabella `assistenzamacc`
--
ALTER TABLE `assistenzamacc`
  ADD CONSTRAINT `Macchina->Macchinario.ID_Macchinario` FOREIGN KEY (`Macchina`) REFERENCES `macchinario` (`IDMacchinario`),
  ADD CONSTRAINT `Tecnico->DatiLavorativi.ID_Tecnico` FOREIGN KEY (`Tecnico`) REFERENCES `datilavorativi` (`IDTecnico`),
  ADD CONSTRAINT `Ticket->Ticket.IDTicket` FOREIGN KEY (`Ticket`) REFERENCES `ticket` (`IDTicket`);

--
-- Limiti per la tabella `contratto`
--
ALTER TABLE `contratto`
  ADD CONSTRAINT `Cliente->Cliente.PartitaIVA` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `datilavorativi`
--
ALTER TABLE `datilavorativi`
  ADD CONSTRAINT `CF->DatiAnagrafici.CodiceFiscale` FOREIGN KEY (`CF`) REFERENCES `datianagrafici` (`CodiceFiscale`);

--
-- Limiti per la tabella `emailcliente`
--
ALTER TABLE `emailcliente`
  ADD CONSTRAINT `NumCliente->Cliente.Partita_IVA` FOREIGN KEY (`NumCliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `emailtecnico`
--
ALTER TABLE `emailtecnico`
  ADD CONSTRAINT `NumTecnico->DatiLavorativi.IDTecnico` FOREIGN KEY (`NumTecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `macchinario`
--
ALTER TABLE `macchinario`
  ADD CONSTRAINT `Gar->Garanzia.IDGaranzia` FOREIGN KEY (`Gar`) REFERENCES `garanzia` (`IDGaranzia`);

--
-- Limiti per la tabella `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD CONSTRAINT `Tecnico->DatiLavorativi.IDTecnico` FOREIGN KEY (`Tecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `telcliente`
--
ALTER TABLE `telcliente`
  ADD CONSTRAINT `NumCliente->Cliente.PartitaIVA` FOREIGN KEY (`NumCliente`) REFERENCES `cliente` (`Partita_IVA`);

--
-- Limiti per la tabella `teltecnico`
--
ALTER TABLE `teltecnico`
  ADD CONSTRAINT `NumTecnico->DatiLavorativi.ID_Tecnico` FOREIGN KEY (`NumTecnico`) REFERENCES `datilavorativi` (`IDTecnico`);

--
-- Limiti per la tabella `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `Cliente->Cliente.Partita_IVA` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Partita_IVA`),
  ADD CONSTRAINT `Macchina->Macchinario.IDMacchinario` FOREIGN KEY (`Macchina`) REFERENCES `macchinario` (`IDMacchinario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
