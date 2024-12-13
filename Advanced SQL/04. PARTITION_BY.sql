-- PARTITION BY
-- DIvide rows into groups to apply the function against(optional)

-- Get me department level avergae salary along with all employee details
SELECT *,
    AVG(salary) OVER (
        PARTITION BY d.dept_name
    )
FROM salaries
JOIN dept_emp as de USING(emp_no)
JOIN departments as d USING(dept_no)