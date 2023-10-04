drop database if exists furama_resort;
create database if not exists furama_resort;
use furama_resort;
CREATE TABLE `customer`(
    `customer_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_type_id` INT NOT NULL,
    `customer_name` VARCHAR(45) NOT NULL,
    `customer_birthday` DATE NOT NULL,
    `customer_gender` TINYINT(1) NOT NULL,
    `customer_id_card` VARCHAR(45) NOT NULL,
    `customer_phone` VARCHAR(45) NOT NULL,
    `customer_email` VARCHAR(45) NOT NULL,
    `customer_address` VARCHAR(255) NOT NULL
);
CREATE TABLE `education_degree`(
    `education_degree_id` INT NOT NULL PRIMARY KEY,
    `education_degree_name` VARCHAR(45) NOT NULL
);
CREATE TABLE `employee`(
    `employee_id` INT PRIMARY KEY,
    `employee_name` VARCHAR(45) NOT NULL,
    `employee_birthday` DATE NOT NULL,
    `employee_id_card` VARCHAR(45) NOT NULL,
    `employee_salary` DOUBLE NOT NULL,
    `employee_phone` VARCHAR(45) NOT NULL,
    `employee_email` VARCHAR(45) NOT NULL,
    `employee_address` VARCHAR(45) NOT NULL,
    `position_id` INT NOT NULL,
    `education_degree_id` INT NOT NULL,
    `division_id` INT NOT NULL,
    `username` VARCHAR(45) NOT NULL
);
CREATE TABLE `user_role`(
    `role_id` INT UNSIGNED NOT NULL,
    `username` VARCHAR(255) NOT NULL
);
CREATE TABLE `contract`(
    `contract_id` INT NOT NULL PRIMARY KEY,
    `contract_start_date` DATETIME NOT NULL,
    `contract_end_time` DATETIME NOT NULL,
    `contract_deposit` DOUBLE NOT NULL,
    `contract_total_money` DOUBLE NOT NULL,
    `employee_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `service_id` INT NOT NULL
);
CREATE TABLE `contract_detail`(
    `contract_detail_id` INT NOT NULL PRIMARY KEY,
    `contract_id` INT NOT NULL,
    `attach_service_id` INT NOT NULL,
    `quantity` INT NOT NULL
);
CREATE TABLE `division`(
    `division_id` INT NOT NULL PRIMARY KEY,
    `division_name` VARCHAR(45) NOT NULL
);
CREATE TABLE `attach_service`(
    `attach_service_id` INT NOT NULL PRIMARY KEY,
    `attach_service_name` VARCHAR(45) NOT NULL,
    `attach_service_cost` DOUBLE NOT NULL,
    `attach_service_unit` INT NOT NULL,
    `attach_service_status` VARCHAR(45) NOT NULL
);
CREATE TABLE `user`(
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `user` ADD PRIMARY KEY(`username`);
CREATE TABLE `service`(
    `service_id` INT NOT NULL PRIMARY KEY,
    `service_name` VARCHAR(45) NOT NULL,
    `service_area` INT NOT NULL,
    `service_cost` DOUBLE NOT NULL,
    `service_max_people` INT NOT NULL,
    `rent_type_id` INT NOT NULL,
    `service_type_id` INT NOT NULL,
    `standard_room` VARCHAR(45) NOT NULL,
    `description_other_convenience` VARCHAR(45) NOT NULL,
    `pool_area` DOUBLE NOT NULL,
    `number_of_floors` INT NOT NULL
);
CREATE TABLE `position`(
    `position_id` INT PRIMARY KEY,
    `position_name` VARCHAR(45) NOT NULL
);
CREATE TABLE `service_type`(
    `service_type_id` INT NOT NULL PRIMARY KEY,
    `service_type_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `rent_type`(
    `rent_type_id` INT NOT NULL PRIMARY KEY,
    `rent_type_name` VARCHAR(45) NOT NULL,
    `rent_type_cost` DOUBLE NOT NULL
);
CREATE TABLE `role`(
    `role_id` INT UNSIGNED NOT NULL PRIMARY KEY,
    `role_name` VARCHAR(45) NOT NULL
);
CREATE TABLE `customer_type`(
    `customer_type_id` INT NOT NULL PRIMARY KEY,
    `customer_type_name` VARCHAR(45) NOT NULL
);
ALTER TABLE
    `service` ADD CONSTRAINT `service_service_type_id_foreign` FOREIGN KEY(`service_type_id`) REFERENCES `service_type`(`service_type_id`);
ALTER TABLE
    `employee` ADD CONSTRAINT `employee_username_foreign` FOREIGN KEY(`username`) REFERENCES `user`(`username`);
ALTER TABLE
    `customer` ADD CONSTRAINT `customer_customer_type_id_foreign` FOREIGN KEY(`customer_type_id`) REFERENCES `customer_type`(`customer_type_id`);
ALTER TABLE
    `contract_detail` ADD CONSTRAINT `contract_detail_contract_id_foreign` FOREIGN KEY(`contract_id`) REFERENCES `contract`(`contract_id`);
ALTER TABLE
    `contract` ADD CONSTRAINT `contract_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE
    `contract_detail` ADD CONSTRAINT `contract_detail_attach_service_id_foreign` FOREIGN KEY(`attach_service_id`) REFERENCES `attach_service`(`attach_service_id`);
ALTER TABLE
    `employee` ADD CONSTRAINT `employee_position_id_foreign` FOREIGN KEY(`position_id`) REFERENCES `position`(`position_id`);
ALTER TABLE
    `user_role` ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `role`(`role_id`);
ALTER TABLE
    `service` ADD CONSTRAINT `service_rent_type_id_foreign` FOREIGN KEY(`rent_type_id`) REFERENCES `rent_type`(`rent_type_id`);
ALTER TABLE
    `employee` ADD CONSTRAINT `employee_education_degree_id_foreign` FOREIGN KEY(`education_degree_id`) REFERENCES `education_degree`(`education_degree_id`);
ALTER TABLE
    `user_role` ADD CONSTRAINT `user_role_username_foreign` FOREIGN KEY(`username`) REFERENCES `user`(`username`);
ALTER TABLE
    `employee` ADD CONSTRAINT `employee_division_id_foreign` FOREIGN KEY(`division_id`) REFERENCES `division`(`division_id`);
    ALTER TABLE
    `contract` ADD CONSTRAINT `contract_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employee`(`employee_id`);
    ALTER TABLE
    `contract` ADD CONSTRAINT `contract_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`service_id`);
    
    


