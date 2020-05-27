CREATE TABLE Cities(CityID int NOT NULL PRIMARY KEY
			       ,[Name] nvarchar(50) NOT NULL);
--------------------------------------------
CREATE TABLE Customers(CustomerID int NOT NULL PRIMARY KEY
			          ,[Name] nvarchar(50) NOT NULL
					  ,Birhday date
					  ,CityID int FOREIGN KEY REFERENCES Cities(CityID));
--------------------------------------------
CREATE TABLE Orders(OrderID int NOT NULL PRIMARY KEY
			      ,CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID));
--------------------------------------------
CREATE TABLE ItemTypes(ItemTypeID int NOT NULL PRIMARY KEY
			          ,[Name] nvarchar(50) NOT NULL);
--------------------------------------------
CREATE TABLE Items(ItemID int NOT NULL PRIMARY KEY
			      ,[Name] nvarchar(50) NOT NULL
				  ,ItemTypeID int FOREIGN KEY REFERENCES ItemTypes(ItemTypeID));
--------------------------------------------
CREATE TABLE OrderItems(OrderID int FOREIGN KEY REFERENCES Orders(OrderID)
			           ,ItemID int FOREIGN KEY REFERENCES Items(ItemID)
					   ,CONSTRAINT PK_StudentsExams PRIMARY KEY (OrderID,ItemID));