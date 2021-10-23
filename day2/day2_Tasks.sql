-- 2.1 Select the last name of all employees
SELECT LastName
FROM Employees;

-- 2.2 Select the last name of all employees, without duplicates
SELECT DISTINCT LastName
FROM Employees;

-- 2.3 Select all the data of employees whose last name is "Smith"
SELECT *
FROM Employees
WHERE LastName = 'Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe"
SELECT *
FROM Employees
WHERE LastName = 'Smith' OR LastName = 'Doe';

-- 2.5 Select all the data of employees that work in department 14
SELECT *
FROM Employees
WHERE Department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77
SELECT *
FROM Employees
WHERE Department = 37 OR Department = 77;

-- 2.7 Select all the data of employees whose last name begins with an "S"
SELECT *
FROM Employees
WHERE LastName LIKE 'S%';

-- 2.8 Select the sum of all the departments' budgets
SELECT SUM(Budget)
FROM Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees)
SELECT D.Name, E.Department, COUNT(D.Name) AS No_of_employee
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
GROUP BY D.Name, E.Department;

-- 2.10 Select all the data of employees, including each employee's department's data
SELECT *
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
HAVING D.Budget > 60000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments
SELECT Name, Budget
FROM Departments
WHERE Budget > (SELECT AVG(Budget) FROM Departments);

-- 2.14 Select the names of departments with more than two employees
SELECT D.Name, COUNT(E.Department) AS No_of_Emp
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
GROUP BY D.Name
Having COUNT(E.Department) > 2;

-- (ASK for 2nd option and also RANK()) 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget

-- Full list of Budgets
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
ORDER BY D.Budget asc;

-- Extracting 2nd lowest budget
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
WHERE D.Budget = (SELECT min(Budget) FROM Departments 
					WHERE Budget > (SELECT min(Budget) FROM Departments));

-- Extracting 3rd lowest budget 
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code
WHERE D.Budget = (SELECT min(Budget) FROM Departments 
					WHERE Budget > (SELECT min(Budget) FROM Departments 
									WHERE Budget > (SELECT min(Budget) FROM Departments)));

-- Discuss with Virginia
-- Using RANK() function, common table expressions(CTE)
SELECT E.Name, E.LastName, D.Name, D.Budget, D.Ranks
FROM Employees E 
JOIN (SELECT *, RANK() OVER (ORDER BY Budget) AS Ranks
  FROM Departments) D
ON E.Department = D.Code
WHERE Ranks = 2
ORDER BY D.Ranks;

-- DENSE_RANK
SELECT E.Name, E.LastName, D.Name, D.Budget, D.Ranks
FROM Employees E 
JOIN (SELECT *, DENSE_RANK() OVER (ORDER BY Budget) AS Ranks
  FROM Departments) D
ON E.Department = D.Code
-- WHERE Ranks = 2
ORDER BY D.Ranks;

-- TESTING START
SELECT Budget FROM Departments ORDER BY Budget;

SELECT Budget 
FROM Departments e1 
WHERE 2 = (SELECT COUNT(DISTINCT(Budget)) FROM Departments e2 WHERE e1.Budget >= e2.Budget);
-- TESTING END

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('847219811','Mary','Moore',11);

-- 2.17 Reduce the budget of all departments by 10%
SELECT *, (Budget - 0.1*Budget) AS Reduced_Budget
FROM Departments;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14)
SELECT *
FROM Employees
WHERE Department = REPLACE(Department, '77', '14');

-- 2.19 Delete from the table all employees in the IT department (code 14)
DELETE FROM Employees
WHERE Department = '14';

-- SELECT * FROM Employees;

-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000
DELETE E FROM Employees E
JOIN Departments D
	ON E.Department = D.Code 
WHERE Budget >= 60000;

-- Checking Employees List
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employees E
JOIN Departments D
	ON E.Department = D.Code;

-- 2.21 Delete from the table all employees