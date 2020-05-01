CREATE DATABASE Movies;
	--
CREATE TABLE Directors (
             Id int NOT NULL PRIMARY KEY,
             DirectorName nvarchar(50) NOT NULL, 
             Notes nvarchar(max));

 INSERT INTO Directors (Id, DirectorName, Notes)
      VALUES (1, 'S', 'Norway'),
             (3, 'Sta', null),
	         (5, 'Stava', null),
	         (7, 'Stavang', 'Nor'),
	         (9, 'Stavanger', '');
	--   
CREATE TABLE Genres(
             Id int NOT NULL PRIMARY KEY,
             GenreName nvarchar(50) NOT NULL, 
             Notes nvarchar(max));

 INSERT INTO Genres(Id, GenreName, Notes)
      VALUES (1, 'S', 'Norway'),
             (3, 'Sta', null),
	         (5, 'Stava', null),
	         (7, 'Stavang', 'Nor'),
	         (9, 'Stavanger', '');
	--
CREATE TABLE Categories(
             Id int NOT NULL PRIMARY KEY,
             CategoryName nvarchar(50) NOT NULL, 
             Notes nvarchar(max));

 INSERT INTO Categories(Id, CategoryName, Notes)
      VALUES (1, 'S', 'Norway'),
             (3, 'Sta', null),
	         (5, 'Stava', null),
	         (7, 'Stavang', 'Nor'),
	         (9, 'Stavanger', '');
	--
CREATE TABLE Movies(
             Id int NOT NULL PRIMARY KEY,
             Title nvarchar(50) NOT NULL,
			 DirectorId int FOREIGN KEY REFERENCES Directors(Id),
             CopyrightYear date NOT NULL,
			 [Length] time NOT NULL,
			 GenreId int FOREIGN KEY REFERENCES Genres(Id),
			 CategoryId int FOREIGN KEY REFERENCES Categories(Id), 
			 Rating int, 
			 Notes nvarchar(max));

 INSERT INTO Movies(Id, 
                    Title,
					DirectorId,
					CopyrightYear,
                    [Length], 
					GenreId, 
					CategoryId, 
					Rating, 
					Notes)
      VALUES (1, 'Sssss', 1, '2020-02-02', '02:22:02', 3, 3, 20, 'sdfgh'),
             (2, 'Ssytys', 3, '2020-02-02', '02:22:02', 7, 5, 6, 'sdfgh'),
	         (3, 'Sst', 7, '2020-02-02', '02:22:02', 1, 5, 77, 'sd'),
	         (4, 'ttss', 1, '2020-02-02', '02:22:02', 5, 9, 7, null),
	         (5, ';lk', 5, '2020-02-02', '02:22:02', 9, 9, null, '');
