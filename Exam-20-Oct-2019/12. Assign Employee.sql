
 --12. Assign Employee

CREATE PROC usp_AssignEmployeeToReport(@EmployeeId INT
									           ,@ReportId INT) 
    AS
	   DECLARE @EmployeeDepartmentId INT = (SELECT [DepartmentId]
				                              FROM [Employees]
			                                 WHERE [Employees].[Id] = @EmployeeId);

	   DECLARE @CategoriesDepartmentId INT = (SELECT [DepartmentId]
					                            FROM [Categories]
					                            JOIN [Reports] ON [CategoryId] = [Categories].[Id]
					                           WHERE [Reports].[Id] = @ReportId);

	     IF (@EmployeeDepartmentId != @CategoriesDepartmentId)
	        THROW  50005,'Employee doesn''t belong to the appropriate department!', 1;

       ELSE UPDATE [Reports]
               SET [EmployeeId] = @EmployeeId
             WHERE @EmployeeDepartmentId = @CategoriesDepartmentId; 