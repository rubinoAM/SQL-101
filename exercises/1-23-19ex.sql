-- Get all rows from employees who are sales reps.
SELECT * FROM employees
	WHERE jobTitle = 'Sales Rep';
	
-- Get all rows from employees in Office 1 who aren't sales reps. Return only name and email.
SELECT firstName, lastName, email FROM employees
	WHERE jobTitle != 'Sales Rep' AND officeCode = '1';
	
-- Get a unique list of managers by pulling the reports to
SELECT * FROM employees
	WHERE reportsTo = '1056'
	AND jobTitle LIKE '%Manager%';

-- Get the name and office code of everyone whose name contains a "b", whose office code is 1,3, or 5, and whose title is manager
-- Pull only the first ten rows by customer name and only bring back name
SELECT CONCAT(firstName," ",lastName) AS fullName FROM employees
	WHERE firstName LIKE "%b%" OR lastName LIKE "%b%"
	AND officeCode IN(1,3,5) 
	AND jobTitle = 'Manager'
	LIMIT 0,10;

-- Get the total of all order amounts where the customer number is 124 (and round)
SELECT SUM(quantityOrdered * priceEach) AS orderTotal FROM orderdetails
	JOIN orders
	WHERE ROUND(quantityOrdered * priceEach) = quantityOrdered * priceEach
	AND customerNumber = '124';