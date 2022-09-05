--List the following details of each employee: employee number, last name, first name, sex, and salary.


SELECT
    e.emp_no,
    first_name,
    last_name,
    sex,
	salary
FROM
    employees e
LEFT JOIN salaries s
    ON e.emp_no = s.emp_no ;
	
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
    dm.dept_no,
    dept_name,
    dm.emp_no,
    last_name,
	first_name
FROM
    dept_manager dm
INNER JOIN departments d
    ON dm.dept_no = d.dept_no 
INNER JOIN employees e
    ON dm.emp_no = cast(e.emp_no as integer) ;
	
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM
    dept_manager dm
INNER JOIN departments d
    ON dm.dept_no = d.dept_no 
INNER JOIN employees e
    ON dm.emp_no = cast(e.emp_no as integer) ;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name, sex
from employees
where first_name = 'Hercules' and Last_name like 'B%'


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM
    dept_manager dm
INNER JOIN departments d
    ON dm.dept_no = d.dept_no 
INNER JOIN employees e
    ON dm.emp_no = cast(e.emp_no as integer)

WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM
    dept_manager dm
INNER JOIN departments d
    ON dm.dept_no = d.dept_no 
INNER JOIN employees e
    ON dm.emp_no = cast(e.emp_no as integer)

WHERE d.dept_name in ('Sales','Development');

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order
SELECT distinct last_name, count (*) as cnt
FROM employees
Group by last_name 
order by cnt desc;
	