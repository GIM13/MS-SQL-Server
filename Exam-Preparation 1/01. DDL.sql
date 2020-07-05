 --00
CREATE DATABASE Airport;

 --01DDL
    --1
 CREATE TABLE [Planes]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[Name] NVARCHAR(30) NOT NULL 
			          ,[Seats] INT NOT NULL
			          ,[Range] INT NOT NULL);

	--2 
CREATE TABLE [Flights]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[DepartureTime] DATETIME2
			          ,[ArrivalTime] DATETIME2
			          ,[Origin] NVARCHAR(50) NOT NULL 
			          ,[Destination] NVARCHAR(50) NOT NULL
			          ,[PlaneId] INT FOREIGN KEY REFERENCES [Planes](Id));

	--3
CREATE TABLE [Passengers]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                         ,[FirstName] NVARCHAR(30) NOT NULL
			             ,[LastName] NVARCHAR(30) NOT NULL
			             ,[Age] INT NOT NULL 
			             ,[Address] NVARCHAR(30) NOT NULL
			             ,[PassportId] NCHAR(11) NOT NULL);

	--4
CREATE TABLE [LuggageTypes]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                           ,[Type] NVARCHAR(30) NOT NULL);

	--5
CREATE TABLE [Luggages]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                       ,[LuggageTypeId] INT FOREIGN KEY REFERENCES [LuggageTypes](Id)
			           ,[PassengerId] INT FOREIGN KEY REFERENCES [Passengers](Id));

	--6
CREATE TABLE [Tickets]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[PassengerId] INT FOREIGN KEY REFERENCES [Passengers](Id)
			          ,[FlightId] INT FOREIGN KEY REFERENCES [Flights](Id)
			          ,[LuggageId] INT FOREIGN KEY REFERENCES [Luggages](Id)
			          ,[Price] DECIMAL(15,2) NOT NULL);

	--7

	--8
	