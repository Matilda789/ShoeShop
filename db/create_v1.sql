-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shop_your_pair
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop_your_pair
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop_your_pair` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `shop_your_pair` ;

-- -----------------------------------------------------
-- Table `shop_your_pair`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`manufacturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`manufacturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`order_pickup_points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`order_pickup_points` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postcode` INT NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `house` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`order_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`order_statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` INT NOT NULL,
  `second_name` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `login` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk__idx` (`role` ASC) VISIBLE,
  CONSTRAINT `fk_`
    FOREIGN KEY (`role`)
    REFERENCES `shop_your_pair`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` VARCHAR(100) NOT NULL,
  `delivery_date` VARCHAR(100) NOT NULL,
  `order_pickup_point_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `receive_code` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_picks_idx` (`order_pickup_point_id` ASC) VISIBLE,
  INDEX `fk_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_statuses_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_picks3`
    FOREIGN KEY (`order_pickup_point_id`)
    REFERENCES `shop_your_pair`.`order_pickup_points` (`id`),
  CONSTRAINT `fk_statuses3`
    FOREIGN KEY (`status_id`)
    REFERENCES `shop_your_pair`.`order_statuses` (`id`),
  CONSTRAINT `fk_users3`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop_your_pair`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`product_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`product_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `article` VARCHAR(100) NOT NULL,
  `type_id` INT NOT NULL,
  `unit` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `supplier_id` INT NOT NULL,
  `manufacturer_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `discount` INT NOT NULL,
  `stock_quantity` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `photo` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `categs_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_suppls_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `fk_manufs_idx` (`manufacturer_id` ASC) VISIBLE,
  INDEX `fk_types_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `fk_categs`
    FOREIGN KEY (`category_id`)
    REFERENCES `shop_your_pair`.`categories` (`id`),
  CONSTRAINT `fk_manufs`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `shop_your_pair`.`manufacturers` (`id`),
  CONSTRAINT `fk_suppls`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `shop_your_pair`.`suppliers` (`id`),
  CONSTRAINT `fk_types`
    FOREIGN KEY (`type_id`)
    REFERENCES `shop_your_pair`.`product_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `shop_your_pair`.`prodorders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_your_pair`.`prodorders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ords_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_prods_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_ords`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop_your_pair`.`orders` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_prods`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop_your_pair`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
