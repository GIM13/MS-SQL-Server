
 --07. Passenger Trips
 
  SELECT CONCAT( [FirstName],' ', [LastName]) AS [Full Name]
        ,[Origin]
		,[Destination]
    FROM [Passengers]
	JOIN [Tickets] ON [PassengerId] = [Passengers].[Id]
	JOIN [Flights] ON [FlightId] = [Flights].[Id]
ORDER BY [Full Name] 
        ,[Origin]
		,[Destination]
