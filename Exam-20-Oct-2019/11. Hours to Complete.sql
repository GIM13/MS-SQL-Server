
 --11. Hours to Complete

 CREATE FUNCTION udf_HoursToComplete(@StartDate DATETIME
                                    ,@EndDate DATETIME) 
 RETURNS INT
      AS  
   BEGIN 
		 IF (@StartDate IS NULL) RETURN 0;

	     IF (@EndDate IS NULL) RETURN 0;                       

         RETURN DATEDIFF(hour, @StartDate, @EndDate);
     END;
