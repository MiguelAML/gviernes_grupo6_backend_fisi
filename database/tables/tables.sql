SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-05:00";
--
-- Base de datos: `red_estudiantil`
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `comments`
--
CREATE TABLE `comments` (
  `uid` varchar(100) NOT NULL,
  `comment` varchar(150) DEFAULT NULL,
  `is_like` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `person_uid` varchar(100) NOT NULL,
  `post_uid` varchar(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `followers`
--
CREATE TABLE `followers` (
  `uid` varchar(100) NOT NULL,
  `person_uid` varchar(100) NOT NULL,
  `followers_uid` varchar(100) NOT NULL,
  `date_followers` datetime DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `friends`
--
CREATE TABLE `friends` (
  `uid` varchar(100) NOT NULL,
  `person_uid` varchar(100) NOT NULL,
  `friend_uid` varchar(100) NOT NULL,
  `date_friend` datetime DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `images_post`
--
CREATE TABLE `images_post` (
  `uid` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `post_uid` varchar(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `likes`
--
CREATE TABLE `likes` (
  `uid_likes` varchar(100) NOT NULL,
  `user_uid` varchar(100) NOT NULL,
  `post_uid` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `list_chats`
--
CREATE TABLE `list_chats` (
  `uid_list_chat` varchar(100) NOT NULL,
  `source_uid` varchar(100) NOT NULL,
  `target_uid` varchar(100) NOT NULL,
  `last_message` text,
  `updated_at` datetime DEFAULT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `media_story`
--
CREATE TABLE `media_story` (
  `uid_media_story` varchar(100) NOT NULL,
  `media` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `story_uid` varchar(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `messages`
--
CREATE TABLE `messages` (
  `uid_messages` varchar(100) NOT NULL,
  `source_uid` varchar(100) NOT NULL,
  `target_uid` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `notifications`
--
CREATE TABLE `notifications` (
  `uid_notification` varchar(100) NOT NULL,
  `type_notification` varchar(5) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_uid` varchar(100) NOT NULL,
  `followers_uid` varchar(100) DEFAULT NULL,
  `post_uid` varchar(100) DEFAULT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `person`
--
CREATE TABLE `person` (
  `uid` varchar(100) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `cover` varchar(50) DEFAULT NULL,
  `birthday_date` date DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `faculty` varchar(100) DEFAULT NULL,
  `cycle` int(11) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `posts`
--
CREATE TABLE `posts` (
  `uid` varchar(100) NOT NULL,
  `is_comment` tinyint(1) DEFAULT '1',
  `type_privacy` varchar(3) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `person_uid` varchar(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `post_save`
--
CREATE TABLE `post_save` (
  `post_save_uid` varchar(100) NOT NULL,
  `post_uid` varchar(100) NOT NULL,
  `person_uid` varchar(100) NOT NULL,
  `date_save` datetime DEFAULT CURRENT_TIMESTAMP
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `stories`
--
CREATE TABLE `stories` (
  `uid_story` varchar(100) NOT NULL,
  `user_uid` varchar(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `users`
--
CREATE TABLE `users` (
  `uid` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT '0',
  `is_online` tinyint(1) DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `passwordd` varchar(100) NOT NULL,
  `email_verified` tinyint(1) DEFAULT '0',
  `person_uid` varchar(100) NOT NULL,
  `notification_token` varchar(255) DEFAULT NULL,
  `token_temp` varchar(100) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `person_uid` (`person_uid`),
  ADD KEY `post_uid` (`post_uid`);
--
-- Indices de la tabla `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `person_uid` (`person_uid`),
  ADD KEY `followers_uid` (`followers_uid`);
--
-- Indices de la tabla `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `person_uid` (`person_uid`),
  ADD KEY `friend_uid` (`friend_uid`);
--
-- Indices de la tabla `images_post`
--
ALTER TABLE `images_post`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `post_uid` (`post_uid`);
--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`uid_likes`),
  ADD KEY `user_uid` (`user_uid`),
  ADD KEY `post_uid` (`post_uid`);
--
-- Indices de la tabla `list_chats`
--
ALTER TABLE `list_chats`
  ADD PRIMARY KEY (`uid_list_chat`),
  ADD KEY `source_uid` (`source_uid`),
  ADD KEY `target_uid` (`target_uid`);
--
-- Indices de la tabla `media_story`
--
ALTER TABLE `media_story`
  ADD PRIMARY KEY (`uid_media_story`),
  ADD KEY `story_uid` (`story_uid`);
--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`uid_messages`),
  ADD KEY `source_uid` (`source_uid`),
  ADD KEY `target_uid` (`target_uid`);
--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`uid_notification`),
  ADD KEY `user_uid` (`user_uid`),
  ADD KEY `followers_uid` (`followers_uid`),
  ADD KEY `post_uid` (`post_uid`);
--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`uid`);
--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `person_uid` (`person_uid`);
--
-- Indices de la tabla `post_save`
--
ALTER TABLE `post_save`
  ADD PRIMARY KEY (`post_save_uid`),
  ADD KEY `post_uid` (`post_uid`),
  ADD KEY `person_uid` (`person_uid`);
--
-- Indices de la tabla `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`uid_story`),
  ADD KEY `user_uid` (`user_uid`);
--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `person_uid` (`person_uid`);
  
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_uid`) REFERENCES `posts` (`uid`);
--
-- Filtros para la tabla `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`followers_uid`) REFERENCES `person` (`uid`);
--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`),
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_uid`) REFERENCES `person` (`uid`);
--
-- Filtros para la tabla `images_post`
--
ALTER TABLE `images_post`
  ADD CONSTRAINT `images_post_ibfk_1` FOREIGN KEY (`post_uid`) REFERENCES `posts` (`uid`);
--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_uid`) REFERENCES `users` (`person_uid`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_uid`) REFERENCES `posts` (`uid`);
--
-- Filtros para la tabla `list_chats`
--
ALTER TABLE `list_chats`
  ADD CONSTRAINT `list_chats_ibfk_1` FOREIGN KEY (`source_uid`) REFERENCES `person` (`uid`),
  ADD CONSTRAINT `list_chats_ibfk_2` FOREIGN KEY (`target_uid`) REFERENCES `person` (`uid`);
--
-- Filtros para la tabla `media_story`
--
ALTER TABLE `media_story`
  ADD CONSTRAINT `media_story_ibfk_1` FOREIGN KEY (`story_uid`) REFERENCES `stories` (`uid_story`) ON DELETE CASCADE;
--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`source_uid`) REFERENCES `users` (`person_uid`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`target_uid`) REFERENCES `users` (`person_uid`);
--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_uid`) REFERENCES `users` (`person_uid`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`followers_uid`) REFERENCES `users` (`person_uid`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`post_uid`) REFERENCES `posts` (`uid`);
--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`);
--
-- Filtros para la tabla `post_save`
--
ALTER TABLE `post_save`
  ADD CONSTRAINT `post_save_ibfk_1` FOREIGN KEY (`post_uid`) REFERENCES `posts` (`uid`),
  ADD CONSTRAINT `post_save_ibfk_2` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`);
--
-- Filtros para la tabla `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`user_uid`) REFERENCES `users` (`person_uid`);
--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`person_uid`) REFERENCES `person` (`uid`);
COMMIT;