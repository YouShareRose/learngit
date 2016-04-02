DROP TABLE IF EXISTS `test`.`pic`;
CREATE TABLE `test`.`pic` (
 `idpic` int(11) NOT NULL auto_increment,
 `caption` varchar(45) NOT NULL default '',
 `img` longblob NOT NULL,
 PRIMARY KEY (`idpic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;