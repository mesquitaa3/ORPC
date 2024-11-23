-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Nov-2024 às 23:43
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `web-project`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administradores`
--

CREATE TABLE `administradores` (
  `id_administrador` int(11) NOT NULL,
  `nome_administrador` varchar(255) NOT NULL,
  `email_administrador` varchar(255) NOT NULL,
  `palavra_passe_administrador` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `administradores`
--

INSERT INTO `administradores` (`id_administrador`, `nome_administrador`, `email_administrador`, `palavra_passe_administrador`, `cargo`, `data_criacao`) VALUES
(3, 'admin', 'admin@admin.pt', 'admin', 'administrador', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(255) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `telefone_cliente` varchar(15) DEFAULT NULL,
  `telemovel_cliente` varchar(15) DEFAULT NULL,
  `distrito_cliente` varchar(255) DEFAULT NULL,
  `conselho_cliente` varchar(255) DEFAULT NULL,
  `localidade_cliente` varchar(255) DEFAULT NULL,
  `morada_cliente` varchar(255) DEFAULT NULL,
  `codigopostal_cliente` varchar(8) DEFAULT NULL,
  `zona_cliente` varchar(255) DEFAULT NULL,
  `palavra_passe_cliente` varchar(255) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `visivel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int(11) NOT NULL,
  `nome_tecnico` varchar(255) NOT NULL,
  `email_tecnico` varchar(255) NOT NULL,
  `palavra_passe_tecnico` varchar(255) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `palavra_passe` varchar(255) NOT NULL,
  `cargo` enum('cliente','administrador','tecnico') NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `nome`, `email`, `palavra_passe`, `cargo`, `data_criacao`, `reset_token`, `token_expiry`) VALUES
(1, 'admin', 'admin@admin.pt', '$2y$10$zLweSztU6O42pyVjMf/YfOdxH7ovgiWhHrTsF8U3VAQF9.xRxikga', 'administrador', '2024-11-21 19:27:27', NULL, NULL),
(2, 'teste', 'teste@tecnico.pt', '$2y$10$OTJ0/7FspBFtMmN.Oiycc./SR6foqdPZOryTxfUOMuY9JCZ9amGW2', 'tecnico', '2024-11-21 19:46:56', NULL, NULL),
(3, 'teste', 'dmmesquita31@gmail.com', '$2y$10$L/O1WDRVv9TkgXsovrXeeO300MmAwhKM/G4KWCsrLF02.iN8G4zDm', 'administrador', '2024-11-22 11:02:52', NULL, NULL),
(4, 'diogo ribeiro', 'compraa69@gmail.com', '$2y$10$J9asR4yyxuivOc49Wky2hO65emjJf7kYX1pZYx5Yb6UnKJy285KCy', 'cliente', '2024-11-22 18:32:01', 'e0634c25fcb81da90ae28654d9f6dd5e2892d90ca3bef7cf23fd374f926606d4', '2024-11-22 20:32:10'),
(5, 'Tiago Ferreira', 'tiagoasf03@gmail.com', '$2y$10$r/NnmrQq2hpcGj..usXKT.2coT6bvs3KBoOOj1iXLESiskH2hb00i', 'cliente', '2024-11-23 19:30:53', 'aa51bcef1955e741461c912e4683354f0b1a9672d363e98e13cf14c13f5cb8fc', '2024-11-23 21:31:14');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `email_administrador` (`email_administrador`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email_cliente` (`email_cliente`);

--
-- Índices para tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD UNIQUE KEY `email_tecnico` (`email_tecnico`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
