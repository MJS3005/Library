-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 11 2022 г., 20:08
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
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'Пушкин Александр Сергеевич'),
(2, 'Лермонтов Михаил Юрьевич'),
(3, 'Герберт Уэллс (Herbert Wells)'),
(4, 'Достоевский Федор Михайлович'),
(5, 'Булгаков Михаил Афанасьевич'),
(6, 'Чехов Антон Павлович'),
(7, 'Гоголь Николай Васильевич'),
(8, 'Толстой Лев Николаевич\r\n'),
(9, 'Дубынин Вячеслав Альбертович'),
(10, 'Хокинг Стивен (Stephen Hawking)'),
(11, 'Фримен Эрик, Робсон Элизабет (Freeman Eric, Robson Elisabeth)'),
(12, 'Голдинг Уильям (Golding William)'),
(13, 'Киз Дэниел (Keyes Daniel)'),
(14, 'По Эдгар Аллан (Poe Edgar Allan)');

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
-- Структура таблицы `catalogOfPrintedBooks`
--

CREATE TABLE `catalogOfPrintedBooks` (
  `id` int NOT NULL,
  `books_id` int DEFAULT NULL,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int DEFAULT NULL,
  `category` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `catalog_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `catalogOfPrintedBooks`
--

INSERT INTO `catalogOfPrintedBooks` (`id`, `books_id`, `name`, `author`, `author_id`, `category`, `status`, `status_id`, `catalog_status`) VALUES
(1, 1, 'Барышня-крестьянка', 'Пушкин Александр Сергеевич', 1, 'Русская классика', 'Нет в наличии; выдана ч/б № 12', 2, 'Недоступно'),
(3, 2, 'Герой нашего времени', 'Лермонтов Михаил Юрьевич', 2, 'Русская классика', 'В наличии; стеллаж 1-1/2', 1, 'Свободно'),
(4, 3, 'Человек-невидимка (The Invisible Man)', 'Герберт Уэллс (Herbert Wells)', 3, 'Зарубежная классика', 'Нет в наличии; выдана ч/б № 13', 2, 'Недоступно'),
(5, 1, 'Барышня-крестьянка', 'Пушкин Александр Сергеевич', 1, 'Русская классика', 'В наличии; стеллаж 1-1/2', 1, 'Свободно'),
(6, 4, 'Евгений Онегин', 'Пушкин Александр Сергеевич', 1, 'Русская классика', 'В наличии; стеллаж 1-1/2', 1, 'Свободно'),
(7, 6, 'Мастер и Маргарита', 'Булгаков Михаил Афанасьевич', 5, 'Русская художественная литература', '', 1, 'Свободно'),
(8, 7, 'Дама с собачкой. Рассказы', 'Чехов Антон Павлович', 6, 'Русская художественная литература', '', 1, 'Свободно'),
(9, 8, 'Мертвые души', 'Гоголь Николай Васильевич', 7, 'Русская художественная литература', NULL, 2, 'Недоступно'),
(10, 9, 'Идиот', 'Достоевский Федор Михайлович', 4, 'Русская художественная литература', NULL, 2, 'Недоступно'),
(11, 10, 'Собачье сердце', 'Булгаков Михаил Афанасьевич', 5, 'Русская художественная литература', NULL, 1, 'Свободно'),
(12, 11, 'Анна Каренина', 'Толстой Лев Николаевич', 8, 'Русская художественная литература', NULL, 1, 'Свободно'),
(13, 11, 'Анна Каренина', 'Толстой Лев Николаевич', 8, 'Русская художественная литература', NULL, 1, 'Свободно'),
(14, 12, 'Мозг и его потребности: От питания до признания', 'Дубынин Вячеслав Альбертович', 9, 'Русская научная литература', '', 2, 'Недоступно'),
(15, 13, 'Теория Всего (The Theory Of Everything)', 'Хокинг Стивен (Stephen Hawking)', 10, 'Зарубежная научная литература', NULL, 1, 'Свободно'),
(16, 14, 'Изучаем программирование на JavaScript (Head First JavaScript Programming)', 'Фримен Эрик, Робсон Элизабет (Freeman Eric, Robson Elisabeth)', 11, 'Зарубежная научная литература', NULL, 1, 'Свободно'),
(17, 15, 'Повелитель мух (Lord of the Flies)', 'Голдинг Уильям (Golding William)', 12, 'Зарубежная художественная литература', NULL, 2, 'Недоступно'),
(18, 16, 'Цветы для Элджернона (Flowers for Algernon)', 'Киз Дэниел (Keyes Daniel)', 13, 'Зарубежная художественная литература', NULL, 2, 'Недоступно'),
(19, 17, 'Золотой жук: сборник (The Gold-Bug)', 'По Эдгар Аллан (Poe Edgar Allan)', 14, 'Зарубежная художественная литература', NULL, 1, 'Свободно');

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` int NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `name`, `author`, `category`) VALUES
(1, 'Барышня-крестьянка', 'Пушкин Александр Сергеевич', 'Русская художественная литература'),
(2, 'Герой нашего времени', 'Лермонтов Михаил Юрьевич', 'Русская художественная литература'),
(3, 'Человек-невидимка (The Invisible Man)', 'Герберт Уэллс (Herbert Wells)', 'Зарубежная художественная литература'),
(4, 'Евгений Онегин', 'Пушкин Александр Сергеевич', 'Русская художественная литература'),
(5, 'Преступление и наказание', 'Достоевский Федор Михайлович', 'Русская художественная литература'),
(6, 'Мастер и Маргарита', 'Булгаков Михаил Афанасьевич', 'Русская художественная литература'),
(7, 'Дама с собачкой. Рассказы', 'Чехов Антон Павлович', 'Русская художественная литература'),
(8, 'Мертвые души', 'Гоголь Николай Васильевич', 'Русская художественная литература'),
(9, 'Идиот', 'Достоевский Федор Михайлович', 'Русская художественная литература'),
(10, 'Собачье сердце', 'Булгаков Михаил Афанасьевич', 'Русская художественная литература'),
(11, 'Анна Каренина', 'Толстой Лев Николаевич', 'Русская художественная литература'),
(12, 'Мозг и его потребности: От питания до признания', 'Дубынин Вячеслав Альбертович', 'Русская научная литература'),
(13, 'Теория Всего (The Theory Of Everything)', 'Хокинг Стивен (Stephen Hawking)', 'Зарубежная научная литература'),
(14, 'Изучаем программирование на JavaScript (Head First JavaScript Programming)', 'Фримен Эрик, Робсон Элизабет (Freeman Eric, Robson Elisabeth)', 'Зарубежная научная литература'),
(15, 'Повелитель мух (Lord of the Flies)', 'Голдинг Уильям (Golding William)', 'Зарубежная художественная литература'),
(16, 'Цветы для Элджернона (Flowers for Algernon)', 'Киз Дэниел (Keyes Daniel)', 'Зарубежная художественная литература'),
(17, 'Золотой жук: сборник (The Gold-Bug)', 'По Эдгар Аллан (Poe Edgar Allan)', 'Зарубежная художественная литература');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Свободно'),
(2, 'Недоступно');

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
(16, 'employee', 'Роза', '$2y$10$owJR3cXQ7mtz.gN4lC943uPs/0IN25oXBXgBWhJia5WSF4qy8FGCq', '4444', 'offline', '2022-09-03 00:00:00', 'Роза', '', 'Библиотекарь', 'roza@email.com', '01.01.1970', NULL),
(17, 'reader', 'Татьяна', '$2y$10$d1XLNgUevZiv1.ejPrA7Xe60fRFRYOiIAa46/I6ArnXEPSaYzIAtG', '5555', NULL, '2022-09-04 00:00:00', 'Татьяна', '', 'Сидорова', 'tanya@email.com', '01.01.1990', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalogOfPrintedBooks`
--
ALTER TABLE `catalogOfPrintedBooks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
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
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `catalogOfPrintedBooks`
--
ALTER TABLE `catalogOfPrintedBooks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
