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
