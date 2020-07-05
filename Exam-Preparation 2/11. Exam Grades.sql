
 --11. Exam Grades

 CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT
                                     ,@Date DATETIME2
									 ,@People INT) 
 RETURNS NVARCHAR(70)
      AS  
   BEGIN 
         DECLARE @HotelId INT = (SELECT [HotelId]
                                   FROM [Rooms]
								  WHERE [HotelId] = @HotelId);
		 IF ([Rooms].[HotelId] = @HotelId) 
		 RETURN 'Grade cannot be above 6.00!';

	     IF ((SELECT [Id]
		        FROM [Students]
			   WHERE [Id] = @studentId) IS NULL)
		 RETURN 'The student with provided id does not exist in the school!';                       

         RETURN CONCAT('You have to update '
		              ,(  SELECT COUNT(*)
		                    FROM [Students]
						    JOIN [StudentsExams] ON [StudentId] = [Id]
			               WHERE @grade <= [Grade] 
						         AND [Grade] <= (@grade + 0.5)
						         AND [Id] = @studentId
						GROUP BY [Id])
					  ,' grades for the student '
					  ,(SELECT [FirstName]
		                  FROM [Students]
						 WHERE [Id] = @studentId));
     END;
