
--01. Employee Address
  SELECT TOP (5) [EmployeeID]
                ,[JobTitle]
				,[Addresses].[AddressID]
				,[AddressText] 
    FROM [Employees]
    JOIN [Addresses] 
	  ON [Addresses].[AddressID] = [Employees].[AddressID]
ORDER BY [Addresses].[AddressID];

 --02. Addresses with Towns
  SELECT TOP (50) [FirstName]
                 ,[LastName]
				 ,[Towns].[Name] AS [Town]
				 ,[AddressText] 
    FROM [Employees]
    JOIN [Addresses] 
	  ON [Addresses].[AddressID] = [Employees].[AddressID]
    JOIN [Towns]
	  ON [Addresses].[TownID] = [Towns].[TownID]
ORDER BY [FirstName]
        ,[LastName];

 --03. Sales Employees
  SELECT [EmployeeID]
         ,[FirstName]
         ,[LastName]
		 ,[Departments].[Name]AS [DepartmentName] 
    FROM [Employees]
    JOIN [Departments] 
	  ON [Employees].[DepartmentID] = [Departments].[DepartmentID]
   WHERE [Departments].[Name] = 'Sales'
ORDER BY [EmployeeID];

 --04. Employee Departments
  SELECT TOP(5)[EmployeeID]
              ,[FirstName]
              ,[Salary]
			  ,[Departments].[Name]AS [DepartmentName] 
    FROM [Employees]
    JOIN [Departments] 
	  ON [Employees].[DepartmentID] = [Departments].[DepartmentID]
   WHERE [Salary] > 15000
ORDER BY [Departments].[DepartmentID];

 --05. Employees Without Projects
   SELECT TOP (3) [Employees].[EmployeeID]
                 ,[FirstName]
     FROM [Employees]
FULL JOIN [EmployeesProjects]
	   ON [Employees].[EmployeeID] = [EmployeesProjects].[EmployeeID]
    WHERE [EmployeesProjects].[EmployeeID] IS NULL
 ORDER BY [Employees].[EmployeeID];

 --06. Employees Hired After
  SELECT [FirstName]
         ,[LastName]
		 ,[HireDate]
		 ,[Departments].[Name] AS [DeptName] 
    FROM [Employees]
    JOIN [Departments] 
	  ON [Employees].[DepartmentID] = [Departments].[DepartmentID]
   WHERE [HireDate] > '1999-01-01' AND [Departments].[Name] IN ('Sales', 'Finance')
ORDER BY [HireDate];

 --07. Employees With Project
  SELECT TOP (5) [Employees].[EmployeeID]
                ,[FirstName]
		        ,[Projects].[Name] AS [ProjectName] 
    FROM [Employees]
    JOIN [EmployeesProjects]
	  ON [Employees].[EmployeeID] = [EmployeesProjects].[EmployeeID]
    JOIN [Projects]
	  ON [EmployeesProjects].[ProjectID]= [Projects].[ProjectID]
   WHERE [StartDate] > '2002-08-13' AND [EndDate] IS NULL
ORDER BY [Employees].[EmployeeID];

 --08. Employee 24
   SELECT [Employees].[EmployeeID]
         ,[FirstName]
	 	 ,IIF([StartDate] < '2005-01-01', [Projects].[Name], NULL) AS [ProjectName] 
     FROM [Employees]
     JOIN [EmployeesProjects]
	   ON [Employees].[EmployeeID] = [EmployeesProjects].[EmployeeID]
     JOIN [Projects]
	   ON [EmployeesProjects].[ProjectID]= [Projects].[ProjectID]
    WHERE [Employees].[EmployeeID] = 24;

 --09. Employee Manager
   SELECT [Employee].[EmployeeID]
         ,[Employee].[FirstName]
		 ,[Employee].[ManagerID]
	 	 ,[Manager].[FirstName] AS [ManagerName] 
     FROM [Employees] AS [Employee]
         ,[Employees] AS [Manager]
    WHERE [Employee].[ManagerID] IN (3, 7)
	  AND [Manager].[EmployeeID] = [Employee].[ManagerID]
 ORDER BY [Employee].[EmployeeID];

 --10. Employees Summary
   SELECT TOP (50)[Employee].[EmployeeID]
                 ,[Employee].[FirstName] + ' ' + [Employee].[LastName] AS [EmployeeName]
	 	         ,[Manager].[FirstName] + ' ' + [Manager].[LastName] AS [ManagerName] 
		         ,[Departments].[Name] AS [DepartmentName]
     FROM [Employees] AS [Manager]
         ,[Employees] AS [Employee]
	 JOIN [Departments] 
	   ON [Employee].[DepartmentID] = [Departments].[DepartmentID]
    WHERE [Manager].[EmployeeID] = [Employee].[ManagerID]
 ORDER BY [Employee].[EmployeeID];

 --11. Min Average Salary
   SELECT TOP (1) AVG([Salary]) AS [MinAverageSalary]
     FROM [Employees] 
 GROUP BY [DepartmentID]
 ORDER BY [MinAverageSalary];


