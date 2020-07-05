
 --05.
 
  SELECT CONCAT([FirstName], ' ',[LastName]) AS [Mechanic]
        ,[Status]
        ,[IssueDate]
    FROM [Mechanics]
	JOIN [Jobs] ON  [Jobs].[MechanicId] = [Mechanics].[MechanicId]
ORDER BY [Mechanics].[MechanicId]
        ,[IssueDate]
		,[JobId]

