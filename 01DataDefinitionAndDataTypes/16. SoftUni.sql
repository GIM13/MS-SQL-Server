CREATE DATABASE SoftUni;
	--1
CREATE TABLE Towns(
             Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
             [Name] nvarchar(50) NOT NULL);

 INSERT INTO Towns([Name])
      VALUES ('Name a'),
             ('Name b'),
	         ('Name c');
	--2 
CREATE TABLE Addresses(
             Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
             AddressText nvarchar(400) NOT NULL, 
			 TownId int FOREIGN KEY REFERENCES Towns(Id));

 INSERT INTO Addresses(AddressText, TownId)
      VALUES ('AddressText 1', 1),
             ('AddressText 2', 2),
	         ('AddressText 3', 3);
	--3
CREATE TABLE Departments(
             Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
             [Name] nvarchar(50) NOT NULL);

 INSERT INTO Departments([Name])
      VALUES ('Name a'),
             ('Name b'),
	         ('Name c');
	--4
CREATE TABLE Employees(
             Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
             FirstName nvarchar(50) NOT NULL,
			 MiddleName nvarchar(50) NOT NULL,
			 LastName nvarchar(50) NOT NULL,
			 JobTitle nvarchar(50) NOT NULL,
             DepartmentId int FOREIGN KEY REFERENCES Departments(Id),
			 HireDate date NOT NULL,
			 Salary decimal(10,2),
			 AddressId int FOREIGN KEY REFERENCES Addresses(Id));

 INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle,
                       DepartmentId, HireDate, Salary, AddressId)
      VALUES ('FirstName a', 'MiddleName a','LastName a','JobTitle a', 1, '2020-04-04', 4000, 1),
             ('FirstName b', 'MiddleName b','LastName b','JobTitle b', 2, '2020-04-04', 4000, 2),
	         ('FirstName c', 'MiddleName a','LastName c','JobTitle c', 3, '2020-04-04', 4000, 3);