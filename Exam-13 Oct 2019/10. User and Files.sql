
 --10. User and Files

      SELECT [Username]
    		,AVG([Size]) AS [Size]
        FROM [Users]
        JOIN [Commits] ON [Commits].[ContributorId] = [Users].[Id]
        JOIN [Files] ON [Files].[CommitId] = [Commits].[Id]
    GROUP BY [Username]
    ORDER BY [Size] DESC
            ,[Username]