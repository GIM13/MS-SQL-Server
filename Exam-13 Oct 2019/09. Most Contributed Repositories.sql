
 --09. Most Contributed Repositories

   SELECT TOP(5)[Repositories].[Id]
               ,[Name]
               ,COUNT([Repositories].[Id]) AS [Commits]
     FROM [Repositories]
     JOIN [Commits] ON [Repositories].[Id] = [Commits].[RepositoryId]
	 JOIN [RepositoriesContributors] ON [Repositories].[Id] = [RepositoriesContributors].[RepositoryId]
 GROUP BY [Repositories].[Id],[Name]
 ORDER BY [Commits] DESC
         ,[Repositories].[Id]
		 ,[Name]