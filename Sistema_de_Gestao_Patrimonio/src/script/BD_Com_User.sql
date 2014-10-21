SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TipoCompartimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoCompartimento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`TipoCompartimento` (
  `idTipoCompartimento` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoCompartimento`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cargo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Responsavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Responsavel` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Responsavel` (
  `idResponsavel` INT NOT NULL AUTO_INCREMENT,
  `apelido` VARCHAR(45) NOT NULL,
  `outrosNomes` VARCHAR(45) NOT NULL,
  `Cargo_idCargo` INT NOT NULL,
  PRIMARY KEY (`idResponsavel`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Responsavel_Cargo1` ON `mydb`.`Responsavel` (`Cargo_idCargo` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Compartimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Compartimento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Compartimento` (
  `idCompartimento` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  `piso` VARCHAR(45) NOT NULL,
  `TipoCompartimento_idTipoCompartimento` INT NOT NULL,
  `Responsavel_idResponsavel` INT NOT NULL,
  PRIMARY KEY (`idCompartimento`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Compartimento_TipoCompartimento1` ON `mydb`.`Compartimento` (`TipoCompartimento_idTipoCompartimento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Compartimento_Responsavel1` ON `mydb`.`Compartimento` (`Responsavel_idResponsavel` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CategoriaMaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CategoriaMaterial` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriaMaterial` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL,
  `identiTipo` CHAR NOT NULL COMMENT 'Identifica o tipo do materia, pode assumir duas Caracteres(E ou N):\nE-Electronico' /* comment truncated */ /*N-Nao-Electronico*/,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Endereco` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `nomeFornecedor` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Fornecedor_Endereco1` ON `mydb`.`Fornecedor` (`Endereco_idEndereco` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`GrupoMaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GrupoMaterial` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`GrupoMaterial` (
  `idGrupoMaterial` INT NOT NULL AUTO_INCREMENT,
  `tempo_vida` INT NOT NULL,
  `data_aquisicao` DATE NOT NULL,
  `Fornecedor_Endereco_idEndereco` INT NOT NULL,
  `CategoriaMaterial_idCategoria` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idGrupoMaterial`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_GrupoMaterial_CategoriaMaterial1` ON `mydb`.`GrupoMaterial` (`CategoriaMaterial_idCategoria` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_GrupoMaterial_Fornecedor2_idx` ON `mydb`.`GrupoMaterial` (`Fornecedor_idFornecedor` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Material` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Material` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT,
  `estado` CHAR NOT NULL,
  `Compartimento_idCompartimento` INT NOT NULL,
  `GrupoMaterial_idGrupoMaterial` INT NOT NULL,
  `estadoChegada` CHAR NULL,
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Material_Compartimento1` ON `mydb`.`Material` (`Compartimento_idCompartimento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Material_GrupoMaterial1` ON `mydb`.`Material` (`GrupoMaterial_idGrupoMaterial` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Electronico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electronico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Electronico` (
  `idElectronico` INT NOT NULL AUTO_INCREMENT,
  `energia` DOUBLE NOT NULL,
  `Material_idMaterial` INT NOT NULL,
  PRIMARY KEY (`idElectronico`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Electronico_Material1` ON `mydb`.`Electronico` (`Material_idMaterial` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NaoElectronico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`NaoElectronico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`NaoElectronico` (
  `idNaoElectronico` INT NOT NULL AUTO_INCREMENT,
  `atributo1` VARCHAR(45) NOT NULL,
  `Material_idMaterial` INT NOT NULL,
  PRIMARY KEY (`idNaoElectronico`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_NaoElectronico_Material1` ON `mydb`.`NaoElectronico` (`Material_idMaterial` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Capacidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Capacidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Capacidade` (
  `Compartimento_idCompartimento` INT NOT NULL,
  `CategoriaMaterial_idCategoria` INT NOT NULL,
  `capacidade` INT NULL,
  PRIMARY KEY (`Compartimento_idCompartimento`, `CategoriaMaterial_idCategoria`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Compartimento_has_CategoriaMaterial_Compartimento1` ON `mydb`.`Capacidade` (`Compartimento_idCompartimento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Compartimento_has_CategoriaMaterial_CategoriaMaterial1` ON `mydb`.`Capacidade` (`CategoriaMaterial_idCategoria` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `apelido` VARCHAR(45) NOT NULL,
  `outrosNomes` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idUsuario_UNIQUE` ON `mydb`.`Usuario` (`idUsuario` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Responsavel_has_Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Responsavel_has_Usuario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Responsavel_has_Usuario` (
  `Responsavel_idResponsavel` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`Responsavel_idResponsavel`, `Usuario_idUsuario`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Responsavel_has_Usuario_Usuario1_idx` ON `mydb`.`Responsavel_has_Usuario` (`Usuario_idUsuario` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Responsavel_has_Usuario_Responsavel1_idx` ON `mydb`.`Responsavel_has_Usuario` (`Responsavel_idResponsavel` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario_has_Material` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Material` (
  `Usuario_idUsuario` INT NOT NULL,
  `Material_idMaterial` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Material_idMaterial`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Material_Material1_idx` ON `mydb`.`Usuario_has_Material` (`Material_idMaterial` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Material_Usuario1_idx` ON `mydb`.`Usuario_has_Material` (`Usuario_idUsuario` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Compartimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario_has_Compartimento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Compartimento` (
  `Usuario_idUsuario` INT NOT NULL,
  `Compartimento_idCompartimento` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Compartimento_idCompartimento`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Compartimento_Compartimento1_idx` ON `mydb`.`Usuario_has_Compartimento` (`Compartimento_idCompartimento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Compartimento_Usuario1_idx` ON `mydb`.`Usuario_has_Compartimento` (`Usuario_idUsuario` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario_has_Fornecedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Fornecedor` (
  `Usuario_idUsuario` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Fornecedor_idFornecedor`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Fornecedor_Fornecedor1_idx` ON `mydb`.`Usuario_has_Fornecedor` (`Fornecedor_idFornecedor` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Fornecedor_Usuario1_idx` ON `mydb`.`Usuario_has_Fornecedor` (`Usuario_idUsuario` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Compartimento1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario_has_Compartimento1` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Compartimento1` (
  `Usuario_idUsuario` INT NOT NULL,
  `Compartimento_idCompartimento` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Compartimento_idCompartimento`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Compartimento1_Compartimento1_idx` ON `mydb`.`Usuario_has_Compartimento1` (`Compartimento_idCompartimento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Usuario_has_Compartimento1_Usuario1_idx` ON `mydb`.`Usuario_has_Compartimento1` (`Usuario_idUsuario` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
