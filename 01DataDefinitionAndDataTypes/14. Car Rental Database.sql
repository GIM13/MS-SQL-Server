CREATE DATABASE CarRental;
	--1
CREATE TABLE Categories(
             Id int NOT NULL PRIMARY KEY,
             CategoryName nvarchar(50) NOT NULL, 
             DailyRate decimal(7,2) NOT NULL,
			 WeeklyRate decimal(8,2) NOT NULL,
			 MonthlyRate decimal(9,2) NOT NULL,
			 WeekendRate decimal(8,2) NOT NULL);

 INSERT INTO Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
      VALUES (1, 'car', 22.22, 130.5,400, 40.17),
             (2, 'bus', 32.22, 200.5,750, 57.17),
	         (3, 'jeep',42.22, 300.5,1000, 75.17);
	--2 
CREATE TABLE Cars(   
             Id int NOT NULL PRIMARY KEY,
             PlateNumber nvarchar(10) NOT NULL, 
             Manufacturer nvarchar(50)NOT NULL,
			 Model nvarchar(50)NOT NULL,
			 CarYear date NOT NULL,
			 CategoryId int FOREIGN KEY REFERENCES Categories(Id),
			 Doors int NOT NULL,
			 Picture varbinary(max),
			 Condition nvarchar(max),
			 Available bit NOT NULL);

 INSERT INTO Cars(Id, 
                  PlateNumber, 
				  Manufacturer, 
				  Model,
				  CarYear, 
				  CategoryId,
				  Doors,
				  Picture, 
				  Condition, 
				  Available)
      VALUES (1, 'C 1234 V', 'volvo', 'S 80', '2007-04-13', 1, 4, 10001111,'good', 1),
             (2, 'C 2341 B', 'volvo', '440', '2007-04-13', 1, 5, 10111111,'good', 0),
	         (3, 'C 4321 T', 'volvo', 'C 30', '2007-04-13', 1, 3, 10001111,'good', 1);
	--3
CREATE TABLE Employees(
             Id int NOT NULL PRIMARY KEY,
             FirstName nvarchar(50) NOT NULL, 
			 LastName nvarchar(50) NOT NULL,
			 Title nvarchar(50) NOT NULL,
             Notes nvarchar(max));

 INSERT INTO Employees(Id, FirstName, LastName, Title, Notes)
      VALUES (1, 'Sisi', 'Aaaaa','queen','ala bala'),
             (2, 'Ani', 'Oooo','queen',''),
	         (3, 'Pipi', 'Eeee','queen', null);
	--4
CREATE TABLE Customers(
             Id int NOT NULL PRIMARY KEY,
             DriverLicenceNumber nvarchar(50) NOT NULL,
			 FullName nvarchar(50) NOT NULL,
			 [Address] nvarchar(50) NOT NULL, 
			 City nvarchar(50) NOT NULL,
			 ZIPCode nvarchar(10),
			 Notes nvarchar(max));

 INSERT INTO Customers(Id,
                       DriverLicenceNumber, 
					   FullName, 
					   [Address],
					   City, 
					   ZIPCode, 
					   Notes)
      VALUES (1, 'gtraegs463', 'deswfe', 'eeee', 't','123',''),
             (2, '45fasgg', 'gsdrr', 'uuuu', 'g', '43', ''),
	         (3, 'vfg54656t', 'tetq', 'iiiiii', 'b', '44322', '');
	--5
CREATE TABLE RentalOrders( 
             Id int NOT NULL PRIMARY KEY,
			 EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
			 CustomerId int FOREIGN KEY REFERENCES Customers(Id),
			 CarId int FOREIGN KEY REFERENCES Cars(Id),
			 TankLevel int NOT NULL,
			 KilometrageStart int NOT NULL,
			 KilometrageEnd int NOT NULL,
			 TotalKilometrage int NOT NULL,
			 StartDate date NOT NULL,
			 EndDate date NOT NULL,
			 TotalDays int NOT NULL,
			 RateApplied nvarchar(max) NOT NULL,
			 TaxRate decimal(5,2),
			 OrderStatus nvarchar(20) NOT NULL,
			 Notes nvarchar(max));

 INSERT INTO RentalOrders(Id,
                          EmployeeId, 
						  CustomerId, 
						  CarId, 
						  TankLevel, 
						  KilometrageStart, 
						  KilometrageEnd, 
						  TotalKilometrage, 
						  StartDate, 
						  EndDate, 
						  TotalDays, 
						  RateApplied, 
						  TaxRate, 
						  OrderStatus, 
						  Notes)
      VALUES (1, 1, 1, 1, 40, 100000, 103000, 3000,
	         '2020-02-02', '2020-02-12', 10,'from A to B', 4.7, 'active', ''),
             (2, 2, 2, 2, 30, 100000, 104000, 4000, 
			 '2020-02-02', '2020-02-12', 10,'from A to B', 4.7, 'active', 'ok'),
	         (3, 3, 3, 3, 30, 100000, 107000, 7000, 
			 '2020-02-02', '2020-02-12', 10,'from A to B', 4.7, 'active', null);