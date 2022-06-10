-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 28 2022 г., 21:48
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `film library`
--
CREATE DATABASE IF NOT EXISTS `film library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `film library`;

-- --------------------------------------------------------

--
-- Структура таблицы `actor`
--

CREATE TABLE `actor` (
  `ID_Actor` int(5) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `actor`
--

INSERT INTO `actor` (`ID_Actor`, `name`) VALUES
(1, 'Leonardo Dicaprio'),
(2, 'Tom Holland'),
(3, 'Daniel Radcliffe'),
(4, 'Ryan Reynolds'),
(5, 'Johnny Depp'),
(6, 'Brad Pitt'),
(7, 'Robert Downey Junior'),
(8, 'Dwayne Johnson');

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `ID_FILM` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `date` year(4) NOT NULL,
  `country` varchar(20) NOT NULL,
  `quality` varchar(10) NOT NULL,
  `resolution` varchar(15) NOT NULL,
  `codec` varchar(10) NOT NULL,
  `producer` varchar(100) NOT NULL,
  `director` varchar(30) NOT NULL,
  `carrier` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`ID_FILM`, `name`, `date`, `country`, `quality`, `resolution`, `codec`, `producer`, `director`, `carrier`) VALUES
(1, 'Titanic', 1997, 'United Kingdom', 'HD+', '1440х720', 'GSM', 'John Landau & James Cameron & Pamela Easley', 'James Cameron', 'video'),
(2, 'Avengers: Endgame', 2019, 'Great Britain', 'HD DVD', '1920x1080', 'iLBC', 'Marvel Studios', 'Anthony Russo & Joe Russo', 'DVD'),
(3, 'Red Notice', 2021, 'USA', 'HD DVD', '1920x1080', 'LPC10', 'Bo Flynn & Hiram Garcia & Rawson Marshall Thurber', 'Rawson Marshall Thurber', 'DVD'),
(4, 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 'USA', 'SATRip', '704x512', 'GSM ', 'Jerry Bruckheimer', 'Gore Verbinski', 'CD'),
(5, 'Harry Potter and the Prisoner of Azkaban', 2004, 'United Kingdom', 'PDTVRip', '624x352', 'ITU G.729', 'David Heyman & Chris Columbus', 'Alfonso Cuaron', 'CD'),
(6, 'The Curious Case of Benjamin Button', 2008, 'United States', 'Blu-Ray', '1920×1080', 'LPC10', 'Ceán Chaffin & Kathleen Kennedy & Frank Marshall', 'David Fincher', 'DVD'),
(7, 'Deadpool 2', 2018, 'United States', 'HD+', '1440х720', 'iLBC', 'Simon Kinberg & Ryan Reynolds & Lauren Shuler Donner', 'David Leitch', 'BR');

-- --------------------------------------------------------

--
-- Структура таблицы `film_actor`
--

CREATE TABLE `film_actor` (
  `FID_Film` int(5) NOT NULL,
  `FID_Actor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film_actor`
--

INSERT INTO `film_actor` (`FID_Film`, `FID_Actor`) VALUES
(1, 1),
(2, 2),
(2, 7),
(3, 4),
(3, 8),
(4, 5),
(5, 3),
(6, 6),
(7, 4),
(7, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `film_genre`
--

CREATE TABLE `film_genre` (
  `FID_Film` int(10) NOT NULL,
  `FID_Genre` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film_genre`
--

INSERT INTO `film_genre` (`FID_Film`, `FID_Genre`) VALUES
(1, 5),
(1, 3),
(2, 4),
(2, 6),
(3, 1),
(3, 7),
(4, 2),
(4, 4),
(6, 2),
(6, 5),
(6, 3),
(5, 2),
(5, 8),
(7, 4),
(7, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `ID_Genre` int(5) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`ID_Genre`, `title`) VALUES
(1, 'thriller'),
(2, 'adventure'),
(3, 'romance'),
(4, 'action'),
(5, 'drama'),
(6, 'sci-Fi'),
(7, 'comedy'),
(8, 'fantasy');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID_Actor`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_FILM`);

--
-- Индексы таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD KEY `FID_Film` (`FID_Film`),
  ADD KEY `FID_Actor` (`FID_Actor`);

--
-- Индексы таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD KEY `FID_Genre` (`FID_Genre`),
  ADD KEY `FID_Film` (`FID_Film`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`FID_Actor`) REFERENCES `actor` (`ID_Actor`);

--
-- Ограничения внешнего ключа таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`FID_FIlm`) REFERENCES `film` (`ID_FILM`),
  ADD CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`FID_Genre`) REFERENCES `genre` (`ID_Genre`),
  ADD CONSTRAINT `film_genre_ibfk_3` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
