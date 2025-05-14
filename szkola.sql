-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 09, 2025 at 10:45 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(10) NOT NULL,
  `rok_nauki` int(11) NOT NULL,
  `wychowawca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klasy`
--

INSERT INTO `klasy` (`id`, `nazwa`, `rok_nauki`, `wychowawca_id`) VALUES
(1, '3TI', 3, 1),
(2, '4TI', 4, 2),
(3, '5TI', 5, 3),
(4, '3TG', 3, 4),
(5, '4TG', 4, 5),
(6, '5TG', 5, 6),
(7, '3TR', 3, 7),
(8, '4TR', 4, 8),
(9, '5TR', 5, 9),
(10, '3TH', 3, 10),
(11, '4TH', 4, 11),
(12, '5TH', 5, 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele_przedmioty`
--

CREATE TABLE `nauczyciele_przedmioty` (
  `nauczyciel_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nauczyciele_przedmioty`
--

INSERT INTO `nauczyciele_przedmioty` (`nauczyciel_id`, `przedmiot_id`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 7),
(5, 6),
(6, 9),
(7, 5),
(8, 9),
(9, 14),
(10, 15),
(11, 13),
(12, 4),
(12, 12),
(13, 4),
(14, 3),
(15, 9),
(16, 10),
(17, 11),
(19, 8),
(20, 2),
(23, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `rola` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osoby`
--

INSERT INTO `osoby` (`id`, `imie`, `nazwisko`, `data_urodzenia`, `rola`) VALUES
(1, 'Adam', 'Kalata', NULL, 'nauczyciel'),
(2, 'Elzbieta', 'Szymczak', NULL, 'nauczyciel'),
(3, 'Agnieszka', 'Jedrych', NULL, 'nauczyciel'),
(4, 'Iwona', 'Kwas', NULL, 'nauczyciel'),
(5, 'Norbert', 'Bienias', NULL, 'nauczyciel'),
(6, 'Krzysztof', 'Kozlak', NULL, 'nauczyciel'),
(7, 'Beata', 'Kryczka', NULL, 'nauczyciel'),
(8, 'Wioleta', 'Grzegrzolka', NULL, 'nauczyciel'),
(9, 'Natalia', 'Zywicka', NULL, 'nauczyciel'),
(10, 'Jolanta', 'Wojtasik', NULL, 'nauczyciel'),
(11, 'Anna', 'Salwa', NULL, 'nauczyciel'),
(12, 'Kamil', 'Sztelmach', NULL, 'nauczyciel'),
(13, 'Beata', 'Bienias', NULL, 'nauczyciel'),
(14, 'Milena', 'Kuzniak', NULL, 'nauczyciel'),
(15, 'Jacek', 'Mucha', NULL, 'nauczyciel'),
(16, 'Tomasz', 'Odziemczyk', NULL, 'nauczyciel'),
(17, 'Dorota', 'Kopek', NULL, 'nauczyciel'),
(18, 'Marcin', 'Chrusciel', NULL, 'administrator'),
(19, 'Malgorzata', 'Gula', NULL, 'nauczyciel'),
(20, 'Dorota', 'Kalata', NULL, 'nauczyciel'),
(21, 'Lidia', 'Socko', NULL, 'menager'),
(22, 'Michal', 'Kosyra', NULL, 'dyrektor'),
(23, 'Lidia', 'Lasocka', NULL, 'nauczyciel'),
(24, 'Adrian', 'Gliwka', NULL, 'uczen'),
(25, 'Kacper', 'Bozek', NULL, 'uczen'),
(26, 'Tomasz', 'Korgul', NULL, 'uczen'),
(27, 'Szymon', 'Mika', NULL, 'uczen'),
(28, 'Kacper', 'Siarkiewicz', NULL, 'uczen'),
(29, 'Kacper', 'Parzyszek', NULL, 'uczen'),
(30, 'Sebastian', 'Zalewski', NULL, 'uczen'),
(31, 'Mateusz', 'Walesiak', NULL, 'uczen'),
(32, 'Daniel', 'Ogrodnik', NULL, 'uczen'),
(33, 'Jakub', 'Bogusz', NULL, 'uczen'),
(34, 'Alicja', 'Lazurek', NULL, 'uczen'),
(35, 'Adrian', 'Wardak', NULL, 'uczen'),
(36, 'Sebastian', 'Polak', NULL, 'uczen'),
(37, 'Maciej', 'Slyk', NULL, 'uczen'),
(38, 'Szymon', 'Sagol', NULL, 'uczen'),
(39, 'Nikola', 'Maslak', NULL, 'uczen'),
(40, 'Klaudia', 'Kolodziejek', NULL, 'uczen'),
(41, 'Julia', 'Wesolowska', NULL, 'uczen'),
(42, 'Amelia', 'Gruza', NULL, 'uczen'),
(43, 'Kuba', 'Zatyka', NULL, 'uczen'),
(44, 'Kacper', 'Korycki', NULL, 'uczen'),
(45, 'Piotr', 'Wojcik', NULL, 'uczen'),
(46, 'Filip', 'Piasecki', NULL, 'uczen'),
(47, 'Maciej', 'Grzyb', NULL, 'uczen'),
(48, 'Szymon', 'Mikusek', NULL, 'uczen'),
(49, 'Mateusz', 'Dziubak', NULL, 'uczen'),
(50, 'Patryk', 'Bareja', NULL, 'uczen'),
(51, 'Bartek', 'Fraczek', NULL, 'uczen'),
(52, 'Patryk', 'Kaszuba', NULL, 'uczen'),
(53, 'Norbert', 'Szczesniak', NULL, 'uczen'),
(54, 'Kacper', 'Nowak', NULL, 'uczen'),
(55, 'Zofia', 'Kowalska', NULL, 'uczen'),
(56, 'Tymon', 'Wiśniewski', NULL, 'uczen'),
(57, 'Lena', 'Dąbrowska', NULL, 'uczen'),
(58, 'Antoni', 'Mazur', NULL, 'uczen'),
(59, 'Julia', 'Wójcik', NULL, 'uczen'),
(60, 'Mikołaj', 'Krawczyk', NULL, 'uczen'),
(61, 'Alicja', 'Zielińska', NULL, 'uczen'),
(62, 'Igor', 'Szymański', NULL, 'uczen'),
(63, 'Natalia', 'Woźniak', NULL, 'uczen'),
(64, 'Jan', 'Jankowski', NULL, 'uczen'),
(65, 'Oliwia', 'Kamińska', NULL, 'uczen'),
(66, 'Bartosz', 'Lewandowski', NULL, 'uczen'),
(67, 'Amelia', 'Zawadzka', NULL, 'uczen'),
(68, 'Filip', 'Pawlak', NULL, 'uczen'),
(69, 'Martyna', 'Król', NULL, 'uczen'),
(70, 'Szymon', 'Górski', NULL, 'uczen'),
(71, 'Wiktoria', 'Rutkowska', NULL, 'uczen'),
(72, 'Maja', 'Baran', NULL, 'uczen'),
(73, 'Nikodem', 'Sikora', NULL, 'uczen'),
(74, 'Aleksandra', 'Marciniak', NULL, 'uczen'),
(75, 'Kamil', 'Sadowski', NULL, 'uczen'),
(76, 'Emilia', 'Walczak', NULL, 'uczen'),
(77, 'Dawid', 'Czarnecki', NULL, 'uczen'),
(78, 'Milena', 'Sawicka', NULL, 'uczen'),
(79, 'Hubert', 'Adamski', NULL, 'uczen'),
(80, 'Paulina', 'Szulc', NULL, 'uczen'),
(81, 'Oskar', 'Włodarczyk', NULL, 'uczen'),
(82, 'Weronika', 'Kaczmarek', NULL, 'uczen'),
(83, 'Adrian', 'Kaleta', NULL, 'uczen'),
(84, 'Nina', 'Michalska', NULL, 'uczen'),
(85, 'Patryk', 'Tomaszewski', NULL, 'uczen'),
(86, 'Karolina', 'Kubicka', NULL, 'uczen'),
(87, 'Sebastian', 'Urban', NULL, 'uczen'),
(88, 'Laura', 'Madej', NULL, 'uczen'),
(89, 'Dominik', 'Szymczak', NULL, 'uczen'),
(90, 'Helena', 'Kopeć', NULL, 'uczen'),
(91, 'Marcel', 'Leszczyński', NULL, 'uczen'),
(92, 'Gabriela', 'Wilk', NULL, 'uczen'),
(93, 'Alan', 'Borowski', NULL, 'uczen'),
(94, 'Klaudia', 'Sikorska', NULL, 'uczen'),
(95, 'Rafał', 'Musiał', NULL, 'uczen'),
(96, 'Iga', 'Stasiak', NULL, 'uczen'),
(97, 'Tomasz', 'Olejnik', NULL, 'uczen'),
(98, 'Liliana', 'Cieślak', NULL, 'uczen'),
(99, 'Mateusz', 'Bąk', NULL, 'uczen'),
(100, 'Natalia', 'Bednarek', NULL, 'uczen');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby_klasy`
--

CREATE TABLE `osoby_klasy` (
  `osoba_id` int(11) NOT NULL,
  `klasa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osoby_klasy`
--

INSERT INTO `osoby_klasy` (`osoba_id`, `klasa_id`) VALUES
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 5),
(33, 5),
(34, 8),
(35, 5),
(36, 11),
(37, 5),
(38, 6),
(39, 9),
(40, 8),
(41, 8),
(42, 8),
(43, 3),
(44, 6),
(45, 1),
(46, 10),
(47, 9),
(48, 1),
(49, 9),
(50, 7),
(51, 12),
(52, 10),
(53, 11),
(55, 5),
(56, 8),
(57, 3),
(58, 12),
(59, 1),
(60, 6),
(61, 4),
(62, 10),
(63, 7),
(64, 1),
(65, 6),
(66, 3),
(67, 9),
(68, 12),
(69, 7),
(70, 11),
(71, 5),
(72, 6),
(73, 8),
(74, 4),
(75, 1),
(76, 7),
(77, 10),
(78, 3),
(79, 9),
(80, 6),
(81, 5),
(82, 12),
(83, 4),
(84, 8),
(85, 11),
(86, 1),
(87, 10),
(88, 3),
(89, 7),
(90, 9),
(91, 6),
(92, 12),
(93, 11),
(94, 5),
(95, 4),
(96, 10),
(97, 7),
(98, 1),
(99, 9),
(100, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`id`, `nazwa`) VALUES
(1, 'Matematyka'),
(2, 'Język polski'),
(3, 'Język angielski'),
(4, 'Historia'),
(5, 'Geografia'),
(6, 'Biologia'),
(7, 'Chemia'),
(8, 'Fizyka'),
(9, 'Informatyka'),
(10, 'Wychowanie fizyczne'),
(11, 'Religia'),
(12, 'Wiedza o społeczeństwie'),
(13, 'Język niemiecki'),
(14, 'Język francuski'),
(15, 'Język rosyjski');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wychowawca_id` (`wychowawca_id`);

--
-- Indeksy dla tabeli `nauczyciele_przedmioty`
--
ALTER TABLE `nauczyciele_przedmioty`
  ADD PRIMARY KEY (`nauczyciel_id`,`przedmiot_id`),
  ADD KEY `przedmiot_id` (`przedmiot_id`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `osoby_klasy`
--
ALTER TABLE `osoby_klasy`
  ADD PRIMARY KEY (`osoba_id`,`klasa_id`),
  ADD KEY `klasa_id` (`klasa_id`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klasy`
--
ALTER TABLE `klasy`
  ADD CONSTRAINT `klasy_ibfk_1` FOREIGN KEY (`wychowawca_id`) REFERENCES `osoby` (`id`);

--
-- Constraints for table `nauczyciele_przedmioty`
--
ALTER TABLE `nauczyciele_przedmioty`
  ADD CONSTRAINT `nauczyciele_przedmioty_ibfk_1` FOREIGN KEY (`nauczyciel_id`) REFERENCES `osoby` (`id`),
  ADD CONSTRAINT `nauczyciele_przedmioty_ibfk_2` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmioty` (`id`);

--
-- Constraints for table `osoby_klasy`
--
ALTER TABLE `osoby_klasy`
  ADD CONSTRAINT `osoby_klasy_ibfk_1` FOREIGN KEY (`osoba_id`) REFERENCES `osoby` (`id`),
  ADD CONSTRAINT `osoby_klasy_ibfk_2` FOREIGN KEY (`klasa_id`) REFERENCES `klasy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
