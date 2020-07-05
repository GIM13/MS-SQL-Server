
 --04. Delete
 
  DELETE FROM [Tickets]
   WHERE [FlightId] = (SELECT [Id]
                         FROM [Flights]
                        WHERE [Destination] = 'Ayn Halagim');;

  DELETE FROM [Flights]
   WHERE [Destination] = 'Ayn Halagim';

