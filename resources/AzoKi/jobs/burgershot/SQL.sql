INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_burgershot','Burgershot',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_burgershot','Burgershot', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_burgershot', 'Burgershot', 1)
;

INSERT INTO `jobs`(`name`, `label`) VALUES
	('burgershot', 'Burgershot')
;

INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('90', 'burgershot',0,'recrue','Recrue',12,'{}','{}'),
	('91', 'burgershot',1,'novice','Novice',24,'{}','{}'),
	('92', 'burgershot',2,'experimente','Experimente',36,'{}','{}'),
	('93', 'burgershot',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('94', 'burgershot',4,'boss','Patron',0,'{}','{}')
;

