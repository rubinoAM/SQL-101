/*  SELECT = Grabs records/rows
	After SELECT comes what columns you want
	Options: * = every available column
			 city = only the city column
			 city, phone = city & phone columns
	After the column(s) comes the table you want to query
    Always end SQL statements with a ';'*/
SELECT * FROM offices;
SELECT firstName, lastName FROM employees;

-- If you want only certain rows, add WHERE after the table
SELECT firstName, lastName, extension FROM employees
	WHERE jobTitle = "Sales Rep";
	
-- We can ask for distinct results
SELECT DISTINCT(jobTitle) FROM employees;

-- WHERE clauses can have multiple conditions using AND + OR (Use parentheses)
SELECT * FROM orders
	WHERE status = 'Cancelled' OR status = 'Resolved';
SELECT * FROM orders
	WHERE orderDate < "2004-01-01" AND orderDate > "2003-01-01";
	
-- LIKE is basically an equal sign
-- The big advantage here is that you can use % (wildcard) in your string
SELECT * FROM productlines
	WHERE productLine LIKE 'planes';
-- We want last names with 'ur' in them, and first names that start with 'd'
SELECT * FROM employees
	WHERE lastName LIKE '%ur%' AND firstName LIKE 'D%';
	
-- After the WHERE clause, you can add ORDER BY, which expects a column and direction (asc/desc)
SELECT * FROM offices
	ORDER BY city asc;