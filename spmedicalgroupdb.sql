-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 07-Nov-2023 às 20:49
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
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `horario` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `medico` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `informacoesamais` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `consultas`
--

INSERT INTO `consultas` (`username`, `date`, `horario`, `medico`, `informacoesamais`) VALUES
('Marcos', '2023-10-02', '21:03', 'Dr. João da Silva', '3e');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nomecompleto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sexo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datanascimento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `cpf`, `nomecompleto`, `sexo`, `datanascimento`, `email`, `tipo`) VALUES
(2, 'GuiVeiga', '12345', '34353533912', 'Guilherme Vegas', 'Masculino', '11/05/1980', 'email', 'user'),
(13, 'Guilherme', '12345', '12345678901', 'Guilherme Veig', 'Masculino', '11/05/1942', 'email@gmail.com', 'Administrador'),
(14, '1', '1', 'gui e', 'eu', 'd', '11', 'Tzar B', NULL),
(15, 'Gui Vegas Ped', 'efsef', '132.323.223-21', 'Gui lherme', 'masculino', '2023-10-09', 'email@email.com', NULL),
(16, 'Grande Irmão', '1984', '198.419.841-98', 'Grande Irmao', 'masculino', '2023-10-17', 'grandeirmao@ministeriodaverdde.com', NULL),
(17, 'Grande Irmão', '1984', '198.419.841-98', 'Grande Irmao', 'masculino', '2023-10-17', 'grandeirmao@ministeriodaverdde.com', NULL),
(18, 'Grande Irmão', '1984', '198.419.841-98', 'Grande Irmao', 'masculino', '2023-10-17', 'grandeirmao@ministeriodaverdde.com', NULL),
(19, 'Grande Irmão', '1984', '198.419.841-98', 'Grande Irmao', 'masculino', '2023-10-17', 'grandeirmao@ministeriodaverdde.com', NULL),
(21, 'Who', '123', '432.545.352-52', 'Doctor Who', 'masculino', '1965-06-16', 'who@tardis.com', 'Medico');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
