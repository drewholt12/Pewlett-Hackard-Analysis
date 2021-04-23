-- deliverable 1 retirement_titles
SELECT  -- columns we want in new table
    e.emp_no, 
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles  -- name of new table
FROM employees as e  -- 1st table to join with alias
INNER JOIN titles as t  -- 2nd table to join with alias and join type
ON (e.emp_no = t.emp_no)  -- column that is equal between the 2 tables
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')  -- only those born between these dates
ORDER BY e.emp_no;  --setting the order in ascending

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, (de.to_date = '9999-01-01') DESC;

-- Retrieve employees by most recent job title about to retire
SELECT COUNT(title),
title
INTO retiring_table
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;