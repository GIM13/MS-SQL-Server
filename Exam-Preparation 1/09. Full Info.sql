
 --09. Full Info

  SELECT CONCAT([FirstName],' ', [LastName]) AS [Full Name]
        ,[Name] AS [Plane Name]
		,CONCAT([Origin], ' - ', [Destination]) AS [Trip]
		,[Type] AS [Luggage Type]
    FROM [Passengers]
	JOIN [Tickets] ON [Tickets].[PassengerId] = [Passengers].[Id]
	JOIN [Flights] ON [Tickets].[FlightId] = [Flights].[Id]
	JOIN [Planes] ON [Flights].[PlaneId] = [Planes].[Id]
	JOIN [Luggages] ON [Tickets].[LuggageId] = [Luggages].[Id]
	JOIN [LuggageTypes] ON [Luggages].[LuggageTypeId] = [LuggageTypes].[Id]
ORDER BY [Full Name]
        ,[Plane Name]
        ,[Origin]
		,[Destination]
		,[Luggage Type]