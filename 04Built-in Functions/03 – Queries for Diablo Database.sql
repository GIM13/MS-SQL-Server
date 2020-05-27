   
 --14. Games From 2011 and 2012 Year
   SELECT TOP(50)[Name], FORMAT ([Start],'yyyy-MM-dd') AS [Start]
     FROM [Games]
    WHERE [Start] BETWEEN '2011-01-01' AND '2012-12-31'
 ORDER BY [Start]
         ,[Name];

 --15. User Email Providers
   SELECT [Username]
         ,SUBSTRING([Email], CHARINDEX('@', [Email]) + 1, 300) AS [Email Provider]
     FROM [Users] 
 ORDER BY [Email Provider]
         ,[Username];

 --16. Get Users with IPAddress Like Pattern
   SELECT [Username]
          ,[IpAddress] AS [IP Address]
     FROM [Users] 
    WHERE [IpAddress] LIKE '___.1%.%.___'
 ORDER BY [Username];

 --17. Show All Games with Duration
    SELECT [Name] AS [Game]
          , CASE
                WHEN FORMAT ([Start],'HH:MM') >= '00:00' AND FORMAT ([Start],'HH:MM') < '12:00' THEN 'Morning'
                WHEN CAST([Start] AS time) >= '12:00' AND CAST([Start] AS time) < '18:00' THEN 'Afternoon'
                WHEN CAST([Start] AS time) >= '18:00' AND CAST([Start] AS time) <= '23:59' THEN 'Evening'
            END 
			 AS [Part of the Day]
		  ,CASE
               WHEN [Duration] <= 3 THEN 'Extra Short'
               WHEN [Duration] <= 6 THEN 'Short'
               WHEN [Duration] >  6 THEN 'Long'
               WHEN [Duration] IS NULL THEN 'Extra Long'
           END
		    AS [Duration]
     FROM [Games]
 ORDER BY [Game]
         ,[Duration]
		 ,[Part of the Day];