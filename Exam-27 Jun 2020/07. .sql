
 --07.
 
   SELECT CONCAT([FirstName], ' ',[LastName]) AS [Mechanic]
		 ,CAST(AVG(DATEDIFF(day, [IssueDate], [FinishDate])) AS int) AS [Average Days]
     FROM [Mechanics]
LEFT JOIN [Jobs] ON [Jobs].[MechanicId] = [Mechanics].[MechanicId]
    WHERE [FinishDate] IS NOT NULL
 GROUP BY [Mechanics].[MechanicId],[FirstName],[LastName]
 ORDER BY [Mechanics].[MechanicId]
