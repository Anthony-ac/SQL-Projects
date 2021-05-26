#***JOINS***

#PREPARE DATABASE FOR JOINS

#Create duplicate table for departments table, insert public relations value, delete record for dept_no d002, and insert to dept_nos.
USE employees;
CREATE TABLE departments_dup (
	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup(dept_no,dept_name)
SELECT * FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';

DELETE FROM departments_dup
WHERE dept_no = 'd010' AND dept_name = 'Data Analysis';

INSERT INTO departments_dup (dept_no)
VALUES ('d010'),('d011');

# Create duplicate table for dept_manager table, populate with 4 records, & delete dept_no d001.
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),(999905, '2017-01-01'),
(999906, '2017-01-01'),(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

# Takes a look at both tables ordered by dept_no
SELECT * FROM dept_manager_dup;
SELECT * FROM employees;

# Inner joins the 2 tables, group by removes duplicates
SELECT dm.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM dept_manager_dup As dm
JOIN employees As e ON dm.emp_no = e.emp_no
GROUP BY dm.emp_no
ORDER BY dm.emp_no;

# Retrieve the employees and dept_manager tables, left join them and identify managers with the last name 'Markovitch'
SELECT * FROM employees;
SELECT * FROM dept_manager;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM employees e
LEFT JOIN dept_manager d ON e.emp_no = d.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY d.dept_no DESC, e.emp_no;

#Joins 2 tables via employee number to retrieve a specific employee
SELECT * From titles;
SELECT * FROM employees;

SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

#Cross joins 2 departments where the dept no is d009
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT dm.*,d.*
FROM dept_manager dm
CROSS JOIN departments d
WHERE d.dept_no = 'd009'
ORDER BY d.dept_no;

#Cross joins 2 departments where the records for the first 10 employee numbers are retrieved
SELECT * FROM employees;
SELECT * FROM departments;
SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

# Retrieves 4 tables and inner joins them filtered by manager and ordered by employee number
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM dept_manager;
SELECT * FROM departments;

SELECT e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_name
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
JOIN dept_manager dm  ON t.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

# Retrieves manager counts by gender
SELECT * FROM dept_manager;
SELECT * FROM employees;

SELECT e.gender, Count(dm.emp_no) AS manager_count
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender
ORDER BY e.emp_no;

# Creates a union (combining of rows) across identical fields in different tables. AS Null columns are used as fillers.
SELECT e.emp_no,e.first_name,e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees e
WHERE e.last_name = 'Denis'
UNION
SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
FROM dept_manager dm
ORDER BY emp_no DESC;
