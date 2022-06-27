-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2022 г., 19:27
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'пробная категория - 1', 'probnaya-kategoriya-1', '2022-06-15 04:45:45', '2022-06-25 13:36:05'),
(3, 'вторая категория-2', 'vtoraya-kategoriya', '2022-06-15 04:55:37', '2022-06-15 04:55:50'),
(4, 'пробная категория- 3', 'probnaya-kategoriya-3', '2022-06-17 07:00:45', '2022-06-17 07:00:54'),
(5, 'similique', 'similique', '2022-06-22 04:36:09', '2022-06-22 04:36:09'),
(6, 'non', 'non', '2022-06-22 04:37:30', '2022-06-22 04:37:30'),
(7, 'ad', 'ad', '2022-06-22 04:37:30', '2022-06-22 04:37:30'),
(8, 'et', 'et', '2022-06-22 04:37:30', '2022-06-22 04:37:30'),
(9, 'aut', 'aut', '2022-06-22 04:37:30', '2022-06-22 04:37:30');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'первый комментарий', 3, 14, 1, '2022-06-24 06:13:58', '2022-06-25 13:02:24'),
(3, 'второй комментарий к посту', 1, 18, 1, '2022-06-25 12:55:33', '2022-06-25 12:57:07'),
(4, 'комментарий к последнему посту', 1, 21, 1, '2022-06-25 13:02:10', '2022-06-25 13:02:20');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_06_08_150559_create_categories_table', 1),
(26, '2022_06_08_152545_create_tags_table', 1),
(27, '2022_06_08_152655_create_comments_table', 1),
(28, '2022_06_08_152711_create_posts_table', 1),
(29, '2022_06_08_152743_create_subscriptions_table', 1),
(30, '2022_06_08_154421_create_posts_tags_table', 1),
(31, '2022_06_15_125509_add_avatar_column_to_users', 2),
(32, '2022_06_19_165124_add_date_to_posts', 3),
(33, '2022_06_19_170721_add_image_to_posts', 4),
(34, '2022_06_22_081852_add_description_to_posts', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `is_featured` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `category_id`, `user_id`, `status`, `views`, `is_featured`, `created_at`, `updated_at`, `date`, `image`, `description`) VALUES
(14, 'Majesty,\' he began. \'You\'re.', 'majesty-he-began-you-re', 'Gryphon, and the beak-- Pray how did you ever eat a little of her head in the last concert!\' on which the words \'DRINK ME\' beautifully printed on it were nine o\'clock in the direction it pointed to, without trying to box her own ears for.wwr', 4, 1, 0, 3980, 1, '2022-06-22 04:52:13', '2022-06-25 09:08:30', '2022-06-22', NULL, 'ffjgjgjfg56756gfgfgfg53535'),
(15, 'How funny it\'ll seem to.', 'how-funny-it-ll-seem-to', 'She took down a large cauldron which seemed to be trampled under its feet, ran round the court was a child,\' said the White Rabbit; \'in fact, there\'s nothing written on the table. \'Nothing can be clearer than THAT. Then.', 1, 1, 1, 2888, 0, '2022-06-22 04:52:13', '2022-06-25 10:24:57', '2022-06-23', NULL, 'gcbxbxcbxbxcbxcbxb6546456'),
(16, 'White Rabbit cried out.', 'white-rabbit-cried-out', 'Alice. \'Nothing,\' said Alice. \'I don\'t see how he can thoroughly enjoy The pepper when he finds out who was reading the list of singers. \'You may go,\' said the Hatter. Alice felt a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\"\' said the Queen.', 5, 2, 1, 4785, 1, '2022-06-22 04:52:13', '2022-06-22 04:52:13', '2022-06-22', NULL, NULL),
(17, 'Alice looked round, eager.', 'alice-looked-round-eager', 'I don\'t want to get out at the mouth with strings: into this they slipped the guinea-pig, head first, and then treading on her toes when they liked, so that it had struck her foot! She was moving them about as she swam about, trying to invent something!\' \'I--I\'m a little.', 5, 1, 1, 957, 0, '2022-06-22 04:52:13', '2022-06-22 04:52:13', '2022-06-22', NULL, NULL),
(18, 'Good-bye, feet!\' (for.', 'good-bye-feet-for', 'Alice, (she had kept a piece of evidence we\'ve heard yet,\' said the Mouse had changed his mind, and was going to say,\' said the Mock Turtle said: \'I\'m too stiff. And the moral of that dark hall, and wander about among those beds of bright flowers and the turtles all advance! They are waiting.', 10, 2, 1, 4910, 0, '2022-06-22 04:52:13', '2022-06-22 04:52:13', '2022-06-22', NULL, NULL),
(19, 'Father William replied.', 'father-william-replied', 'The Rabbit started violently, dropped the white kid gloves: she took up the conversation a little. \'\'Tis so,\' said Alice. \'Oh, don\'t talk about her and to her ear, and whispered \'She\'s under sentence of execution.\'.', 9, 2, 1, 1187, 0, '2022-06-22 04:52:13', '2022-06-22 04:52:13', '2022-06-22', NULL, NULL),
(20, 'Dormouse turned out, and.', 'dormouse-turned-out-and', 'And he got up and say \"Who am I to do it.\' (And, as you liked.\' \'Is that all?\' said the Cat said, waving its right paw round, \'lives a Hatter: and in another moment it was not a mile high,\' said.', 5, 1, 1, 2778, 1, '2022-06-22 04:52:13', '2022-06-22 04:52:13', '2022-06-22', NULL, NULL),
(21, 'пост доступ', 'post-dosdup', 'пробный пост от юзера на проверку доступа - фЫАфаФА', 1, 1, 0, 0, 1, '2022-06-25 10:23:40', '2022-06-25 10:24:06', '2022-06-25', 'RaDNQN4GEX.jpg', 'пробный пост от юзера на проверку доступа');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(7, 14, 5, NULL, NULL),
(8, 14, 7, NULL, NULL),
(9, 14, 9, NULL, NULL),
(10, 16, 6, NULL, NULL),
(11, 16, 10, NULL, NULL),
(12, 16, 12, NULL, NULL),
(13, 21, 5, NULL, NULL),
(14, 21, 6, NULL, NULL),
(15, 15, 7, NULL, NULL),
(16, 15, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(2, 'example@rambler.ru', NULL, '2022-06-24 13:32:45', '2022-06-24 13:32:45'),
(3, 'nickon_job1@rambler.ru', 'V89RrELUZQFE2aDyO9Yezrlh4bGsNL4m2KgVW9ZJR5l2QxAEQRbVZAT4MbCTk3c9KGLHaKboYaHqOGyvuv2AvpXWJtYyAzF4GC3A', '2022-06-25 08:00:04', '2022-06-25 08:00:04'),
(4, 'example2@rambler.ru', 'W8fNfG6EoSX7lEHNv27IHA6Ts6ZJew45Nul1dhUza93rLxjEJLQKYFBRLjvRSAKaArlFjCOxRe6cGxBmEUHVc3JMJa296MQymRzW', '2022-06-25 08:03:38', '2022-06-25 08:03:38');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(5, 'тег1', 'teg1', '2022-06-19 14:25:10', '2022-06-19 14:25:10'),
(6, 'тег2', 'teg2', '2022-06-19 14:25:17', '2022-06-19 14:25:17'),
(7, 'тег3', 'teg3', '2022-06-19 14:25:22', '2022-06-19 14:25:22'),
(8, 'non', 'non', '2022-06-22 04:38:18', '2022-06-22 04:38:18'),
(9, 'praesentium', 'praesentium', '2022-06-22 04:38:18', '2022-06-22 04:38:18'),
(10, 'consequatur', 'consequatur', '2022-06-22 04:38:18', '2022-06-22 04:38:18'),
(11, 'nemo', 'nemo', '2022-06-22 04:38:18', '2022-06-22 04:38:18'),
(12, 'laudantium', 'laudantium', '2022-06-22 04:38:18', '2022-06-22 04:38:18');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `status`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'user1', 'user1@rambler.ru', NULL, '$2y$10$liJ8gvOyaTUyW.aBrXxqeuVtT6kNhLNXpR2E86WN7kKwlOxixkQ5S', 1, 0, NULL, '2022-06-15 09:18:28', '2022-06-25 13:00:23', 'FsXCjYAgU5.jpg'),
(2, 'user2', 'user2@rambler.ru', NULL, '$2y$10$2ARuSwdtu5o6YtNBvXOj2uzw3GPlDuzrAWZx/rn6oN821zfGrbbVS', 1, 0, NULL, '2022-06-17 07:35:13', '2022-06-25 13:00:51', 'Gm4Ee93Nbo.jpg'),
(3, 'user3', 'user3@rambler.ru', NULL, '$2y$10$DT1p5dYnqb5JPiHiluF87exKTZG9XvRLvgYlrC2vgNxFfIq0qbzLu', 1, 0, NULL, '2022-06-24 02:41:32', '2022-06-25 13:01:07', 'KURcxKlDoE.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
