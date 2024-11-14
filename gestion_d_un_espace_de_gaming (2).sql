-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 nov. 2024 à 11:13
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion d'un espace de gaming`
--

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id_games` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `age_rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `games`
--

INSERT INTO `games` (`id_games`, `title`, `genre`, `age_rating`) VALUES
(1, 'League of Legends', 'MOBA', 12),
(2, 'FIFA 2024', 'Sports', 3),
(3, 'Counter Strike', 'FPS', 16);

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `id_players` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`id_players`, `name`, `email`, `birth_date`) VALUES
(1, 'Daryl  ', 'daryl@example.com', '1995-04-12'),
(2, 'Nicolas Dupont ', 'nicolas@example.com', '1990-06-25'),
(3, 'Carl ', 'carl@example.com', '1988-09-03');

-- --------------------------------------------------------

--
-- Structure de la table `playersessions`
--

CREATE TABLE `playersessions` (
  `id_player_session` bigint(20) UNSIGNED NOT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_session` int(11) DEFAULT NULL,
  `id_room` int(11) DEFAULT NULL,
  `join_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `playersessions`
--

INSERT INTO `playersessions` (`id_player_session`, `id_player`, `id_session`, `id_room`, `join_time`) VALUES
(1, 1, 1, NULL, '2024-11-14 09:54:37'),
(2, 2, 1, NULL, '2024-11-14 09:54:37'),
(3, 3, 2, NULL, '2024-11-14 09:54:37'),
(4, 1, 3, NULL, '2024-11-14 09:54:37'),
(5, 2, 3, NULL, '2024-11-14 09:54:37');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id_rooms` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `max_players` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id_rooms`, `name`, `max_players`) VALUES
(1, 'Salle A', 5),
(2, 'Salle B', 10);

-- --------------------------------------------------------

--
-- Structure de la table `scores`
--

CREATE TABLE `scores` (
  `id_scores` bigint(20) UNSIGNED NOT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_session` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `scores`
--

INSERT INTO `scores` (`id_scores`, `id_player`, `id_session`, `score`) VALUES
(1, 1, 1, 120),
(2, 2, 1, 95),
(3, 3, 2, 100),
(4, 1, 3, 130),
(5, 2, 3, 110);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id_sessions` bigint(20) UNSIGNED NOT NULL,
  `id_game` int(11) DEFAULT NULL,
  `id_room` int(11) DEFAULT NULL,
  `session_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id_sessions`, `id_game`, `id_room`, `session_date`, `start_time`, `end_time`) VALUES
(1, 1, 1, '2024-11-15', '14:00:00', '16:00:00'),
(2, 2, 2, '2024-11-15', '16:30:00', '18:30:00'),
(3, 3, 1, '2024-11-16', '10:00:00', '12:00:00'),
(4, 1, 2, '2024-11-17', '11:00:00', '13:00:00'),
(5, 2, 1, '2024-11-17', '15:00:00', '17:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id_games`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id_players`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `playersessions`
--
ALTER TABLE `playersessions`
  ADD PRIMARY KEY (`id_player_session`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id_rooms`);

--
-- Index pour la table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id_scores`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id_sessions`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id_games` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
  MODIFY `id_players` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `playersessions`
--
ALTER TABLE `playersessions`
  MODIFY `id_player_session` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id_rooms` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `scores`
--
ALTER TABLE `scores`
  MODIFY `id_scores` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id_sessions` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;








--  ## 2. Requêtes de Base

--  1. Lister tous les joueurs avec leur date de naissance.
SELECT name, birth_date FROM Players;


--  2. Lister tous les jeux avec leur genre et âge minimum recommandé.
SELECT title, genre, age_rating FROM Games;


--  3. Lister les sessions de jeu (date, heure de début et fin) par salle.
SELECT r.name AS room_name, s.session_date, s.start_time, s.end_time
FROM Sessions s
JOIN Rooms r ON s.id_room = r.id_rooms
ORDER BY r.name, s.session_date;


--  ## 3. Requêtes avec Jointures

--  1. Récupérer les scores de tous les joueurs pour une session donnée.
SELECT p.name, sc.score
FROM Scores sc
JOIN Players p ON sc.id_player = p.id_players
WHERE sc.id_session = 1; 


--  2. Afficher les informations des sessions (date, jeu, salle) où un joueur spécifique a participé.
SELECT s.session_date, g.title, r.name AS room_name
FROM Sessions s
JOIN Games g ON s.id_game = g.id_games
JOIN Rooms r ON s.id_room = r.id_rooms
JOIN PlayerSessions ps ON ps.id_session = s.id_sessions
WHERE ps.id_player = 1;


--  3. Lister les salles et les sessions avec le nombre de joueurs ayant participé.
SELECT r.name AS room_name, s.session_date, COUNT(ps.id_player) AS player_count
FROM Sessions s
JOIN Rooms r ON s.id_room = r.id_rooms
LEFT JOIN PlayerSessions ps ON ps.id_session = s.id_sessions
GROUP BY r.name, s.session_date;


--  ## 4. Requêtes avec Conditions et Agrégats

--  1. Trouver le meilleur score pour chaque joueur sur l’ensemble des sessions.
SELECT p.name, MAX(sc.score) AS best_score
FROM Scores sc
JOIN Players p ON sc.id_player = p.id_players
GROUP BY p.name;


--  2. Afficher le score moyen de chaque jeu.
SELECT g.title, AVG(sc.score) AS average_score
FROM Scores sc
JOIN Sessions s ON sc.id_session = s.id_sessions
JOIN Games g ON s.id_game = g.id_games
GROUP BY g.title;


--  3. Identifier les sessions où le score moyen des joueurs a dépassé 50.
SELECT s.id_sessions, AVG(sc.score) AS average_score
FROM Scores sc
JOIN Sessions s ON sc.id_session = s.id_sessions
GROUP BY s.id_sessions
HAVING AVG(sc.score) > 50;


--  ## 5. Requêtes Avancées

--  1. Afficher le nombre total de sessions organisées dans chaque salle.
SELECT r.name AS room_name, COUNT(s.id_sessions) AS total_sessions
FROM Rooms r
LEFT JOIN Sessions s ON r.id_rooms = s.id_room
GROUP BY r.name;


--  2. Lister les joueurs ayant participé à au moins 3 sessions.
SELECT p.name, COUNT(ps.id_session) AS session_count
FROM PlayerSessions ps
JOIN Players p ON ps.id_player = p.id_players
GROUP BY p.name
HAVING COUNT(ps.id_session) >= 3;


--  3. Trouver les sessions où tous les joueurs ont un score supérieur à 70
SELECT s.id_sessions, s.session_date
FROM Scores sc
JOIN Sessions s ON sc.id_session = s.id_sessions
GROUP BY s.id_sessions, s.session_date
HAVING MIN(sc.score) > 70;



## Lien du depot Github : 
-- SQL
-- CDM
-- https://github.com/dolobe/Gestion-d-un-Espace-de-Gaming.git

