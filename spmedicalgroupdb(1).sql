-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 18/10/2023 às 16:03
-- Versão do servidor: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Versão do PHP: 8.1.2-1ubuntu2.14

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
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nomecompleto` varchar(255) DEFAULT NULL,
  `sexo` varchar(100) DEFAULT NULL,
  `datanascimento` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `cpf`, `nomecompleto`, `sexo`, `datanascimento`, `email`) VALUES
(2, 'GuiVeiga', '12345', '34353533912', 'Guilherme Vegas', 'Masculino', '11/05/1980', 'email'),
(3, 'atonio', '12', '12345678910', 'Marcos Veiga', 'Masculino', '01/10/27', NULL),
(4, 'GatoComunista', '12345', '12345678912', 'João Texeira', 'Masculino', '13/01/2007', NULL),
(5, 'Guilherme', '12345', '34353533912', 'Pedromilo', 'Masculino', '11/05/1980', 'rgrgrtgtff'),
(8, 'Gui345', '12345', '34353533912', 'Guilherme Vegas', 'Masculino', '13/01/2007', 'sgdsdddsds'),
(9, 'Gui345', '12345', '34353533912', 'Guilherme Vegas', 'Masculino', '13/01/2007', 'sgdsdddsds'),
(10, 'ddd', '1', '34353533912', 'Guilherme Vegas', 'Masculino', '11/05/1980', 'feregdrg');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
