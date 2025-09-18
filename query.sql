-- Find employees who have not had a salary change in the last year
SELECT e.emp_id, e.emp_name
FROM employees e
LEFT JOIN salary_history sh ON e.emp_id = sh.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING MAX(sh.change_date) <= CURRENT_DATE - INTERVAL '1 year' OR MAX(sh.change_date) IS NULL;

-- Find the duplicate employee names
SELECT emp_name, COUNT(*)
FROM employees
GROUP BY emp_name
HAVING COUNT(*) > 1;