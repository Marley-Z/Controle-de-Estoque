-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/06/2024 às 03:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

CREATE DATABASE IF NOT EXISTS controle_estoque;
USE controle_estoque;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controle_estoque`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `quantidade` int(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`codigo`, `nome`, `descricao`, `quantidade`, `preco`) VALUES
(1, 'Cerveja Pilsen', 'Cerveja tipo Pilsen, garrafa de 350ml', 470, 3.50),
(2, 'Cerveja IPA', 'Cerveja tipo IPA, garrafa de 500ml', 300, 6.00),
(3, 'Refrigerante Cola', 'Refrigerante sabor cola, garrafa de 2 litros', 200, 5.00),
(4, 'Água Mineral', 'Água mineral natural, garrafa de 500ml', 1000, 1.20),
(5, 'Suco de Laranja', 'Suco natural de laranja, garrafa de 1 litro', 150, 4.00),
(6, 'Vinho Tinto', 'Vinho tinto seco, garrafa de 750ml', 75, 25.00),
(7, 'Vodka', 'Vodka pura, garrafa de 1 litro', 50, 45.00),
(8, 'Rum', 'Rum envelhecido, garrafa de 750ml', 80, 35.00),
(9, 'Whisky 12 Anos', 'Whisky envelhecido 12 anos, garrafa de 700ml', 40, 120.00),
(10, 'Espumante', 'Espumante brut, garrafa de 750ml', 60, 55.00),
(11, 'Cachaça', 'Cachaça artesanal, garrafa de 1 litro', 100, 20.00),
(12, 'Energético', 'Bebida energética, lata de 250ml', 500, 6.50),
(13, 'Gin', 'Gin London Dry, garrafa de 1 litro', 70, 60.00),
(14, 'Tequila', 'Tequila ouro, garrafa de 750ml', 45, 75.00),
(15, 'Champagne', 'Champagne francês, garrafa de 750ml', 30, 150.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `prateleira`
--

CREATE TABLE `prateleira` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `quantidadePrateleira` int(100) NOT NULL,
  `preco` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `prateleira`
--

INSERT INTO `prateleira` (`codigo`, `nome`, `descricao`, `quantidadePrateleira`, `preco`) VALUES
(66, 'Cerveja Pilsen', 'Cerveja tipo Pilsen, garrafa de 350ml', 30, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_prateleira`
--

CREATE TABLE `produto_prateleira` (
  `id_produto` int(11) NOT NULL,
  `id_prateleira` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nome_produto_unico` (`nome`);

--
-- Índices de tabela `prateleira`
--
ALTER TABLE `prateleira`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `produto_unico` (`nome`,`descricao`,`preco`);

--
-- Índices de tabela `produto_prateleira`
--
ALTER TABLE `produto_prateleira`
  ADD PRIMARY KEY (`id_produto`,`id_prateleira`),
  ADD KEY `id_prateleira` (`id_prateleira`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `prateleira`
--
ALTER TABLE `prateleira`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produto_prateleira`
--
ALTER TABLE `produto_prateleira`
  ADD CONSTRAINT `produto_prateleira_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `estoque` (`codigo`),
  ADD CONSTRAINT `produto_prateleira_ibfk_2` FOREIGN KEY (`id_prateleira`) REFERENCES `prateleira` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
