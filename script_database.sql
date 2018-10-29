-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-05-2018 a las 20:55:07
-- Versión del servidor: 5.6.38
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica12`
--

CREATE DATABASE practica12;

USE practica12;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `usuarios`
--
CREATE TABLE usuarios
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(32) NOT NULL,
	apellidos VARCHAR(32) NOT NULL,
	usuario VARCHAR(32) NOT NULL,
	password VARCHAR(32) NOT NULL,		
	email VARCHAR(32) NOT NULL,
	fecha_registro DATE NOT NULL,
	ruta_imagen VARCHAR(128) 
);


-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `categorias`
--
CREATE TABLE categorias
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(64) NOT NULL,
	descripcion VARCHAR(512),
	fecha_registro DATE NOT NULL
);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `productos`
--
CREATE TABLE productos
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR(16) NOT NULL,
	nombre VARCHAR(64) NOT NULL,
	fecha_registro DATE NOT NULL,
	precio DOUBLE NOT NULL,
	stock INT NOT NULL,
	categoria INT REFERENCES categorias(id),
	ruta_imagen VARCHAR(128) 
);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `alumnos`
--
CREATE TABLE historial
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	producto INT REFERENCES productos(id),
	usuario INT REFERENCES usuarios(id),
	fecha DATE NOT NULL,
	nota VARCHAR(256) NOT NULL,
	referencia VARCHAR(128) NOT NULL,
	cantidad INT NOT NULL
);

--
-- Volcado de datos para la tabla `usuarios`
--
INSERT INTO  usuarios (nombre, apellidos, usuario, password, email, fecha_registro)
VALUES ('Luis', 'Gomez', 'admin', 'admin','admin@admin.com',CURDATE());

--
-- Volcado de datos para la tabla `categorias`
--
INSERT INTO  categorias (nombre, descripcion, fecha_registro)
VALUES ('Electronica','Electrocomponentes etc.',CURDATE()), 
('Zapateria','Articulos de Calzado.',CURDATE());

--
-- Volcado de datos para la tabla `productos`
--
INSERT INTO productos (codigo, nombre, fecha_registro, precio, stock, categoria)
VALUES ('10101','Licuadora MABE', CURDATE(), 1750.5, 10, 1);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


