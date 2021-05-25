# RETRIEVE (DISTINCT/NON-DISTINCT) AND FILTERED/NON-FILTERED RECORDS. INTRODUCE COUNT AND AVG AGGREGATE FUNCTIONS.

USE employees;

# Retreives filtered/non-filtered records 
SELECT * FROM employees;

SELECT * FROM employees WHERE first_name = 'Elvis';
    
SELECT * FROM employees WHERE first_name = 'Kellie' AND gender = 'F';

SELECT * FROM employees WHERE first_name = 'Kellie' OR first_name = 'Aruna';

SELECT * FROM employees WHERE gender = 'F' AND (first_name = 'Kellie' OR 'Aruna');

SELECT * FROM employees WHERE first_name IN ('Denis','Elvis');

SELECT * FROM employees WHERE first_name NOT IN ('John','Mark','Jacob');

SELECT * FROM employees WHERE first_name LIKE('Mark%');

SELECT * FROM employees WHERE hire_date LIKE('%2000%');

SELECT * FROM employees WHERE emp_no LIKE('1000_');

SELECT * FROM employees WHERE first_name LIKE('%Jack%');

SELECT *FROM employees WHERE first_name NOT LIKE ('%Jack%');

SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;

SELECT * FROM employees WHERE emp_no NOT BETWEEN 10004 AND 10012;

SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

SELECT * FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees ORDER BY first_name, last_name ASC;

SELECT * FROM salaries WHERE salary > 150000;

SELECT * FROM employees WHERE hire_date >= 2000-01-01 AND  gender = 'F' 
ORDER BY hire_date;

# Retrieves filtered records that are distinct.
SELECT DISTINCT hire_date FROM employees;

# introduces count and avg aggregate functions
SELECT COUNT(*) FROM salaries WHERE salary >= 100000;

SELECT COUNT(*) FROM dept_manager;

SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY first_name, last_name ASC;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary FROM salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary;

SELECT emp_no, AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > 120000 ORDER BY emp_no;

SELECT emp_no FROM dept_emp WHERE from_date > 2000-01-01 GROUP BY emp_no HAVING COUNT(emp_no) > 1 ORDER BY emp_no LIMIT 100;