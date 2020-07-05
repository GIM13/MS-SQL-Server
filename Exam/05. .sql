
 --05.
 
  SELECT [FirstName]
        ,[LastName]
        ,FORMAT([BirthDate], 'MM-dd-yyyy') AS [BirthDate]
        ,[Name] AS [Hometown]
		,[Email]
    FROM [dbo].[Accounts]
	JOIN [dbo].[Cities] ON  [CityId] = [dbo].[Cities].[Id]
   WHERE [Email] LIKE 'e%'
ORDER BY [Hometown]

