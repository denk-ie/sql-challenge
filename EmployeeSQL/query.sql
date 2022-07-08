CREATE TABLE titles(
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR
);


CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title VARCHAR(5),
    birth_date VARCHAR(10),
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR(1),
    hire_date VARCHAR(10),
    FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE departments(
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE dept_manager(
    dept_no VARCHAR(4), 
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
    emp_no INT,
    dept_no VARCHAR(4),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
    emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT e.emp_no, last_name, first_name, sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date ~* '1986';

SELECT d.dept_no, d.dept_name, e.emp_no,
       e.last_name, e.first_name
FROM departments AS d
JOIN employees AS e
JOIN dept_manager AS m
ON e.emp_no = m.emp_no;