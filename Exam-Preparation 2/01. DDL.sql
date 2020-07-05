 --00
 --CREATE DATABASE [WMS];

 --01DDL
    --1
 CREATE TABLE [Clients] ([ClientId] INT NOT NULL IDENTITY PRIMARY KEY
                        ,[FirstName] VARCHAR(50)  NOT NULL
					    ,[LastName] VARCHAR(50) NOT NULL
					    ,[Phone] NCHAR(12) NOT NULL);

	--2 
CREATE TABLE [Mechanics]([MechanicId] INT NOT NULL IDENTITY PRIMARY KEY
                        ,[FirstName] VARCHAR(50) NOT NULL 
					    ,[LastName] VARCHAR(50) NOT NULL
					    ,[Address] VARCHAR(225) NOT NULL);


	--3
CREATE TABLE [Models]([ModelId] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[Name] VARCHAR(50) UNIQUE NOT NULL);

	--4
CREATE TABLE [Jobs] ([JobId] INT NOT NULL IDENTITY PRIMARY KEY
                    ,[ModelId] INT NOT NULL FOREIGN KEY REFERENCES [Models]([ModelId])
					,[Status] VARCHAR(11) NOT NULL DEFAULT 'Pending' CHECK ([Status] IN ('Pending', 'In Progress', 'Finished'))
				    ,[ClientId] INT NOT NULL FOREIGN KEY REFERENCES [Clients]([ClientId])
				    ,[MechanicId] INT NOT NULL FOREIGN KEY REFERENCES [Mechanics]([MechanicId])
				    ,[IssueDate] DATE NOT NULL
				    ,[FinishDate] DATE);

	--5
CREATE TABLE [Orders]([OrderId] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[JobId] INT NOT NULL FOREIGN KEY REFERENCES [Jobs]([JobId])
				     ,[IssueDate] DATE
					 ,[Delivered] BIT NOT NULL DEFAULT 0);

	--6
CREATE TABLE [Vendors]([VendorId] INT NOT NULL IDENTITY PRIMARY KEY
			          ,[Name] VARCHAR(50) UNIQUE NOT NULL);

    --7 
CREATE TABLE [Parts]([PartId] INT NOT NULL IDENTITY PRIMARY KEY
                    ,[SerialNumber] VARCHAR(50) NOT NULL UNIQUE
					,[Description] VARCHAR(255)
					,[Price] DECIMAL(15,2) NOT NULL CHECK([Price] > 0)
					,[VendorId]  INT NOT NULL FOREIGN KEY REFERENCES [Vendors]([VendoriD])
			        ,[StockQty]  INT NOT NULL DEFAULT 0 CHECK([StockQty] >= 0));

    --8
CREATE TABLE [OrderParts]([OrderId] INT NOT NULL FOREIGN KEY REFERENCES [Orders]([OrderId])
			             ,[PartId] INT NOT NULL FOREIGN KEY REFERENCES [Parts]([PartId])
			             ,[Quantity]  INT NOT NULL DEFAULT 1 CHECK([Quantity] > 0)
					     ,CONSTRAINT PK_Order_Parts PRIMARY KEY ([OrderId], [PartId]));

    --9
CREATE TABLE [PartsNeeded]([JobId] INT NOT NULL FOREIGN KEY REFERENCES [Jobs]([JobId])
			              ,[PartId] INT NOT NULL FOREIGN KEY REFERENCES [Parts]([PartId])
			              ,[Quantity]  INT NOT NULL DEFAULT 1 CHECK([Quantity] > 0)
					      ,CONSTRAINT PK_Parts_Needed PRIMARY KEY ([JobId], [PartId]));							   