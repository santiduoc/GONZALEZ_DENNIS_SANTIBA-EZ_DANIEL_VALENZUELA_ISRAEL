/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flota_conectada`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$UrGSvHTWm8.ZK4BzPmo8iuqsK6XF5RfHay6ooC5D50y/nShon5wqe', 'Administrador', 'General', 'user-default.png', '2024-08-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE `asignaciones` (
  `id_asignacion` int(11) NOT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `id_faena` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_colaborador` int(11) DEFAULT NULL,
  `tarea` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_asignacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_colaboradores`
--

CREATE TABLE `cargo_colaboradores` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id_colaborador` int(11) NOT NULL,
  `rut_colaborador` varchar(12) NOT NULL,
  `nombre_colaborador` varchar(100) NOT NULL,
  `apellido_colaborador` varchar(100) NOT NULL,
  `cargo_colaborador` int(11) NOT NULL,
  `estado_colaborador` int(11) NOT NULL,
  `created_colaborador` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faenas`
--

CREATE TABLE `faenas` (
  `id_faena` int(11) NOT NULL,
  `nombre_faena` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ubicacion_faena` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mandante_faena` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado_faena` int(2) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `fecha_creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_por` int(11) NOT NULL,
  `fecha_actualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenciones`
--

CREATE TABLE `mantenciones` (
  `id_mantencion` int(11) NOT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `tipo_mantencion` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_programada` date NOT NULL,
  `fecha_realizada` date DEFAULT NULL,
  `taller_responsable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinas_sondaje`
--

CREATE TABLE `maquinas_sondaje` (
  `id_maquina` int(11) NOT NULL,
  `numero_serie` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` int(4) NOT NULL,
  `marca` int(4) NOT NULL,
  `modelo` int(4) NOT NULL,
  `anio` year(4) NOT NULL,
  `estado` int(2) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_maquinas_sondaje`
--

CREATE TABLE `marca_maquinas_sondaje` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_vehiculos`
--

CREATE TABLE `marca_vehiculos` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_maquinas_sondaje`
--

CREATE TABLE `modelo_maquinas_sondaje` (
  `id_modelo` int(11) NOT NULL,
  `nombre_modelo` varchar(255) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_vehiculos`
--

CREATE TABLE `modelo_vehiculos` (
  `id_modelo` int(11) NOT NULL,
  `nombre_modelo` varchar(255) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Nombre_Completo` varchar(100) DEFAULT NULL,
  `Correo_Electrónico` varchar(100) NOT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Fecha_Creación` date DEFAULT NULL,
  `Último_Inicio_Sesión` date DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `patente` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marca` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modelo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `anio` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(2) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `fk_asignaciones_vehiculo` (`id_vehiculo`),
  ADD KEY `fk_asignaciones_maquina` (`id_maquina`),
  ADD KEY `fk_asignaciones_faena` (`id_faena`);

--
-- Indices de la tabla `cargo_colaboradores`
--
ALTER TABLE `cargo_colaboradores`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id_colaborador`);

--
-- Indices de la tabla `faenas`
--
ALTER TABLE `faenas`
  ADD PRIMARY KEY (`id_faena`);

--
-- Indices de la tabla `mantenciones`
--
ALTER TABLE `mantenciones`
  ADD PRIMARY KEY (`id_mantencion`),
  ADD KEY `fk_mantenimiento_maquina` (`id_maquina`),
  ADD KEY `fk_mantenimiento_vehiculo` (`id_vehiculo`) USING BTREE;

--
-- Indices de la tabla `maquinas_sondaje`
--
ALTER TABLE `maquinas_sondaje`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `Número_Serie` (`numero_serie`);

--
-- Indices de la tabla `marca_maquinas_sondaje`
--
ALTER TABLE `marca_maquinas_sondaje`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `marca_vehiculos`
--
ALTER TABLE `marca_vehiculos`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `modelo_maquinas_sondaje`
--
ALTER TABLE `modelo_maquinas_sondaje`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `modelo_vehiculos`
--
ALTER TABLE `modelo_vehiculos`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Nombre_Usuario` (`Nombre_Usuario`),
  ADD UNIQUE KEY `Correo_Electrónico` (`Correo_Electrónico`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `Patente` (`patente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cargo_colaboradores`
--
ALTER TABLE `cargo_colaboradores`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id_colaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `faenas`
--
ALTER TABLE `faenas`
  MODIFY `id_faena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mantenciones`
--
ALTER TABLE `mantenciones`
  MODIFY `id_mantencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `maquinas_sondaje`
--
ALTER TABLE `maquinas_sondaje`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca_maquinas_sondaje`
--
ALTER TABLE `marca_maquinas_sondaje`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca_vehiculos`
--
ALTER TABLE `marca_vehiculos`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `modelo_maquinas_sondaje`
--
ALTER TABLE `modelo_maquinas_sondaje`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelo_vehiculos`
--
ALTER TABLE `modelo_vehiculos`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_sondaje` (`id_maquina`),
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`id_faena`) REFERENCES `faenas` (`id_faena`),
  ADD CONSTRAINT `fk_asignaciones_faena` FOREIGN KEY (`id_faena`) REFERENCES `faenas` (`id_faena`),
  ADD CONSTRAINT `fk_asignaciones_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_sondaje` (`id_maquina`),
  ADD CONSTRAINT `fk_asignaciones_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `mantenciones`
--
ALTER TABLE `mantenciones`
  ADD CONSTRAINT `fk_mantenimiento_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_sondaje` (`id_maquina`),
  ADD CONSTRAINT `fk_mantenimiento_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `mantenciones_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `mantenciones_ibfk_2` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_sondaje` (`id_maquina`);
COMMIT;
