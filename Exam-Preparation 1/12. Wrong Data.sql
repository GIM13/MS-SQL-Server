
 --12. Wrong Data

CREATE PROC usp_CancelFlights 
    AS
       UPDATE [Flights]
          SET [DepartureTime] = NULL, [ArrivalTime] = NULL
        WHERE [DepartureTime] < [ArrivalTime];
 -------------- Wrong Judge--^^^--------
 ---------------------------------------
