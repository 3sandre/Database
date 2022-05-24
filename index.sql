-- Schema Données
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Données` DEFAULT CHARACTER SET utf8mb3 ;
USE `Données` ;

-- -----------------------------------------------------
-- Table `Données`.`info-films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Données`.`info-films` (
  `idfilms` INT NOT NULL AUTO_INCREMENT,
  `Titre` VARCHAR(20) NULL DEFAULT NULL,
  `Date de sortie` DATETIME NULL DEFAULT NULL,
  `Durer` TIME NULL DEFAULT NULL,
  `Realisateur` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idfilms`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Données`.`Categorie-films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Données`.`Categorie-films` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Action` VARCHAR(25) NULL DEFAULT NULL,
  `Comedie` VARCHAR(25) NULL DEFAULT NULL,
  `Aventure` VARCHAR(40) NULL DEFAULT NULL,
  `Drame` VARCHAR(25) NULL DEFAULT NULL,
  `Horreur` VARCHAR(25) NULL DEFAULT NULL,
  `info-films_idfilms` INT NOT NULL,
  PRIMARY KEY (`id`, `info-films_idfilms`),
  INDEX `fk_Categorie-films_info-films1_idx` (`info-films_idfilms` ASC) VISIBLE,
  CONSTRAINT `fk_Categorie-films_info-films1`
    FOREIGN KEY (`info-films_idfilms`)
    REFERENCES `Données`.`info-films` (`idfilms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Données`.`info-clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Données`.`info-clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(25) NULL DEFAULT NULL,
  `Prenom` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idclients`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Données`.`Payement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Données`.`Payement` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Date de payement` DATETIME NOT NULL,
  `Description` VARCHAR(40) NOT NULL,
  `Montant` DECIMAL(6,0) NOT NULL,
  `info-clients_idclients` INT NOT NULL,
  `info-films_idfilms` INT NOT NULL,
  PRIMARY KEY (`Id`, `info-clients_idclients`),
  INDEX `fk_Payement_info-clients1_idx` (`info-clients_idclients` ASC) VISIBLE,
  INDEX `fk_Payement_info-films1_idx` (`info-films_idfilms` ASC) VISIBLE,
  CONSTRAINT `fk_Payement_info-clients1`
    FOREIGN KEY (`info-clients_idclients`)
    REFERENCES `Données`.`info-clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payement_info-films1`
    FOREIGN KEY (`info-films_idfilms`)
    REFERENCES `Données`.`info-films` (`idfilms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Données`.`info-clients_has_info-films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Données`.`info-clients_has_info-films` (
  `info-clients_idclients` INT NOT NULL,
  `info-films_idfilms` INT NOT NULL,
  `Date de creation` DATETIME NOT NULL DEFAULT Now(),
  `Derniere date de modification` DATETIME NOT NULL DEFAULT Now(),
  PRIMARY KEY (`info-clients_idclients`, `info-films_idfilms`),
  INDEX `fk_info-clients_has_info-films_info-films1_idx` (`info-films_idfilms` ASC) VISIBLE,
  INDEX `fk_info-clients_has_info-films_info-clients_idx` (`info-clients_idclients` ASC) VISIBLE,
  CONSTRAINT `fk_info-clients_has_info-films_info-clients`
    FOREIGN KEY (`info-clients_idclients`)
    REFERENCES `Données`.`info-clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_info-clients_has_info-films_info-films1`
    FOREIGN KEY (`info-films_idfilms`)
    REFERENCES `Données`.`info-films` (`idfilms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;
