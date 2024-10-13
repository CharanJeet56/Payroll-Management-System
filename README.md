# Payroll Management System

## Project Overview

The **Payroll Management System** is a comprehensive database-driven application designed to manage employee details, positions, payrolls, allowances, and deductions. It includes various functionalities to maintain and query employee data, calculate net pay, and generate reports on salary, allowances, and deductions. This system uses SQL queries to interact with a database and offers a variety of aggregate functions and date-range queries for effective payroll management.

## Features

- **Employee Management**: Add, update, and query employee details such as position, name, address, email, and age.
- **Position Management**: Manage different employee positions with associated pay rates.
- **Payroll Calculation**: Calculate net pay based on base pay, allowances, and deductions.
- **Allowances and Deductions**: Add, update, and retrieve allowances and deductions for employees.
- **Reports**: Generate reports such as:
  - Employees and their positions
  - Employee salaries and net pay
  - Aggregate values like maximum hourly wage, minimum salary, and total payroll
  - Employees in a specific date range

## Project Structure

- **Database Name**: `Payroll_Management_System`
- **Tables**:
  - `employee`: Stores employee details such as ID, position, name, address, etc.
  - `positionn`: Stores positions for employees (e.g., Manager, Engineer, etc.).
  - `basePay`: Stores salary or hourly wage details for each position.
  - `allowance`: Stores allowances (e.g., housing, travel, etc.).
  - `deductions`: Stores deductions (e.g., health insurance, tax, etc.).
  - `payroll`: Stores payroll records, including net pay and other details.

## Setup Instructions

### Prerequisites

- A MySQL or PostgreSQL database setup is required to run the queries and create the tables.

### Steps to Run the Project

1. **Clone the repository:**

   ```bash
   git clone https://github.com/charanjeet56/Payroll-Management-System.git
   ```

2. **Setup the database**:
   - Create a database using the following command:
   
     ```sql
     CREATE DATABASE Payroll_Management_System;
     ```

3. **Import tables and data**:
   - Run the SQL scripts provided in the repository to create the tables and populate them with sample data.

4. **Run Queries**:
   - Execute various SQL queries to manage the payroll, such as querying employee details, calculating net pay, and generating reports.

## Example Queries

### 1. **Find Net Pay for Employees in a Specific Date Range**:
```sql
SELECT e.fname, e.lname, pay.netPay
FROM payroll pay
JOIN employee e ON pay.emp_id = e.emp_id
WHERE pay.dateFrom >= '2023-01-01' AND pay.dateTo <= '2023-01-15';
```

### 2. **Maximum Hourly Wage**:
```sql
SELECT MAX(amount) 
FROM basePay 
WHERE type = 'H';
```

### 3. **Total Payroll for All Employees**:
```sql
SELECT SUM(netPay) AS total_payroll
FROM payroll;
```

## Technologies Used

- **Database**: MySQL / PostgreSQL
- **SQL**: For querying and database management
- **Version Control**: GitHub for version control and collaboration

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

**D Charan Jeet**  
[GitHub](https://github.com/charanjeet56) | [LinkedIn](https://www.linkedin.com/in/charan-jeeth-95bb0524a/)

---

Feel free to reach out if you have any questions or suggestions for improvements. Contributions are welcome!


### Steps to Include:

- Replace any placeholders like `charanjeeth56` with your actual GitHub username.
- Make sure the **Technologies Used** section matches your tech stack.
- Add any specific setup instructions you may need based on how you're storing and accessing the database.

Once you've added this to your repository, it will provide clear instructions for others to understand and work with your project.
