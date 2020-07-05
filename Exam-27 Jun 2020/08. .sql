
 --08.
 
   SELECT [Available]
     FROM (   SELECT DISTINCT CONCAT([FirstName], ' ',[LastName]) AS [Available]
                             ,[Mechanics].[MechanicId] AS [MechanicId]
                FROM [Mechanics]
           LEFT JOIN [Jobs] ON [Jobs].[MechanicId] = [Mechanics].[MechanicId]
               WHERE [Status] = 'Finished' OR [Status] = NULL) AS A
 ORDER BY [MechanicId]
