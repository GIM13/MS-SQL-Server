
 --06. Reports & Categories
 
  SELECT [Description]
        ,[Name] AS [CategoryName]
    FROM [Reports]
	JOIN [Categories] ON [Categories].[Id] = [Reports].[CategoryId]
ORDER BY [Description]
        ,[CategoryName]

