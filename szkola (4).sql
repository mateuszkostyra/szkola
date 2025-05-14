-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 14, 2025 at 10:16 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

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
-- Struktura tabeli dla tabeli `artykuly`
--

CREATE TABLE `artykuly` (
  `id` int(11) NOT NULL,
  `tytul` text NOT NULL,
  `tresc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artykuly`
--

INSERT INTO `artykuly` (`id`, `tytul`, `tresc`) VALUES
(6, 'Historia', 'Krótka historia naszej szkoly'),
(9, 'Konkurs', 'zapraszamy na konkurs');

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
(12, '5TH', 5, 12),
(13, '2TI', 2, NULL),
(14, '2TR', 2, NULL);

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
-- Struktura tabeli dla tabeli `obecnosci`
--

CREATE TABLE `obecnosci` (
  `id` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_lekcji` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` enum('obecny','nieobecny','spóźniony','usprawiedliwiony') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL,
  `id_nauczyciela` int(11) NOT NULL,
  `data` date NOT NULL,
  `ocena` varchar(5) NOT NULL,
  `waga` int(11) DEFAULT 1,
  `opis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(100, 'Natalia', 'Bednarek', NULL, 'uczen'),
(101, 'Tadeusz', 'Nowaak', NULL, 'uczen'),
(109, 'Kacper', 'Molen', NULL, 'uczen'),
(110, 'Adam', 'Sagol', NULL, 'uczen'),
(111, 'Hubert', 'Zadrożny', NULL, 'uczen');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby_klasy`
--

CREATE TABLE `osoby_klasy` (
  `id_osoby` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osoby_klasy`
--

INSERT INTO `osoby_klasy` (`id_osoby`, `id_klasy`) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(1, 11),
(2, 1),
(2, 3),
(2, 5),
(2, 7),
(2, 9),
(2, 11),
(3, 1),
(3, 3),
(3, 4),
(3, 7),
(3, 10),
(4, 3),
(4, 6),
(4, 9),
(4, 11),
(5, 4),
(5, 7),
(5, 11),
(6, 2),
(6, 5),
(6, 8),
(6, 12),
(7, 1),
(7, 4),
(7, 6),
(7, 10),
(8, 3),
(8, 7),
(8, 10),
(9, 3),
(9, 6),
(9, 8),
(9, 11),
(10, 3),
(10, 4),
(10, 6),
(10, 8),
(10, 10),
(10, 12),
(11, 1),
(11, 7),
(11, 9),
(11, 11),
(12, 1),
(12, 4),
(12, 6),
(12, 7),
(12, 10),
(12, 12),
(13, 2),
(13, 5),
(13, 8),
(13, 10),
(13, 12),
(14, 2),
(14, 4),
(14, 5),
(14, 6),
(14, 8),
(14, 9),
(14, 11),
(14, 12),
(15, 9),
(16, 1),
(16, 2),
(16, 5),
(16, 7),
(16, 9),
(16, 11),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(17, 8),
(17, 10),
(17, 12),
(18, 2),
(19, 2),
(19, 6),
(19, 8),
(19, 10),
(19, 12),
(20, 2),
(20, 4),
(20, 6),
(20, 8),
(20, 10),
(20, 12),
(23, 2),
(23, 4),
(23, 6),
(23, 8),
(23, 10),
(23, 12),
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
(100, 8),
(109, 12),
(111, 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plan_lekcji`
--

CREATE TABLE `plan_lekcji` (
  `id` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL,
  `id_nauczyciela` int(11) NOT NULL,
  `nr_lekcji` int(11) NOT NULL,
  `dzien_tygodnia` enum('Poniedzialek','Wtorek','Sroda','Czwartek','Piatek') DEFAULT NULL,
  `sala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan_lekcji`
--

INSERT INTO `plan_lekcji` (`id`, `id_klasy`, `id_przedmiotu`, `id_nauczyciela`, `nr_lekcji`, `dzien_tygodnia`, `sala`) VALUES
(1, 1, 1, 1, 1, 'Poniedzialek', 'Sala 101'),
(2, 1, 3, 3, 2, 'Poniedzialek', 'Sala 202');

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
-- Indeksy dla tabeli `artykuly`
--
ALTER TABLE `artykuly`
  ADD PRIMARY KEY (`id`);

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
-- Indeksy dla tabeli `obecnosci`
--
ALTER TABLE `obecnosci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_lekcji` (`id_lekcji`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `osoby_klasy`
--
ALTER TABLE `osoby_klasy`
  ADD PRIMARY KEY (`id_osoby`,`id_klasy`),
  ADD KEY `klasa_id` (`id_klasy`);

--
-- Indeksy dla tabeli `plan_lekcji`
--
ALTER TABLE `plan_lekcji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artykuly`
--
ALTER TABLE `artykuly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `obecnosci`
--
ALTER TABLE `obecnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `plan_lekcji`
--
ALTER TABLE `plan_lekcji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `obecnosci`
--
ALTER TABLE `obecnosci`
  ADD CONSTRAINT `obecnosci_ibfk_1` FOREIGN KEY (`id_ucznia`) REFERENCES `osoby` (`id`),
  ADD CONSTRAINT `obecnosci_ibfk_2` FOREIGN KEY (`id_lekcji`) REFERENCES `plan_lekcji` (`id`);

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_ucznia`) REFERENCES `osoby` (`id`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_nauczyciela`) REFERENCES `osoby` (`id`);

--
-- Constraints for table `osoby_klasy`
--
ALTER TABLE `osoby_klasy`
  ADD CONSTRAINT `osoby_klasy_ibfk_1` FOREIGN KEY (`id_osoby`) REFERENCES `osoby` (`id`),
  ADD CONSTRAINT `osoby_klasy_ibfk_2` FOREIGN KEY (`id_klasy`) REFERENCES `klasy` (`id`);

--
-- Constraints for table `plan_lekcji`
--
ALTER TABLE `plan_lekcji`
  ADD CONSTRAINT `plan_lekcji_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasy` (`id`),
  ADD CONSTRAINT `plan_lekcji_ibfk_2` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `plan_lekcji_ibfk_3` FOREIGN KEY (`id_nauczyciela`) REFERENCES `osoby` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
