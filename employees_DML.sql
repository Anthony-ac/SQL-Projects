USE employees;

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

SELECT * FROM employees WHERE hire_date >= 2000-01-01 AND  gender = 'F' 
ORDER BY hire_date;

SELECT DISTINCT hire_date FROM employees;

SELECT * FROM salaries WHERE salary > 150000;

SELECT COUNT(*) FROM salaries WHERE salary >= 100000;

SELECT COUNT(*) FROM dept_manager;