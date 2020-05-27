
CREATE TABLE Majors(MajorID int NOT NULL PRIMARY KEY
			       ,[Name] nvarchar(50) NOT NULL);
--------------------------------------------
CREATE TABLE Students(StudentID int NOT NULL PRIMARY KEY
					  ,StudentNumber int NOT NULL
			          ,StudentName nvarchar(50) NOT NULL
					  ,MajorID int FOREIGN KEY REFERENCES Majors(MajorID));
--------------------------------------------
CREATE TABLE Subjects(SubjectID int NOT NULL PRIMARY KEY
			         ,SubjectName nvarchar(50) NOT NULL);
--------------------------------------------
CREATE TABLE Payments(PaymentID int NOT NULL PRIMARY KEY
                     ,PaymentDate datetime2 NOT NULL
			         ,PaymentAmount decimal(15,2) NOT NULL
				     ,StudentID int FOREIGN KEY REFERENCES Students(StudentID));
--------------------------------------------
CREATE TABLE Agenda(StudentID int FOREIGN KEY REFERENCES Students(StudentID)
			       ,SubjectID int FOREIGN KEY REFERENCES Subjects(SubjectID)
				   ,CONSTRAINT PK_Agenda PRIMARY KEY (StudentID,SubjectID));