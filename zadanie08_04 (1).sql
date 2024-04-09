-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 09 2024 г., 07:20
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zadanie08.04`
--

-- --------------------------------------------------------

--
-- Структура таблицы `arrival`
--

CREATE TABLE `arrival` (
  `id` int DEFAULT NULL,
  `port_name` varchar(30) DEFAULT NULL,
  `ship_name` varchar(30) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY RANGE (year(`arrival_date`))
(
PARTITION p0 VALUES LESS THAN (2023) ENGINE=InnoDB,
PARTITION p1 VALUES LESS THAN (2024) ENGINE=InnoDB
);

-- --------------------------------------------------------

--
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `id` int DEFAULT NULL,
  `client_type` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY RANGE COLUMNS(client_type)
(
PARTITION part1 VALUES LESS THAN ('Юридическое лицо') ENGINE=InnoDB,
PARTITION part2 VALUES LESS THAN (MAXVALUE) ENGINE=InnoDB
);

--
-- Дамп данных таблицы `Clients`
--

INSERT INTO `Clients` (`id`, `client_type`, `phone`) VALUES
(3, 'Физическое лицо', '8354678'),
(4, 'Физическое лицо', '83424466'),
(1, 'Юридическое лицо', '894368965'),
(2, 'Юридическое лицо', '85674238'),
(5, 'Юридическое лицо', '85674238');

-- --------------------------------------------------------

--
-- Структура таблицы `Directions`
--

CREATE TABLE `Directions` (
  `ship_number` int DEFAULT NULL,
  `port` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY LIST COLUMNS(ship_number)
(
PARTITION gruz VALUES IN (1,3) ENGINE=InnoDB,
PARTITION passenge VALUES IN (2,4) ENGINE=InnoDB,
PARTITION gruz_passenger VALUES IN (5) ENGINE=InnoDB
);

--
-- Дамп данных таблицы `Directions`
--

INSERT INTO `Directions` (`ship_number`, `port`) VALUES
(1, 'Йеск'),
(3, 'Тамань'),
(2, 'Севастополь'),
(4, 'Туапсе'),
(5, 'Кавказ');

-- --------------------------------------------------------

--
-- Структура таблицы `ports`
--

CREATE TABLE `ports` (
  `id` int DEFAULT NULL,
  `titLe` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY LIST COLUMNS(title)
(
PARTITION gruz VALUES IN ('Ейск','Севастополь','Тамань') ENGINE=InnoDB,
PARTITION pass VALUES IN ('Туапсе','Анапа','Геленджик') ENGINE=InnoDB,
PARTITION gruz_pass VALUES IN ('Кавказ','Сочи') ENGINE=InnoDB
);

--
-- Дамп данных таблицы `ports`
--

INSERT INTO `ports` (`id`, `titLe`) VALUES
(1, 'Ейск'),
(2, 'Севастополь'),
(3, 'Тамань'),
(6, 'Туапсе'),
(7, 'Анапа'),
(8, 'Геленджик'),
(4, 'Сочи'),
(5, 'Кавказ');

-- --------------------------------------------------------

--
-- Структура таблицы `ships`
--

CREATE TABLE `ships` (
  `id` int NOT NULL,
  `title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY LIST (`id`)
(
PARTITION part1 VALUES IN (1,3,5) ENGINE=InnoDB,
PARTITION part2 VALUES IN (2,4) ENGINE=InnoDB
);

--
-- Дамп данных таблицы `ships`
--

INSERT INTO `ships` (`id`, `title`) VALUES
(1, 'Аврора'),
(3, 'Ямада'),
(5, 'Дорис'),
(2, 'Барс'),
(4, 'Варна');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
