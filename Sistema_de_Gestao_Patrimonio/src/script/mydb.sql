-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 13-Out-2014 às 19:20
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `geraMaterial`(IN `idGrupoMaterial` INT, IN `estado` CHAR, IN `idCompartimento` INT, IN `estadoChegada` CHAR, IN `quantidade` INT)
    NO SQL
WHILE quantidade > 0 DO

	INSERT INTO `mydb`.`Material` (`estado`, 				`Compartimento_idCompartimento`, 		`GrupoMaterial_idGrupoMaterial`, `estadoChegada`) VALUES (estado, idCompartimento, idGrupoMaterial,estadoChegada);
	SET quantidade = quantidade - 1;
END WHILE$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Capacidade`
--

CREATE TABLE IF NOT EXISTS `Capacidade` (
  `Compartimento_idCompartimento` int(11) NOT NULL,
  `CategoriaMaterial_idCategoria` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Capacidade`
--

INSERT INTO `Capacidade` (`Compartimento_idCompartimento`, `CategoriaMaterial_idCategoria`, `capacidade`) VALUES
(1, 1, 10),
(2, 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cargo`
--

CREATE TABLE IF NOT EXISTS `Cargo` (
`idCargo` int(11) NOT NULL,
  `designacao` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Cargo`
--

INSERT INTO `Cargo` (`idCargo`, `designacao`) VALUES
(1, 'Barra');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CategoriaMaterial`
--

CREATE TABLE IF NOT EXISTS `CategoriaMaterial` (
`idCategoria` int(11) NOT NULL,
  `designacao` varchar(45) NOT NULL,
  `identiTipo` char(1) NOT NULL COMMENT 'Identifica o tipo do materia, pode assumir duas Caracteres(E ou N):\nE-Electronico\nN-Nao-Electronico'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `CategoriaMaterial`
--

INSERT INTO `CategoriaMaterial` (`idCategoria`, `designacao`, `identiTipo`) VALUES
(1, 'Apagador', 'a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Compartimento`
--

CREATE TABLE IF NOT EXISTS `Compartimento` (
`idCompartimento` int(11) NOT NULL,
  `designacao` varchar(45) NOT NULL,
  `piso` varchar(45) NOT NULL,
  `TipoCompartimento_idTipoCompartimento` int(11) NOT NULL,
  `Responsavel_idResponsavel` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `Compartimento`
--

INSERT INTO `Compartimento` (`idCompartimento`, `designacao`, `piso`, `TipoCompartimento_idTipoCompartimento`, `Responsavel_idResponsavel`) VALUES
(2, 'H2A1', '1', 1, 1),
(3, 'H2A1', '1', 1, 1),
(4, 'H2A1', '1', 1, 1),
(5, 'H2A1', '1', 1, 1),
(6, 'H2A1', '1', 1, 1),
(7, 'H2A1', '1', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Electronico`
--

CREATE TABLE IF NOT EXISTS `Electronico` (
`idElectronico` int(11) NOT NULL,
  `energia` double NOT NULL,
  `Material_idMaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Endereco`
--

CREATE TABLE IF NOT EXISTS `Endereco` (
`idEndereco` int(11) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Endereco`
--

INSERT INTO `Endereco` (`idEndereco`, `pais`, `cidade`, `rua`, `numero`) VALUES
(1, 'Mozambique', 'Maputo', 'Araujo', 1234);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fornecedor`
--

CREATE TABLE IF NOT EXISTS `Fornecedor` (
`idFornecedor` int(11) NOT NULL,
  `nomeFornecedor` varchar(45) NOT NULL,
  `Endereco_idEndereco` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Fornecedor`
--

INSERT INTO `Fornecedor` (`idFornecedor`, `nomeFornecedor`, `Endereco_idEndereco`) VALUES
(1, 'MozaBanco', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fornecimento`
--

CREATE TABLE IF NOT EXISTS `Fornecimento` (
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  `GrupoMaterial_idGrupoMaterial` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `dataAquisicao` date DEFAULT NULL,
  `tipoFornecimento` varchar(45) NOT NULL,
  `garantia` int(11) NOT NULL,
  `preco` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Fornecimento`
--

INSERT INTO `Fornecimento` (`Fornecedor_idFornecedor`, `GrupoMaterial_idGrupoMaterial`, `quantidade`, `dataAquisicao`, `tipoFornecimento`, `garantia`, `preco`) VALUES
(1, 1, 12, '2014-10-06', 'ssaas', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `GrupoMaterial`
--

CREATE TABLE IF NOT EXISTS `GrupoMaterial` (
`idGrupoMaterial` int(11) NOT NULL,
  `tempo_vida` int(11) NOT NULL,
  `CategoriaMaterial_idCategoria` int(11) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `cor` varchar(10) NOT NULL,
  `altura` double NOT NULL,
  `comprimento` double NOT NULL,
  `profundidade` double NOT NULL,
  `peso` double NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `GrupoMaterial`
--

INSERT INTO `GrupoMaterial` (`idGrupoMaterial`, `tempo_vida`, `CategoriaMaterial_idCategoria`, `modelo`, `cor`, `altura`, `comprimento`, `profundidade`, `peso`) VALUES
(1, 1, 1, 'Maa', 'Branco', 12, 12, 12, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Material`
--

CREATE TABLE IF NOT EXISTS `Material` (
`idMaterial` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  `Compartimento_idCompartimento` int(11) DEFAULT NULL,
  `GrupoMaterial_idGrupoMaterial` int(11) NOT NULL,
  `estadoChegada` char(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19029 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `NaoElectronico`
--

CREATE TABLE IF NOT EXISTS `NaoElectronico` (
`idNaoElectronico` int(11) NOT NULL,
  `atributo1` varchar(45) NOT NULL,
  `Material_idMaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Responsavel`
--

CREATE TABLE IF NOT EXISTS `Responsavel` (
`idResponsavel` int(11) NOT NULL,
  `apelido` varchar(45) NOT NULL,
  `outrosNomes` varchar(45) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TipoCompartimento`
--

CREATE TABLE IF NOT EXISTS `TipoCompartimento` (
`idTipoCompartimento` int(11) NOT NULL,
  `designacao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Capacidade`
--
ALTER TABLE `Capacidade`
 ADD PRIMARY KEY (`Compartimento_idCompartimento`,`CategoriaMaterial_idCategoria`), ADD KEY `fk_Compartimento_has_CategoriaMaterial_Compartimento1` (`Compartimento_idCompartimento`), ADD KEY `fk_Compartimento_has_CategoriaMaterial_CategoriaMaterial1` (`CategoriaMaterial_idCategoria`);

--
-- Indexes for table `Cargo`
--
ALTER TABLE `Cargo`
 ADD PRIMARY KEY (`idCargo`);

--
-- Indexes for table `CategoriaMaterial`
--
ALTER TABLE `CategoriaMaterial`
 ADD PRIMARY KEY (`idCategoria`);

--
-- Indexes for table `Compartimento`
--
ALTER TABLE `Compartimento`
 ADD PRIMARY KEY (`idCompartimento`), ADD KEY `fk_Compartimento_TipoCompartimento1` (`TipoCompartimento_idTipoCompartimento`), ADD KEY `fk_Compartimento_Responsavel1` (`Responsavel_idResponsavel`);

--
-- Indexes for table `Electronico`
--
ALTER TABLE `Electronico`
 ADD PRIMARY KEY (`idElectronico`), ADD KEY `fk_Electronico_Material1` (`Material_idMaterial`);

--
-- Indexes for table `Endereco`
--
ALTER TABLE `Endereco`
 ADD PRIMARY KEY (`idEndereco`);

--
-- Indexes for table `Fornecedor`
--
ALTER TABLE `Fornecedor`
 ADD PRIMARY KEY (`idFornecedor`), ADD KEY `fk_Fornecedor_Endereco1` (`Endereco_idEndereco`);

--
-- Indexes for table `Fornecimento`
--
ALTER TABLE `Fornecimento`
 ADD PRIMARY KEY (`Fornecedor_idFornecedor`,`GrupoMaterial_idGrupoMaterial`), ADD KEY `fk_Fornecedor_has_GrupoMaterial_Fornecedor1` (`Fornecedor_idFornecedor`), ADD KEY `fk_Fornecedor_has_GrupoMaterial_GrupoMaterial1` (`GrupoMaterial_idGrupoMaterial`), ADD KEY `Fornecedor_idFornecedor` (`Fornecedor_idFornecedor`,`GrupoMaterial_idGrupoMaterial`);

--
-- Indexes for table `GrupoMaterial`
--
ALTER TABLE `GrupoMaterial`
 ADD PRIMARY KEY (`idGrupoMaterial`), ADD KEY `fk_GrupoMaterial_CategoriaMaterial1` (`CategoriaMaterial_idCategoria`);

--
-- Indexes for table `Material`
--
ALTER TABLE `Material`
 ADD PRIMARY KEY (`idMaterial`), ADD KEY `fk_Material_Compartimento1` (`Compartimento_idCompartimento`), ADD KEY `fk_Material_GrupoMaterial1` (`GrupoMaterial_idGrupoMaterial`);

--
-- Indexes for table `NaoElectronico`
--
ALTER TABLE `NaoElectronico`
 ADD PRIMARY KEY (`idNaoElectronico`), ADD KEY `fk_NaoElectronico_Material1` (`Material_idMaterial`);

--
-- Indexes for table `Responsavel`
--
ALTER TABLE `Responsavel`
 ADD PRIMARY KEY (`idResponsavel`), ADD KEY `fk_Responsavel_Cargo1` (`Cargo_idCargo`);

--
-- Indexes for table `TipoCompartimento`
--
ALTER TABLE `TipoCompartimento`
 ADD PRIMARY KEY (`idTipoCompartimento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cargo`
--
ALTER TABLE `Cargo`
MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `CategoriaMaterial`
--
ALTER TABLE `CategoriaMaterial`
MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Compartimento`
--
ALTER TABLE `Compartimento`
MODIFY `idCompartimento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Electronico`
--
ALTER TABLE `Electronico`
MODIFY `idElectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Endereco`
--
ALTER TABLE `Endereco`
MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Fornecedor`
--
ALTER TABLE `Fornecedor`
MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GrupoMaterial`
--
ALTER TABLE `GrupoMaterial`
MODIFY `idGrupoMaterial` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Material`
--
ALTER TABLE `Material`
MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19029;
--
-- AUTO_INCREMENT for table `NaoElectronico`
--
ALTER TABLE `NaoElectronico`
MODIFY `idNaoElectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Responsavel`
--
ALTER TABLE `Responsavel`
MODIFY `idResponsavel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TipoCompartimento`
--
ALTER TABLE `TipoCompartimento`
MODIFY `idTipoCompartimento` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
