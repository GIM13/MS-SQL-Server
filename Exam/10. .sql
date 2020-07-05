
 --10.

   SELECT [Trips].[Id]
         ,CONCAT([FirstName]
                ,' '
				,[MiddleName]
				,IIF([MiddleName] IS NULL,'',' ')
				,[LastName]) AS [Full Name]
		 ,[Cities].[Name] AS [From]
		 ,(SELECT [Cities].[Name]
		     FROM [Cities]
		    WHERE [Hotels].[CityId] = [Cities].[Id]) AS [To]
		 ,IIF([CancelDate] IS NULL
		      ,CONCAT(DATEDIFF(day, [ArrivalDate], [ReturnDate]),'days')
			  ,'Canceled') AS [LongestTrip]
     FROM [Accounts]
	 JOIN [Cities] ON [CityId] = [Cities].[Id]
     JOIN [AccountsTrips] ON [Accounts].[Id] = [AccountId] 
	 JOIN [Trips] ON [TripId] = [Trips].[Id]
     JOIN [Rooms] ON [Rooms].[Id] = [RoomId]
     JOIN [Hotels] ON [Hotels].[Id] = [HotelId]
 ORDER BY [Full Name]
         ,[Trips].[Id]