CREATE TABLE IF NOT EXISTS `cyber_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8_turkish_ci NOT NULL,
  `type` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `data` longtext COLLATE utf8_turkish_ci NOT NULL,
  `slot` int(11) NOT NULL DEFAULT 1,
  `drop` text COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

CREATE TABLE IF NOT EXISTS `cyber_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_turkish_ci NOT NULL,
  `description` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `max` int(11) NOT NULL DEFAULT 100,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;