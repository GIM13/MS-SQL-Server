
 --06.
 
  SELECT [Cities].[Name]
        ,COUNT([Hotels].[Id]) AS [Hotels]
    FROM [Cities]
	JOIN [Hotels] ON [Cities].[Id] = [CityId]
GROUP BY [Cities].[Name]
ORDER BY [Hotels] DESC
        ,[Cities].[Name]

