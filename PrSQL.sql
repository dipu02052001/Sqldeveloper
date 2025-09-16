create table managers (
    m_id int PRIMARY KEY,
    m_salary int NOT NULL,
    dept_id int,
    mag_name varchar(20) NOT NULL,
    hire_date date,
    emp_id int,
    commission int,
    location_id int,
    phone_number varchar(20) UNIQUE,
    email varchar(20) UNIQUE,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

select * from managers;

INSERT INTO managers (
    m_id, m_salary, dept_id, mag_name, hire_date, emp_id, commission, location_id, phone_number, email
) VALUES
(1, 70000, 30, 'Bob', '2022-06-01', 4, NULL, 103, '6789019345', 'bo1@example.com'),
(2, 40000, 20, 'Bob', '2022-02-01', 5, NULL, 102, '2345678901', 'bob200@example.com'),
(3, 45000, 10, 'Charlie', '2022-03-01', NULL, NULL, 101, '3456789012', 'charlie@exmpl.com'),
(4, 60000, 30, 'David', '2022-04-01', 2, NULL, 103, '4567890123', 'david@exampl.com'),
(5, 55000, 20, 'Eve', '2022-05-01', 2, NULL, 102, '5678901234', 'eve3@exmpal.com'),
(6, 70000, 30, 'Bob', '2022-06-01', 3, NULL, 103, '6789012345', 'bob@example.com');

create table employees (
    emp_id int PRIMARY KEY,
    salary int NOT NULL,
    dept_id int,
    emp_name varchar(20) NOT NULL,
    hire_date date,
    job_name varchar(20),
    manager_id int,
    commission int,
    location_id int,
    phone_number varchar(20) UNIQUE,
    email varchar(20) UNIQUE,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (
    emp_id, salary, dept_id, emp_name, hire_date, job_name, manager_id, commission, location_id, phone_number, email
) VALUES
(1,70000, 30, 'Bob', '2022-06-01', 'VP', NULL, NULL, 103, '6789019345', 'bo1@example.com');
(2, 40000, 20, 'Bob', '2022-02-01', 'Developer', 1, NULL, 102, '2345678901', 'bob@example.com'),
(3, 45000, 10, 'Charlie', '2022-03-01', 'Analyst', 1, NULL, 101, '3456789012', 'charlie@exmpl.com'),
(4, 60000, 30, 'David', '2022-04-01', 'Director', NULL, NULL, 103, '4567890123', 'david@exampl.com'),
(5, 55000, 20, 'Eve', '2022-05-01', 'Manager', 4, NULL, 102, '5678901234', 'eve3@exmpal.com'),
(6, 70000, 30, 'Bob', '2022-06-01', 'VP', NULL, NULL, 103, '6789012345', 'bob@example.com');
select * from employees;

SELECT MAX(salary) --AS SecondHighestSalary
FROM employees
WHERE salary <(SELECT MAX(salary) --AS SecondHighestSalary
FROM employees
WHERE salary < (SELECT MAX(salary) from employees));

--how to remove duplicate items from your table in postgresql
DELETE FROM employees
WHERE emp_id NOT IN (
    SELECT MIN(emp_id)
    FROM employees
    GROUP BY emp_name
);

Alter table employees RENAME
manager_id to m_id;


--retreive all the manager who earn more than employee
SELECT m.*
FROM managers m
WHERE m.m_salary > ALL (
    SELECT e.salary
    FROM employees e
    WHERE e.m_id = m.m_id
);