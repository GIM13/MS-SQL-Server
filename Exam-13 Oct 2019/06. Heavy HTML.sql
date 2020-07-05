
 --06. Heavy HTML
 
  SELECT [Id]
        ,[Name] 
		,[Size]
    FROM [Files]
   WHERE [Size] > 1000 AND [Name] LIKE '%HTML%'
ORDER BY [Size] DESC
        ,[Name]

