
 --07.
 
  SELECT [AccountId]
		,CONCAT([FirstName],' ', [LastName]) AS [FullName]
		,MAX(DATEDIFF(day, [ArrivalDate], [ReturnDate])) AS [LongestTrip]
		,MIN(DATEDIFF(day, [ArrivalDate], [ReturnDate])) AS [ShortestTrip]
    FROM [Trips]
	JOIN [AccountsTrips] ON [Trips].[Id] = [TripId]
	JOIN [Accounts] ON [Accounts].[Id] = [AccountId]
   WHERE [MiddleName] IS NULL
         AND [CancelDate] IS NULL
GROUP BY [AccountId],[FirstName],[LastName]
ORDER BY [LongestTrip] DESC
        ,[ShortestTrip] 
