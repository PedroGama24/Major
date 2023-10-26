CREATE TABLE `groups_blacklist` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`time` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;
