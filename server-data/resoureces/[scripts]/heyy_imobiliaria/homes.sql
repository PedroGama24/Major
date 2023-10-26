CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
	`owner` INT(11) NOT NULL,
	`user_id` INT(11) NOT NULL,
	`garage` INT(11) NOT NULL,
	`home` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`tax` VARCHAR(24) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`chestSize` INT(11) NULL DEFAULT NULL,
	`slotsChest` INT(11) NOT NULL DEFAULT '15'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
