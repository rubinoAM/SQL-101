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
	
-- After everything you can choose to limit the number of rows returned
-- LIMIT takes 2 args (where to start & how many)
SELECT * FROM orderdetails
	ORDER BY priceEach desc
	LIMIT 0,5; -- 0 is the default starting point
	
-- You can create temporary columns in queries using AS before FROM
-- E.g. orderTotal
SELECT *, quantityOrdered * priceEach AS orderTotal FROM orderdetails
	ORDER BY orderTotal desc;
	
SELECT * FROM employees WHERE officeCode IN (1,2,3);

-- Math functions from Excel are available as well
-- Aggregate functions (e.g. SUM, AVG, etc.) grab a bunch of rows and combine them into one thing
SELECT AVG(quantityOrdered * priceEach) AS orderAverage FROM orderdetails
	ORDER BY orderAverage desc;

-- JOIN allows us to bring 2 tables together and makes tables wider
-- UNION makes tables taller

SELECT payments.amount, customers.customerName, customers.salesRepEmployeeNumber FROM payments
	JOIN customers ON payments.customerNumber = customers.customerNumber
	WHERE amount > 1000;

-- Get payments above 1000 with employee sales rep names
SELECT payments.amount, customers.customerName, CONCAT(employees.firstName," ",employees.lastName) AS employeeName FROM payments
	INNER JOIN customers ON payments.customerNumber = customers.customerNumber
	INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
	WHERE amount > 1000
	ORDER BY amount desc;
	
SELECT * FROM employees
	INNER JOIN customers ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- TABLE CREATION
CREATE TABLE test(
	id int(11),
	name varchar(50),
	job varchar(50),
	salary int(6)
);

-- Drop a column
ALTER TABLE test DROP COLUMN salary;

-- Insert a record
INSERT INTO test (id,name,job)
	VALUES (1,'Rob','Teacher');
	
-- Update a record
UPDATE test SET name = "Robert"
	WHERE name = "Rob";