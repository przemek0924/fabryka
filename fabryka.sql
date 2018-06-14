-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Cze 2018, 00:20
-- Wersja serwera: 10.1.25-MariaDB
-- Wersja PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `fabryka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ewidencja`
--

CREATE TABLE `ewidencja` (
  `ID_EWID` int(11) NOT NULL,
  `ID_MASZYNY` varchar(8) DEFAULT NULL,
  `ID_PRACOWNIKA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ewidencja`
--

INSERT INTO `ewidencja` (`ID_EWID`, `ID_MASZYNY`, `ID_PRACOWNIKA`) VALUES
(1, 'M0001', 1),
(2, 'M0001', 2),
(3, 'M0001', 3),
(4, 'M0002', 4),
(5, 'M0003', 4),
(6, 'M0004', 2),
(7, 'M0005', 2),
(8, 'M0005', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hala`
--

CREATE TABLE `hala` (
  `NAZWA` varchar(20) NOT NULL,
  `ADRES` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hala`
--

INSERT INTO `hala` (`NAZWA`, `ADRES`) VALUES
('NARZEDZIA', 'ul. Sienkiewicza 12'),
('POJAZDY', 'ul. Nowa 57'),
('URZADZENIA', 'ul. Sikorskiego 33');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `maszyna`
--

CREATE TABLE `maszyna` (
  `NAZWA` varchar(20) NOT NULL,
  `NR_EWIDENCYJNY` varchar(8) NOT NULL,
  `DATA_URUCHOMIENIA` date NOT NULL,
  `NAZWA_HALI` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `maszyna`
--

INSERT INTO `maszyna` (`NAZWA`, `NR_EWIDENCYJNY`, `DATA_URUCHOMIENIA`, `NAZWA_HALI`) VALUES
('Szlifierka', 'M0001', '2017-12-01', 'NARZEDZIA'),
('Betoniarka', 'M0002', '2017-10-05', 'URZADZENIA'),
('Koparka', 'M0003', '2017-05-05', 'POJAZDY'),
('Wiertarka', 'M0004', '2017-01-05', 'NARZEDZIA'),
('Ciagnik', 'M0005', '2017-02-05', 'POJAZDY'),
('Wiertarka', 'M0006', '2017-01-05', 'NARZEDZIA'),
('Ciagnik', 'M0007', '2017-02-05', 'POJAZDY'),
('Betoniarka', 'M0008', '2017-09-05', 'URZADZENIA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operator`
--

CREATE TABLE `operator` (
  `ID_OP` int(11) NOT NULL,
  `NAZWISKO` varchar(20) DEFAULT NULL,
  `IMIE` varchar(20) DEFAULT NULL,
  `PLACA` decimal(6,2) DEFAULT NULL,
  `DATA_ZATRUDNIENIA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `operator`
--

INSERT INTO `operator` (`ID_OP`, `NAZWISKO`, `IMIE`, `PLACA`, `DATA_ZATRUDNIENIA`) VALUES
(1, 'Kowalski', 'Jan', '1500.00', '2016-12-12'),
(2, 'Frankowski', 'Krzysztof', '1200.00', '2016-12-20'),
(3, 'Zawadzki', 'Piotr', '1300.00', '2016-12-21'),
(4, 'Sowa', 'Zdzislaw', '1400.00', '2016-12-22');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `ewidencja`
--
ALTER TABLE `ewidencja`
  ADD PRIMARY KEY (`ID_EWID`),
  ADD KEY `ID_PRACOWNIKA` (`ID_PRACOWNIKA`),
  ADD KEY `ID_MASZYNY` (`ID_MASZYNY`);

--
-- Indexes for table `hala`
--
ALTER TABLE `hala`
  ADD PRIMARY KEY (`NAZWA`);

--
-- Indexes for table `maszyna`
--
ALTER TABLE `maszyna`
  ADD PRIMARY KEY (`NR_EWIDENCYJNY`),
  ADD KEY `NAZWA_HALI` (`NAZWA_HALI`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`ID_OP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `ewidencja`
--
ALTER TABLE `ewidencja`
  MODIFY `ID_EWID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `operator`
--
ALTER TABLE `operator`
  MODIFY `ID_OP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ewidencja`
--
ALTER TABLE `ewidencja`
  ADD CONSTRAINT `ewidencja_ibfk_1` FOREIGN KEY (`ID_PRACOWNIKA`) REFERENCES `operator` (`ID_OP`) ON DELETE CASCADE,
  ADD CONSTRAINT `ewidencja_ibfk_2` FOREIGN KEY (`ID_MASZYNY`) REFERENCES `maszyna` (`NR_EWIDENCYJNY`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `maszyna`
--
ALTER TABLE `maszyna`
  ADD CONSTRAINT `maszyna_ibfk_1` FOREIGN KEY (`NAZWA_HALI`) REFERENCES `hala` (`NAZWA`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
