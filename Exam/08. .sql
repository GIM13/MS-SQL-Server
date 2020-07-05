
 --08.
 
   SELECT TOP(10)[Cities].[Id]
                ,[Name] AS [City]
				,[CountryCode] AS [Country]
				,COUNT([Cities].[Id]) AS [Accounts]
     FROM [Cities]
     JOIN [Accounts] ON [Cities].[Id] = [CityId]
 GROUP BY [Cities].[Name], [Cities].[Id], [CountryCode]
 ORDER BY [Accounts] DESC
