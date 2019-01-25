SELECT r.name,AVG(reviews.stars) AS score FROM restaurants AS r
	INNER JOIN reviews ON r.id = reviews.restaurant_id
	GROUP BY r.id;

SELECT users.name,AVG(reviews.stars) AS average_rating FROM users
	INNER JOIN reviews ON users.id = reviews.author_id
	GROUP BY users.id;