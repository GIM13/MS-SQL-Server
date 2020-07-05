
 --10. Full Info

      SELECT IIF((CONCAT([FirstName],' ', [LastName])) = ' '
	            , 'None'
				,CONCAT([FirstName],' ', [LastName])) AS [Employee]
            ,IIF([Departments].[Name] IS NULL
	            , 'None'
				,[Departments].[Name]) AS [Department]
    		,[Categories].[Name] AS [Category]
    		,[Description]
    		,FORMAT([OpenDate], 'dd.MM.yyyy') AS [OpenDate]
    		,[Label] AS [Status]
    		,[Users].[Name] AS [User]
        FROM [Employees]
   FULL JOIN [Reports] ON [Reports].[EmployeeId] = [Employees].[Id]
   FULL JOIN [Departments] ON [Employees].[DepartmentId] = [Departments].[Id]
   FULL JOIN [Categories] ON [Categories].[Id] = [Reports].[CategoryId]
   FULL JOIN [Status] ON [Reports].[StatusId] = [Status].[Id]
        JOIN [Users] ON [Reports].[UserId] = [Users].[Id]
    ORDER BY [FirstName] DESC
            ,[LastName] DESC
            ,[Department]
    		,[Category]
    		,[Description]
    		,[OpenDate]
    		,[Status]
    		,[User]