-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Creato il: Dic 08, 2022 alle 16:41
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
  `Città` varchar(20) DEFAULT NULL,
  `Saldo` char(1) NOT NULL
) ;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`Partita_IVA`, `Nome`, `Stato`, `Città`, `Saldo`) VALUES
('1', 'Samsung', 'Italia', 'Ancona', '+'),
('12908626249', 'People Virtual', 'WA', 'Grayland', '-'),
('14420667758', 'Bell Studio Advanced', 'VA', 'Gate City', '-'),
('17206371499', 'Signal Graphics Hill', 'PA', 'New Wilmington', '-'),
('19649871787', 'Systems Contract', 'WY', 'Hartville', '-'),
('2', 'Apple', 'Inghilterra', 'Londra', '+'),
('20610916533', 'Industries Construct', 'CA', 'Ludlow', '-'),
('23591893170', 'Speed Electronic Bel', 'KY', 'Mill Springs', '-'),
('25563547498', 'Alpha Direct People', 'LA', 'Kenner', '+'),
('25835035146', 'Speed Building', 'WI', 'Rosholt', '+'),
('26810986744', 'Adventure Star Telec', 'VA', 'Hampton', '-'),
('28764426046', 'Building Digital Pac', 'TX', 'Beaumont', '-'),
('31565014219', 'Max Bell', 'CA', 'Lamont', '-'),
('38274821545', 'Contract Universal', 'ND', 'Hamberg', '-'),
('39290760519', 'Industries East', 'WA', 'Moclips', '-'),
('40425186663', 'Network Interactive ', 'VA', 'Warm Springs', '+'),
('41659064377', 'Galaxy Software Data', 'VA', 'Norfolk', '+'),
('45538338992', 'Federated Data Front', 'MO', 'Cape Girardeau', '-'),
('47109980373', 'Systems Innovation', 'MO', 'Kansas City', '-'),
('48908898502', 'Telecom Hill Bell', 'NY', 'Freeport', '+'),
('49577116606', 'Resource Speed', 'CA', 'Sacramento', '-'),
('49709425815', 'People Electronics A', 'PA', 'Hawley', '-'),
('52578823020', 'Analysis North Ventu', 'VA', 'Alberta', '+'),
('53550593649', 'Interactive Electron', 'MO', 'Kansas City', '-'),
('53849997419', 'Graphics North', 'WI', 'Spring Valley', '+'),
('54947720751', 'Studio Federated Ele', 'CT', 'Oxford', '-'),
('55054779156', 'Universal Direct', 'IL', 'Chicago', '-'),
('58535966610', 'Provider Net', 'VA', 'Village', '+'),
('62663110407', 'Source Network', 'ME', 'Mars Hill', '-'),
('68850157424', 'Research Frontier', 'FL', 'New Port Richey', '-'),
('70119192435', 'Net Technology Consu', 'AL', 'Birmingham', '+'),
('71161640348', 'East Hardware', 'OK', 'Spavinaw', '-'),
('71319442662', 'Construction Innovat', 'FL', 'Fort Lauderdale', '+'),
('71451288455', 'Max Systems', 'TX', 'Stamford', '+'),
('72353499249', 'Source Omega Source', 'WV', 'Linden', '-'),
('73045377438', 'Medicine Software In', 'TX', 'Richards', '-'),
('75273809103', 'Telecom Source Appli', 'TX', 'Point Comfort', '+'),
('75354714634', 'Electronic Resource ', 'ME', 'Belgrade Lakes', '-'),
('76402759124', 'Star Construction Fu', 'MI', 'Lansing', '-'),
('77919318762', 'Provider Constructio', 'NY', 'Earlville', '+'),
('79969284432', 'Software Frontier An', 'NJ', 'Avon By The Sea', '+'),
('82123876543', 'East Digital Galaxy', 'CA', 'Arroyo Grande', '-'),
('82818308998', 'People Frontier Univ', 'IA', 'Manchester', '-'),
('87104802490', 'Hardware Network Sig', 'MI', 'Muskegon', '-'),
('87453653758', 'Electronic Net Solut', 'WI', 'Brownsville', '+'),
('87860400764', 'Resource People Adva', 'CA', 'San Diego', '-'),
('87946183142', 'Omega Consulting', 'SD', 'Redfield', '-'),
('88999694482', 'Consulting Atlantic ', 'MD', 'College Park', '-'),
('89926668970', 'Universal Venture', 'WY', 'Centennial', '-'),
('96285929991', 'Alpha Building Star', 'SC', 'Blythewood', '+'),
('97105885088', 'Star Vision Analysis', 'MO', 'Columbia', '+'),
('99546985285', 'Consulting Research ', 'TN', 'Winchester', '+');

-- --------------------------------------------------------

--
-- Struttura della tabella `consumabile`
--

CREATE TABLE `consumabile` (
  `IDConsumabile` int(11) NOT NULL,
  `Categoria` varchar(15) NOT NULL,
  `Prezzo` int(5) NOT NULL
) ;

--
-- Dump dei dati per la tabella `consumabile`
--

INSERT INTO `consumabile` (`IDConsumabile`, `Categoria`, `Prezzo`) VALUES
(1, 'Lampade', 15),
(2, 'Feltri', 5),
(3, 'feltri', 10),
(4, 'feltri', 20);

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
) ;

--
-- Dump dei dati per la tabella `contratto`
--

INSERT INTO `contratto` (`IDContratto`, `DataInizio`, `DataFine`, `Canone`, `Banca`, `Cliente`) VALUES
(1, '2022-12-07', '2022-12-08', 200, 'Carifermo', '1'),
(4, '2022-12-07', '2022-12-28', 100, 'Carifermo', '2');

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
('AF11udhedher', 'Andrea', 'Rossi', 'M', '2022-12-07');

-- --------------------------------------------------------

--
-- Struttura della tabella `datilavorativi`
--

CREATE TABLE `datilavorativi` (
  `IDTecnico` int(4) NOT NULL,
  `Resident` varchar(2) NOT NULL,
  `CF` char(16) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `emailcliente`
--

CREATE TABLE `emailcliente` (
  `NumCliente` char(11) NOT NULL,
  `Email` varchar(30) NOT NULL
) ;

--
-- Dump dei dati per la tabella `emailcliente`
--

INSERT INTO `emailcliente` (`NumCliente`, `Email`) VALUES
('1', 'ciao@ciao.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `emailtecnico`
--

CREATE TABLE `emailtecnico` (
  `NumTecnico` int(4) NOT NULL,
  `Email` varchar(30) NOT NULL
) ;

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
) ;

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

-- --------------------------------------------------------

--
-- Struttura della tabella `telcliente`
--

CREATE TABLE `telcliente` (
  `NumCliente` char(11) NOT NULL,
  `Telefono` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Macchina` int(11) DEFAULT NULL,
  `Tecnico` int(4) NOT NULL,
  `Cons` int(11) DEFAULT NULL
) ;

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
  ADD KEY `Cons->Consumabile.IDConsumabile` (`Cons`),
  ADD KEY `Tecnico->IDTecnico` (`Tecnico`),
  ADD KEY `Cliente->Cliente.Partita_IVA` (`Cliente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `consumabile`
--
ALTER TABLE `consumabile`
  MODIFY `IDConsumabile` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `IDContratto` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `datilavorativi`
--
ALTER TABLE `datilavorativi`
  MODIFY `IDTecnico` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `garanzia`
--
ALTER TABLE `garanzia`
  MODIFY `IDGaranzia` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `macchinario`
--
ALTER TABLE `macchinario`
  MODIFY `IDMacchinario` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `Cons->Consumabile.IDConsumabile` FOREIGN KEY (`Cons`) REFERENCES `consumabile` (`IDConsumabile`),
  ADD CONSTRAINT `Macchina->Macchinario.IDMacchinario` FOREIGN KEY (`Macchina`) REFERENCES `macchinario` (`IDMacchinario`),
  ADD CONSTRAINT `Tecnico->IDTecnico` FOREIGN KEY (`Tecnico`) REFERENCES `datilavorativi` (`IDTecnico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
