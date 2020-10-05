DROP SCHEMA IF EXISTS `notesdb`;
CREATE SCHEMA IF NOT EXISTS `notesdb` DEFAULT CHARACTER SET latin1;
USE `notesdb`;

CREATE TABLE IF NOT EXISTS `notesdb`.`user` (
  `email` VARCHAR(40) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`email`)
);

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `contents` varchar(20000) CHARACTER SET utf8 NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_Note_User` (`owner`),
  CONSTRAINT `FK_Note_User` FOREIGN KEY (`owner`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`)
    VALUES ('cprg352+anne@gmail.com', true, 'Anne','Annerson', 'password');
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`)
    VALUES ('cprg352+barb@gmail.com', true, 'Barb','Barber', 'password');

INSERT INTO `note` (`Title`, `Contents`, `Owner`)
    VALUES ('Quote #1', 'Writing is nature''s way of letting you know how sloppy your thinking is.', 'cprg352+anne@gmail.com');
INSERT INTO `note` (`Title`, `Contents`, `Owner`)
    VALUES ('Another quote', '"Java is to JavaScript as ham is to hamster." -  Jeremy Keith', 'cprg352+anne@gmail.com');
INSERT INTO `note` (`Title`, `Contents`, `Owner`)
    VALUES ('Barb''s Note', 'Anne should not see this note.', 'cprg352+barb@gmail.com');
