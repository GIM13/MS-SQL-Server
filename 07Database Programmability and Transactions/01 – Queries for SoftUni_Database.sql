 
 --01. Employees with Salary Above 35000
CREATE PROC usp_GetEmployeesSalaryAbove35000 
    AS
     SELECT [FirstName] AS [First Name]
		        ,[LastName] AS [Last Name]
	   FROM [Employees] 
	  WHERE [Salary] > 35000;

 --02. Employees with Salary Above Number
CREATE PROC usp_GetEmployeesSalaryAboveNumber
            @number DECIMAL(18,4)  
    AS
     SELECT [FirstName] AS [First Name]
		   ,[LastName] AS [Last Name]
	   FROM [Employees] 
	  WHERE [Salary] >= @number;

 --03. Town Names Starting With
CREATE PROC usp_GetTownsStartingWith 
            @str NVARCHAR(400)
    AS
     SELECT [Name] AS [Town]
	   FROM [Towns] 
	  WHERE LEFT([Name],LEN(@str)) = @str;

 --04. Employees from Town
CREATE PROC usp_GetEmployeesFromTown  
            @townName NVARCHAR(400)
    AS
     SELECT [FirstName] AS [First Name]
		   ,[LastName] AS [Last Name]  
	   FROM [Towns] 
	   JOIN [Addresses] ON [Addresses].[TownID] = [Towns].[TownID]
	   JOIN [Employees] ON [Employees].[AddressID] = [Addresses].[AddressID]
	  WHERE [Towns].[Name] = @townName;

 --05. Salary Level Function
 CREATE FUNCTION ufn_GetSalaryLevel (@salary DECIMAL(18,4))
RETURNS VARCHAR(7)  
     AS  
  BEGIN
        RETURN (CASE
                     WHEN @salary < 30000  THEN 'Low'
                     WHEN @salary BETWEEN 30000 
					                  AND 50000 THEN 'Average'
                     WHEN @salary > 50000 THEN 'High'
                 END) 
    END;

 --06. Employees by Salary Level
CREATE PROC usp_EmployeesBySalaryLevel   
            @level NVARCHAR(7)
    AS
     SELECT [FirstName] AS [First Name]
		   ,[LastName] AS [Last Name]  
	   FROM [Employees] 
	  WHERE [dbo].[ufn_GetSalaryLevel]([Salary]) = @level;

 --07. Define Function
 CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(30), @word VARCHAR(70))
RETURNS BIT  
     AS  
  BEGIN
       DECLARE @cnt INT = 1;
	   DECLARE @result  INT = 1;

         WHILE @cnt <= LEN(@word) AND @result > 0
         BEGIN
		      DECLARE @char CHAR(1) = SUBSTRING(@word,@cnt,1);

              SET @result = CHARINDEX(@char, @setOfLetters)

              SET @cnt += 1;
          END;

        RETURN @result; 
    END;

 --08. Delete Employees and Departments
CREATE PROC usp_DeleteEmployeesFromDepartment 
            @departmentId INT

    AS     ALTER TABLE [Departments] 
	      ALTER COLUMN [ManagerID] INT NULL;

	       ALTER TABLE [Employees] 
	   DROP CONSTRAINT [FK_Employees_Departments];

	       ALTER TABLE [Employees] 
	   DROP CONSTRAINT [FK_Employees_Employees];

	       ALTER TABLE [EmployeesProjects]
	   DROP CONSTRAINT [FK_EmployeesProjects_Employees];

	       ALTER TABLE [Departments] 
	   DROP CONSTRAINT [FK_Departments_Employees];

           DELETE FROM [Employees] 
		         WHERE [DepartmentID] = @departmentId;

           DELETE FROM [Departments] 
		         WHERE [DepartmentID] = @departmentId;

           ALTER TABLE [Employees] 
	    ADD CONSTRAINT [FK_Employees_Departments]
           FOREIGN KEY ([DepartmentID]) REFERENCES [Departments]([DepartmentID]);
	 
           ALTER TABLE [Employees] WITH NOCHECK 
	    ADD CONSTRAINT [FK_Employees_Employees]
           FOREIGN KEY ([ManagerID]) REFERENCES [Employees]([EmployeeID]);
	 							  
	 	   ALTER TABLE [EmployeesProjects] WITH NOCHECK
	    ADD CONSTRAINT [FK_EmployeesProjects_Employees]
           FOREIGN KEY ([EmployeeID]) REFERENCES [Employees]([EmployeeID]);
	 									  
	 	   ALTER TABLE [Departments] 
	    ADD CONSTRAINT [FK_Departments_Employees]
           FOREIGN KEY ([ManagerID]) REFERENCES [Employees]([EmployeeID]);
	 
                SELECT COUNT([FirstName]) AS [Counter] 
	              FROM [Employees] 
	             WHERE [DepartmentID] = @departmentId;

  --21. Employees with Three Projects
    CREATE PROC usp_AssignProject
                @emloyeeId INT
			   ,@projectID INT
        AS BEGIN TRANSACTION

				   INSERT INTO [EmployeesProjects]
                   VALUES (@emloyeeId, @projectID);

                   IF (SELECT COUNT([EmployeeID])
	                     FROM [EmployeesProjects] 
	                    WHERE [EmployeeID] = @emloyeeId) > 3
                      BEGIN
                           ROLLBACK
                           RAISERROR('The employee has too many projects!', 16, 1)
                           RETURN
                       END;
           COMMIT;

 --22. Delete Employees
 CREATE TABLE [Deleted_Employees]([EmployeeID] INT IDENTITY PRIMARY KEY
	                             ,[FirstName] NVARCHAR(50) NOT NULL
	                             ,[LastName] NVARCHAR(50) NOT NULL
	                             ,[MiddleName] NVARCHAR(50) NULL
	                             ,[JobTitle] NVARCHAR(50) NOT NULL
	                             ,[DepartmentID] INT NOT NULL
	                             ,[Salary] DECIMAL(15,2) NOT NULL);

 CREATE TRIGGER tr_InsertsDeletedEmployees
     ON [Employees]
    FOR DELETE 
     AS INSERT INTO [Deleted_Employees]
             SELECT [FirstName]
				   ,[LastName]
				   ,[MiddleName]
				   ,[JobTitle]
				   ,[DepartmentID]
				   ,[Salary]
			   FROM deleted;
								 