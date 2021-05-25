#***UPDATE, DELETE & TCL

USE employees;

#selects all columns for emp_no 999901
SELECT * FROM employees
WHERE emp_no = 999901;
    
# updates emp_no 999901 (Where clause is required when updating a specific row or all rows will be updated.)
UPDATE employees
SET first_name = 'Stella', last_name = 'Parkinson', birth_date = '1990-12-31', gender = 'F'
WHERE emp_no = 999901;

#Updates dept_names Business Analysis to Data Analysis in the departments table and then saves the change
SELECT * FROM departments;
UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_name = 'Business Analysis';
Commit;

/*Deletes record for dept_no d010 from the departments table and then rolls back the change
DROP REMOVES THE TABLE WITHOUT BEING ABLE TO ROLLBACK, TRUNCATE DELETES ALL RECORDS SIMILAR TO DELETE WITHOUT WHERE CLAUSE BUT WILL LOSE AUTO INCREMENT AND IS FASTER*/
SELECT * FROM departments;
DELETE FROM departments
WHERE dept_no = 'd010';
ROLLBACK;

