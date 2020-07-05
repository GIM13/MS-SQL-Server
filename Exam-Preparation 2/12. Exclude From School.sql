
 --12. Exclude From School

CREATE PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
    AS 
	       DECLARE @hotelid INT = (SELECT H.Id
		                                 FROM Trips T
                                         JOIN Rooms R2 on T.RoomId = R2.Id
                                         JOIN Hotels H ON R2.HotelId = H.Id
                                        WHERE T.Id = @TripId )

           DECLARE @bed INT = ( SELECT R2.Beds
		                                 FROM Trips T
                                         JOIN Rooms R2 on T.RoomId = R2.Id
                                        WHERE T.Id = @TripId)


           DECLARE @hotel INT = (SELECT R.HotelId 
		                           FROM Rooms R
                                  WHERE Id = @TargetRoomId)

    DECLARE @room INT = (SELECT R2.Beds FROM Trips T
                                  JOIN Rooms R2 on T.RoomId = R2.Id
                                  JOIN Hotels H ON R2.HotelId = H.Id
                                 WHERE T.Id = @TargetRoomId)

    IF (@hotelid!=@hotel)
    THROW 50001, 'Target room is in another hotel!',1

    IF (@bed>@room)
    THROW 50002, 'Not enough beds in target room!',1

    UPDATE Trips
    SET [RoomId] = @TargetRoomId
    WHERE [Id] = @TripId