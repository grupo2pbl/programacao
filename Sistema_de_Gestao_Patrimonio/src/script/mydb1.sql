-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23-Out-2014 às 20:15
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizaResponsavel`(IN `newApelido` VARCHAR(45), IN `NoutrosNomes` VARCHAR(45), IN `id` INT)
    NO SQL
update Responsavel set apelido= newApelido, outrosNomes=NoutrosNomes  where idResponsavel=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addCapacidade`(IN `idCategoria` INT, IN `idCompartimento` INT, IN `capacidade1` INT)
    NO SQL
while capacidade1 > 0 and capacidade1 < 71 do
Insert into Capacidade(CategoriaMaterial_idCategoria,Compartimento_idCompartimento,capacidade) values(idCategoria,idCompartimento,capacidade1);
end while$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCargo`(IN `Designaccao` VARCHAR(45))
    NO SQL
insert into cargo (designacao) values (Designaccao)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCategoriaMaterial`(IN `Designaccao` VARCHAR(45), IN `IdT` CHAR)
    NO SQL
Insert into CategoriaMaterial (designacao,identiTipo)values (Designaccao,IdT)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCompartimento`(IN `Designaccao` VARCHAR(45), IN `idTipoCompartimento` INT, IN `descriccao` VARCHAR(45))
    NO SQL
Insert into Compartimento(designacao,tipoCompartimento_idTipoCompartimento,descricao) values (Designaccao,idTipoCompartimento,descriccao)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCompartimentoResponsavel`(IN `Compartimento_ID` INT, IN `Reaponsavel_ID` INT, IN `dataInicio` DATE, IN `dataFim` DATE)
    NO SQL
INSERT INTO CompartimentoResponsavel(id,idCompartimento,idResponsavel,dataInicio,dataFim) VALUES(id,Compartimento_ID,Reaponsavel_ID,dataInicio,dataFim)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEndereco`(IN `Ppais` VARCHAR(45), IN `Ccidade` VARCHAR(45), IN `Nnumero` INT, IN `Rrua` INT)
    NO SQL
Insert into Endereco (pais,cidade,rua,numero) values(Ppais,Ccidade,Rrua,Nnumero)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFornecedor`(IN `NnomFornecedor` VARCHAR(45), IN `id_Endereco` INT, IN `mail` VARCHAR(45), IN `telef` INT)
    NO SQL
Insert into Fornecedor(nomeFornecedor,Endereco_idEndereco,email,tell) values (NnomFornecedor,id_Endereco,mail,telef)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFornecimento`(IN `idFornecedor` INT, IN `idGrupoMaterial` INT, IN `Qquantidade` INT, IN `TtipoFornecimento` VARCHAR(25), IN `Ggarantia` INT, IN `Ppreco` DOUBLE, IN `DdataAquisicao` DATE)
    NO SQL
if quant>0 and pre>0 then
INSERT INTO `mydb1`.`fornecimento` (`idFornecimento`, `Fornecedor_idFornecedor`, `GrupoMaterial_idGrupoMaterial`, `quantidade`, `dataAquisicao`, `tipoFornecimento`, `garantia`, `preco`) VALUES (NULL, idFornecedor,idGrupoMaterial,Qquantidade ,DdataAquisicao, TtipoFornecimento,Ggarantia, Ppreco); 
end if$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGrupoMaterial`(IN `Ttempo_Vida` INT, IN `idCategoriaMaterial` INT, IN `Mmodelo` VARCHAR(45), IN `Ccor` VARCHAR(45), IN `Ccmprimento` DOUBLE, IN `Aaltura` DOUBLE, IN `Pprofundidade` DOUBLE, IN `Ppeso` DOUBLE)
    NO SQL
Insert into GrupoMaterial(tempo_vida, categoriaMaterial_idCategoria,modelo,cor,comprimento,altura, profundidade, peso) values (Ttempo_Vida,idCategoriaMaterial,Mmodelo,Ccor,Ccmprimento,Aaltura,Pprofundidade,Ppeso)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddResponsavel`(IN `Aapelido` VARCHAR(15), IN `outrosNoms` VARCHAR(45), IN `id` INT)
    NO SQL
Insert into Responsavel(apelido,outrosNomes,Cargo_idCargo) values (Aapelido,outrosNoms,id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTipoCompartimento`(IN `id` INT, IN `Ddesignacao` VARCHAR(45))
    NO SQL
Insert into TipoCompartimento(idTipoCompartimento,designacao) values (id,Ddesignacao)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `geraMaterial`(IN `idGrupoMaterial` INT, IN `quantidade` INT)
    NO SQL
WHILE quantidade > 0 DO

	INSERT INTO `mydb1`.`Material` (		`GrupoMaterial_idGrupoMaterial`,`Compartimento_idCompartimento`) VALUES (idGrupoMaterial,0);
	SET quantidade = quantidade - 1;
END WHILE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaCapacidade`()
    NO SQL
select CategoriaMaterial_idCategoria,Compartimento_idCompartimento,capacidade from capacidade$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaCargo`(IN `idCargo1` INT)
    NO SQL
select idCargo,designacao from cargo where idCargo=idCargo1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaCategoriaMaterial`()
    NO SQL
select idCategoria, designacao,identiTipo from categoriamaterial$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaCompartimento`()
    NO SQL
Select idCompartimento, designacao, piso, TipoCompartimento_idTipoCompartimento, descricao from Compartimento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaCompartimentoResponsavel`()
    NO SQL
SELECT id,idCompartimento,idResponsavel,dataInicio,dataFim FROM CompartimentoResponsavel$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaEndereco`()
    NO SQL
SELECT idEndereco,pais,cidade,numero,rua FROM Endereco$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaFornecedor`()
    NO SQL
Select idFornecedor, nomeFornecedor,Endereco_idEndereco,email,tell from Fornecedor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaFornecimento`()
    NO SQL
select Fornecedor_idFornecedor,GrupoMaterial_idGrupoMaterial,quantidade,dataAquisicao,garantia,preco,TipoFornecimento from
fornecimento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaGrupoMaterial`()
    NO SQL
Select idGrupoMaterial,tempo_vida, modelo,cor,altura,comprimento,profundidade,peso,CategoriaMaterial_idCategoria from GrupoMaterial$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaMaterial`()
    NO SQL
Select idMaterial,estado,Compartimento_idCompartimento,GrupoMaterial_idGrupoMaterial,estadoChegada from material$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaPais`()
    NO SQL
select paisId, paisNome from pais$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaResponsavel`()
    NO SQL
Select idResponsavel,apelido,outrosNomes,cargo_idCargo from Responsavel$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaTipoCompartimento`()
    NO SQL
select idTipoCompartimento,designacao from tipoCompartimento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraCapacidade`(IN `idCategoriaMaterial` INT, IN `idCompartimento` INT)
    NO SQL
select CategoriaMaterial_idCategoria,Compartimento_idCompartimento,capacidade from capacidade where (CategoriaMaterial_idCategoria=idCategoriaMaterial and Compartimento_idCompartimento=idCompartimento)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procuraCargo`(IN `idCcargo` INT)
    NO SQL
SELECT *FROM Cargo WHERE idCargo = idCcargo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraCategoriaMaterial`(IN `idCcategoria` INT)
    NO SQL
SELECT idCategoria,designacao,identiTipo FROM CategoriaMaterial WHERE idCategoria = idCcategoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraCompartimentoID`(IN `idCcompartimento` INT)
    NO SQL
Select idCompartimento, designacao, piso, TipoCompartimento_idTipoCompartimento, descricao from Compartimento where idCompartimento=idCcompartimento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraEndereco`(IN `idEendereco` INT)
    NO SQL
SELECT idEndereco,pais,cidade,numero,rua FROM Endereco WHERE idEndereco = idEendereco$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraFornecedor`(IN `idFfornecedor` INT)
    NO SQL
SELECT idFornecedor,nomeFornecedor,Endereco_idEndereco,email,tell FROM Fornecedor WHERE idFornecedor = idFfornecedor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraGrupoMaterial`(IN `idGrupoMateriall` INT)
    NO SQL
SELECT idGrupoMaterial,tempo_vida, modelo,cor,altura,comprimento,profundidade,peso,CategoriaMaterial_idCategoria  FROM grupomaterial WHERE idGrupoMaterial = idGrupoMateriall$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraMaterial`(IN `idMateriall` INT)
    NO SQL
SELECT idMaterial ,GrupoMaterial_idGrupoMaterial,Compartimento_idCompartimento,estadoChegada  from material WHERE idMaterial = idMateriall$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraPais`(IN `id` INT)
    NO SQL
SELECT paisId, paisNome FROM pais WHERE paisId = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraResponsavel`(IN `idResponsavell` INT)
    NO SQL
SELECT idResponsavel,apelido,outrosNomes,Cargo_idCargo FROM responsavel WHERE idResponsavel = idResponsavell$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraTipoCompartimento`(IN `idTipoCcompartimento` INT)
    NO SQL
SELECT idTipoCompartimento, designacao FROM TipoCompartimento WHERE idTipoCompartimento = idTipoCcompartimento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraUltimoEndereco`()
    NO SQL
SELECT idEndereco,pais,cidade,rua,numero FROM Endereco WHERE idEndereco = (SELECT MAX(idEndereco) FROM Endereco)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraUltimoFornecimento`()
    NO SQL
SELECT Fornecedor_idFornecedor,GrupoMaterial_idGrupoMaterial, quantidade, dataAquisicao ,garantia, preco FROM Fornecimento WHERE idFornecimento = (SELECT MAX(idFornecimento) FROM Fornecimento)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraUltimoGrupoMaterial`()
    NO SQL
select idGrupoMaterial,tempo_vida, modelo,cor,altura,comprimento,profundidade,peso,CategoriaMaterial_idCategoria from grupomaterial where idGrupoMaterial = (select MAX(idGrupoMaterial) FROM grupomaterial)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcuraUltmoCompartimento`()
    NO SQL
select idCompartimento, designacao, piso, TipoCompartimento_idTipoCompartimento, descricao from compartimento WHERE idCompartimento = (SELECT MAX(idCompartimento) FROM Compartimento)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `capacidade`
--

CREATE TABLE IF NOT EXISTS `capacidade` (
  `Compartimento_idCompartimento` int(11) NOT NULL,
  `CategoriaMaterial_idCategoria` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`Compartimento_idCompartimento`,`CategoriaMaterial_idCategoria`),
  KEY `fk_Compartimento_has_CategoriaMaterial_Compartimento1` (`Compartimento_idCompartimento`),
  KEY `fk_Compartimento_has_CategoriaMaterial_CategoriaMaterial1` (`CategoriaMaterial_idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `capacidade`
--

INSERT INTO `capacidade` (`Compartimento_idCompartimento`, `CategoriaMaterial_idCategoria`, `capacidade`) VALUES
(1, 1, 10),
(2, 1, 10),
(4, 4, 7),
(6, 2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idCargo`, `designacao`) VALUES
(2, 'Docente'),
(3, 'Copeiro'),
(4, 'Dancarino'),
(5, 'Guarda'),
(6, 'BABABA'),
(7, 'cossador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriamaterial`
--

CREATE TABLE IF NOT EXISTS `categoriamaterial` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `identiTipo` char(1) NOT NULL COMMENT 'Identifica o tipo do materia, pode assumir duas Caracteres(E ou N):\nE-Electronico\nN-Nao-Electronico',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `categoriamaterial`
--

INSERT INTO `categoriamaterial` (`idCategoria`, `designacao`, `identiTipo`) VALUES
(13, 'Cadeira', 'N'),
(14, 'Mesa', 'E'),
(15, 'Tomada', 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compartimento`
--

CREATE TABLE IF NOT EXISTS `compartimento` (
  `idCompartimento` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `TipoCompartimento_idTipoCompartimento` int(11) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`idCompartimento`),
  KEY `fk_Compartimento_TipoCompartimento1` (`TipoCompartimento_idTipoCompartimento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `compartimento`
--

INSERT INTO `compartimento` (`idCompartimento`, `designacao`, `piso`, `TipoCompartimento_idTipoCompartimento`, `descricao`) VALUES
(1, 'frff', NULL, 3, 'cadeira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compartimentoresponsavel`
--

CREATE TABLE IF NOT EXISTS `compartimentoresponsavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCompartimento` int(11) NOT NULL,
  `idResponsavel` int(11) NOT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `compartimentoresponsavel`
--

INSERT INTO `compartimentoresponsavel` (`id`, `idCompartimento`, `idResponsavel`, `dataInicio`, `dataFim`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 1, NULL, NULL),
(3, 1, 1, '2014-09-19', NULL),
(4, 1, 1, '2014-09-19', NULL),
(5, 1, 1, '2013-10-10', NULL),
(6, 1, 32, '2014-09-08', '2014-07-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `electronico`
--

CREATE TABLE IF NOT EXISTS `electronico` (
  `idElectronico` int(11) NOT NULL AUTO_INCREMENT,
  `energia` double NOT NULL,
  `Material_idMaterial` int(11) NOT NULL,
  PRIMARY KEY (`idElectronico`),
  KEY `fk_Electronico_Material1` (`Material_idMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `pais`, `cidade`, `rua`, `numero`) VALUES
(1, '165', 'Item 4', 'das Flores', 1510),
(2, '165', 'Item 1', 'ssss', 111111),
(3, '3', 'Item 3', 'da Flores', 123),
(4, '0', 'Polonia', '3', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeFornecedor` varchar(45) NOT NULL,
  `Endereco_idEndereco` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tell` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `fk_Fornecedor_Endereco1` (`Endereco_idEndereco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idFornecedor`, `nomeFornecedor`, `Endereco_idEndereco`, `email`, `tell`) VALUES
(3, 'Beula Producoes', 19, NULL, NULL),
(4, 'Joao', 20, NULL, NULL),
(5, 'mOZAbANCO', 21, NULL, NULL),
(6, 'Elton Tomas Laice', 22, NULL, NULL),
(7, 'MOBILIA MAMAD', 1, NULL, NULL),
(8, 'sssss', 2, 'aasassas@sasa', '12121212'),
(9, 'Junta', 3, 'elton@gmail.com', '824477993'),
(10, 'Beula', 2, 'juliaBeula@gamil.com', '820000001');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecimento`
--

CREATE TABLE IF NOT EXISTS `fornecimento` (
  `idFornecimento` int(11) NOT NULL AUTO_INCREMENT,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  `GrupoMaterial_idGrupoMaterial` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `dataAquisicao` date DEFAULT NULL,
  `tipoFornecimento` varchar(45) NOT NULL,
  `garantia` int(11) NOT NULL,
  `preco` double NOT NULL,
  PRIMARY KEY (`idFornecimento`),
  KEY `fk_Fornecedor_has_GrupoMaterial_Fornecedor1` (`Fornecedor_idFornecedor`),
  KEY `fk_Fornecedor_has_GrupoMaterial_GrupoMaterial1` (`GrupoMaterial_idGrupoMaterial`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11513 ;

--
-- Extraindo dados da tabela `fornecimento`
--

INSERT INTO `fornecimento` (`idFornecimento`, `Fornecedor_idFornecedor`, `GrupoMaterial_idGrupoMaterial`, `quantidade`, `dataAquisicao`, `tipoFornecimento`, `garantia`, `preco`) VALUES
(11512, 1, 1, 2, NULL, 'ddddddddd', 2, 2345);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupomaterial`
--

CREATE TABLE IF NOT EXISTS `grupomaterial` (
  `idGrupoMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `tempo_vida` int(11) NOT NULL,
  `CategoriaMaterial_idCategoria` int(11) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `cor` varchar(10) NOT NULL,
  `altura` double NOT NULL,
  `comprimento` double NOT NULL,
  `profundidade` double NOT NULL,
  `peso` double NOT NULL,
  PRIMARY KEY (`idGrupoMaterial`),
  KEY `fk_GrupoMaterial_CategoriaMaterial1` (`CategoriaMaterial_idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `grupomaterial`
--

INSERT INTO `grupomaterial` (`idGrupoMaterial`, `tempo_vida`, `CategoriaMaterial_idCategoria`, `modelo`, `cor`, `altura`, `comprimento`, `profundidade`, `peso`) VALUES
(1, 12, 1, 'dddd', 'ffffff', 12, 21, 21, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `estado` char(1) NOT NULL DEFAULT 'B',
  `Compartimento_idCompartimento` int(11) DEFAULT NULL,
  `GrupoMaterial_idGrupoMaterial` int(11) NOT NULL,
  `estadoChegada` char(1) DEFAULT 'B',
  PRIMARY KEY (`idMaterial`),
  KEY `fk_Material_Compartimento1` (`Compartimento_idCompartimento`),
  KEY `fk_Material_GrupoMaterial1` (`GrupoMaterial_idGrupoMaterial`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Extraindo dados da tabela `material`
--

INSERT INTO `material` (`idMaterial`, `estado`, `Compartimento_idCompartimento`, `GrupoMaterial_idGrupoMaterial`, `estadoChegada`) VALUES
(51, 'B', 0, 1, 'B'),
(52, 'B', 0, 2, 'B'),
(53, 'B', 0, 2, 'B');

-- --------------------------------------------------------

--
-- Estrutura da tabela `naoelectronico`
--

CREATE TABLE IF NOT EXISTS `naoelectronico` (
  `idNaoElectronico` int(11) NOT NULL AUTO_INCREMENT,
  `atributo1` varchar(45) NOT NULL,
  `Material_idMaterial` int(11) NOT NULL,
  PRIMARY KEY (`idNaoElectronico`),
  KEY `fk_NaoElectronico_Material1` (`Material_idMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `paisId` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `paisNome` varchar(50) NOT NULL,
  `paisName` varchar(50) NOT NULL,
  PRIMARY KEY (`paisId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=253 ;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`paisId`, `paisNome`, `paisName`) VALUES
(1, 'AFEGANISTÃO', 'AFGHANISTAN'),
(2, 'ACROTÍRI E DECELIA', 'AKROTIRI E DEKÉLIA'),
(3, 'ÁFRICA DO SUL', 'SOUTH AFRICA'),
(4, 'ALBÂNIA', 'ALBANIA'),
(5, 'ALEMANHA', 'GERMANY'),
(6, 'AMERICAN SAMOA', 'AMERICAN SAMOA'),
(7, 'ANDORRA', 'ANDORRA'),
(8, 'ANGOLA', 'ANGOLA'),
(9, 'ANGUILLA', 'ANGUILLA'),
(10, 'ANTÍGUA E BARBUDA', 'ANTIGUA AND BARBUDA'),
(11, 'ANTILHAS NEERLANDESAS', 'NETHERLANDS ANTILLES'),
(12, 'ARÁBIA SAUDITA', 'SAUDI ARABIA'),
(13, 'ARGÉLIA', 'ALGERIA'),
(14, 'ARGENTINA', 'ARGENTINA'),
(15, 'ARMÉNIA', 'ARMENIA'),
(16, 'ARUBA', 'ARUBA'),
(17, 'AUSTRÁLIA', 'AUSTRALIA'),
(18, 'ÁUSTRIA', 'AUSTRIA'),
(19, 'AZERBAIJÃO', 'AZERBAIJAN'),
(20, 'BAHAMAS', 'BAHAMAS, THE'),
(21, 'BANGLADECHE', 'BANGLADESH'),
(22, 'BARBADOS', 'BARBADOS'),
(23, 'BARÉM', 'BAHRAIN'),
(24, 'BASSAS DA ÍNDIA', 'BASSAS DA INDIA'),
(25, 'BÉLGICA', 'BELGIUM'),
(26, 'BELIZE', 'BELIZE'),
(27, 'BENIM', 'BENIN'),
(28, 'BERMUDAS', 'BERMUDA'),
(29, 'BIELORRÚSSIA', 'BELARUS'),
(30, 'BOLÍVIA', 'BOLIVIA'),
(31, 'BÓSNIA E HERZEGOVINA', 'BOSNIA AND HERZEGOVINA'),
(32, 'BOTSUANA', 'BOTSWANA'),
(33, 'BRASIL', 'BRAZIL'),
(34, 'BRUNEI DARUSSALAM', 'BRUNEI DARUSSALAM'),
(35, 'BULGÁRIA', 'BULGARIA'),
(36, 'BURQUINA FASO', 'BURKINA FASO'),
(37, 'BURUNDI', 'BURUNDI'),
(38, 'BUTÃO', 'BHUTAN'),
(39, 'CABO VERDE', 'CAPE VERDE'),
(40, 'CAMARÕES', 'CAMEROON'),
(41, 'CAMBOJA', 'CAMBODIA'),
(42, 'CANADÁ', 'CANADA'),
(43, 'CATAR', 'QATAR'),
(44, 'CAZAQUISTÃO', 'KAZAKHSTAN'),
(45, 'CENTRO-AFRICANA REPÚBLICA', 'CENTRAL AFRICAN REPUBLIC'),
(46, 'CHADE', 'CHAD'),
(47, 'CHILE', 'CHILE'),
(48, 'CHINA', 'CHINA'),
(49, 'CHIPRE', 'CYPRUS'),
(50, 'COLÔMBIA', 'COLOMBIA'),
(51, 'COMORES', 'COMOROS'),
(52, 'CONGO', 'CONGO'),
(53, 'CONGO REPÚBLICA DEMOCRÁTICA', 'CONGO DEMOCRATIC REPUBLIC'),
(54, 'COREIA DO NORTE', 'KOREA NORTH'),
(55, 'COREIA DO SUL', 'KOREA SOUTH'),
(56, 'COSTA DO MARFIM', 'IVORY COAST'),
(57, 'COSTA RICA', 'COSTA RICA'),
(58, 'CROÁCIA', 'CROATIA'),
(59, 'CUBA', 'CUBA'),
(60, 'DINAMARCA', 'DENMARK'),
(61, 'DOMÍNICA', 'DOMINICA'),
(62, 'EGIPTO', 'EGYPT'),
(63, 'EMIRADOS ÁRABES UNIDOS', 'UNITED ARAB EMIRATES'),
(64, 'EQUADOR', 'ECUADOR'),
(65, 'ERITREIA', 'ERITREA'),
(66, 'ESLOVÁQUIA', 'SLOVAKIA'),
(67, 'ESLOVÉNIA', 'SLOVENIA'),
(68, 'ESPANHA', 'SPAIN'),
(69, 'ESTADOS UNIDOS', 'UNITED STATES'),
(70, 'ESTÓNIA', 'ESTONIA'),
(71, 'ETIÓPIA', 'ETHIOPIA'),
(72, 'FAIXA DE GAZA', 'GAZA STRIP'),
(73, 'FIJI', 'FIJI'),
(74, 'FILIPINAS', 'PHILIPPINES'),
(75, 'FINLÂNDIA', 'FINLAND'),
(76, 'FRANÇA', 'FRANCE'),
(77, 'GABÃO', 'GABON'),
(78, 'GÂMBIA', 'GAMBIA'),
(79, 'GANA', 'GHANA'),
(80, 'GEÓRGIA', 'GEORGIA'),
(81, 'GIBRALTAR', 'GIBRALTAR'),
(82, 'GRANADA', 'GRENADA'),
(83, 'GRÉCIA', 'GREECE'),
(84, 'GRONELÂNDIA', 'GREENLAND'),
(85, 'GUADALUPE', 'GUADELOUPE'),
(86, 'GUAM', 'GUAM'),
(87, 'GUATEMALA', 'GUATEMALA'),
(88, 'GUERNSEY', 'GUERNSEY'),
(89, 'GUIANA', 'GUYANA'),
(90, 'GUIANA FRANCESA', 'FRENCH GUIANA'),
(91, 'GUINÉ', 'GUINEA'),
(92, 'GUINÉ EQUATORIAL', 'EQUATORIAL GUINEA'),
(93, 'GUINÉ-BISSAU', 'GUINEA-BISSAU'),
(94, 'HAITI', 'HAITI'),
(95, 'HONDURAS', 'HONDURAS'),
(96, 'HONG KONG', 'HONG KONG'),
(97, 'HUNGRIA', 'HUNGARY'),
(98, 'IÉMEN', 'YEMEN'),
(99, 'ILHA BOUVET', 'BOUVET ISLAND'),
(100, 'ILHA CHRISTMAS', 'CHRISTMAS ISLAND'),
(101, 'ILHA DE CLIPPERTON', 'CLIPPERTON ISLAND'),
(102, 'ILHA DE JOÃO DA NOVA', 'JUAN DE NOVA ISLAND'),
(103, 'ILHA DE MAN', 'ISLE OF MAN'),
(104, 'ILHA DE NAVASSA', 'NAVASSA ISLAND'),
(105, 'ILHA EUROPA', 'EUROPA ISLAND'),
(106, 'ILHA NORFOLK', 'NORFOLK ISLAND'),
(107, 'ILHA TROMELIN', 'TROMELIN ISLAND'),
(108, 'ILHAS ASHMORE E CARTIER', 'ASHMORE AND CARTIER ISLANDS'),
(109, 'ILHAS CAIMAN', 'CAYMAN ISLANDS'),
(110, 'ILHAS COCOS (KEELING)', 'COCOS (KEELING) ISLANDS'),
(111, 'ILHAS COOK', 'COOK ISLANDS'),
(112, 'ILHAS DO MAR DE CORAL', 'CORAL SEA ISLANDS'),
(113, 'ILHAS FALKLANDS (ILHAS MALVINAS)', 'FALKLAND ISLANDS (ISLAS MALVINAS)'),
(114, 'ILHAS FEROE', 'FAROE ISLANDS'),
(115, 'ILHAS GEÓRGIA DO SUL E SANDWICH DO SUL', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),
(116, 'ILHAS MARIANAS DO NORTE', 'NORTHERN MARIANA ISLANDS'),
(117, 'ILHAS MARSHALL', 'MARSHALL ISLANDS'),
(118, 'ILHAS PARACEL', 'PARACEL ISLANDS'),
(119, 'ILHAS PITCAIRN', 'PITCAIRN ISLANDS'),
(120, 'ILHAS SALOMÃO', 'SOLOMON ISLANDS'),
(121, 'ILHAS SPRATLY', 'SPRATLY ISLANDS'),
(122, 'ILHAS VIRGENS AMERICANAS', 'UNITED STATES VIRGIN ISLANDS'),
(123, 'ILHAS VIRGENS BRITÂNICAS', 'BRITISH VIRGIN ISLANDS'),
(124, 'ÍNDIA', 'INDIA'),
(125, 'INDONÉSIA', 'INDONESIA'),
(126, 'IRÃO', 'IRAN'),
(127, 'IRAQUE', 'IRAQ'),
(128, 'IRLANDA', 'IRELAND'),
(129, 'ISLÂNDIA', 'ICELAND'),
(130, 'ISRAEL', 'ISRAEL'),
(131, 'ITÁLIA', 'ITALY'),
(132, 'JAMAICA', 'JAMAICA'),
(133, 'JAN MAYEN', 'JAN MAYEN'),
(134, 'JAPÃO', 'JAPAN'),
(135, 'JERSEY', 'JERSEY'),
(136, 'JIBUTI', 'DJIBOUTI'),
(137, 'JORDÂNIA', 'JORDAN'),
(138, 'KIRIBATI', 'KIRIBATI'),
(139, 'KOWEIT', 'KUWAIT'),
(140, 'LAOS', 'LAOS'),
(141, 'LESOTO', 'LESOTHO'),
(142, 'LETÓNIA', 'LATVIA'),
(143, 'LÍBANO', 'LEBANON'),
(144, 'LIBÉRIA', 'LIBERIA'),
(145, 'LÍBIA', 'LIBYAN ARAB JAMAHIRIYA'),
(146, 'LISTENSTAINE', 'LIECHTENSTEIN'),
(147, 'LITUÂNIA', 'LITHUANIA'),
(148, 'LUXEMBURGO', 'LUXEMBOURG'),
(149, 'MACAU', 'MACAO'),
(150, 'MACEDÓNIA', 'MACEDONIA'),
(151, 'MADAGÁSCAR', 'MADAGASCAR'),
(152, 'MALÁSIA', 'MALAYSIA'),
(153, 'MALAVI', 'MALAWI'),
(154, 'MALDIVAS', 'MALDIVES'),
(155, 'MALI', 'MALI'),
(156, 'MALTA', 'MALTA'),
(157, 'MARROCOS', 'MOROCCO'),
(158, 'MARTINICA', 'MARTINIQUE'),
(159, 'MAURÍCIA', 'MAURITIUS'),
(160, 'MAURITÂNIA', 'MAURITANIA'),
(161, 'MAYOTTE', 'MAYOTTE'),
(162, 'MÉXICO', 'MEXICO'),
(163, 'MIANMAR', 'MYANMAR BURMA'),
(164, 'MICRONÉSIA', 'MICRONESIA'),
(165, 'MOÇAMBIQUE', 'MOZAMBIQUE'),
(166, 'MOLDÁVIA', 'MOLDOVA'),
(167, 'MÓNACO', 'MONACO'),
(168, 'MONGÓLIA', 'MONGOLIA'),
(169, 'MONTENEGRO', 'MONTENEGRO'),
(170, 'MONTSERRAT', 'MONTSERRAT'),
(171, 'NAMÍBIA', 'NAMIBIA'),
(172, 'NAURU', 'NAURU'),
(173, 'NEPAL', 'NEPAL'),
(174, 'NICARÁGUA', 'NICARAGUA'),
(175, 'NÍGER', 'NIGER'),
(176, 'NIGÉRIA', 'NIGERIA'),
(177, 'NIUE', 'NIUE'),
(178, 'NORUEGA', 'NORWAY'),
(179, 'NOVA CALEDÓNIA', 'NEW CALEDONIA'),
(180, 'NOVA ZELÂNDIA', 'NEW ZEALAND'),
(181, 'OMÃ', 'OMAN'),
(182, 'PAÍSES BAIXOS', 'NETHERLANDS'),
(183, 'PALAU', 'PALAU'),
(184, 'PALESTINA', 'PALESTINE'),
(185, 'PANAMÁ', 'PANAMA'),
(186, 'PAPUÁSIA-NOVA GUINÉ', 'PAPUA NEW GUINEA'),
(187, 'PAQUISTÃO', 'PAKISTAN'),
(188, 'PARAGUAI', 'PARAGUAY'),
(189, 'PERU', 'PERU'),
(190, 'POLINÉSIA FRANCESA', 'FRENCH POLYNESIA'),
(191, 'POLÓNIA', 'POLAND'),
(192, 'PORTO RICO', 'PUERTO RICO'),
(193, 'PORTUGAL', 'PORTUGAL'),
(194, 'QUÉNIA', 'KENYA'),
(195, 'QUIRGUIZISTÃO', 'KYRGYZSTAN'),
(196, 'REINO UNIDO', 'UNITED KINGDOM'),
(197, 'REPÚBLICA CHECA', 'CZECH REPUBLIC'),
(198, 'REPÚBLICA DOMINICANA', 'DOMINICAN REPUBLIC'),
(199, 'ROMÉNIA', 'ROMANIA'),
(200, 'RUANDA', 'RWANDA'),
(201, 'RÚSSIA', 'RUSSIAN FEDERATION'),
(202, 'SAHARA OCCIDENTAL', 'WESTERN SAHARA'),
(203, 'SALVADOR', 'EL SALVADOR'),
(204, 'SAMOA', 'SAMOA'),
(205, 'SANTA HELENA', 'SAINT HELENA'),
(206, 'SANTA LÚCIA', 'SAINT LUCIA'),
(207, 'SANTA SÉ', 'HOLY SEE'),
(208, 'SÃO CRISTÓVÃO E NEVES', 'SAINT KITTS AND NEVIS'),
(209, 'SÃO MARINO', 'SAN MARINO'),
(210, 'SÃO PEDRO E MIQUELÃO', 'SAINT PIERRE AND MIQUELON'),
(211, 'SÃO TOMÉ E PRÍNCIPE', 'SAO TOME AND PRINCIPE'),
(212, 'SÃO VICENTE E GRANADINAS', 'SAINT VINCENT AND THE GRENADINES'),
(213, 'SEICHELES', 'SEYCHELLES'),
(214, 'SENEGAL', 'SENEGAL'),
(215, 'SERRA LEOA', 'SIERRA LEONE'),
(216, 'SÉRVIA', 'SERBIA'),
(217, 'SINGAPURA', 'SINGAPORE'),
(218, 'SÍRIA', 'SYRIA'),
(219, 'SOMÁLIA', 'SOMALIA'),
(220, 'SRI LANCA', 'SRI LANKA'),
(221, 'SUAZILÂNDIA', 'SWAZILAND'),
(222, 'SUDÃO', 'SUDAN'),
(223, 'SUÉCIA', 'SWEDEN'),
(224, 'SUÍÇA', 'SWITZERLAND'),
(225, 'SURINAME', 'SURINAME'),
(226, 'SVALBARD', 'SVALBARD'),
(227, 'TAILÂNDIA', 'THAILAND'),
(228, 'TAIWAN', 'TAIWAN'),
(229, 'TAJIQUISTÃO', 'TAJIKISTAN'),
(230, 'TANZÂNIA', 'TANZANIA'),
(231, 'TERRITÓRIO BRITÂNICO DO OCEANO ÍNDICO', 'BRITISH INDIAN OCEAN TERRITORY'),
(232, 'TERRITÓRIO DAS ILHAS HEARD E MCDONALD', 'HEARD ISLAND AND MCDONALD ISLANDS'),
(233, 'TIMOR-LESTE', 'TIMOR-LESTE'),
(234, 'TOGO', 'TOGO'),
(235, 'TOKELAU', 'TOKELAU'),
(236, 'TONGA', 'TONGA'),
(237, 'TRINDADE E TOBAGO', 'TRINIDAD AND TOBAGO'),
(238, 'TUNÍSIA', 'TUNISIA'),
(239, 'TURKS E CAICOS', 'TURKS AND CAICOS ISLANDS'),
(240, 'TURQUEMENISTÃO', 'TURKMENISTAN'),
(241, 'TURQUIA', 'TURKEY'),
(242, 'TUVALU', 'TUVALU'),
(243, 'UCRÂNIA', 'UKRAINE'),
(244, 'UGANDA', 'UGANDA'),
(245, 'URUGUAI', 'URUGUAY'),
(246, 'USBEQUISTÃO', 'UZBEKISTAN'),
(247, 'VANUATU', 'VANUATU'),
(248, 'VENEZUELA', 'VENEZUELA'),
(249, 'VIETNAME', 'VIETNAM'),
(250, 'WALLIS E FUTUNA', 'WALLIS AND FUTUNA'),
(251, 'ZÂMBIA', 'ZAMBIA'),
(252, 'ZIMBABUÉ', 'ZIMBABWE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE IF NOT EXISTS `responsavel` (
  `idResponsavel` int(11) NOT NULL AUTO_INCREMENT,
  `apelido` varchar(45) NOT NULL,
  `outrosNomes` varchar(45) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  PRIMARY KEY (`idResponsavel`),
  KEY `fk_Responsavel_Cargo1` (`Cargo_idCargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `responsavel`
--

INSERT INTO `responsavel` (`idResponsavel`, `apelido`, `outrosNomes`, `Cargo_idCargo`) VALUES
(1, 'Laice', 'Elton Tomas', 1),
(2, 'Beula', 'Julia Nelma', 0),
(3, 'Macie', 'Tedy', 0),
(4, 'Muzime', 'Eunice', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocompartimento`
--

CREATE TABLE IF NOT EXISTS `tipocompartimento` (
  `idTipoCompartimento` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoCompartimento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tipocompartimento`
--

INSERT INTO `tipocompartimento` (`idTipoCompartimento`, `designacao`) VALUES
(1, 'Sala de Aula'),
(2, 'Laboratorio');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
