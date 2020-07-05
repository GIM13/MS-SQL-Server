
 --06.
 
  SELECT CONCAT([FirstName], ' ',[LastName]) AS [Client]
        ,DATEDIFF(day, [IssueDate], '2017-04-24') AS [Days going]
		,[Status]
    FROM [Clients]
	JOIN [Jobs] ON [Jobs].[ClientId] = [Clients].[ClientId]
   WHERE [Status] != 'Finished'
ORDER BY [Days going] DESC
        ,[Clients].[ClientId]

