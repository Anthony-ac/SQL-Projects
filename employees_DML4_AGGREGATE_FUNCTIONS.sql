#***5 AGGREGATE FUNCTIONS, ROUNDING, IFNULL & COALESCE***

USE employees;

#Counts all rows and only works with the count aggregate function.
SELECT * FROM dept_emp;
SELECT COUNT(*) FROM dept_emp;

#Selects a count of distinct departments
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

#Total amount of money spent on salaries post 1/1/1997
SELECT * FROM salaries;
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';

# returns the lowest and highest employee numbers
SELECT * FROM employees;
SELECT MIN(emp_no) FROM employees;
SELECT MAX(emp_no) FROM employees;

#Retrieves the annual average salary for employees who started post 01-01-1997.
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';

#Coalesce mirrors IFNULL by filling null cells from left to right in the order of its arguments.
SELECT dept_no, dept_name, COALESCE(dept_no,dept_name) AS dept_info FROM departments ORDER BY dept_no;