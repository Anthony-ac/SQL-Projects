USE employees_mod;

# Uses 3 tables to generate the number of employees per year per gender
SELECT 
	YEAR(d.from_date) AS calendar_year,
	e.gender AS gender,
	COUNT(e.emp_no) AS num_of_employees
FROM t_employees e
JOIN t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;

#selects the following columns and creates a column called active which returns 1 when the calendar year falls between the contracted dates
SELECT  ee.emp_no,
		ee.gender,
		d.dept_no,
        d.dept_name,
        dm.from_date, 
        dm.to_date, 
        e.calendar_year,
		CASE
        WHEN YEAR(dm.from_date) <= calendar_year AND YEAR(dm.to_date) >= calendar_year THEN 1 ELSE 0
        END AS active

#selects the fields above from the cross join and joins below
FROM
(SELECT YEAR(hire_date) AS calendar_year
	FROM t_employees
    WHERE hire_date >= 1990
    GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm # cross join takes all 11 year records and replicates them to match each row in the dm table
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

