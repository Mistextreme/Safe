CREATE TABLE IF NOT EXISTS `garage_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `position` longtext NOT NULL,
  `delete_pos` longtext NOT NULL,
  `blip` tinyint(1) NOT NULL DEFAULT 1,
  `spawns` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_type` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 