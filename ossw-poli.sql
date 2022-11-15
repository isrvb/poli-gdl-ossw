-- phpMyAdmin SQL Dump
-- version 5.1.4deb1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-11-2022 a las 21:11:12
-- Versión del servidor: 10.6.10-MariaDB-1+b1
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_school`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumn`
--

CREATE TABLE `alumn` (
  `id` int(11) NOT NULL,
  `image` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `address` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `phone` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `c1_fullname` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c1_address` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c1_phone` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c1_note` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c2_fullname` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c2_address` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c2_phone` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `c2_note` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Volcado de datos para la tabla `alumn`
--

INSERT INTO `alumn` (`id`, `image`, `name`, `lastname`, `email`, `address`, `phone`, `c1_fullname`, `c1_address`, `c1_phone`, `c1_note`, `c2_fullname`, `c2_address`, `c2_phone`, `c2_note`, `is_active`, `created_at`, `user_id`) VALUES
(29, '', 'EDWIN', 'LOPEZ', '', 'MEXICO', '3333333333', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumn_team`
--

CREATE TABLE `alumn_team` (
  `id` int(11) NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Volcado de datos para la tabla `alumn_team`
--

INSERT INTO `alumn_team` (`id`, `alumn_id`, `team_id`) VALUES
(18, 29, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assistance`
--

CREATE TABLE `assistance` (
  `id` int(11) NOT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `date_at` date NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behavior`
--

CREATE TABLE `behavior` (
  `id` int(11) NOT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `date_at` date NOT NULL,
  `alumn_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `block`
--

CREATE TABLE `block` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Volcado de datos para la tabla `block`
--

INSERT INTO `block` (`id`, `name`, `team_id`) VALUES
(7, 'CIBERSEGURIDAD', 1),
(8, 'MATEMATICAS', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calification`
--

CREATE TABLE `calification` (
  `id` int(11) NOT NULL,
  `val` double DEFAULT NULL,
  `alumn_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Grupos'),
(3, 'Acceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

CREATE TABLE `team` (
  `idgrupo` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `favorito` tinyint(1) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Volcado de datos para la tabla `team`
--

INSERT INTO `team` (`idgrupo`, `nombre`, `favorito`, `idusuario`) VALUES
(1, 'PRIMERO', 1, 1),
(2, 'SEGUNDO', 1, 1),
(3, 'TERCERO', 1, 1),
(4, 'CUARTO', 1, 1),
(5, 'QUINTO', 1, 1),
(6, 'SEXTO', 1, 1),
(10, 'SEPTIMO', 1, 1),
(11, 'OCTAVO', 1, 1),
(12, 'NOVENO', 1, 1),
(13, 'DECIMO', 1, 1),
(14, 'ONCEAVO', 1, 1),
(15, 'DOCEAVO', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'OS', 'DNI', '', '', '', '', 'Administrador', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '../files/usuarios/OO.jpg', 1),
(4, 'VB', 'DNI', '', '', '', '', 'Cibernetico', 'VB', '3ba4094169c62d0d57e94993a6b7e50c2adbe609f09c4a0e83af1e3f0cdc3b16', '1667793840.jpg', 1),
(5, 'Tom', 'DNI', '', '', '', '', '', 'tom', 'e1608f75c5d7813f3d4031cb30bfb786507d98137538ff8e128a6ff74e84e643', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(35, 1, 1),
(36, 1, 2),
(37, 1, 3),
(44, 4, 1),
(45, 4, 2),
(46, 4, 3),
(47, 5, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumn`
--
ALTER TABLE `alumn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `behavior`
--
ALTER TABLE `behavior`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indices de la tabla `calification`
--
ALTER TABLE `calification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumn_id` (`alumn_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `team_ibfk_1` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumn`
--
ALTER TABLE `alumn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `assistance`
--
ALTER TABLE `assistance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `behavior`
--
ALTER TABLE `behavior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `calification`
--
ALTER TABLE `calification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `team`
--
ALTER TABLE `team`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumn`
--
ALTER TABLE `alumn`
  ADD CONSTRAINT `alumn_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `alumn_team`
--
ALTER TABLE `alumn_team`
  ADD CONSTRAINT `alumn_team_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `alumn_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD CONSTRAINT `assistance_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `assistance_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `behavior`
--
ALTER TABLE `behavior`
  ADD CONSTRAINT `behavior_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `behavior_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `block_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`idgrupo`);

--
-- Filtros para la tabla `calification`
--
ALTER TABLE `calification`
  ADD CONSTRAINT `calification_ibfk_1` FOREIGN KEY (`alumn_id`) REFERENCES `alumn` (`id`),
  ADD CONSTRAINT `calification_ibfk_2` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`);

--
-- Filtros para la tabla `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
