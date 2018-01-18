-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `idDoctor` INT(8) NOT NULL,
  `Doctor_name` VARCHAR(45) NOT NULL,
  `Doctor_date_of_birth` DATE NOT NULL,
  `Doctor_adress` VARCHAR(45) NOT NULL,
  `Doctor_phone` INT NOT NULL,
  `Doctor_salary` DECIMAL(4) NOT NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `idMedical` INT NOT NULL,
  `overtime_rate` VARCHAR(45) NOT NULL,
  `Doctor_idDoctor` INT(8) NOT NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `fk_Medical_Doctor_idx` (`Doctor_idDoctor` ASC),
  CONSTRAINT `fk_Medical_Doctor`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `PatientName` VARCHAR(45) NOT NULL,
  `PatientAdress` VARCHAR(45) NOT NULL,
  `PatientPhone` CHAR(9) NOT NULL,
  `PatientDateOfBirth` DATE NOT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`specialist` (
  `idspecialist` INT NOT NULL,
  `Field-area` VARCHAR(45) NOT NULL,
  `Doctor_idDoctor` INT(8) NOT NULL,
  PRIMARY KEY (`idspecialist`),
  INDEX `fk_specialist_Doctor1_idx` (`Doctor_idDoctor` ASC),
  CONSTRAINT `fk_specialist_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Time` TIME(2) NOT NULL,
  `Doctor_idDoctor` INT(8) NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `fk_Appointment_Doctor1_idx` (`Doctor_idDoctor` ASC),
  INDEX `fk_Appointment_Patient1_idx` (`Patient_idPatient` ASC),
  CONSTRAINT `fk_Appointment_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL,
  `Details` VARCHAR(45) NOT NULL,
  `Method` VARCHAR(45) NOT NULL,
  `total` DECIMAL(4) NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_Payment_Patient1_idx` (`Patient_idPatient` ASC),
  CONSTRAINT `fk_Payment_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `Doctor_idDoctor` INT(8) NOT NULL,
  `total` DECIMAL(4) NOT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `fk_Bill_Doctor1_idx` (`Doctor_idDoctor` ASC),
  CONSTRAINT `fk_Bill_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment_has_Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment_has_Bill` (
  `Payment_idPayment` INT NOT NULL,
  `Bill_idBill` INT NOT NULL,
  PRIMARY KEY (`Payment_idPayment`, `Bill_idBill`),
  INDEX `fk_Payment_has_Bill_Bill1_idx` (`Bill_idBill` ASC),
  INDEX `fk_Payment_has_Bill_Payment1_idx` (`Payment_idPayment` ASC),
  CONSTRAINT `fk_Payment_has_Bill_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Bill_Bill1`
    FOREIGN KEY (`Bill_idBill`)
    REFERENCES `mydb`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
