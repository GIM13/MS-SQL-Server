
 --11. Vacation

 CREATE FUNCTION udf_CalculateTickets(@origin NVARCHAR(50)
                                     ,@destination NVARCHAR(50)
									 ,@peopleCount INT)
 RETURNS NVARCHAR(50)
      AS  
   BEGIN DECLARE @price DECIMAL(15,2) = (SELECT CAST([Price] AS decimal(15,2))
                                           FROM [Flights]
                                           JOIN [Tickets] ON [Tickets].[FlightId] = [Flights].[Id]
		                                  WHERE [Origin] = @origin AND [Destination] = @destination);
 
		 IF (@peopleCount <= 0) RETURN 'Invalid people count!';

	     IF (@price IS NULL) RETURN 'Invalid flight!';                       

         RETURN CONCAT('Total price ' , @price * @peopleCount);
     END;
