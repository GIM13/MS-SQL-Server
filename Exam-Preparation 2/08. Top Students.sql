
 --08. Top Students
 
   SELECT TOP(10)[FirstName] AS [First Name]
                ,[LastName] AS [Last Name]
		        ,CAST((AVG([Grade])) AS DECIMAL(15,2))  AS [Grade]
     FROM [Students]
     JOIN [StudentsExams] ON [Id] = [StudentId]
 GROUP BY [Id],[FirstName],[LastName]
 ORDER BY [Grade] DESC
         ,[First Name]
		 ,[Last Name]
