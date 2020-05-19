CREATE TABLE Employees(
             Id int NOT NULL PRIMARY KEY,
             FirstName nvarchar(50) NOT NULL, 
			 LastName nvarchar(50) NOT NULL,
			 Title nvarchar(50) NOT NULL,
             Notes nvarchar(max));

 INSERT INTO Employees(Id, FirstName, LastName, Title, Notes)
      VALUES (1, 'Name a', 'LastName a','Title a', 'Notes a'),
             (2, 'Name b', 'LastName b','Title b', 'Notes b'),
	         (3, 'Name c', 'LastName c','Title c', 'Notes c');
	--2 
CREATE TABLE Customers(
             AccountNumber int NOT NULL PRIMARY KEY,
             FirstName nvarchar(50) NOT NULL, 
			 LastName nvarchar(50) NOT NULL,
			 PhoneNumber int NOT NULL,
			 EmergencyName nvarchar(50) NOT NULL,
			 EmergencyNumber int NOT NULL,
			 Notes nvarchar(max));

 INSERT INTO Customers(AccountNumber, 
                       FirstName, 
					   LastName, 
					   PhoneNumber, 
					   EmergencyName, 
					   EmergencyNumber, 
					   Notes)
      VALUES (1, 'FirstName a', 'LastName a', 08881, 'EmergencyName a', 088811,'Notes a'),
             (2, 'FirstName b', 'LastName b', 08882, 'EmergencyName b', 088822,'Notes b'),
	         (3, 'FirstName c', 'LastName c', 08883, 'EmergencyName c', 088833,'Notes c');
	--3
CREATE TABLE RoomStatus(
			 RoomStatus nvarchar(50) NOT NULL,
             Notes nvarchar(max));

 INSERT INTO RoomStatus(RoomStatus, Notes)
      VALUES ('RoomStatus 1', 'Notes 1'),
             ('RoomStatus 2', 'Notes 2'),
	         ('RoomStatus 3', 'Notes 3');
	--4
CREATE TABLE RoomTypes(
			 RoomTypes nvarchar(50) NOT NULL,
             Notes nvarchar(max));

 INSERT INTO RoomTypes(RoomTypes, Notes)
      VALUES ('RoomTypes 1', 'Notes 1'),
             ('RoomTypes 2', 'Notes 2'),
	         ('RoomTypes 3', 'Notes 3');
	--5
CREATE TABLE BedTypes(
			 BedTypes nvarchar(50) NOT NULL,
             Notes nvarchar(max));

 INSERT INTO BedTypes(BedTypes, Notes)
      VALUES ('BedTypes 1', 'Notes 1'),
             ('BedTypes 2', 'Notes 2'),
	         ('BedTypes 3', 'Notes 3');
	--6
CREATE TABLE Rooms(
             RoomNumber int NOT NULL PRIMARY KEY,
             RoomType nvarchar(50) NOT NULL,
			 BedType nvarchar(50) NOT NULL,
			 Rate decimal(5,2) NOT NULL, 
			 RoomStatus nvarchar(50) NOT NULL,
			 Notes nvarchar(max));

 INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
      VALUES (1, 'RoomType 1', 'BedType 1', 22.22, 'RoomStatus 1','Notes 1'),
             (2, 'RoomType 2', 'BedType 2', 33.22, 'RoomStatus 2','Notes 2'),
	         (3, 'RoomType 3', 'BedType 3', 44.22, 'RoomStatus 3','Notes 3');
	--7
CREATE TABLE Payments(
             Id int NOT NULL PRIMARY KEY,
			 EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
			 PaymentDate datetime2 NOT NULL,
			 AccountNumber int FOREIGN KEY REFERENCES Customers(AccountNumber),
			 FirstDateOccupied datetime2 NOT NULL,
			 LastDateOccupied datetime2 NOT NULL,
			 TotalDays int NOT NULL,
			 AmountCharged decimal(5,2) NOT NULL,
			 TaxRate decimal(5,2) NOT NULL,
			 TaxAmount decimal(5,2) NOT NULL,
			 PaymentTotal decimal(5,2) NOT NULL,
			 Notes nvarchar(max));

 INSERT INTO Payments(Id, EmployeeId, PaymentDate, AccountNumber, 
                      FirstDateOccupied, LastDateOccupied,TotalDays,
					  AmountCharged, TaxRate,TaxAmount, PaymentTotal, Notes)
      VALUES (1, 1, '2020-02-02', 1,'2020-02-07', '2020-02-09', 2,100.1, 2.2, 5.55, 107.85,'Notes 1'),
             (2, 2, '2020-02-02', 2,'2020-02-07', '2020-02-09', 2,100.1, 2.2, 5.55, 107.85,'Notes 2'),
	         (3, 3, '2020-02-02', 3,'2020-02-07', '2020-02-09', 2,100.1, 2.2, 5.55, 107.85,'Notes 3');
	--8
CREATE TABLE Occupancies(
             Id int NOT NULL PRIMARY KEY,
			 EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
			 DateOccupied datetime2 NOT NULL,
			 AccountNumber int FOREIGN KEY REFERENCES Customers(AccountNumber),
			 RoomNumber int FOREIGN KEY REFERENCES Rooms(RoomNumber),
             RateApplied decimal(5,2) NOT NULL,
			 PhoneCharge decimal(5,2) NOT NULL,
			 Notes nvarchar(max));

 INSERT INTO Occupancies(Id, EmployeeId, DateOccupied, AccountNumber, 
                         RoomNumber, RateApplied, PhoneCharge, Notes)
      VALUES (1, 1, '2020-02-02', 1, 1, 2.2, 5.55, 'Notes 1'),
             (2, 2, '2020-02-02', 2, 2, 2.2, 5.55, 'Notes 2'),
	         (3, 3, '2020-02-02', 3, 3, 2.2, 5.55, 'Notes 3');