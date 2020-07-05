 --00
--CREATE DATABASE [TripService];

 --01DDL
    --1
 CREATE TABLE [Cities]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[Name] NVARCHAR(20) NOT NULL
					  ,[CountryCode] NCHAR(2) NOT NULL);

	--2 
CREATE TABLE [Hotels]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[Name] NVARCHAR(30) NOT NULL 
					 ,[CityId] INT NOT NULL FOREIGN KEY REFERENCES [Cities](Id)
			         ,[EmployeeCount] INT NOT NULL
					 ,[BaseRate] DECIMAL(15,2));


	--3
CREATE TABLE [Rooms]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                    ,[Price] DECIMAL(15,2) NOT NULL
			        ,[Type] NVARCHAR(20) NOT NULL
			        ,[Beds] INT NOT NULL
			        ,[HotelId] INT NOT NULL FOREIGN KEY REFERENCES [Hotels](Id));

	--4
CREATE TABLE [Trips]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                    ,[RoomId] INT NOT NULL FOREIGN KEY REFERENCES [Rooms](Id)
                    ,[BookDate] DATETIME2 NOT NULL
                    ,[ArrivalDate] DATETIME2 NOT NULL 
                    ,[ReturnDate] DATETIME2 NOT NULL
			        ,[CancelDate] DATETIME2
					,CHECK([BookDate] < [ArrivalDate])
					,CHECK([ArrivalDate] < [ReturnDate]));

	--5
CREATE TABLE [Accounts] ([Id] INT NOT NULL IDENTITY PRIMARY KEY
                        ,[FirstName] NVARCHAR(50) NOT NULL  
				   	    ,[MiddleName] NVARCHAR(20)
					    ,[LastName] NVARCHAR(50) NOT NULL
						,[CityId]  INT NOT NULL FOREIGN KEY REFERENCES [Cities](Id)
			            ,[BirthDate] DATETIME2 NOT NULL
					    ,[Email] NVARCHAR(100) NOT NULL UNIQUE);

	--6
CREATE TABLE [AccountsTrips]([AccountId]  INT NOT NULL FOREIGN KEY REFERENCES [Accounts](Id)
						    ,[TripId]  INT NOT NULL FOREIGN KEY REFERENCES [Trips](Id)
                            ,[Luggage] INT NOT NULL CHECK([Luggage] > = 0)
							,CONSTRAINT PK_Accounts_Trips PRIMARY KEY ([AccountId],[TripId]));

	