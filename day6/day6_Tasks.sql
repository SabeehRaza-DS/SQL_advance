USE SQL_day6;

-- 6.1 List all the scientists' names, their projects' names, 
SELECT Sc.SSN, Sc.Name, Ass.Project, Pr.Name AS Project_Name
FROM Scientists Sc
JOIN AssignedTo Ass
	ON Sc.SSN = Ass.Scientist
JOIN Projects Pr
	ON Ass.Project = Pr.Code;
    
-- and the hours worked by that scientist on each project,
SELECT Sc.SSN, Sc.Name, Ass.Project, Pr.Name AS Project_Name, Pr.Hours
FROM Scientists Sc
JOIN AssignedTo Ass
	ON Sc.SSN = Ass.Scientist
JOIN Projects Pr
	ON Ass.Project = Pr.Code;

-- in alphabetical order of project name, then scientist name.
SELECT Sc.SSN, Sc.Name, Ass.Project, Pr.Name AS Project_Name, Pr.Hours
FROM Scientists Sc
JOIN AssignedTo Ass
	ON Sc.SSN = Ass.Scientist
JOIN Projects Pr
	ON Ass.Project = Pr.Code
ORDER BY Project_Name, Sc.Name;

-- 6.2 Select the project names which are not assigned yet
SELECT Code, Name
FROM Projects
WHERE Code NOT In (SELECT Project FROM AssignedTo);