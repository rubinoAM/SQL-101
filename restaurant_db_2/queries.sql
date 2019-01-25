SELECT r.name,AVG(reviews.stars) AS score FROM restaurants AS r
	INNER JOIN reviews ON r.id = reviews.restaurant_id
	GROUP BY r.id;

SELECT users.name,AVG(reviews.stars) AS average_rating FROM users
	INNER JOIN reviews ON users.id = reviews.author_id
	GROUP BY users.id;

SELECT users.name,MIN(reviews.stars) AS lowest_rating FROM reviews
	INNER JOIN users on users.id = reviews.author_id
	GROUP BY users.id;

SELECT restaurants.name, COUNT(reviews.id) AS num_reviews FROM reviews
	INNER JOIN restaurants on restaurants.id = reviews.restaurant_id
	GROUP BY restaurants.id;

SELECT category, COUNT(category) AS total
	FROM restaurants
	GROUP BY category;

SELECT restaurants.name, reviews.stars FROM restaurants
	INNER JOIN reviews on restaurants.id = reviews.restaurant_id
	WHERE reviews.stars = 5;