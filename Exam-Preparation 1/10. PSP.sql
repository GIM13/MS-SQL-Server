
 --10. PSP

    SELECT [Name]
          ,[Seats]
          ,[Passengers Count]
      FROM [Planes] AS A
	  JOIN (  SELECT [Planes].[Id]
		            ,COUNT([Tickets].[PassengerId]) AS [Passengers Count]
                FROM [Planes]
           FULL JOIN [Flights] ON [Planes].[Id] = [Flights].[PlaneId]
           FULL JOIN [Tickets] ON [Tickets].[FlightId] = [Flights].[Id]
            GROUP BY [Planes].[Id]) AS [Passengers Count] ON A.[Id] = [Passengers Count].[Id]
  ORDER BY [Passengers Count] DESC
          ,[Name]
          ,[Seats]