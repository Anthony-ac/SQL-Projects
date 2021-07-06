#Creates gender, dept_name, salary, & Calendar year for years 2002 and below.
USE employees;
SELECT e.gender, d.dept_name, ROUND(AVG(s.salary),2) AS salary, YEAR(s.from_date) AS calendar_year
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;


