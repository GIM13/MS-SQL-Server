
 --08. Birthday Report
 
   SELECT [Username]
         ,[Categories].[Name] AS [CategoryName]
     FROM [Reports]
     JOIN [Categories] ON [Categories].[Id] = [Reports].[CategoryId]
	 JOIN [Users] ON [Users].[Id] = [Reports].[UserId]
    WHERE DAY([OpenDate]) = DAY([Birthdate]) AND MONTH([OpenDate]) = MONTH([Birthdate])
 ORDER BY [Username]
         ,[CategoryName]
