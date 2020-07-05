
 --07. Most Reported Category
 
  SELECT [Issues].[Id]
		 ,CONCAT([Username],' : ', [Title]) AS [IssueAssignee]
    FROM [Issues]
	JOIN [Users] ON [Users].[Id] = [Issues].[AssigneeId]
ORDER BY [Issues].[Id] DESC
        ,[IssueAssignee] 
