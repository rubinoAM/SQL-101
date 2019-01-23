/*  SELECT = Grabs records/rows
	After SELECT comes what columns you want
	Options: * = every available column
			 city = only the city column
			 city, phone = city & phone columns
	After the column(s) comes the table you want to query
    Always end SQL statements with a ';'*/
SELECT * FROM offices;
SELECT firstName, lastName from employees;

-- If you want only certain rows, add WHERE after the table
SELECT * FROM employees
	WHERE jobTitle = "Sales Rep";