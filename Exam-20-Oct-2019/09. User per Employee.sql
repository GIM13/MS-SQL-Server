
 --09. User per Employee

   SELECT CONCAT([FirstName], ' ', [LastName]) AS [FullName]
         ,[UsersCount]
     FROM [Employees] AS A
     JOIN (   SELECT [Employees].[Id]
                    ,COUNT([Reports].[UserId]) AS [UsersCount]
                FROM [Employees]
           LEFT JOIN [Reports] ON [Employees].[Id] = [Reports].[EmployeeId]
           LEFT JOIN [Users] ON [Users].[Id] = [Reports].[UserId]
            GROUP BY [Employees].[Id]
		  )  AS B ON A.[Id] = B.[Id]
 ORDER BY [UsersCount] DESC
         ,[FullName]