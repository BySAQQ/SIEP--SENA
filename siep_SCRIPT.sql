-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2022 a las 04:06:42
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siep`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Codigo_CL` int(11) NOT NULL,
  `Cedula_CL` int(15) NOT NULL,
  `Nombre_CL` varchar(30) NOT NULL,
  `Direccion_CL` text NOT NULL,
  `Correo_CL` text NOT NULL,
  `Telefono_CL` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Codigo_CL`, `Cedula_CL`, `Nombre_CL`, `Direccion_CL`, `Correo_CL`, `Telefono_CL`) VALUES
(1, 123456, 'Cliente Prueba', 'CALLE 21 21 84', 'cliente@cliente.com', 19875633);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_servicio`
--

CREATE TABLE `ordenes_de_servicio` (
  `Numero_Ord` int(45) NOT NULL,
  `ID_Servicio` int(15) NOT NULL,
  `Cedula_CL` int(15) NOT NULL,
  `Nomble_CL` varchar(45) NOT NULL,
  `Fecha_Ord` date NOT NULL,
  `Monto_Ord` decimal(10,0) NOT NULL,
  `ventas_ID_User` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Codigo_P` int(15) NOT NULL,
  `ID_Categoria` int(10) NOT NULL,
  `Nombre_P` varchar(40) NOT NULL,
  `Cantidad_P` int(11) NOT NULL,
  `Precio_P` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo_P`, `ID_Categoria`, `Nombre_P`, `Cantidad_P`, `Precio_P`) VALUES
(1, 1, 'Producto Test', 1, 2000),
(4, 2, 'Producto 1', 1, 3000),
(5, 4, 'Empaque', 5, 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_categorias`
--

CREATE TABLE `productos_categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Cat` varchar(45) NOT NULL,
  `Detalles` varchar(60) NOT NULL,
  `Estado` bit(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_categorias`
--

INSERT INTO `productos_categorias` (`ID_Categoria`, `Nombre_Cat`, `Detalles`, `Estado`) VALUES
(1, 'Motor', '', b'0000000001'),
(2, 'Accesorios', '', b'0000000001'),
(3, 'Refrigerantes', '', b'0000000001'),
(4, 'Otros', '', b'0000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Codigo_Prove` int(11) NOT NULL,
  `NIT_Prove` int(12) NOT NULL,
  `Codigo_P` int(15) NOT NULL,
  `Nombre_Prove` varchar(45) NOT NULL,
  `Direccion_Prove` varchar(45) NOT NULL,
  `Celular_Prove` int(15) NOT NULL,
  `Correo_Prove` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(10) NOT NULL,
  `Nombre_ROL` varchar(30) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `Estado` bit(10) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_ROL`, `Nombre_ROL`, `Descripcion`, `Estado`) VALUES
(1, 'Administrador', '', b'0000000001'),
(2, 'Operador', '', b'0000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_servicio`
--

CREATE TABLE `tipos_de_servicio` (
  `ID_Servicio` int(15) NOT NULL,
  `Tipo_Serv` varchar(20) NOT NULL,
  `Detalles_Servicio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_User` int(15) NOT NULL,
  `Nombres_Us` varchar(60) NOT NULL,
  `Celular_Us` bigint(10) NOT NULL,
  `Correo_Us` varchar(40) NOT NULL,
  `Direccion_Us` varchar(40) NOT NULL,
  `Cargo_Us` varchar(15) NOT NULL,
  `Profesion_Us` text NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `ID_ROL` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_User`, `Nombres_Us`, `Celular_Us`, `Correo_Us`, `Direccion_Us`, `Cargo_Us`, `Profesion_Us`, `Contrasena`, `ID_ROL`) VALUES
(1, 'Usuario', 123456789, 'local@local.com', 'cra 123', 'CARGO', '', '202cb962ac59075b964b07152d234b70', 1),
(2, 'German', 3178867238, 'ger@ger.com', 'CRA 35', 'ORG', 'ASASASA', '202cb962ac59075b964b07152d234b70', 2),
(3, 'Sionne', 123456, 'Sionne@sionne.com', 'CRA 35', 'ORG', 'asasas', '25f9e794323b453885f5181f1b624d0b', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Numero_Ven` int(11) NOT NULL,
  `ID_User` int(15) NOT NULL,
  `Nombre_CL` varchar(45) NOT NULL,
  `Codigo_P` int(15) NOT NULL,
  `Nombre_P` varchar(60) NOT NULL,
  `Fecha_Ven` date NOT NULL,
  `Monto_Ven` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Codigo_CL`);

--
-- Indices de la tabla `ordenes_de_servicio`
--
ALTER TABLE `ordenes_de_servicio`
  ADD PRIMARY KEY (`Numero_Ord`,`ventas_ID_User`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Codigo_P`);

--
-- Indices de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Codigo_Prove`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `tipos_de_servicio`
--
ALTER TABLE `tipos_de_servicio`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_User`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Numero_Ven`),
  ADD UNIQUE KEY `Codigo_P` (`Codigo_P`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Codigo_CL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Codigo_P` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Codigo_Prove` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_User` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Numero_Ven` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
