CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `data` LONGTEXT DEFAULT '{}', -- Alterado para objeto JSON
  PRIMARY KEY (`plate`, `model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;