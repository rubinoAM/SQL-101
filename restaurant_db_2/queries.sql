SELECT r.name,AVG(reviews.stars) AS score FROM restaurants AS r
	INNER JOIN reviews ON r.id = reviews.restaurant_id
	GROUP BY r.id;

SELECT users.name,AVG(reviews.stars) AS average_rating FROM users
	INNER JOIN reviews ON users.id = reviews.author_id
	GROUP BY users.id;

SELECT MIN(reviews.stars) AS lowest_rating,users.name FROM reviews
	INNER JOIN users on users.id = reviews.author_id
	GROUP BY users.id;