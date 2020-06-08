
 --13. Departments Total Salaries
   SELECT [DepartmentID]
        ,SUM([Salary]) AS [TotalSalary]
    FROM [Employees]
GROUP BY [DepartmentID]

 --14. Employees Minimum Salaries
   SELECT [DepartmentID]
        ,MIN([Salary]) AS [MinimumSalary]
    FROM [Employees]
   WHERE [DepartmentID] IN (2,5,7)
GROUP BY [DepartmentID]

 --15. Employees Average Salaries
  SELECT *
    INTO [Average_Salaries]
    FROM [Employees]
   WHERE [Salary] > 30000;

DELETE FROM [Average_Salaries] 
      WHERE [ManagerID] = 42;
	
 UPDATE [Average_Salaries]
    SET [Salary] += 5000
  WHERE [DepartmentID] = 1; 
  
  SELECT [DepartmentID]
        ,AVG([Salary]) AS [AverageSalary]
    FROM [Average_Salaries]
GROUP BY [DepartmentID];

 --16. Employees Maximum Salaries
  SELECT [DepartmentID]
        ,MAX([Salary]) AS [MaxSalary]
    FROM [Employees]
GROUP BY [DepartmentID]
  HAVING MAX([Salary]) NOT BETWEEN 30000 AND 70000; 

 --17. Employees Count Salaries
  SELECT COUNT(*) AS [Count]
    FROM [Employees]
   WHERE [ManagerID] IS NULL;

 --18. 3rd Highest Salary
  SELECT DISTINCT [DepartmentID]
        ,[Salary] AS [ThirdHighestSalary]
    FROM (  SELECT [DepartmentID]
                  ,[Salary]
		          ,DENSE_RANK() OVER(PARTITION BY [DepartmentID]
		                       ORDER BY [Salary] DESC) AS [Rank]
              FROM [Employees]) AS AA
   WHERE [Rank] = 3;

 --19. Salary Challenge
   SELECT TOP(10)[FirstName] 
                ,[LastName]
		        ,[DepartmentID]
	 FROM [Employees] AS A
    WHERE [Salary] > (SELECT AVG([Salary])
	                    FROM [Employees] AS B
                    GROUP BY [DepartmentID]
					  HAVING A.[DepartmentID] = B.[DepartmentID])
 ORDER BY [DepartmentID];