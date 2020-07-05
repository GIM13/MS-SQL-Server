
 --09.

   SELECT [Accounts].[Id]
         ,[Email]
		 ,[Cities].[Name] AS [City]
		 ,COUNT([TripId]) AS [Trips]
     FROM [Accounts]
	 JOIN [Cities] ON [CityId] = [Cities].[Id]
     JOIN [AccountsTrips] ON [Accounts].[Id] = [AccountId] 
	 JOIN [Trips] ON [TripId] = [Trips].[Id]
     JOIN [Rooms] ON [Rooms].[Id] = [RoomId]
     JOIN [Hotels] ON [Hotels].[Id] = [HotelId]
	WHERE [Accounts].[CityId] = [Hotels].[CityId]
 GROUP BY [Accounts].[Id],[Email],[Cities].[Name]
 ORDER BY [Trips] DESC
         ,[Accounts].[Id]