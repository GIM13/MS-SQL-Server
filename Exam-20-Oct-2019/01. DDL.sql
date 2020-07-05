 --00
CREATE DATABASE [Service];

 --01DDL
    --1
 CREATE TABLE [Users]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[Username] NVARCHAR(30) NOT NULL UNIQUE 
					  ,[Password] NVARCHAR(50) NOT NULL 
					  ,[Name] NVARCHAR(50)
			          ,[Birthdate] DATETIME2
			          ,[Age] INT NOT NULL CHECK (Age BETWEEN 14 AND 110)
					  ,[Email] NVARCHAR(50) NOT NULL);

	--2 
CREATE TABLE [Departments]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                          ,[Name] NVARCHAR(30) NOT NULL);


	--3
CREATE TABLE [Employees]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                        ,[FirstName] NVARCHAR(25)
			            ,[LastName] NVARCHAR(25)
			            ,[Birthdate] DATETIME2
			            ,[Age] INT CHECK (Age BETWEEN 18 AND 110)
			            ,[DepartmentId] INT FOREIGN KEY REFERENCES [Departments](Id));

	--4
CREATE TABLE [Categories]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                         ,[Name] NVARCHAR(50) NOT NULL
						 ,[DepartmentId]  INT NOT NULL FOREIGN KEY REFERENCES [Departments](Id));

	--5
CREATE TABLE [Status]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[Label] NVARCHAR(30) NOT NULL);

	--6
CREATE TABLE [Reports]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[CategoryId] INT NOT NULL FOREIGN KEY REFERENCES [Categories](Id)
					  ,[StatusId] INT NOT NULL FOREIGN KEY REFERENCES [Status](Id)
                      ,[OpenDate] DATETIME2 NOT NULL
			          ,[CloseDate] DATETIME2
			          ,[Description] NVARCHAR(200) NOT NULL 
			          ,[UserId] INT NOT NULL FOREIGN KEY REFERENCES [Users](Id)
			          ,[EmployeeId] INT FOREIGN KEY REFERENCES [Employees](Id));

	