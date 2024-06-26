-- phpMyAdmin SQL Dump
-- version 5.2.1deb1ubuntu0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 30 avr. 2024 à 11:20
-- Version du serveur : 8.0.35-0ubuntu0.23.04.1
-- Version de PHP : 8.1.12-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `compteur_eau`
--

-- --------------------------------------------------------

--
-- Structure de la table `alertes`
--

CREATE TABLE `alertes` (
  `id_alerte` int NOT NULL,
  `horodatage` datetime NOT NULL,
  `type_alerte` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `alertes`
--

INSERT INTO `alertes` (`id_alerte`, `horodatage`, `type_alerte`) VALUES
(87, '2024-04-22 12:11:54', 'FUITE'),
(88, '2024-04-22 12:12:54', 'FUITE'),
(89, '2024-04-23 08:23:05', 'Fuite'),
(90, '2024-04-23 08:24:05', 'Fuite'),
(91, '2024-04-23 08:25:05', 'Fuite'),
(92, '2024-04-23 08:26:05', 'Fuite'),
(93, '2024-04-23 08:27:05', 'Fuite'),
(94, '2024-04-23 08:28:06', 'Fuite'),
(95, '2024-04-23 08:29:05', 'Fuite'),
(96, '2024-04-23 08:30:05', 'Fuite'),
(97, '2024-04-23 08:31:05', 'Fuite'),
(98, '2024-04-23 08:32:05', 'Fuite'),
(99, '2024-04-23 08:33:05', 'Fuite'),
(100, '2024-04-23 08:34:05', 'Fuite'),
(101, '2024-04-23 08:35:05', 'Fuite'),
(102, '2024-04-23 08:36:05', 'Fuite'),
(103, '2024-04-23 08:37:05', 'Fuite'),
(104, '2024-04-23 08:38:09', 'Fuite'),
(105, '2024-04-23 08:40:15', 'Fuite'),
(106, '2024-04-23 08:41:12', 'Fuite'),
(107, '2024-04-23 08:42:12', 'Fuite'),
(108, '2024-04-23 09:34:00', 'Fuite'),
(109, '2024-04-23 09:35:07', 'Fuite'),
(110, '2024-04-23 10:50:07', 'FUITE/ABSENT'),
(111, '2024-04-23 10:50:18', 'FUITE/ABSENT'),
(112, '2024-04-23 10:51:45', 'FUITE/ABSENT'),
(113, '2024-04-23 11:47:29', 'FUITE/ABSENT'),
(114, '2024-04-23 14:11:04', 'FUITE/ABSENT'),
(115, '2024-04-25 10:43:01', 'FUITE/ABSENT'),
(116, '2024-04-25 10:43:24', 'FUITE/ABSENT'),
(117, '2024-04-25 10:43:34', 'FUITE/ABSENT'),
(118, '2024-04-25 10:43:48', 'FUITE/ABSENT'),
(119, '2024-04-25 10:48:24', 'FUITE/ABSENT');

-- --------------------------------------------------------

--
-- Structure de la table `consoeau`
--

CREATE TABLE `consoeau` (
  `idconso` int NOT NULL,
  `horodatage` datetime NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `debit_instantane` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `consoeau`
--

INSERT INTO `consoeau` (`idconso`, `horodatage`, `volume`, `debit_instantane`) VALUES
(544, '2024-04-23 10:46:04', 1.00, 0.020),
(545, '2024-04-23 10:46:09', 1.00, 0.170),
(546, '2024-04-23 10:46:15', 2.00, 0.170),
(547, '2024-04-23 10:46:23', 3.00, 0.170),
(548, '2024-04-23 10:46:27', 4.00, 0.170),
(549, '2024-04-23 10:46:33', 1.00, 0.170),
(550, '2024-04-23 10:46:39', 2.00, 0.170),
(551, '2024-04-23 10:46:45', 3.00, 0.170),
(552, '2024-04-23 10:46:51', 1.00, 0.170),
(553, '2024-04-23 10:46:57', 2.00, 0.170),
(554, '2024-04-23 10:47:03', 3.00, 0.170),
(555, '2024-04-23 10:50:07', 0.00, 0.010),
(556, '2024-04-23 10:50:18', 0.00, 0.100),
(557, '2024-04-23 10:51:45', 0.00, 0.010),
(558, '2024-04-23 11:10:47', 1.00, 0.000),
(559, '2024-04-23 11:10:53', 1.00, 0.160),
(560, '2024-04-23 11:11:01', 2.00, 0.130),
(561, '2024-04-23 11:13:22', 1.00, 0.010),
(562, '2024-04-23 11:14:09', 1.00, 0.020),
(563, '2024-04-23 11:14:15', 2.00, 0.160),
(564, '2024-04-23 11:14:24', 3.00, 0.110),
(565, '2024-04-23 11:14:30', 1.00, 0.170),
(566, '2024-04-23 11:14:36', 2.00, 0.170),
(567, '2024-04-23 11:14:47', 3.00, 0.090),
(568, '2024-04-23 11:14:53', 1.00, 0.170),
(569, '2024-04-23 11:14:59', 2.00, 0.170),
(570, '2024-04-23 11:15:05', 3.00, 0.170),
(571, '2024-04-23 11:15:11', 1.00, 0.160),
(572, '2024-04-23 11:15:17', 2.00, 0.160),
(573, '2024-04-23 11:15:23', 3.00, 0.160),
(574, '2024-04-23 11:15:29', 1.00, 0.160),
(575, '2024-04-23 11:15:35', 2.00, 0.170),
(576, '2024-04-23 11:15:41', 3.00, 0.170),
(577, '2024-04-23 11:15:47', 4.00, 0.160),
(578, '2024-04-23 11:15:53', 1.00, 0.170),
(579, '2024-04-23 11:15:59', 2.00, 0.170),
(580, '2024-04-23 11:16:05', 3.00, 0.170),
(581, '2024-04-23 11:16:11', 1.00, 0.160),
(582, '2024-04-23 11:16:17', 2.00, 0.170),
(583, '2024-04-23 11:16:24', 3.00, 0.160),
(584, '2024-04-23 11:16:30', 1.00, 0.160),
(585, '2024-04-23 11:16:36', 2.00, 0.160),
(586, '2024-04-23 11:16:42', 3.00, 0.160),
(587, '2024-04-23 11:16:48', 4.00, 0.160),
(588, '2024-04-23 11:16:54', 1.00, 0.160),
(589, '2024-04-23 11:17:00', 2.00, 0.160),
(590, '2024-04-23 11:17:06', 3.00, 0.160),
(591, '2024-04-23 11:17:13', 1.00, 0.160),
(592, '2024-04-23 11:17:19', 2.00, 0.160),
(593, '2024-04-23 11:17:25', 3.00, 0.160),
(594, '2024-04-23 11:17:31', 1.00, 0.160),
(595, '2024-04-23 11:17:37', 2.00, 0.160),
(596, '2024-04-23 11:17:43', 3.00, 0.160),
(597, '2024-04-23 11:17:49', 1.00, 0.160),
(598, '2024-04-23 11:17:55', 2.00, 0.160),
(599, '2024-04-23 11:18:02', 3.00, 0.160),
(600, '2024-04-23 11:18:08', 4.00, 0.160),
(601, '2024-04-23 11:18:14', 1.00, 0.160),
(602, '2024-04-23 11:18:20', 2.00, 0.160),
(603, '2024-04-23 11:18:26', 3.00, 0.160),
(604, '2024-04-23 11:18:32', 1.00, 0.160),
(605, '2024-04-23 11:20:18', 1.00, 0.010),
(606, '2024-04-23 11:20:24', 2.00, 0.160),
(607, '2024-04-23 11:20:30', 1.00, 0.160),
(608, '2024-04-23 11:20:36', 2.00, 0.170),
(609, '2024-04-23 11:20:42', 3.00, 0.170),
(610, '2024-04-23 11:47:29', 0.00, 0.000),
(611, '2024-04-23 11:57:14', 1.00, 0.170),
(612, '2024-04-23 11:57:20', 2.00, 0.170),
(613, '2024-04-23 11:57:26', 3.00, 0.170),
(614, '2024-04-23 11:57:32', 1.00, 0.170),
(615, '2024-04-23 11:57:38', 2.00, 0.170),
(616, '2024-04-23 11:57:44', 3.00, 0.170),
(617, '2024-04-23 13:21:12', 1.00, 0.170),
(618, '2024-04-23 13:21:17', 2.00, 0.170),
(619, '2024-04-23 13:21:23', 3.00, 0.170),
(620, '2024-04-23 13:21:29', 1.00, 0.170),
(621, '2024-04-23 13:21:35', 2.00, 0.170),
(622, '2024-04-23 13:21:41', 3.00, 0.170),
(623, '2024-04-23 13:21:47', 4.00, 0.170),
(624, '2024-04-23 13:21:53', 1.00, 0.170),
(625, '2024-04-23 13:22:39', 1.00, 0.020),
(626, '2024-04-23 13:22:45', 2.00, 0.170),
(627, '2024-04-23 13:22:51', 1.00, 0.170),
(628, '2024-04-23 13:23:04', 2.00, 0.080),
(629, '2024-04-23 13:49:52', 2.00, 0.090),
(630, '2024-04-23 13:49:58', 3.00, 0.170),
(631, '2024-04-23 13:50:04', 4.00, 0.170),
(632, '2024-04-23 13:50:10', 5.00, 0.170),
(633, '2024-04-23 13:50:16', 6.00, 0.170),
(634, '2024-04-23 13:50:22', 7.00, 0.170),
(635, '2024-04-23 13:50:28', 8.00, 0.170),
(636, '2024-04-23 13:50:36', 9.00, 0.130),
(637, '2024-04-23 14:01:44', 3.00, 0.070),
(638, '2024-04-23 14:01:50', 4.00, 0.170),
(639, '2024-04-23 14:01:56', 5.00, 0.170),
(640, '2024-04-23 14:02:46', 2.00, 0.040),
(641, '2024-04-23 14:02:52', 3.00, 0.170),
(642, '2024-04-23 14:02:58', 4.00, 0.170),
(643, '2024-04-23 14:03:04', 5.00, 0.170),
(644, '2024-04-23 14:04:31', 2.00, 0.020),
(645, '2024-04-23 14:04:36', 3.00, 0.170),
(646, '2024-04-23 14:04:42', 4.00, 0.170),
(647, '2024-04-23 14:10:52', 3.00, 0.170),
(648, '2024-04-23 14:10:58', 4.00, 0.170),
(649, '2024-04-23 14:11:04', 5.00, 0.170),
(650, '2024-04-25 10:42:42', 4.00, 0.160),
(651, '2024-04-25 10:42:49', 5.00, 0.170),
(652, '2024-04-25 10:42:55', 6.00, 0.150),
(653, '2024-04-25 10:43:01', 7.00, 0.170),
(654, '2024-04-25 10:43:24', 1.00, 0.040),
(655, '2024-04-25 10:43:34', 2.00, 0.100),
(656, '2024-04-25 10:43:48', 1.00, 0.070),
(657, '2024-04-25 10:44:12', 1.00, 0.040),
(658, '2024-04-25 10:48:24', 1.00, 0.000),
(659, '2024-04-25 13:41:21', 3.00, 0.170),
(660, '2024-04-25 13:41:21', 3.00, 0.170),
(661, '2024-04-25 13:41:27', 4.00, 0.170),
(662, '2024-04-25 13:41:27', 4.00, 0.170),
(663, '2024-04-25 13:41:33', 5.00, 0.170),
(664, '2024-04-25 13:41:33', 5.00, 0.170),
(665, '2024-04-25 13:41:39', 6.00, 0.170),
(666, '2024-04-25 13:41:39', 6.00, 0.170),
(667, '2024-04-25 13:41:45', 7.00, 0.170),
(668, '2024-04-25 13:41:45', 7.00, 0.170),
(669, '2024-04-25 13:44:21', 8.00, 0.010),
(670, '2024-04-25 13:44:21', 8.00, 0.010),
(671, '2024-04-25 13:44:27', 9.00, 0.170),
(672, '2024-04-25 13:44:27', 9.00, 0.170),
(673, '2024-04-25 13:44:33', 10.00, 0.160),
(674, '2024-04-25 13:44:33', 10.00, 0.160),
(675, '2024-04-25 13:49:01', 11.00, 0.000),
(676, '2024-04-25 13:49:01', 11.00, 0.000),
(677, '2024-04-25 13:49:07', 12.00, 0.170),
(678, '2024-04-25 13:49:07', 12.00, 0.170),
(679, '2024-04-25 13:49:17', 13.00, 0.100),
(680, '2024-04-25 13:49:17', 13.00, 0.100),
(681, '2024-04-25 13:53:13', 14.00, 0.000),
(682, '2024-04-25 13:53:13', 14.00, 0.000),
(683, '2024-04-25 13:53:19', 15.00, 0.170),
(684, '2024-04-25 13:53:19', 15.00, 0.170),
(685, '2024-04-25 13:53:25', 16.00, 0.170),
(686, '2024-04-25 13:53:25', 16.00, 0.170),
(687, '2024-04-25 13:53:31', 17.00, 0.170),
(688, '2024-04-25 13:53:31', 17.00, 0.170),
(689, '2024-04-25 13:53:37', 18.00, 0.170),
(690, '2024-04-25 13:53:37', 18.00, 0.170),
(691, '2024-04-25 13:53:43', 19.00, 0.170),
(692, '2024-04-25 13:53:43', 19.00, 0.170),
(693, '2024-04-25 13:53:49', 20.00, 0.170),
(694, '2024-04-25 13:53:49', 20.00, 0.170),
(695, '2024-04-25 13:53:55', 21.00, 0.170),
(696, '2024-04-25 13:53:55', 21.00, 0.170),
(697, '2024-04-25 13:54:01', 22.00, 0.170),
(698, '2024-04-25 13:54:01', 22.00, 0.170),
(699, '2024-04-25 13:54:07', 23.00, 0.170),
(700, '2024-04-25 13:54:07', 23.00, 0.170),
(701, '2024-04-25 13:54:13', 24.00, 0.170),
(702, '2024-04-25 13:54:13', 24.00, 0.170),
(703, '2024-04-25 13:54:19', 25.00, 0.170),
(704, '2024-04-25 13:54:19', 25.00, 0.170),
(705, '2024-04-25 13:54:25', 26.00, 0.170),
(706, '2024-04-25 13:54:25', 26.00, 0.170),
(707, '2024-04-25 13:54:31', 27.00, 0.170),
(708, '2024-04-25 13:54:31', 27.00, 0.170),
(709, '2024-04-25 13:54:37', 28.00, 0.170),
(710, '2024-04-25 13:54:37', 28.00, 0.170),
(711, '2024-04-25 13:54:43', 29.00, 0.170),
(712, '2024-04-25 13:54:43', 29.00, 0.170),
(713, '2024-04-25 13:54:49', 30.00, 0.170),
(714, '2024-04-25 13:54:49', 30.00, 0.170),
(715, '2024-04-25 13:54:55', 31.00, 0.170),
(716, '2024-04-25 13:54:55', 31.00, 0.170),
(717, '2024-04-25 13:55:01', 32.00, 0.170),
(718, '2024-04-25 13:55:01', 32.00, 0.170),
(719, '2024-04-25 13:55:07', 33.00, 0.170),
(720, '2024-04-25 13:55:07', 33.00, 0.170),
(721, '2024-04-25 13:56:27', 3.00, 0.170),
(722, '2024-04-25 13:56:27', 3.00, 0.170),
(723, '2024-04-25 14:03:14', 4.00, 0.000),
(724, '2024-04-25 14:03:14', 4.00, 0.000),
(725, '2024-04-25 14:03:20', 5.00, 0.170),
(726, '2024-04-25 14:03:20', 5.00, 0.170),
(727, '2024-04-25 14:03:26', 6.00, 0.170),
(728, '2024-04-25 14:03:26', 6.00, 0.170),
(729, '2024-04-25 14:03:32', 7.00, 0.170),
(730, '2024-04-25 14:03:32', 7.00, 0.170),
(731, '2024-04-25 14:03:45', 8.00, 0.080),
(732, '2024-04-25 14:03:45', 8.00, 0.080),
(733, '2024-04-25 14:03:51', 9.00, 0.170),
(734, '2024-04-25 14:03:51', 9.00, 0.170),
(735, '2024-04-25 14:03:57', 10.00, 0.170),
(736, '2024-04-25 14:03:57', 10.00, 0.170),
(737, '2024-04-25 14:06:11', 11.00, 0.010),
(738, '2024-04-25 14:06:11', 11.00, 0.010),
(739, '2024-04-25 14:06:17', 12.00, 0.170),
(740, '2024-04-25 14:06:17', 12.00, 0.170),
(741, '2024-04-25 14:08:16', 13.00, 0.010),
(742, '2024-04-25 14:08:16', 13.00, 0.010),
(743, '2024-04-25 14:08:28', 14.00, 0.080),
(744, '2024-04-25 14:08:28', 14.00, 0.080),
(745, '2024-04-25 14:08:34', 15.00, 0.170),
(746, '2024-04-25 14:08:34', 15.00, 0.170),
(747, '2024-04-25 14:08:54', 16.00, 0.170),
(748, '2024-04-25 14:08:54', 16.00, 0.170),
(749, '2024-04-25 14:09:20', 17.00, 0.030),
(750, '2024-04-25 14:09:20', 17.00, 0.030),
(751, '2024-04-25 14:09:24', 18.00, 0.170),
(752, '2024-04-25 14:09:24', 18.00, 0.170),
(753, '2024-04-25 14:09:30', 19.00, 0.170),
(754, '2024-04-25 14:09:30', 19.00, 0.170),
(755, '2024-04-25 14:09:36', 20.00, 0.170),
(756, '2024-04-25 14:09:36', 20.00, 0.170),
(757, '2024-04-25 14:09:48', 21.00, 0.170),
(758, '2024-04-25 14:09:48', 21.00, 0.170),
(759, '2024-04-25 14:11:13', 22.00, 0.010),
(760, '2024-04-25 14:11:13', 22.00, 0.010),
(761, '2024-04-25 14:11:19', 23.00, 0.170),
(762, '2024-04-25 14:11:19', 23.00, 0.170),
(763, '2024-04-25 14:11:25', 24.00, 0.170),
(764, '2024-04-25 14:11:25', 24.00, 0.170),
(765, '2024-04-25 14:11:31', 25.00, 0.170),
(766, '2024-04-25 14:11:31', 25.00, 0.170),
(767, '2024-04-25 14:11:37', 26.00, 0.170),
(768, '2024-04-25 14:11:37', 26.00, 0.170),
(769, '2024-04-25 14:11:43', 27.00, 0.170),
(770, '2024-04-25 14:11:43', 27.00, 0.170),
(771, '2024-04-25 14:11:49', 28.00, 0.170),
(772, '2024-04-25 14:11:49', 28.00, 0.170),
(773, '2024-04-25 14:13:41', 29.00, 0.010),
(774, '2024-04-25 14:13:41', 29.00, 0.010),
(775, '2024-04-25 14:13:46', 30.00, 0.170),
(776, '2024-04-25 14:13:46', 30.00, 0.170),
(777, '2024-04-25 14:13:52', 31.00, 0.170),
(778, '2024-04-25 14:13:52', 31.00, 0.170),
(779, '2024-04-25 14:25:01', 2.00, 0.169),
(780, '2024-04-25 14:25:01', 2.00, 0.169),
(781, '2024-04-25 14:25:07', 3.00, 0.168),
(782, '2024-04-25 14:25:07', 3.00, 0.168),
(783, '2024-04-25 14:25:12', 4.00, 0.168),
(784, '2024-04-25 14:25:12', 4.00, 0.168),
(785, '2024-04-25 14:25:19', 5.00, 0.146),
(786, '2024-04-25 14:25:19', 5.00, 0.146),
(787, '2024-04-25 14:35:46', 6.00, 0.002),
(788, '2024-04-25 14:35:46', 6.00, 0.002),
(789, '2024-04-25 14:35:52', 7.00, 0.170),
(790, '2024-04-25 14:35:52', 7.00, 0.170),
(791, '2024-04-25 14:35:59', 8.00, 0.169),
(792, '2024-04-25 14:35:59', 8.00, 0.169),
(793, '2024-04-25 14:36:03', 9.00, 0.167),
(794, '2024-04-25 14:36:03', 9.00, 0.167);

-- --------------------------------------------------------

--
-- Structure de la table `etat_electrovanne`
--

CREATE TABLE `etat_electrovanne` (
  `idelectro` int NOT NULL,
  `horodatage` datetime NOT NULL,
  `etat` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `etat_electrovanne`
--

INSERT INTO `etat_electrovanne` (`idelectro`, `horodatage`, `etat`) VALUES
(611, '2024-04-22 11:33:29', 'FERMÉ'),
(612, '2024-04-22 11:33:29', 'FERMÉ'),
(613, '2024-04-22 11:41:53', 'OUVERT'),
(614, '2024-04-22 11:41:53', 'OUVERT'),
(615, '2024-04-22 12:04:23', 'OUVERT'),
(616, '2024-04-22 12:04:31', 'FERMÉ'),
(617, '2024-04-22 12:04:38', 'OUVERT'),
(618, '2024-04-22 12:05:26', 'FERMÉ'),
(619, '2024-04-22 12:05:53', 'OUVERT'),
(620, '2024-04-22 12:05:54', 'FERMÉ'),
(621, '2024-04-22 12:06:03', 'OUVERT'),
(622, '2024-04-22 12:06:41', 'FERMÉ'),
(623, '2024-04-22 12:09:27', 'OUVERT'),
(624, '2024-04-22 12:09:35', 'FERMÉ'),
(625, '2024-04-22 12:11:31', 'OUVERT'),
(626, '2024-04-22 12:11:51', 'FERMÉ'),
(627, '2024-04-22 12:12:49', 'OUVERT'),
(628, '2024-04-22 12:12:53', 'FERMÉ'),
(629, '2024-04-22 12:13:05', 'OUVERT'),
(630, '2024-04-23 07:14:19', 'OUVERT'),
(631, '2024-04-23 07:17:27', 'OUVERT'),
(632, '2024-04-23 08:19:42', 'FERMÉ'),
(633, '2024-04-23 08:22:38', 'OUVERT'),
(634, '2024-04-23 08:44:05', 'OUVERT'),
(635, '2024-04-23 09:34:00', 'FERMÉ'),
(636, '2024-04-23 09:34:02', 'OUVERT'),
(637, '2024-04-23 09:35:12', 'FERMÉ'),
(638, '2024-04-23 09:50:20', 'OUVERT'),
(639, '2024-04-23 10:00:49', 'OUVERT'),
(640, '2024-04-23 10:06:25', 'FERMÉ'),
(641, '2024-04-23 10:06:46', 'OUVERT'),
(642, '2024-04-23 10:06:52', 'FERMÉ'),
(643, '2024-04-23 10:07:01', 'OUVERT'),
(644, '2024-04-23 10:38:29', 'OUVERT'),
(645, '2024-04-23 10:38:30', 'FERMÉ'),
(646, '2024-04-23 10:38:32', 'OUVERT'),
(647, '2024-04-23 10:38:37', 'FERMÉ'),
(648, '2024-04-23 10:38:39', 'OUVERT'),
(649, '2024-04-23 10:38:52', 'FERMÉ'),
(650, '2024-04-23 10:38:54', 'OUVERT'),
(651, '2024-04-23 10:43:44', 'OUVERT'),
(652, '2024-04-23 10:45:14', 'FERMÉ'),
(653, '2024-04-23 10:45:59', 'OUVERT'),
(654, '2024-04-23 10:46:00', 'OUVERT'),
(655, '2024-04-23 10:49:38', 'OUVERT'),
(656, '2024-04-23 10:49:40', 'FERMÉ'),
(657, '2024-04-23 10:49:41', 'OUVERT'),
(658, '2024-04-23 10:50:07', 'OUVERT'),
(659, '2024-04-23 10:50:07', 'FERMÉ'),
(660, '2024-04-23 10:50:11', 'FERMÉ'),
(661, '2024-04-23 10:50:12', 'OUVERT'),
(662, '2024-04-23 10:50:18', 'FERMÉ'),
(663, '2024-04-23 10:51:39', 'OUVERT'),
(664, '2024-04-23 10:51:44', 'FERMÉ'),
(665, '2024-04-23 10:52:03', 'OUVERT'),
(666, '2024-04-23 10:52:06', 'OUVERT'),
(667, '2024-04-23 10:52:19', 'OUVERT'),
(668, '2024-04-23 10:52:23', 'OUVERT'),
(669, '2024-04-23 10:59:41', 'OUVERT'),
(670, '2024-04-23 10:59:55', 'FERMÉ'),
(671, '2024-04-23 11:00:02', 'OUVERT'),
(672, '2024-04-23 11:06:57', 'OUVERT'),
(673, '2024-04-23 11:07:01', 'FERMÉ'),
(674, '2024-04-23 11:07:01', 'FERMÉ'),
(675, '2024-04-23 11:07:01', 'FERMÉ'),
(676, '2024-04-23 11:07:02', 'OUVERT'),
(677, '2024-04-23 11:07:06', 'OUVERT'),
(678, '2024-04-23 11:07:07', 'FERMÉ'),
(679, '2024-04-23 11:07:09', 'OUVERT'),
(680, '2024-04-23 11:07:10', 'FERMÉ'),
(681, '2024-04-23 11:07:19', 'OUVERT'),
(682, '2024-04-23 11:07:28', 'FERMÉ'),
(683, '2024-04-23 11:07:36', 'OUVERT'),
(684, '2024-04-23 11:09:08', 'FERMÉ'),
(685, '2024-04-23 11:09:09', 'OUVERT'),
(686, '2024-04-23 11:09:14', 'OUVERT'),
(687, '2024-04-23 11:09:19', 'OUVERT'),
(688, '2024-04-23 11:09:21', 'FERMÉ'),
(689, '2024-04-23 11:09:22', 'OUVERT'),
(690, '2024-04-23 11:09:23', 'FERMÉ'),
(691, '2024-04-23 11:09:24', 'OUVERT'),
(692, '2024-04-23 11:09:25', 'FERMÉ'),
(693, '2024-04-23 11:10:14', 'OUVERT'),
(694, '2024-04-23 11:10:18', 'FERMÉ'),
(695, '2024-04-23 11:10:20', 'FERMÉ'),
(696, '2024-04-23 11:10:33', 'OUVERT'),
(697, '2024-04-23 11:10:54', 'FERMÉ'),
(698, '2024-04-23 11:10:56', 'OUVERT'),
(699, '2024-04-23 11:11:22', 'FERMÉ'),
(700, '2024-04-23 11:11:23', 'OUVERT'),
(701, '2024-04-23 11:11:29', 'OUVERT'),
(702, '2024-04-23 11:11:30', 'FERMÉ'),
(703, '2024-04-23 11:13:07', 'OUVERT'),
(704, '2024-04-23 11:13:08', 'FERMÉ'),
(705, '2024-04-23 11:13:10', 'OUVERT'),
(706, '2024-04-23 11:14:14', 'FERMÉ'),
(707, '2024-04-23 11:14:18', 'OUVERT'),
(708, '2024-04-23 11:14:36', 'OUVERT'),
(709, '2024-04-23 11:14:38', 'FERMÉ'),
(710, '2024-04-23 11:14:40', 'OUVERT'),
(711, '2024-04-23 11:14:41', 'FERMÉ'),
(712, '2024-04-23 11:14:45', 'OUVERT'),
(713, '2024-04-23 11:19:36', 'OUVERT'),
(714, '2024-04-23 11:19:38', 'FERMÉ'),
(715, '2024-04-23 11:19:44', 'OUVERT'),
(716, '2024-04-23 11:25:22', 'FERMÉ'),
(717, '2024-04-23 11:25:23', 'OUVERT'),
(718, '2024-04-23 11:47:29', 'FERMÉ'),
(719, '2024-04-23 11:57:04', 'OUVERT'),
(720, '2024-04-23 13:49:45', 'OUVERT'),
(721, '2024-04-23 14:01:35', 'OUVERT'),
(722, '2024-04-23 14:02:43', 'OUVERT'),
(723, '2024-04-23 14:04:25', 'OUVERT'),
(724, '2024-04-23 14:10:42', 'OUVERT'),
(725, '2024-04-23 14:11:04', 'FERMÉ'),
(726, '2024-04-25 09:40:59', 'OUVERT'),
(727, '2024-04-25 10:37:25', 'OUVERT'),
(728, '2024-04-25 10:37:26', 'FERMÉ'),
(729, '2024-04-25 10:37:29', 'OUVERT'),
(730, '2024-04-25 10:37:30', 'FERMÉ'),
(731, '2024-04-25 10:42:49', 'OUVERT'),
(732, '2024-04-25 10:42:51', 'FERMÉ'),
(733, '2024-04-25 10:42:52', 'OUVERT'),
(734, '2024-04-25 10:43:01', 'FERMÉ'),
(735, '2024-04-25 10:43:15', 'OUVERT'),
(736, '2024-04-25 10:43:17', 'FERMÉ'),
(737, '2024-04-25 10:43:18', 'OUVERT'),
(738, '2024-04-25 10:43:24', 'FERMÉ'),
(739, '2024-04-25 10:43:27', 'FERMÉ'),
(740, '2024-04-25 10:43:28', 'OUVERT'),
(741, '2024-04-25 10:43:34', 'FERMÉ'),
(742, '2024-04-25 10:43:40', 'OUVERT'),
(743, '2024-04-25 10:43:42', 'FERMÉ'),
(744, '2024-04-25 10:43:43', 'OUVERT'),
(745, '2024-04-25 10:43:48', 'FERMÉ'),
(746, '2024-04-25 10:44:07', 'OUVERT'),
(747, '2024-04-25 10:47:13', 'OUVERT'),
(748, '2024-04-25 10:47:13', 'FERMÉ'),
(749, '2024-04-25 10:47:15', 'OUVERT'),
(750, '2024-04-25 10:47:16', 'FERMÉ'),
(751, '2024-04-25 10:47:19', 'OUVERT'),
(752, '2024-04-25 10:48:14', 'OUVERT'),
(753, '2024-04-25 10:48:17', 'FERMÉ'),
(754, '2024-04-25 10:48:19', 'OUVERT'),
(755, '2024-04-25 10:48:24', 'FERMÉ'),
(756, '2024-04-25 10:48:30', 'OUVERT'),
(757, '2024-04-25 11:01:57', 'OUVERT'),
(758, '2024-04-25 11:02:02', 'FERMÉ'),
(759, '2024-04-25 11:02:07', 'OUVERT'),
(760, '2024-04-25 11:02:09', 'FERMÉ'),
(761, '2024-04-25 13:22:07', 'OUVERT'),
(762, '2024-04-25 13:22:07', 'OUVERT'),
(763, '2024-04-25 13:22:55', 'OUVERT'),
(764, '2024-04-25 13:22:55', 'OUVERT'),
(765, '2024-04-25 13:22:58', 'FERMÉ'),
(766, '2024-04-25 13:22:59', 'FERMÉ'),
(767, '2024-04-25 13:23:55', 'OUVERT'),
(768, '2024-04-25 13:23:55', 'OUVERT'),
(769, '2024-04-25 13:23:56', 'OUVERT'),
(770, '2024-04-25 13:23:56', 'OUVERT'),
(771, '2024-04-25 13:23:57', 'FERMÉ'),
(772, '2024-04-25 13:23:57', 'FERMÉ'),
(773, '2024-04-25 13:41:14', 'OUVERT'),
(774, '2024-04-25 13:41:14', 'OUVERT'),
(775, '2024-04-25 13:56:14', 'OUVERT'),
(776, '2024-04-25 13:56:14', 'OUVERT'),
(777, '2024-04-25 14:03:33', 'FERMÉ'),
(778, '2024-04-25 14:03:33', 'FERMÉ'),
(779, '2024-04-25 14:03:41', 'OUVERT'),
(780, '2024-04-25 14:03:41', 'OUVERT'),
(781, '2024-04-25 14:04:01', 'FERMÉ'),
(782, '2024-04-25 14:04:01', 'FERMÉ'),
(783, '2024-04-25 14:06:10', 'OUVERT'),
(784, '2024-04-25 14:06:10', 'OUVERT'),
(785, '2024-04-25 14:06:17', 'FERMÉ'),
(786, '2024-04-25 14:06:17', 'FERMÉ'),
(787, '2024-04-25 14:06:20', 'OUVERT'),
(788, '2024-04-25 14:06:20', 'OUVERT'),
(789, '2024-04-25 14:06:24', 'FERMÉ'),
(790, '2024-04-25 14:06:24', 'FERMÉ'),
(791, '2024-04-25 14:08:22', 'OUVERT'),
(792, '2024-04-25 14:08:22', 'OUVERT'),
(793, '2024-04-25 14:23:11', 'OUVERT'),
(794, '2024-04-25 14:23:11', 'OUVERT'),
(795, '2024-04-25 14:23:25', 'FERMÉ'),
(796, '2024-04-25 14:23:25', 'FERMÉ'),
(797, '2024-04-25 14:24:53', 'OUVERT'),
(798, '2024-04-25 14:24:53', 'OUVERT'),
(799, '2024-04-25 14:28:11', 'OUVERT'),
(800, '2024-04-25 14:28:11', 'OUVERT'),
(801, '2024-04-25 14:28:12', 'FERMÉ'),
(802, '2024-04-25 14:28:12', 'FERMÉ'),
(803, '2024-04-25 14:28:13', 'OUVERT'),
(804, '2024-04-25 14:28:13', 'OUVERT'),
(805, '2024-04-25 14:28:22', 'FERMÉ'),
(806, '2024-04-25 14:28:22', 'FERMÉ'),
(807, '2024-04-25 14:29:01', 'OUVERT'),
(808, '2024-04-25 14:29:01', 'OUVERT'),
(809, '2024-04-25 14:29:08', 'FERMÉ'),
(810, '2024-04-25 14:29:08', 'FERMÉ'),
(811, '2024-04-25 14:29:25', 'OUVERT'),
(812, '2024-04-25 14:29:25', 'OUVERT'),
(813, '2024-04-25 14:29:28', 'FERMÉ'),
(814, '2024-04-25 14:29:28', 'FERMÉ'),
(815, '2024-04-25 14:29:52', 'OUVERT'),
(816, '2024-04-25 14:29:52', 'OUVERT'),
(817, '2024-04-25 14:29:54', 'FERMÉ'),
(818, '2024-04-25 14:29:54', 'FERMÉ'),
(819, '2024-04-25 14:29:56', 'OUVERT'),
(820, '2024-04-25 14:29:56', 'OUVERT'),
(821, '2024-04-25 14:30:15', 'FERMÉ'),
(822, '2024-04-25 14:30:15', 'FERMÉ'),
(823, '2024-04-25 14:30:16', 'OUVERT'),
(824, '2024-04-25 14:30:16', 'OUVERT'),
(825, '2024-04-25 14:30:17', 'FERMÉ'),
(826, '2024-04-25 14:30:17', 'FERMÉ'),
(827, '2024-04-25 14:34:28', 'OUVERT'),
(828, '2024-04-25 14:34:28', 'OUVERT'),
(829, '2024-04-25 14:34:29', 'FERMÉ'),
(830, '2024-04-25 14:34:29', 'FERMÉ'),
(831, '2024-04-25 14:35:00', 'OUVERT'),
(832, '2024-04-25 14:35:00', 'OUVERT'),
(833, '2024-04-25 14:35:04', 'FERMÉ'),
(834, '2024-04-25 14:35:04', 'FERMÉ'),
(835, '2024-04-25 14:35:30', 'OUVERT'),
(836, '2024-04-25 14:35:30', 'OUVERT'),
(837, '2024-04-25 14:36:18', 'FERMÉ'),
(838, '2024-04-25 14:36:18', 'FERMÉ'),
(839, '2024-04-25 14:36:24', 'FERMÉ'),
(840, '2024-04-25 14:36:24', 'FERMÉ'),
(841, '2024-04-25 14:36:29', 'OUVERT'),
(842, '2024-04-25 14:36:29', 'OUVERT'),
(843, '2024-04-25 14:36:29', 'OUVERT'),
(844, '2024-04-25 14:36:30', 'OUVERT'),
(845, '2024-04-25 14:36:36', 'OUVERT'),
(846, '2024-04-25 14:36:36', 'OUVERT'),
(847, '2024-04-25 14:36:40', 'OUVERT'),
(848, '2024-04-25 14:36:40', 'OUVERT'),
(849, '2024-04-25 14:37:06', 'FERMÉ'),
(850, '2024-04-25 14:37:06', 'FERMÉ'),
(851, '2024-04-25 14:37:08', 'FERMÉ'),
(852, '2024-04-25 14:37:08', 'FERMÉ'),
(853, '2024-04-25 14:37:14', 'FERMÉ'),
(854, '2024-04-25 14:37:14', 'FERMÉ'),
(855, '2024-04-25 14:52:53', 'OUVERT'),
(856, '2024-04-26 13:20:46', 'OUVERT'),
(857, '2024-04-26 13:21:09', 'FERMÉ'),
(858, '2024-04-26 13:21:11', 'OUVERT'),
(859, '2024-04-30 08:58:52', 'OUVERT'),
(860, '2024-04-30 09:00:24', 'FERMÉ'),
(861, '2024-04-30 09:02:13', 'OUVERT'),
(862, '2024-04-30 09:02:15', 'FERMÉ'),
(863, '2024-04-30 09:02:31', 'OUVERT'),
(864, '2024-04-30 09:02:42', 'FERMÉ'),
(865, '2024-04-30 09:06:44', 'OUVERT'),
(866, '2024-04-30 09:06:45', 'OUVERT'),
(867, '2024-04-30 09:06:46', 'FERMÉ'),
(868, '2024-04-30 09:06:46', 'OUVERT'),
(869, '2024-04-30 09:06:49', 'FERMÉ'),
(870, '2024-04-30 09:07:11', 'OUVERT'),
(871, '2024-04-30 09:07:14', 'OUVERT'),
(872, '2024-04-30 09:07:18', 'FERMÉ'),
(873, '2024-04-30 09:07:21', 'FERMÉ'),
(874, '2024-04-30 09:07:22', 'FERMÉ'),
(875, '2024-04-30 09:07:22', 'FERMÉ'),
(876, '2024-04-30 09:07:22', 'FERMÉ'),
(877, '2024-04-30 09:07:22', 'FERMÉ'),
(878, '2024-04-30 09:07:22', 'FERMÉ'),
(879, '2024-04-30 09:07:22', 'FERMÉ'),
(880, '2024-04-30 09:07:22', 'FERMÉ'),
(881, '2024-04-30 09:07:22', 'FERMÉ'),
(882, '2024-04-30 09:07:23', 'FERMÉ'),
(883, '2024-04-30 09:07:23', 'FERMÉ'),
(884, '2024-04-30 09:07:30', 'FERMÉ'),
(885, '2024-04-30 09:07:39', 'FERMÉ'),
(886, '2024-04-30 09:07:39', 'FERMÉ'),
(887, '2024-04-30 09:07:45', 'OUVERT'),
(888, '2024-04-30 09:07:50', 'FERMÉ'),
(889, '2024-04-30 09:13:34', 'OUVERT'),
(890, '2024-04-30 09:13:36', 'FERMÉ');

-- --------------------------------------------------------

--
-- Structure de la table `mode`
--

CREATE TABLE `mode` (
  `idmode` int NOT NULL,
  `horodatage` datetime NOT NULL,
  `etat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `mode`
--

INSERT INTO `mode` (`idmode`, `horodatage`, `etat`) VALUES
(10, '2024-04-02 11:27:44', 'PRESENT'),
(11, '2024-04-02 11:27:46', 'ABSENT'),
(12, '2024-04-02 11:28:01', 'PRESENT'),
(13, '2024-04-04 09:58:17', 'ABSENT'),
(14, '2024-04-04 09:58:19', 'PRESENT'),
(15, '2024-04-04 10:05:45', 'PRESENT'),
(16, '2024-04-04 10:10:04', 'PRESENT'),
(17, '2024-04-04 10:12:03', 'PRESENT'),
(18, '2024-04-04 10:12:06', 'ABSENT'),
(19, '2024-04-04 10:13:25', 'PRESENT'),
(20, '2024-04-04 10:22:00', 'PRESENT'),
(21, '2024-04-04 10:22:03', 'ABSENT'),
(22, '2024-04-04 10:22:06', 'PRESENT'),
(23, '2024-04-04 10:32:06', 'PRESENT'),
(24, '2024-04-04 10:32:08', 'ABSENT'),
(25, '2024-04-04 10:32:27', 'PRESENT'),
(26, '2024-04-04 10:50:18', 'PRESENT'),
(27, '2024-04-04 12:51:16', 'PRESENT'),
(28, '2024-04-04 13:00:49', 'ABSENT'),
(29, '2024-04-04 13:01:52', 'ABSENT'),
(30, '2024-04-04 13:02:31', 'PRESENT'),
(31, '2024-04-04 13:02:51', 'PRESENT'),
(32, '2024-04-04 13:03:16', 'ABSENT'),
(33, '2024-04-04 13:03:18', 'PRESENT'),
(34, '2024-04-04 13:03:57', 'ABSENT'),
(35, '2024-04-04 13:04:06', 'PRESENT'),
(36, '2024-04-04 13:04:11', 'ABSENT'),
(37, '2024-04-04 13:04:14', 'PRESENT'),
(38, '2024-04-04 13:04:25', 'ABSENT'),
(39, '2024-04-04 13:04:31', 'PRESENT'),
(40, '2024-04-04 13:04:35', 'ABSENT'),
(41, '2024-04-04 13:04:44', 'PRESENT'),
(42, '2024-04-04 13:04:49', 'ABSENT'),
(43, '2024-04-04 13:04:51', 'PRESENT'),
(44, '2024-04-04 13:05:19', 'ABSENT'),
(45, '2024-04-04 13:05:27', 'PRESENT'),
(46, '2024-04-04 13:05:54', 'ABSENT'),
(47, '2024-04-04 13:06:05', 'PRESENT'),
(48, '2024-04-04 13:07:05', 'ABSENT'),
(49, '2024-04-04 13:08:17', 'PRESENT'),
(50, '2024-04-04 14:29:38', 'PRESENT'),
(51, '2024-04-04 14:29:46', 'PRESENT'),
(52, '2024-04-04 14:29:51', 'PRESENT'),
(53, '2024-04-04 14:29:54', 'PRESENT'),
(54, '2024-04-04 14:30:02', 'PRESENT'),
(55, '2024-04-04 14:31:14', 'PRESENT'),
(56, '2024-04-04 14:31:19', 'PRESENT'),
(57, '2024-04-04 14:31:44', 'ABSENT'),
(58, '2024-04-04 14:31:53', 'PRESENT'),
(59, '2024-04-04 14:32:59', 'ABSENT'),
(60, '2024-04-04 14:33:26', 'PRESENT'),
(61, '2024-04-04 14:33:39', 'ABSENT'),
(62, '2024-04-04 14:34:33', 'ABSENT'),
(63, '2024-04-04 14:35:00', 'PRESENT'),
(64, '2024-04-04 14:35:21', 'PRESENT'),
(65, '2024-04-04 14:35:38', 'ABSENT'),
(66, '2024-04-04 14:35:55', 'PRESENT'),
(67, '2024-04-04 14:47:44', 'PRESENT'),
(68, '2024-04-05 11:41:26', 'PRESENT'),
(69, '2024-04-22 09:45:14', 'PRESENT'),
(70, '2024-04-22 10:37:53', 'PRESENT'),
(71, '2024-04-22 10:50:12', 'ABSENT'),
(72, '2024-04-22 10:50:28', 'PRESENT'),
(73, '2024-04-22 10:57:45', 'PRESENT'),
(74, '2024-04-22 11:10:44', 'PRESENT'),
(75, '2024-04-22 12:04:18', 'PRESENT'),
(76, '2024-04-22 12:06:21', 'PRESENT'),
(77, '2024-04-22 12:06:26', 'ABSENT'),
(78, '2024-04-22 12:09:31', 'ABSENT'),
(79, '2024-04-22 12:09:36', 'FUITE'),
(80, '2024-04-22 12:11:24', 'PRESENT'),
(81, '2024-04-22 12:11:49', 'ABSENT'),
(82, '2024-04-22 12:12:57', 'PRESENT'),
(83, '2024-04-23 07:17:22', 'PRESENT'),
(84, '2024-04-23 08:44:00', 'PRESENT'),
(85, '2024-04-23 10:06:36', 'ABSENT'),
(86, '2024-04-23 10:06:57', 'PRESENT'),
(87, '2024-04-23 10:49:30', 'PRESENT'),
(88, '2024-04-23 10:50:01', 'ABSENT'),
(89, '2024-04-23 10:52:12', 'PRESENT'),
(90, '2024-04-23 11:09:17', 'PRESENT'),
(91, '2024-04-23 11:11:27', 'ABSENT'),
(92, '2024-04-23 11:11:33', 'PRESENT'),
(93, '2024-04-23 11:25:47', 'PRESENT'),
(94, '2024-04-23 11:25:53', 'ABSENT'),
(95, '2024-04-23 11:57:01', 'PRESENT'),
(96, '2024-04-23 13:49:41', 'PRESENT'),
(97, '2024-04-23 14:01:29', 'PRESENT'),
(98, '2024-04-23 14:02:40', 'PRESENT'),
(99, '2024-04-23 14:11:01', 'ABSENT'),
(100, '2024-04-23 14:11:10', 'PRESENT'),
(101, '2024-04-23 14:17:58', 'PRESENT'),
(102, '2024-04-25 08:45:59', 'PRESENT'),
(103, '2024-04-25 10:37:24', 'PRESENT'),
(104, '2024-04-25 10:37:43', 'ABSENT'),
(105, '2024-04-25 10:37:43', 'ABSENT'),
(106, '2024-04-25 10:42:57', 'PRESENT'),
(107, '2024-04-25 10:43:00', 'ABSENT'),
(108, '2024-04-25 10:43:59', 'PRESENT'),
(109, '2024-04-25 10:48:05', 'PRESENT'),
(110, '2024-04-25 10:48:10', 'ABSENT'),
(111, '2024-04-25 13:22:05', 'PRESENT'),
(112, '2024-04-25 13:22:05', 'PRESENT'),
(113, '2024-04-25 13:41:11', 'PRESENT'),
(114, '2024-04-25 13:41:11', 'PRESENT'),
(115, '2024-04-25 13:56:12', 'PRESENT'),
(116, '2024-04-25 13:56:12', 'PRESENT'),
(117, '2024-04-26 13:20:43', 'PRESENT'),
(118, '2024-04-30 08:57:40', 'PRESENT'),
(119, '2024-04-30 09:06:54', 'PRESENT'),
(120, '2024-04-30 09:07:10', 'ABSENT');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alertes`
--
ALTER TABLE `alertes`
  ADD PRIMARY KEY (`id_alerte`);

--
-- Index pour la table `consoeau`
--
ALTER TABLE `consoeau`
  ADD PRIMARY KEY (`idconso`);

--
-- Index pour la table `etat_electrovanne`
--
ALTER TABLE `etat_electrovanne`
  ADD PRIMARY KEY (`idelectro`);

--
-- Index pour la table `mode`
--
ALTER TABLE `mode`
  ADD PRIMARY KEY (`idmode`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alertes`
--
ALTER TABLE `alertes`
  MODIFY `id_alerte` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT pour la table `consoeau`
--
ALTER TABLE `consoeau`
  MODIFY `idconso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=795;

--
-- AUTO_INCREMENT pour la table `etat_electrovanne`
--
ALTER TABLE `etat_electrovanne`
  MODIFY `idelectro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=891;

--
-- AUTO_INCREMENT pour la table `mode`
--
ALTER TABLE `mode`
  MODIFY `idmode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
