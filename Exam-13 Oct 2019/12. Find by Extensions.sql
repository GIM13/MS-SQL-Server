
 --12. Find by Extensions

CREATE PROC usp_FindByExtension(@extension NVARCHAR(20)) 
    AS
	     SELECT [Id]
	           ,[Name]
		       ,CONCAT([Size],'KB') AS [Size]
		   FROM [Files]
		  WHERE RIGHT([Name], LEN(@extension)) = @extension
	   ORDER BY [Id]
	           ,[Name]
			   ,[Size] DESC; 