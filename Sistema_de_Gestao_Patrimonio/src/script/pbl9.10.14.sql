SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;


--------------------------------------------
-- Table `mydb`.`TipoCompartimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoCompartimento` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TipoCompartimento` (
  `idTipoCompartimento` INT NOT NULL AUTO_INCREMENT ,
  `designacao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idTipoCompartimento`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cargo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT ,
  `designacao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCargo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Responsavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Responsavel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Responsavel` (
  `idResponsavel` INT NOT NULL AUTO_INCREMENT ,
  `apelido` VARCHAR(45) NOT NULL ,
  `outrosNomes` VARCHAR(45) NOT NULL ,
  `Cargo_idCargo` INT NOT NULL ,
  PRIMARY KEY (`idResponsavel`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Responsavel_Cargo1` ON `mydb`.`Responsavel` (`Cargo_idCargo` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Compartimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Compartimento` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Compartimento` (
  `idCompartimento` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL ,
  `piso` VARCHAR(45) NOT NULL ,
  `TipoCompartimento_idTipoCompartimento` INT NOT NULL ,
  `Responsavel_idResponsavel` INT NOT NULL ,
  PRIMARY KEY (`idCompartimento`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Compartimento_TipoCompartimento1` ON `mydb`.`Compartimento` (`TipoCompartimento_idTipoCompartimento` ASC) ;

CREATE INDEX `fk_Compartimento_Responsavel1` ON `mydb`.`Compartimento` (`Responsavel_idResponsavel` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`CategoriaMaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CategoriaMaterial` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`CategoriaMaterial` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT ,
  `designacao` VARCHAR(45) NOT NULL ,
  `identiTipo` CHAR NOT NULL COMMENT 'Identifica o tipo do materia, pode assumir duas Caracteres(E ou N):\nE-Electronico\nN-Nao-Electronico' ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GrupoMaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GrupoMaterial` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`GrupoMaterial` (
  `idGrupoMaterial` INT NOT NULL AUTO_INCREMENT ,
  `tempo_vida` INT NOT NULL ,
  `CategoriaMaterial_idCategoria` INT NOT NULL ,
  `modelo` VARCHAR(45) NOT NULL ,
  `cor` VARCHAR(10) NOT NULL ,
  `altura` DOUBLE NOT NULL ,
  `comprimento` DOUBLE NOT NULL ,
  `profundidade` DOUBLE NOT NULL ,
  `peso` DOUBLE NOT NULL ,
  PRIMARY KEY (`idGrupoMaterial`) )
ENGINE = InnoDB;

CREATE INDEX `fk_GrupoMaterial_CategoriaMaterial1` ON `mydb`.`GrupoMaterial` (`CategoriaMaterial_idCategoria` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Material` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Material` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT ,
  `estado` CHAR NOT NULL ,
  `Compartimento_idCompartimento` INT NOT NULL ,
  `GrupoMaterial_idGrupoMaterial` INT NOT NULL ,
  `estadoChegada` CHAR NULL ,
  PRIMARY KEY (`idMaterial`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Material_Compartimento1` ON `mydb`.`Material` (`Compartimento_idCompartimento` ASC) ;

CREATE INDEX `fk_Material_GrupoMaterial1` ON `mydb`.`Material` (`GrupoMaterial_idGrupoMaterial` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Electronico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electronico` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Electronico` (
  `idElectronico` INT NOT NULL AUTO_INCREMENT ,
  `energia` DOUBLE NOT NULL ,
  `Material_idMaterial` INT NOT NULL ,
  PRIMARY KEY (`idElectronico`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Electronico_Material1` ON `mydb`.`Electronico` (`Material_idMaterial` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`NaoElectronico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`NaoElectronico` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`NaoElectronico` (
  `idNaoElectronico` INT NOT NULL AUTO_INCREMENT ,
  `atributo1` VARCHAR(45) NOT NULL ,
  `Material_idMaterial` INT NOT NULL ,
  PRIMARY KEY (`idNaoElectronico`) )
ENGINE = InnoDB;

CREATE INDEX `fk_NaoElectronico_Material1` ON `mydb`.`NaoElectronico` (`Material_idMaterial` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Endereco` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT ,
  `pais` VARCHAR(45) NOT NULL ,
  `cidade` VARCHAR(45) NOT NULL ,
  `rua` VARCHAR(45) NOT NULL ,
  `numero` INT NULL ,
  PRIMARY KEY (`idEndereco`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecedor` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT ,
  `nomeFornecedor` VARCHAR(45) NOT NULL ,
  `Endereco_idEndereco` INT NOT NULL ,
  PRIMARY KEY (`idFornecedor`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Fornecedor_Endereco1` ON `mydb`.`Fornecedor` (`Endereco_idEndereco` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Capacidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Capacidade` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Capacidade` (
  `Compartimento_idCompartimento` INT NOT NULL ,
  `CategoriaMaterial_idCategoria` INT NOT NULL ,
  `capacidade` INT NULL ,
  PRIMARY KEY (`Compartimento_idCompartimento`, `CategoriaMaterial_idCategoria`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Compartimento_has_CategoriaMaterial_Compartimento1` ON `mydb`.`Capacidade` (`Compartimento_idCompartimento` ASC) ;

CREATE INDEX `fk_Compartimento_has_CategoriaMaterial_CategoriaMaterial1` ON `mydb`.`Capacidade` (`CategoriaMaterial_idCategoria` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecimento` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fornecimento` (
  `Fornecedor_idFornecedor` INT NOT NULL ,
  `GrupoMaterial_idGrupoMaterial` INT NOT NULL ,
  `quantidade` INT NOT NULL ,
  `dataAquisicao` DATE NOT NULL ,
  `tipoFornecimento` VARCHAR(45) NOT NULL ,
  `garantia` INT NOT NULL ,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `GrupoMaterial_idGrupoMaterial`) )
ENGINE = InnoDB;

CREATE INDEX `fk_Fornecedor_has_GrupoMaterial_Fornecedor1` ON `mydb`.`Fornecimento` (`Fornecedor_idFornecedor` ASC) ;

CREATE INDEX `fk_Fornecedor_has_GrupoMaterial_GrupoMaterial1` ON `mydb`.`Fornecimento` (`GrupoMaterial_idGrupoMaterial` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
