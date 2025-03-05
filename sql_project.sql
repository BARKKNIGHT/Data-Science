-- 1. Retrieve all details of employees
SELECT * FROM employees;

-- 2. Display the first name, last name, and email of all employees
SELECT first_name, last_name, email FROM employees;

-- 3. Retrieve the distinct job titles from the jobs table
SELECT DISTINCT job_title FROM jobs;

-- 4. Find the total number of employees in the company
SELECT COUNT(*) AS total_employees FROM employees;

-- 5. Retrieve the employees who were hired after January 1, 2015
SELECT * FROM employees WHERE hire_date > '2015-01-01';

-- 6. List all employees who have a salary greater than 5000
SELECT * FROM employees WHERE salary > 5000;

-- 7. Retrieve employees with job titles containing the word 'Manager'
SELECT e.*, j.job_title 
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title LIKE '%Manager%';

-- 8. Retrieve all employees whose first name starts with 'A' and ends with 'n'
SELECT * FROM employees WHERE first_name LIKE 'A%n';

-- 9. Display the employees who do not have a commission
SELECT * FROM employees WHERE commission_pct IS NULL OR commission_pct = 0;

-- 10. Retrieve the top 5 highest-paid employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- 11. Find the average salary of all employees
SELECT AVG(salary) AS average_salary FROM employees;

-- 12. Retrieve the total number of employees working in each department
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id;

-- 13. Display the employee's first name and the length of their first name
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- 14. Convert the hire_date of employees to display only the year
SELECT first_name, last_name, EXTRACT(YEAR FROM hire_date) AS hire_year 
FROM employees;

-- 15. Retrieve the minimum and maximum salary for each job title
SELECT j.job_title, MIN(e.salary) AS min_salary, MAX(e.salary) AS max_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title;

-- 16. Retrieve the employee names along with their department names
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 17. List the employees along with their job titles and the location of their department
SELECT e.first_name, e.last_name, j.job_title, l.city, l.country_id
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 18. Retrieve the department names along with the count of employees in each department
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 19. Find employees who have the same job as their manager
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.job_id = m.job_id;

-- 20. Display the names of employees who worked in different jobs in the past
SELECT DISTINCT e.first_name, e.last_name
FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE e.job_id != jh.job_id;
