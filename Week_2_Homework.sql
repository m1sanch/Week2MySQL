-- I want to know how many employees with each title were born after 1965-01-01.
SELECT
	t.title,
	COUNT(*)
FROM 
	titles t
	INNER JOIN employees emp
	ON t.emp_no = emp.emp_no
WHERE 
	emp.birth_date > '1965-01-01'
GROUP BY
	t.title
ORDER BY
	COUNT(*) DESC
;





-- I want to know the average salary per title.
SELECT
	DISTINCT t.title,
	AVG(s.salary) AS 'Average Salary'
FROM 
	salaries s
	INNER JOIN titles t
	ON s.emp_no = t.emp_no    
GROUP BY
	t.title
ORDER BY
	AVG(s.salary) DESC
;



-- How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT
	dept.dept_name AS 'Department',
	SUM(s.salary) AS 'Total Money Spent'
FROM 
	salaries s
	INNER JOIN dept_emp depemp
	ON s.emp_no = depemp.emp_no
    INNER JOIN departments dept
    ON depemp.dept_no = dept.dept_no
WHERE
dept.dept_name = 'Marketing' AND
s.from_date > '1989-12-31' AND
s.from_date < '1993-01-01'
;


