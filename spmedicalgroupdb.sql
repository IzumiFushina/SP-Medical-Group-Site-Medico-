-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 22-Nov-2023 às 11:00
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
  `date` date NOT NULL,
  `horario` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `medico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `informacoesamais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `consultas`
--

INSERT INTO `consultas` (`username`, `date`, `horario`, `medico`, `informacoesamais`) VALUES
('Marcos', '2023-10-02', '21:03', 'Dr. João da Silva', '3e'),
('Guilherme', '2023-11-14', '20:42', 'Doctor Who', 'Meu corazao está triste');

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

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`nomecompleto`, `email`, `assunto`, `mensagem`, `telefone`) VALUES
('Grande Irmao', 'arnaldogomes@gmail.com', 'Assunto', 'fsafsdr', ''),
('Grande Irmao', 'arnaldogomes@gmail.com', 'Assunto', 'fsafsdr', ''),
('sfsd', 'arnaldogomes@gmail.com', 'Assunto', 'fsafsdr', ''),
('Doctor Who', 'arnaldogomes@gmail.com', 'Assunto', 'fsafsdr', ''),
('Kratos', 'kratos@olimpo.com', 'Queda do Olimpo', 'Baixo assinado contra Zeus', '+55 19981617025');

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
(23, 'Saul Goodman', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '132.234.244-44', 'Masculino', '2023-11-21', 'goodman@netflix.com', 'Gestor'),
(24, 'A A', '356a192b7913b04c54574d18c28d46e6395428ab', '423.534.536-54', 'Masculino', '0056-05-04', 'a@a.com', 'user'),
(25, 'Admin A', '8bb6d4390779af92c05c5107b9f35cacd9004e0c', '235.346.356-45', 'NaoInformado', '34645-05-31', 'admin@gmail.com', 'Administrador');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
