CREATE TABLE restaurant(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(50),
	distance float(4,2),
	stars int(5),
	category varchar(50),
	favoriteDish varchar(50),
	doesTakeout int(1),
	lastTimeYouAteThere date,
    primary key (id)
);