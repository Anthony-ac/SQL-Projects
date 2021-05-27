#***SUBQUERIES - IN, EXISTS & MULTIPLE SUBQUERIES***
#Inner query runs first then outer query.
#Inner queries within inner queries are possible.
#A column from each table must match
USE employees;

/*Selects & searches the emp_no column from employees and filters it between a date range ordered by hire date
then retrieves the dept_manager table records that match the employee.emp_no (IN is faster with smaller data sets)*/

SELECT * FROM dept_manager
WHERE emp_no IN(
SELECT emp_no
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01'
ORDER BY hire_date ASC);

/*Returns a value for each record if it exists where the id numbers of both tables match, 
the outer query returns all records from the employees table if they match the titles table.*/
SELECT * FROM employees e
WHERE EXISTS(
SELECT * FROM titles t
WHERE t.emp_no = e.emp_no AND t.title = 'Assistant Engineer')
ORDER BY e.emp_no ASC;


/*Creates a table named emp_manager and inserts values for columns emp_no, dept_no, & manager_no.
The 3 columns were created from 3 other tables via joins and unions*/
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager(
	emp_no INT(11) NOT NULL,
	dept_no CHAR(4) NULL,
	manager_no INT(11) NOT NULL);

INSERT INTO emp_manager
SELECT U.*
FROM
	(SELECT A.*
	FROM
		(SELECT 
			e.emp_no,
			MIN(de.dept_no),
			(SELECT emp_no FROM dept_manager
			WHERE emp_no = 110022) AS manager_no
		FROM employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE e.emp_no BETWEEN 10001 AND 10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS A
	UNION
	SELECT B.*
	FROM
		(SELECT 
			e.emp_no,
			MIN(de.dept_no),
			(SELECT emp_no FROM dept_manager
			WHERE emp_no = 110039) AS manager_no
		FROM employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE e.emp_no BETWEEN 10021 AND 10040
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS B
		UNION
		SELECT C.*
		FROM
		(SELECT 
			e.emp_no,
			MIN(de.dept_no),
			(SELECT emp_no FROM dept_manager
			WHERE emp_no = 110039) AS manager_no
		FROM employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE e.emp_no = 110022
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS C
	UNION
	SELECT D.*
	FROM 
		(SELECT 
			e.emp_no,
			MIN(de.dept_no),
			(SELECT emp_no FROM dept_manager
			WHERE emp_no = 110022) AS manager_no
		FROM employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE e.emp_no = 110039
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS D)
        AS U;
SELECT * FROM emp_manager;
