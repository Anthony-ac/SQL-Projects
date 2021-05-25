#INSERT VALUES

USE employees;

#selects every record & column from employees ordered by emp_no in descending order
SELECT * FROM employees ORDER BY emp_no DESC;

#inserts values into the employees table & checks that the new inserted record is there
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (500000,'1981-10-31','Anthony', 'Cordova', 'M', '2001-05-22');
SELECT * FROM employees WHERE first_name = 'Anthony' AND last_name = 'Cordova';

#inserts values into the employees table & selects the top 10 records.
INSERT INTO employees 
VALUES(999903,'1977-09-14','Johnathan','Creek','M','1999-01-01'),
(999901,'1986-04-21','John','Smith','M','2011-01-01');
SELECT * FROM employees LIMIT 10;

#inserts values into the titles table
INSERT INTO titles (emp_no, title, from_date)
VALUES (999903,'Senior Engineer', '1997-10-01');

#inserts values into the department employee table
SELECT * FROM dept_emp;
INSERT INTO dept_emp
VALUES(999903,'d005','1997-10-01','9999-01-01');

#inserts values into the departments table
SELECT * FROM departments;
INSERT INTO departments
VALUES ('d010','Business Analysis');