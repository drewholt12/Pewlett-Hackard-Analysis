# Pewlett-Hackard-Analysis
# Overview
## Purpose
The company, Pewlett Hackard, has identified a possible issue where employees may begin retiring at or near the same time.  They are calling it a “silver tsunami”.  These jobs held high skill and experience value for the company.  The company wants to implement a mentorship program to pass along skills and experience to the employees who will take over from those that retire.  The company has asked us to identify the number of employees reaching retirement age, and begin to identify those that could participate in a mentorship program.  
## Software Used
QuickDBD
pgAdmin
SQL
Visual Studio Code
# Results
1.  The analysis began by creating a table for all retirement titles, called retirement_titles_1952_1955.  It was obvious that this list was not sufficient for this report.  This table included multiple entries for anyone who had more than one title during their employment.  It also included employees who were no longer employed.  A new list was required where these were eliminated.

![retirement_titles](https://user-images.githubusercontent.com/79231355/116002324-dcb2b280-a5be-11eb-826d-fafa5c562c16.png)

2. The second table created, called unique_titles_1952_1955.csv took the initial list but removed duplicate names and dates where the employee is no longer employed.  The result is a complete list of employees and titles who are currently employed with Pewlett-Hackard, and will be in the silver tsunami.   This table is large, so a summary seemed appropriate. 

![unique_titles](https://user-images.githubusercontent.com/79231355/116002372-0bc92400-a5bf-11eb-8875-55e4288b4baf.png)

3.  The third table created utilized the retiring_titles_1952_1955
.csv table to count the number of each job title in the silver tsunami.  This table is called retiring_titles.csv and shows which job titles will be the most affected.

![retiring_titles_1952_1955](https://user-images.githubusercontent.com/79231355/116002430-55197380-a5bf-11eb-8cbc-707e0a2ef042.png)

5.  The fourth table created is similar to unique_titles.csv.  This table is called mentorship_eligibility_1965
.csv.  The table includes the date the employee began working in a department in addition to title.  Only those whose birthday falls within the silver tsunami criteria is populated on this table.  Those in management were also removed from the mentorship table. 

![mentorship_eligibility_1965](https://user-images.githubusercontent.com/79231355/116002489-96118800-a5bf-11eb-9bab-65ab405839ad.png)

# Summary
•	How many roles will need to be filled as the "silver tsunami" begins to make an impact?  The total number of roles needing to be filled will be 90,398.  Another search from 1956 through the end of 1960 shows an additional 115,614 employees preparing for retirement.  This shows the mentorship program even more essential to retain any of the skills and experience with the new generation of employees.  A new table was created to illustrate this number called retiring_titles_1956_1960.csv.

![retiring_titles_1956_1960](https://user-images.githubusercontent.com/79231355/116002533-c6592680-a5bf-11eb-81d3-b4f2a3e5503c.png)

•	Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?  There are not enough current employees that meet the criteria set for the mentorship program.   1549 employees meet the current standards.  The limiting factor is the age of the employees identified for this program.  Those chosen were born in 1965.  It appears that the company wants to present an opportunity to utilize mentors for about 10 years prior to retirement.  This will not alleviate the issue.  Management should utilize all current employees for the membership program who are within 5 years of retirement, not limit to 10 years or more from retirement.  Some employees that are near retirement age may not be planning on retiring.  If a 5 year window is selected, the number of mentorship eligible employees moves to 93757, well above the number retiring during the silver tsunami.  The code should be amended  at the WHERE statement to include anyone born from 1960 through 1965.
-	Example-  WHERE (e.birth_date  BETWEEN '1960-01-01' AND '1965-12-31')  -- limiting to birth years between 1960 and 1965
	AND (de.to_date = '9999-01-01') -- limits to current employee date code
A new table was created for the increased number of eligible employees called mentorship_eligibility_1960_1965.csv.

![mentorship_eligibility_1960_1965](https://user-images.githubusercontent.com/79231355/116002628-48e1e600-a5c0-11eb-88f2-465842a7afda.png)
