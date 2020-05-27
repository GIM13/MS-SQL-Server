CREATE TABLE Passports(PassportID int NOT NULL PRIMARY KEY
			        ,PassportNumber nvarchar(50) NOT NULL);

 INSERT INTO Passports(PassportID, PassportNumber)
      VALUES (101, 'N34FG21B')
	        ,(102, 'K65LO4R7')
			,(103, 'ZE657QP2');
---------------------------------------------
CREATE TABLE Persons(PersonID int NOT NULL PRIMARY KEY
			        ,FirstName nvarchar(50) NOT NULL
			        ,Salary decimal(15,2)
			        ,PassportID int FOREIGN KEY REFERENCES Passports(PassportID));

 INSERT INTO Persons(PersonID, FirstName,  Salary, PassportID)
      VALUES (1, 'Roberto', 43300.00, 102)
	        ,(2, 'Tom', 56100.00, 103)
			,(3, 'Yana', 60200.00, 101);