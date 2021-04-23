-- CHECK NUMBER OF PEOPLE WORKING BORN FOR EACH YEAR
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' and '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' and '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' and '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' and '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' and '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility set to a new table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

SELECT * FROM retirement_info;

DROP TABLE retirement_info
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables-- do not use-- wrong info
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining same as above, but with alias.  even though alias is used in the select portion, it is defined in the FROM and JOIN portion. 
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Left Join on retirement_info and dept_emp, creating new table for joined data
SELECT ri.emp_no,  -- which columns we want to see
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp  -- creates new table to hold data
FROM retirement_info as ri -- 1st table to join with alias
LEFT JOIN dept_emp as de  -- 2nd table to join, and how to join, with alias
ON ri.emp_no = de.emp_no  -- with these columns being the same in each table
WHERE de.to_date = ('9999-01-01');  -- sets criteria where only current employees show

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_ret_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY dept_no;

-- Checking all columns from salaries to identify if to_date aligns with any column in employees  which it doesn't
SELECT * FROM salaries
ORDER BY to_date DESC;

-- Build 1st table boss wants with employee info with salaries 
SELECT e.emp_no,  -- all the columns we want to see
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info  -- new table created to hold the new data
FROM employees as e  -- 1st table to use
INNER JOIN salaries as s  -- 2nd table to use and join type - only similar columns
on (e.emp_no = s.emp_no)  -- the columns that are equal
INNER JOIN dept_emp as de  -- joining 3rd table
ON (e.emp_no = de.emp_no)  -- column that are equal in all 3 tables
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- 2nd list - of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- 3rd List of department retireees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

DROP TABLE sales_info;  -- added to update code below
-- Skill drill- return list relevant to the sales team
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_info
FROM current_emp as ce
INNER JOIN dept_emp as de
on (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- Skill drill 2- 
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_dev_info
FROM current_emp as ce
INNER JOIN dept_emp as de
on (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');