
 --07. Most Reported Category
 
  SELECT TOP(5)[Name] AS [CategoryName]
		       ,COUNT([CategoryId]) AS [ReportsNumber]
    FROM [Reports]
	JOIN [Categories] ON [Categories].[Id] = [Reports].[CategoryId]
GROUP BY [CategoryId],[Name]
ORDER BY [ReportsNumber] DESC
        ,[CategoryName] 
