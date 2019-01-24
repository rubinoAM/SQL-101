CREATE TABLE restaurant(
	id int NOT NULL AUTO_INCREMENT primary key,
	name varchar(50) NOT NULL,
	address varchar(255) NOT NULL,
	category varchar(50)
);

CREATE TABLE user(
	id int NOT NULL AUTO_INCREMENT primary key,
	name varchar(50) NOT NULL,
	email varchar(255) NOT NULL,
	total_posts ENUM('0','1','2','3','4','5','6','7') NOT NULL
);

CREATE TABLE review(
	id int NOT NULL AUTO_INCREMENT primary key,
	stars ENUM('1','1.5','2','2.5','3','3.5','4','4.5','5') NOT NULL,
	title varchar(255) NOT NULL,
	review varchar(255) NOT NULL,
	author_id int NOT NULL,
	rest_id int NOT NULL,
	CONSTRAINT `fk_author` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  	CONSTRAINT `fk_rest` FOREIGN KEY (`id`) REFERENCES `restaurant` (`id`) ON UPDATE CASCADE
);