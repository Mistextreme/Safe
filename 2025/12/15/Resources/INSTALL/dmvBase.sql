CREATE TABLE `p_dmv_schools` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `type` varchar(10) NOT NULL,
  `blipSprite` int(5) NOT NULL,
  `blipColor` int(5) NOT NULL,
  `mainCoords` longtext NOT NULL,
  `theoryQuestions` longtext NOT NULL DEFAULT '[]',
  `practiceMap` longtext NOT NULL DEFAULT '[]',
  `start` longtext NOT NULL DEFAULT '[]',
  `tasks` longtext NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `p_dmv_schools`
  ADD PRIMARY KEY (`name`);
COMMIT;