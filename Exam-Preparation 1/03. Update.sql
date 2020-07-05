
 --03. Update

 UPDATE [Tickets]
    SET [Price] *= 1.13
  WHERE [FlightId] = (SELECT [Id]
                        FROM [Flights]
                       WHERE [Destination] = 'Carlsbad');



