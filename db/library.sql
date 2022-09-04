-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 04 2022 г., 18:38
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `name`, `author`, `category`, `status`) VALUES
(1, 'Барышня-крестьянка', 'Пушкин Александр Сергеевич', 'Русская классика', 'Нет в наличии; выдана ч/б № 12'),
(3, 'Герой нашего времени', 'Лермонтов Михаил Юрьевич', 'Русская классика', 'В наличии; место 1-1/1'),
(4, 'Человек-невидимка (The Invisible Man)', 'Герберт Уэллс (Herbert Wells)', 'Зарубежная классика', 'Нет в наличии; выдана ч/б № 13');

-- --------------------------------------------------------

--
-- Структура таблицы `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `id` int NOT NULL,
  `id_of_borrowed_book` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_of_user` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_borrow` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `borrowed_books`
--

INSERT INTO `borrowed_books` (`id`, `id_of_borrowed_book`, `id_of_user`, `date_of_borrow`, `return_date`) VALUES
(49, 'Барышня-крестьянка, Пушкин Александр Сергеевич; арт. №1', 'Иван  Иванов; читательский билет № 12', '2022-09-04 00:00:00', '2022-09-12 00:00:00'),
(51, 'Человек-невидимка (The Invisible Man), Герберт Уэллс (Herbert Wells); арт. №4', 'Петр Петрович Петров; читательский билет № 13', '2022-09-04 00:00:00', '2022-09-12 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sername` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_of_borrowed_books` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role`, `login`, `password`, `show_password`, `status`, `registration_date`, `name`, `patronymic`, `sername`, `email`, `birth_date`, `id_of_borrowed_books`) VALUES
(12, 'reader', 'Иван', '$2y$10$7mP2gHNI14sGFLLvzTqdOOeIbGrdCqQI4hEAxwF77CuYGSBDRHzpm', '1111', 'offline', '2022-09-03 00:00:00', 'Иван', '', 'Иванов', 'ivan@email.com', '01.01.1985', 1),
(13, 'reader', 'Петр Петрович', '$2y$10$d3GFL2dIGnGx2cTAs4yqlO9iErsp7CskWsk3XSvLCzVpjvSbkyN6i', '2222', 'offline', '2022-09-03 00:00:00', 'Петр', 'Петрович', 'Петров', 'petr@email.com', '01.01.1987', 4),
(15, 'reader', 'Masha', '$2y$10$X3j3tHJJRo2Whci2v73xUugDejTBBY4wcShoOKsSR1FLO3nTonmYO', '3333', 'offline', '2022-09-03 00:00:00', 'Мария', '', 'Просто', 'masha@email.com', '01.01.2000', NULL),
(16, 'employee', 'Роза', '$2y$10$owJR3cXQ7mtz.gN4lC943uPs/0IN25oXBXgBWhJia5WSF4qy8FGCq', '4444', 'online', '2022-09-03 00:00:00', 'Роза', '', 'Библиотекарь', 'roza@email.com', '01.01.1970', NULL),
(17, 'reader', 'Татьяна', '$2y$10$d1XLNgUevZiv1.ejPrA7Xe60fRFRYOiIAa46/I6ArnXEPSaYzIAtG', '5555', NULL, '2022-09-04 00:00:00', 'Татьяна', '', 'Сидорова', 'tanya@email.com', '01.01.1990', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
