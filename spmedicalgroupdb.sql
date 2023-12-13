-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12-Dez-2023 às 21:01
-- Versão do servidor: 8.0.35-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `spmedicalgroupdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultas`
--

CREATE TABLE `consultas` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` text COLLATE utf8mb4_general_ci NOT NULL,
  `horario` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `medico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `informacoesamais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `consultas`
--

INSERT INTO `consultas` (`username`, `email`, `date`, `horario`, `medico`, `informacoesamais`) VALUES
('Guilherme Ped', 'guipedromilo@gmail.com', '2023-12-12', '18:00', 'Doctor Who', ''),
('Guilherme Ped', 'guipedromilo@gmail.com', '2023-12-12', '18:30', 'Milena Shokan', ''),
('Guilherme Ped', 'guipedromilo@gmail.com', '2023-12-20', '12:01', 'Walter White', ''),
('Guilherme Ped', 'guipedromilo@gmail.com', '2023-12-22', '12:00', 'Miguel Tiradentes', 'Manutenção');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `nomecompleto` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `telefone` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sexo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datanascimento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `cpf`, `sexo`, `datanascimento`, `email`, `tipo`) VALUES
(25, 'Admin A', '8bb6d4390779af92c05c5107b9f35cacd9004e0c', '000.000.000-01', 'Masculino', '2000-11-05', 'admin@gmail.com', 'Administrador'),
(32, 'Doctor Who', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-02', 'Masculino', '1980-05-11', 'doctorwho@gmail.com', 'Medico'),
(33, 'Elizabeth Schimidt', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-03', 'Feminino', '2000-04-13', 'elizabeth@gmail.com', 'Medico'),
(34, 'Bonnie Fazbear', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-04', 'Masculino', '1997-02-13', 'bonnie@gmail.com', 'Medico'),
(35, 'Milena Shokan', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-05', 'Feminino', '1985-12-13', 'milena@gmail.com', 'Medico'),
(36, 'Walter White', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-06', 'Masculino', '1993-08-06', 'walter@gmail.com', 'Medico'),
(37, 'Miguel Tiradentes', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-07', 'Masculino', '2004-12-20', 'miguel@gmail.com', 'Medico'),
(38, 'Fátima dos Santos', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-08', 'Feminino', '1999-03-14', 'fatima@gmail.com', 'Medico'),
(39, 'Fernando Ferreiro', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-09', 'Masculino', '2001-04-12', 'fernando@gmail.com', 'Gestor'),
(40, 'Guilherme Ped', '7c222fb2927d828af22f592134e8932480637c0d', '000.000.000-00', 'Masculino', '2003-02-11', 'ped@gmail.com', 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
