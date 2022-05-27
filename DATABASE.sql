-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb`;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `category_id` INT NOT NULL,
  `action` VARCHAR(150) NOT NULL,
  `comedie` VARCHAR(500) NOT NULL,
  `aventure` VARCHAR(405) NOT NULL,
  `drame` VARCHAR(450) NOT NULL,
  `horreur` VARCHAR(450) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Entrées`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Entrées` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Entrées` (
  `idEntrées` INT NOT NULL,
  `date de création` DATETIME NOT NULL,
  `date de modification` DATETIME NOT NULL,
  PRIMARY KEY (`idEntrées`));


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`clients` ;

CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `idclients` INT NOT NULL,
  `nom` VARCHAR(50) NOT NULL,
  `prénom` VARCHAR(150) NOT NULL,
  `email` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idclients`));


-- -----------------------------------------------------
-- Table `mydb`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Payments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Payments` (
  `payment_id` INT NOT NULL,
  `idclients` INT NULL DEFAULT NULL,
  `date de payment` DATE NULL DEFAULT NULL,
  `description` VARCHAR(75) NULL DEFAULT NULL,
  `Montant` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `idclients`
    FOREIGN KEY (`idclients`)
    REFERENCES `mydb`.`clients` (`idclients`));


-- -----------------------------------------------------
-- Table `mydb`.`films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`films` ;

CREATE TABLE IF NOT EXISTS `mydb`.`films` (
  `idfilms` INT NOT NULL,
  `titre` VARCHAR(350) NOT NULL,
  `date de sortie` DATE NOT NULL,
  `durée` VARCHAR(10) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `réalisateur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfilms`),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`Categories` (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`films loués`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`films loués` ;

CREATE TABLE IF NOT EXISTS `mydb`.`films loués` (
  `idlocation` INT NOT NULL,
  `date de location` DATE NOT NULL,
  `idfilms` INT NULL DEFAULT NULL,
  `date de retour` DATE NOT NULL,
  `Entrés base_idEntrées` INT NOT NULL,
  `clients_idclients` INT NOT NULL,
  `Entrées_idEntrées` INT NOT NULL,
  PRIMARY KEY (`idlocation`, `Entrés base_idEntrées`, `Entrées_idEntrées`),
  CONSTRAINT `fk_films loués_clients1`
    FOREIGN KEY (`clients_idclients`)
    REFERENCES `mydb`.`clients` (`idclients`),
  CONSTRAINT `idfilms`
    FOREIGN KEY (`idfilms`)
    REFERENCES `mydb`.`films` (`idfilms`),
  CONSTRAINT `fk_films loués_Entrées1`
    FOREIGN KEY (`Entrées_idEntrées`)
    REFERENCES `mydb`.`Entrées` (`idEntrées`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


