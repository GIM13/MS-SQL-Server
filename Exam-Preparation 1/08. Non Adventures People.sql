
 --08. Non Adventures People
 
   SELECT [FirstName]
         ,[LastName]
         ,[Age]
     FROM [Passengers]
LEFT JOIN [Tickets] ON [PassengerId] = [Passengers].[Id]
    WHERE [PassengerId] IS NULL
 ORDER BY [Age] DESC
         ,[FirstName]
		 ,[LastName]
