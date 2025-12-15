ALTER TABLE electus_admin_roles
ADD COLUMN IF NOT EXISTS `sub_permissions` text NOT NULL DEFAULT '{}';

CREATE TABLE IF NOT EXISTS `electus_admin_licenses` (
  `license` varchar(255) DEFAULT NULL,
  `discord` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `steam` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `electus_admin_notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`note_id`)
);