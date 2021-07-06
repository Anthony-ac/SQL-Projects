#Retrieves the average salary by gender per department
DROP PROCEDURE IF EXISTS avg_s_gender;
DELIMITER $$
CREATE PROCEDURE avg_s_gender(IN input1 FLOAT, IN input2 FLOAT)
BEGIN
SELECT e.gender, d.dept_name, ROUND(AVG(s.salary),2)AS avg_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
JOIN employees e ON e.emp_no = s.emp_no
WHERE s.salary > input1 AND s.salary < input2
GROUP BY d.dept_no, e.gender
ORDER BY d.dept_no;

END$$

DELIMITER $$

USE employees;
CALL avg_s_gender(40000,60000);