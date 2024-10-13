CREATE DATABASE Payroll_Management_System;
USE Payroll_Management_System;


CREATE TABLE employee (
    emp_id INT PRIMARY KEY CHECK (emp_id > 0),
    position_id INT NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100),
    phoneNo VARCHAR(15),
    age INT CHECK (age > 0)
);

-- Position Table (needed for foreign key in employee and basePay)
CREATE TABLE positionn (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(100)
);



-- Base Pay Table
CREATE TABLE basePay (
    basePay_id INT PRIMARY KEY CHECK (basePay_id > 0),
    type VARCHAR(1) NOT NULL DEFAULT 'H', 
    amount INT NOT NULL CHECK (amount > 0), 
    position_id INT NOT NULL,
    FOREIGN KEY (position_id) REFERENCES positionn(position_id) ON DELETE CASCADE
);


CREATE TABLE allowance (
    allowance_id INT PRIMARY KEY CHECK (allowance_id > 0),
    description VARCHAR(100),
    amount INT NOT NULL CHECK (amount > 0)
);

CREATE TABLE deductions (
    deduction_id INT PRIMARY KEY CHECK (deduction_id > 0),
    description VARCHAR(100),
    amount INT NOT NULL CHECK (amount > 0)
);

CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY CHECK (payroll_id > 0),
    emp_id INT NOT NULL,
    allow_id INT,
    deduc_id INT,
    basePay_id INT NOT NULL,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    netPay INT NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY(allow_id) REFERENCES allowance(allowance_id),
    FOREIGN KEY(deduc_id) REFERENCES deductions(deduction_id),
    FOREIGN KEY(basePay_id) REFERENCES basePay(basePay_id)
);

SELECT * FROM  payroll;


INSERT INTO positionn (position_id, position_name) VALUES (1, 'Manager');
INSERT INTO positionn (position_id, position_name) VALUES (2, 'Engineer');
INSERT INTO positionn (position_id, position_name) VALUES (3, 'Technician');
INSERT INTO positionn (position_id, position_name) VALUES (4, 'Analyst');
INSERT INTO positionn (position_id, position_name) VALUES (5, 'Developer');
INSERT INTO positionn (position_id, position_name) VALUES (6, 'HR Manager');


INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (1, 2, 'Rahul', 'Sharma', '1234 6 ave Surrey', 'rahul@gmail.com', '7513497852', 25);
INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (2, 1, 'Mandeep', 'Kaur', '18354 96 st Cloverdale', 'mandeep@gmail.com', '2523497852', 33);
INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (3, 3, 'Vijay', 'Khanna', '18282 181A st Surrey', 'vijay@yahoo.com', '6048993497', 28);
INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (4, 5, 'Deepak', 'Verma', '9823 55 st Vancouver', 'deepak@gmail.com', '6047895231', 27);
INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (5, 4, 'Neha', 'Singh', '1478 8 ave Surrey', 'neha@gmail.com', '7784598321', 26);
INSERT INTO employee (emp_id, position_id, fname, lname, address, email, phoneNo, age) 
VALUES (6, 6, 'Amit', 'Pandey', '2289 3 st Cloverdale', 'amit@company.com', '6049373929', 35);




INSERT INTO basePay (basePay_id, type, amount, position_id) VALUES (1, 'H', 20, 2); -- Hourly wage for Engineer
INSERT INTO basePay (basePay_id, type, amount, position_id) VALUES (2, 'S', 3000, 1); -- Fixed salary for Manager
INSERT INTO basePay (basePay_id, type, amount, position_id) VALUES (3, 'H', 25, 5); -- Hourly wage for Developer
INSERT INTO basePay (basePay_id, type, amount, position_id) VALUES (4, 'S', 3500, 4); -- Fixed salary for Analyst
INSERT INTO basePay (basePay_id, type, amount, position_id) VALUES (5, 'S', 4500, 6); -- Fixed salary for HR Manager




INSERT INTO allowance (allowance_id, description, amount) 
VALUES (1, 'Housing Allowance', 500);
INSERT INTO allowance (allowance_id, description, amount) 
VALUES (2, 'Travel Allowance', 300);
INSERT INTO allowance (allowance_id, description, amount) 
VALUES (3, 'Food Allowance', 400);
INSERT INTO allowance (allowance_id, description, amount) 
VALUES (4, 'Bonus', 800);



INSERT INTO deductions (deduction_id, description, amount) 
VALUES (1, 'Health Insurance Deduction', 100);
INSERT INTO deductions (deduction_id, description, amount) 
VALUES (2, 'Tax Deduction', 1200);
INSERT INTO deductions (deduction_id, description, amount) 
VALUES (3, 'Retirement Fund', 500);
INSERT INTO deductions (deduction_id, description, amount) 
VALUES (4, 'Medical Insurance', 300);


INSERT INTO payroll (payroll_id, emp_id, allow_id, deduc_id, basePay_id, dateFrom, dateTo, netPay) 
VALUES (1, 1, 1, 1, 1, '2023-01-01', '2023-01-15', 1500);
INSERT INTO payroll (payroll_id, emp_id, allow_id, deduc_id, basePay_id, dateFrom, dateTo, netPay) 
VALUES (2, 4, 2, 2, 3, '2023-01-01', '2023-01-15', 1250);
INSERT INTO payroll (payroll_id, emp_id, allow_id, deduc_id, basePay_id, dateFrom, dateTo, netPay) 
VALUES (3, 5, 3, 3, 4, '2023-01-01', '2023-01-15', 2200);
INSERT INTO payroll (payroll_id, emp_id, allow_id, deduc_id, basePay_id, dateFrom, dateTo, netPay) 
VALUES (4, 6, 4, 4, 5, '2023-01-01', '2023-01-15', 4000);


-- some sample queries

 -- update queries
  UPDATE employee SET position_id = 3 WHERE emp_id = 1;
  UPDATE basePay SET amount = 3500 WHERE basePay_id = 2;
  
 -- count employees
  SELECT COUNT(emp_id) FROM employee;
  SELECT * FROM employee WHERE age < 28;
  
 -- Employee Names and Positions:

	SELECT e.fname, e.lname, p.position_name 
	FROM employee e 
	LEFT JOIN positionn p ON e.position_id = p.position_id;

-- Net Pay for a Specific Employee:

	SELECT netPay FROM payroll WHERE emp_id = (SELECT emp_id FROM employee WHERE lname = 'Sharma');

-- Aggregate Queries
	-- Maximum Hourly Wage:

	SELECT MAX(amount) FROM basePay WHERE type = 'H';

	-- Minimum Fixed Salary:

	SELECT MIN(amount) FROM basePay WHERE type = 'S';
 
 -- Count Employees
SELECT COUNT(emp_id) FROM employee;

-- Employees Younger Than 28
SELECT * FROM employee WHERE age < 28;

-- Employee Names and Positions
SELECT e.fname, e.lname, p.position_name 
FROM employee e 
LEFT JOIN positionn p ON e.position_id = p.position_id;

-- Net Pay for a Specific Employee
SELECT netPay FROM payroll WHERE emp_id = (SELECT emp_id FROM employee WHERE lname = 'Sharma');

-- 4. **Aggregate Queries**

-- Maximum Hourly Wage
SELECT MAX(amount) FROM basePay WHERE type = 'H';

-- Minimum Fixed Salary
SELECT MIN(amount) FROM basePay WHERE type = 'S';

-- Average Salary of Employees
SELECT AVG(amount) AS avg_salary 
FROM basePay 
WHERE type = 'S';

-- Total Payroll for All Employees
SELECT SUM(netPay) AS total_payroll 
FROM payroll;

-- Find Employees with the Highest Salary
SELECT e.fname, e.lname, p.position_name, b.amount AS salary
FROM employee e 
JOIN basePay b ON e.position_id = b.position_id 
JOIN positionn p ON e.position_id = p.position_id
WHERE b.type = 'S' 
ORDER BY b.amount DESC 
LIMIT 1;

-- Find Employees with the Lowest Hourly Wage
SELECT e.fname, e.lname, b.amount AS hourly_wage
FROM employee e 
JOIN basePay b ON e.position_id = b.position_id 
WHERE b.type = 'H'
ORDER BY b.amount ASC 
LIMIT 1;

--  Date Range Queries

-- Net Pay for Employees in a Specific Date Range
SELECT e.fname, e.lname, pay.netPay 
FROM payroll pay
JOIN employee e ON pay.emp_id = e.emp_id 
WHERE pay.dateFrom >= '2023-01-01' AND pay.dateTo <= '2023-01-15';

--  More Queries

-- Update Salary for All Employees by 10%
UPDATE basePay 
SET amount = amount * 1.10;

-- Update Allowance for a Specific Employee
UPDATE allowance 
SET amount = 600 
WHERE allowance_id = 1;

-- Employees Over the Age of 30
SELECT * FROM employee 
WHERE age > 30;

-- Employees and Their Net Pay
SELECT e.fname, e.lname, p.position_name, pay.netPay 
FROM payroll pay 
JOIN employee e ON pay.emp_id = e.emp_id 
JOIN positionn p ON e.position_id = p.position_id;

-- Total Allowances Paid in a Month
SELECT SUM(amount) AS total_allowances 
FROM allowance;

-- Employee Names, Positions, and Payroll
SELECT e.fname, e.lname, p.position_name, pay.netPay 
FROM payroll pay
JOIN employee e ON pay.emp_id = e.emp_id 
JOIN positionn p ON e.position_id = p.position_id;



