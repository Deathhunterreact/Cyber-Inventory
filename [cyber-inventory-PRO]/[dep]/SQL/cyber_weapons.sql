CREATE TABLE `cyber_weapons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner` text NOT NULL,
  `hash` text NOT NULL,
  `ammo` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `cyber_weapons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `cyber_weapons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

ALTER TABLE `cyber_weapons` 
ADD COLUMN `suppressor` INT NULL DEFAULT 0 ,
ADD COLUMN `light` INT NULL DEFAULT 0,
ADD COLUMN `grip` INT NULL DEFAULT 0,
ADD COLUMN `goldtint` INT NULL DEFAULT 0,
ADD COLUMN `sight` INT NULL DEFAULT 0,
ADD COLUMN `extended` INT NULL DEFAULT 0
