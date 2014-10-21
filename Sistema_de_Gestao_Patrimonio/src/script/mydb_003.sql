-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 19-Out-2014 às 06:36
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `procuraCargo`(IN `id` INT)
    NO SQL
SELECT *FROM Cargo WHERE idCargo = id$$

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `Cargo`
--

INSERT INTO `Cargo` (`idCargo`, `designacao`) VALUES
(2, 'Docente'),
(3, 'Copeiro'),
(4, 'Dancarino'),
(5, 'Guarda'),
(6, 'BABABA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CategoriaMaterial`
--

CREATE TABLE IF NOT EXISTS `CategoriaMaterial` (
`idCategoria` int(11) NOT NULL,
  `designacao` varchar(45) NOT NULL,
  `identiTipo` char(1) NOT NULL COMMENT 'Identifica o tipo do materia, pode assumir duas Caracteres(E ou N):\nE-Electronico\nN-Nao-Electronico'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `CategoriaMaterial`
--

INSERT INTO `CategoriaMaterial` (`idCategoria`, `designacao`, `identiTipo`) VALUES
(13, 'Cadeira', 'N'),
(14, 'Mesa', 'E');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `Compartimento`
--

INSERT INTO `Compartimento` (`idCompartimento`, `designacao`, `piso`, `TipoCompartimento_idTipoCompartimento`, `Responsavel_idResponsavel`) VALUES
(2, 'H2A1', '1', 1, 1),
(3, 'H2A1', '1', 1, 1),
(4, 'H2A1', '1', 1, 1),
(5, 'H2A1', '1', 1, 1),
(6, 'H2A1', '1', 1, 1),
(7, 'H2A1', '1', 1, 1),
(8, 'H2A1', '1', 1, 1),
(9, 'H2A1', '1', 1, 1);

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
  `pais` int(11) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `Endereco`
--

INSERT INTO `Endereco` (`idEndereco`, `pais`, `cidade`, `rua`, `numero`) VALUES
(15, 165, 'Item 1', 'Cabral', 1234),
(16, 165, 'Item 1', 'aaa', 1111),
(17, 165, 'Item 1', '12', 12),
(19, 165, 'Item 1', 'Palave Street', 1310),
(20, 165, 'Item 1', 'Damaso', 23423),
(21, 165, 'Item 1', 'dos Namorados', 1234);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fornecedor`
--

CREATE TABLE IF NOT EXISTS `Fornecedor` (
`idFornecedor` int(11) NOT NULL,
  `nomeFornecedor` varchar(45) NOT NULL,
  `Endereco_idEndereco` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `Fornecedor`
--

INSERT INTO `Fornecedor` (`idFornecedor`, `nomeFornecedor`, `Endereco_idEndereco`) VALUES
(3, 'Beula Producoes', 19),
(4, 'Joao', 20),
(5, 'mOZAbANCO', 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fornecimento`
--

CREATE TABLE IF NOT EXISTS `Fornecimento` (
`idFornecimento` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  `GrupoMaterial_idGrupoMaterial` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `dataAquisicao` date DEFAULT NULL,
  `tipoFornecimento` varchar(45) NOT NULL,
  `garantia` int(11) NOT NULL,
  `preco` double NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `GrupoMaterial`
--

INSERT INTO `GrupoMaterial` (`idGrupoMaterial`, `tempo_vida`, `CategoriaMaterial_idCategoria`, `modelo`, `cor`, `altura`, `comprimento`, `profundidade`, `peso`) VALUES
(23, 100, 13, '100', 'Azul', 100, 100, 100, 100),
(24, 100, 13, 'NNN', 'Azul', 100, 100, 100, 100),
(25, 100, 13, '100', 'Azul', 100, 100, 100, 100);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `Material`
--

INSERT INTO `Material` (`idMaterial`, `estado`, `Compartimento_idCompartimento`, `GrupoMaterial_idGrupoMaterial`, `estadoChegada`) VALUES
(1, 'A', 0, 1, 'A'),
(2, 'A', 0, 1, 'A'),
(3, 'A', 0, 1, 'A'),
(4, 'A', 0, 1, 'A'),
(5, 'A', 0, 1, 'A');

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
-- Estrutura da tabela `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
`paisId` tinyint(3) unsigned NOT NULL,
  `paisNome` varchar(50) NOT NULL,
  `paisName` varchar(50) NOT NULL
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
 ADD PRIMARY KEY (`idFornecimento`), ADD KEY `fk_Fornecedor_has_GrupoMaterial_Fornecedor1` (`Fornecedor_idFornecedor`), ADD KEY `fk_Fornecedor_has_GrupoMaterial_GrupoMaterial1` (`GrupoMaterial_idGrupoMaterial`);

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
-- Indexes for table `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`paisId`);

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
MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `CategoriaMaterial`
--
ALTER TABLE `CategoriaMaterial`
MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `Compartimento`
--
ALTER TABLE `Compartimento`
MODIFY `idCompartimento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Electronico`
--
ALTER TABLE `Electronico`
MODIFY `idElectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Endereco`
--
ALTER TABLE `Endereco`
MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `Fornecedor`
--
ALTER TABLE `Fornecedor`
MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Fornecimento`
--
ALTER TABLE `Fornecimento`
MODIFY `idFornecimento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GrupoMaterial`
--
ALTER TABLE `GrupoMaterial`
MODIFY `idGrupoMaterial` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Material`
--
ALTER TABLE `Material`
MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `NaoElectronico`
--
ALTER TABLE `NaoElectronico`
MODIFY `idNaoElectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
MODIFY `paisId` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=253;
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
