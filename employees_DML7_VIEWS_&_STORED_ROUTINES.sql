#***VIEWS AND STORED ROUTINES***

USE employees;

# Creates or replaces a view that shows the avg manager salary
CREATE OR REPLACE VIEW v_avg_mgr_salary AS
SELECT ROUND(AVG(s.salary),2) AS AVG_Salary
FROM salaries s
JOIN dept_manager dm ON s.emp_no = dm.emp_no;

SELECT * FROM v_avg_mgr_salary;

# Deletes the stored procedure if it exists and creates a procedure that show the average employee salary
DROP PROCEDURE IF EXISTS AVG_Emp_Salary;

# Creates IN procedure that retrieves the average salary depending on the employee id number given
#Delimeter changes the delimeter temporarily.
DELIMITER $$
CREATE PROCEDURE AVG_Emp_Salary(IN p_emp_no INTEGER)
BEGIN
	SELECT ROUND(AVG(salary),2) AS AVG_Salary
     	FROM salaries
     	WHERE emp_no = p_emp_no;
	
END$$
DELIMITER ;

CALL AVG_Emp_Salary(10002);

# Creates average average employee salary based on input of employee id and places it in a variable that is retrieved via select statement.
DELIMITER $$
CREATE PROCEDURE avg_emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))

BEGIN

	SELECT ROUND(AVG(s.salary),2) AS Average_Salary
	INTO p_avg_salary 
	FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
	WHERE e.emp_no = p_emp_no;

END$$

DELIMITER ;

SET @p_avg_salary = 0;
CALL avg_emp_salary_out(10001, @p_avg_salary);
SELECT @p_avg_salary;
