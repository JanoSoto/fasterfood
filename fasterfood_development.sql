-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-06-2014 a las 07:07:22
-- Versión del servidor: 5.5.37-0ubuntu0.12.04.1
-- Versión de PHP: 5.3.10-1ubuntu3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `fasterfood_development`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta_obsolescencia`
--

CREATE TABLE IF NOT EXISTS `alerta_obsolescencia` (
`id` int(11) NOT NULL,
  `tiempo_emision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visualizada` tinyint(1) DEFAULT NULL,
  `necesidad_cubierta` tinyint(1) DEFAULT NULL,
  `lote_id` int(11) DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta_stock`
--

CREATE TABLE IF NOT EXISTS `alerta_stock` (
`id` int(11) NOT NULL,
  `ingrediente_id` int(11) DEFAULT NULL,
  `insumo_id` int(11) DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visualizada` tinyint(1) DEFAULT NULL,
  `necesidad_cubierta` tinyint(1) DEFAULT NULL,
  `tiempo_emision` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta_temporizador`
--

CREATE TABLE IF NOT EXISTS `alerta_temporizador` (
`id` int(11) NOT NULL,
  `tiempo_emision` datetime DEFAULT NULL,
  `visualizada` tinyint(1) DEFAULT NULL,
  `necesidad_cubierta` tinyint(1) DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basicos`
--

CREATE TABLE IF NOT EXISTS `basicos` (
`id` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `nombre_producto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_venta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `basicos`
--

INSERT INTO `basicos` (`id`, `precio`, `nombre_producto`, `en_venta`) VALUES
(1, 550, 'sprite pequeña', 1),
(2, 650, 'sprite mediana', 1),
(3, 750, 'sprite grande', 1),
(4, 550, 'coca-cola pequeña', 1),
(5, 650, 'coca-cola mediana', 1),
(6, 750, 'coca-cola grande', 1),
(7, 550, 'fanta pequeña', 1),
(8, 650, 'fanta mediana', 1),
(9, 750, 'fanta grande', 1),
(10, 550, 'kem pequeña', 1),
(11, 650, 'kem mediana', 1),
(12, 750, 'kem grande', 1),
(13, 750, 'hamburguesa nugget', 1),
(14, 750, 'hamburguesa italiana', 1),
(15, 750, 'completo italiano', 1),
(16, 550, 'papas fritas pequeñas', 1),
(17, 750, 'papas fritas medianas', 1),
(18, 990, 'papas fritas grandes', 1),
(19, 290, 'helado pequeño', 1),
(20, 450, 'helado mediano', 1),
(21, 750, 'helado grande', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `composicions`
--

CREATE TABLE IF NOT EXISTS `composicions` (
`id` int(11) NOT NULL,
  `basico_id` int(11) DEFAULT NULL,
  `compuesto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `composicions`
--

INSERT INTO `composicions` (`id`, `basico_id`, `compuesto_id`, `cantidad`) VALUES
(1, 13, 1, 1),
(2, 16, 1, 1),
(3, 13, 2, 1),
(4, 17, 2, 1),
(5, 19, 2, 1),
(6, 15, 3, 1),
(7, 17, 3, 1),
(8, 20, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compuestos`
--

CREATE TABLE IF NOT EXISTS `compuestos` (
`id` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `nombre_producto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en_venta` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `compuestos`
--

INSERT INTO `compuestos` (`id`, `precio`, `nombre_producto`, `en_venta`, `created_at`, `updated_at`) VALUES
(1, 1590, 'combo 2', 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(2, 1990, 'combo 3', 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(3, 2090, 'combo 4', 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE IF NOT EXISTS `detalles` (
`id` int(11) NOT NULL,
  `compuesto_id` int(11) DEFAULT NULL,
  `basico_id` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_entrega` datetime DEFAULT NULL,
  `tiempo_en_espera` datetime DEFAULT NULL,
  `tiempo_preparando` datetime DEFAULT NULL,
  `tiempo_terminado` datetime DEFAULT NULL,
  `tiempo_entregado_deseachado` datetime DEFAULT NULL,
  `intento_entrega` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `comentario` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `compuesto_id`, `basico_id`, `estado`, `tiempo_entrega`, `tiempo_en_espera`, `tiempo_preparando`, `tiempo_terminado`, `tiempo_entregado_deseachado`, `intento_entrega`, `precio`, `created_at`, `updated_at`, `venta_id`, `cantidad`, `comentario`) VALUES
(1, NULL, 2, '2', NULL, NULL, NULL, NULL, NULL, NULL, 650, '2014-06-30 10:07:49', '2014-06-30 10:07:49', 1, 1, ''),
(2, NULL, 15, '2', NULL, NULL, NULL, NULL, NULL, NULL, 750, '2014-06-30 10:07:49', '2014-06-30 10:20:24', 1, 1, ''),
(3, 3, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 2090, '2014-06-30 10:08:26', '2014-06-30 10:27:14', 2, 1, ''),
(4, NULL, 8, '3', NULL, NULL, NULL, NULL, NULL, NULL, 650, '2014-06-30 10:08:26', '2014-06-30 10:27:19', 2, 1, ''),
(5, NULL, 16, '3', NULL, NULL, NULL, NULL, NULL, NULL, 550, '2014-06-30 10:08:26', '2014-06-30 10:26:44', 2, 1, ''),
(6, NULL, 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, 1100, '2014-06-30 10:09:03', '2014-06-30 10:09:03', 3, 2, ''),
(7, NULL, 4, '2', NULL, NULL, NULL, NULL, NULL, NULL, 1100, '2014-06-30 10:09:03', '2014-06-30 10:09:03', 3, 2, ''),
(8, 3, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 8360, '2014-06-30 10:09:03', '2014-06-30 10:09:03', 3, 4, ''),
(9, NULL, 1, '3', NULL, NULL, NULL, NULL, NULL, NULL, 550, '2014-06-30 10:09:24', '2014-06-30 10:26:38', 4, 1, ''),
(10, NULL, 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, 550, '2014-06-30 10:29:48', '2014-06-30 10:29:48', 5, 1, ''),
(11, NULL, 19, '2', NULL, NULL, NULL, NULL, NULL, NULL, 290, '2014-06-30 10:29:48', '2014-06-30 10:29:48', 5, 1, ''),
(12, NULL, 16, '2', NULL, NULL, NULL, NULL, NULL, NULL, 550, '2014-06-30 10:29:48', '2014-06-30 10:29:48', 5, 1, ''),
(13, NULL, 13, '2', NULL, NULL, NULL, NULL, NULL, NULL, 750, '2014-06-30 10:31:11', '2014-06-30 10:31:11', 6, 1, ''),
(14, NULL, 15, '2', NULL, NULL, NULL, NULL, NULL, NULL, 750, '2014-06-30 10:31:11', '2014-06-30 10:31:11', 6, 1, 'Sin palta'),
(15, NULL, 4, '2', NULL, NULL, NULL, NULL, NULL, NULL, 1100, '2014-06-30 10:31:11', '2014-06-30 10:31:11', 6, 2, '');

--
-- Disparadores `detalles`
--
DELIMITER //
CREATE TRIGGER `TGR_PEDIDO_FINALIZADO` AFTER UPDATE ON `detalles`
 FOR EACH ROW if (select count(*) from detalles where detalles.venta_id = NEW.venta_id and detalles.estado = 2) = 0 then
update venta set venta.estado_venta = 3 where NEW.venta_id = venta.id;
end if
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_basicos`
--

CREATE TABLE IF NOT EXISTS `detalles_basicos` (
`id` int(11) NOT NULL,
  `basico_id` int(11) DEFAULT NULL,
  `ingrediente_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `detalles_basicos`
--

INSERT INTO `detalles_basicos` (`id`, `basico_id`, `ingrediente_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 1, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(2, 2, 16, 1, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(3, 3, 17, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(4, 4, 18, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(5, 5, 19, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(6, 6, 20, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(7, 7, 21, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(8, 8, 22, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(9, 9, 23, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(10, 10, 24, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(11, 11, 25, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(12, 12, 26, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(13, 13, 7, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(14, 13, 3, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(15, 13, 9, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(16, 13, 10, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(17, 13, 14, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(18, 14, 7, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(19, 14, 1, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(20, 14, 9, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(21, 14, 10, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(22, 14, 14, 1, '2014-06-30 09:43:42', '2014-06-30 09:43:42'),
(23, 15, 8, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(24, 15, 2, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(25, 15, 9, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(26, 15, 10, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(27, 15, 14, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(28, 16, 11, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(29, 17, 11, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(30, 18, 11, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(31, 19, 27, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(32, 20, 27, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(33, 21, 27, 1, '2014-06-30 09:43:43', '2014-06-30 09:43:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE IF NOT EXISTS `entregas` (
`id` int(11) NOT NULL,
  `fecha_hora_entrega` datetime DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
`id` int(11) NOT NULL,
  `refrigerado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `stock_critico` int(11) DEFAULT NULL,
  `stock_ideal` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `refrigerado`, `nombre`, `categoria`, `stock_actual`, `stock_critico`, `stock_ideal`, `created_at`, `updated_at`) VALUES
(1, NULL, 'hamburguesa de vacuno', 'carnes', 30, 20, 40, '2014-06-30 09:43:39', '2014-06-30 09:43:39'),
(2, NULL, 'vienesa', 'carnes', 23, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(3, NULL, 'nugget de pollo', 'carnes', 29, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:10'),
(4, NULL, 'churrasco', 'carnes', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(5, NULL, 'pollo', 'carnes', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(6, NULL, 'queso', 'lacteos', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(7, NULL, 'pan de hamburguesa', 'masas', 29, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:10'),
(8, NULL, 'pan de completo', 'masas', 23, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(9, NULL, 'tomate', 'verduras', 22, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(10, NULL, 'palta', 'verduras', 22, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(11, NULL, 'papas', 'verduras', 23, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:29:48'),
(12, NULL, 'ketchup (10gr)', 'condimentos', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(13, NULL, 'mostaza (10gr)', 'condimentos', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(14, NULL, 'mayonesa (10gr)', 'condimentos', 22, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(15, NULL, 'sprite pequeña', 'bebidas', 26, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:29:48'),
(16, NULL, 'sprite mediana', 'bebidas', 29, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:07:48'),
(17, NULL, 'sprite grande', 'bebidas', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(18, NULL, 'coca-cola pequeña', 'bebidas', 26, 20, 40, '2014-06-30 09:43:40', '2014-06-30 10:31:11'),
(19, NULL, 'coca-cola mediana', 'bebidas', 30, 20, 40, '2014-06-30 09:43:40', '2014-06-30 09:43:40'),
(20, NULL, 'coca-cola grande', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(21, NULL, 'fanta pequeña', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(22, NULL, 'fanta mediana', 'bebidas', 29, 20, 40, '2014-06-30 09:43:41', '2014-06-30 10:08:25'),
(23, NULL, 'fanta grande', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(24, NULL, 'kem pequeña', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(25, NULL, 'kem mediana', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(26, NULL, 'kem grande', 'bebidas', 30, 20, 40, '2014-06-30 09:43:41', '2014-06-30 09:43:41'),
(27, NULL, 'helado (1 porcion)', 'helados', 24, 20, 40, '2014-06-30 09:43:41', '2014-06-30 10:29:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE IF NOT EXISTS `insumos` (
`id` int(11) NOT NULL,
  `tipo_insumo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_insumo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria_insumo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `stock_critico` int(11) DEFAULT NULL,
  `stock_ideal` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE IF NOT EXISTS `lotes` (
`id` int(11) NOT NULL,
  `fecha_hora_llegada` datetime DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `ingrediente_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `numero_lote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mermas`
--

CREATE TABLE IF NOT EXISTS `mermas` (
`id` int(11) NOT NULL,
  `cantidad_merma` int(11) DEFAULT NULL,
  `fecha_merma` datetime DEFAULT NULL,
  `comentario_merma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merma_ingredientes`
--

CREATE TABLE IF NOT EXISTS `merma_ingredientes` (
`id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_merma` date DEFAULT NULL,
  `comentario_merma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingrediente_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merma_insumos`
--

CREATE TABLE IF NOT EXISTS `merma_insumos` (
`id` int(11) NOT NULL,
  `cantidad_merma` int(11) DEFAULT NULL,
  `fecha_merma` date DEFAULT NULL,
  `comentario_merma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insumo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merma_materials`
--

CREATE TABLE IF NOT EXISTS `merma_materials` (
`id` int(11) NOT NULL,
  `cantidad_merma` int(11) DEFAULT NULL,
  `fecha_merma` datetime DEFAULT NULL,
  `comentario_merma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingredientes_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
`id` int(11) NOT NULL,
  `rut_proveedor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_proveedor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_proveedor` int(11) DEFAULT NULL,
  `email_proveedor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `rut_proveedor`, `nombre_proveedor`, `telefono_proveedor`, `email_proveedor`, `created_at`, `updated_at`) VALUES
(1, '584765461', 'IDEAL', 24571684, NULL, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(2, '756468138', 'CCU', 12348574, NULL, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(3, '798465465', 'SUPER CERDO', 12341871, NULL, '2014-06-30 09:43:43', '2014-06-30 09:43:43'),
(4, '79845465K', 'JB', 12867492, NULL, '2014-06-30 09:43:44', '2014-06-30 09:43:44'),
(5, '713135488', 'HELLMANS', 27685947, NULL, '2014-06-30 09:43:44', '2014-06-30 09:43:44'),
(6, '754654651', 'MONTINA', 26574869, NULL, '2014-06-30 09:43:44', '2014-06-30 09:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140611030022'),
('20140611030723'),
('20140611030932'),
('20140611031326'),
('20140611031650'),
('20140611032339'),
('20140611032835'),
('20140611114319'),
('20140611114320'),
('20140611114321'),
('20140611120340'),
('20140613170809'),
('20140613171230'),
('20140613172117'),
('20140619115026'),
('20140623133519'),
('20140623161642'),
('20140623183531'),
('20140625022232'),
('20140625023524'),
('20140625034236'),
('20140625034505'),
('20140626115424'),
('20140626231107'),
('20140626234900'),
('20140627230505'),
('20140628001954'),
('20140628183718'),
('20140628190207'),
('20140628213640'),
('20140628213837'),
('20140629005822'),
('20140629022208'),
('20140629023955'),
('20140629181249'),
('20140629232913'),
('20140630020308'),
('20140630040204'),
('20140630072213');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rut` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `rut`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `user_id`, `rol`) VALUES
(6, 'admin@fasterfood.cl', '$2a$10$c1S3ZUupiFTmiUF0Z9gM2OxHXSl19yn8YNJj4PSQDjkF5L0fjgYhq', NULL, NULL, NULL, 8, '2014-06-30 11:04:39', '2014-06-30 10:06:24', '127.0.0.1', '127.0.0.1', '2014-06-30 03:24:54', '2014-06-30 11:04:39', '000000000', 'Administrador', 'Administrador', 'Administrador', NULL, NULL, 5),
(7, 'giovanni.benussi@usach.cl', '$2a$10$6DHR29PrIjiWS47utI0Fg.DGVfYL3XtrRWK7aj5XJk1h4hCNq0Ef6', NULL, NULL, NULL, 1, '2014-06-30 05:00:21', '2014-06-30 05:00:21', '127.0.0.1', '127.0.0.1', '2014-06-30 04:40:47', '2014-06-30 05:00:21', '175658173', 'Giovanni', 'Benussi', 'Paredes', 94659339, NULL, 5),
(8, 'cocinero@fasterfood.cl', '$2a$10$dQLlsWnHXNcX4fLANBHRhu4/Y1haioSdCtuplZur3xbVPd//cReh.', NULL, NULL, NULL, 5, '2014-06-30 10:06:17', '2014-06-30 06:59:52', '127.0.0.1', '127.0.0.1', '2014-06-30 05:04:23', '2014-06-30 10:06:17', '123456785', 'Cocinero', 'Cocinero', 'Cocinero', NULL, NULL, 1),
(9, 'vendedor@fasterfood.cl', '$2a$10$9ojYzAZQDaayHMebNl0Fe.8aZyg9/S0fdDLfAijGgpftEoDNDFt/a', NULL, NULL, NULL, 3, '2014-06-30 10:06:59', '2014-06-30 06:40:56', '127.0.0.1', '127.0.0.1', '2014-06-30 05:05:43', '2014-06-30 10:06:59', '876543214', 'Vendedor', 'Vendedor', 'Vendedor', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedors`
--

CREATE TABLE IF NOT EXISTS `vendedors` (
`id` int(11) NOT NULL,
  `rut` int(11) DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `nombre_cliente` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `precio_total` int(11) NOT NULL,
  `comentario_perdida` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `numero_de_caja` int(11) DEFAULT NULL,
  `estado_venta` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_terminado_venta` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `vendedor_id`, `fecha_hora`, `nombre_cliente`, `precio_total`, `comentario_perdida`, `numero_de_caja`, `estado_venta`, `tiempo_terminado_venta`, `created_at`, `updated_at`, `cantidad`) VALUES
(1, 9, '2014-06-30 10:07:48', 'Giovanni', 1400, '', 1, '0', NULL, '2014-06-30 10:07:49', '2014-06-30 10:28:47', NULL),
(2, 9, '2014-06-30 10:08:25', 'Alejandro', 3290, '', 1, '3', NULL, '2014-06-30 10:08:26', '2014-06-30 10:08:26', NULL),
(3, 9, '2014-06-30 10:09:01', 'Margarita', 10560, '', 1, '2', NULL, '2014-06-30 10:09:03', '2014-06-30 10:09:03', NULL),
(4, 9, '2014-06-30 10:09:24', 'Juanito', 550, '', 1, '4', NULL, '2014-06-30 10:09:24', '2014-06-30 10:27:01', NULL),
(5, 9, '2014-06-30 10:29:48', 'Carmen', 1390, '', 1, '2', NULL, '2014-06-30 10:29:48', '2014-06-30 10:29:48', NULL),
(6, 9, '2014-06-30 10:31:10', 'Maria', 2600, '', 1, '2', NULL, '2014-06-30 10:31:11', '2014-06-30 10:31:11', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta_obsolescencia`
--
ALTER TABLE `alerta_obsolescencia`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alerta_stock`
--
ALTER TABLE `alerta_stock`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alerta_temporizador`
--
ALTER TABLE `alerta_temporizador`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `basicos`
--
ALTER TABLE `basicos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `composicions`
--
ALTER TABLE `composicions`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compuestos`
--
ALTER TABLE `compuestos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_basicos`
--
ALTER TABLE `detalles_basicos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
 ADD PRIMARY KEY (`id`), ADD KEY `index_entregas_on_proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
 ADD PRIMARY KEY (`id`), ADD KEY `index_lotes_on_ingrediente_id` (`ingrediente_id`);

--
-- Indices de la tabla `mermas`
--
ALTER TABLE `mermas`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `merma_ingredientes`
--
ALTER TABLE `merma_ingredientes`
 ADD PRIMARY KEY (`id`), ADD KEY `index_merma_ingredientes_on_ingrediente_id` (`ingrediente_id`);

--
-- Indices de la tabla `merma_insumos`
--
ALTER TABLE `merma_insumos`
 ADD PRIMARY KEY (`id`), ADD KEY `index_merma_insumos_on_insumo_id` (`insumo_id`);

--
-- Indices de la tabla `merma_materials`
--
ALTER TABLE `merma_materials`
 ADD PRIMARY KEY (`id`), ADD KEY `index_merma_materials_on_ingredientes_id` (`ingredientes_id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `schema_migrations`
--
ALTER TABLE `schema_migrations`
 ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `index_users_on_email` (`email`), ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- Indices de la tabla `vendedors`
--
ALTER TABLE `vendedors`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta_obsolescencia`
--
ALTER TABLE `alerta_obsolescencia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alerta_stock`
--
ALTER TABLE `alerta_stock`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alerta_temporizador`
--
ALTER TABLE `alerta_temporizador`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `basicos`
--
ALTER TABLE `basicos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `composicions`
--
ALTER TABLE `composicions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `compuestos`
--
ALTER TABLE `compuestos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `detalles_basicos`
--
ALTER TABLE `detalles_basicos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mermas`
--
ALTER TABLE `mermas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `merma_ingredientes`
--
ALTER TABLE `merma_ingredientes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `merma_insumos`
--
ALTER TABLE `merma_insumos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `merma_materials`
--
ALTER TABLE `merma_materials`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `vendedors`
--
ALTER TABLE `vendedors`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
