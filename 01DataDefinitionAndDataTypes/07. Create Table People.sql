CREATE TABLE People (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(200) NOT NULL,
    Picture VARBINARY(2000) NOT NULL,
    Height DECIMAL(3,2) NULL,
    [Weight] DECIMAL(5,2),
	Gender CHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX),
    CHECK (Gender ='f' OR Gender ='m')
);
INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ( 'Tom', 0111000, 1.7, 105, 'm','2020-01-01','aaaaaaaaaaaaaaaaaaaaa');

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ( 'fom', 0111010, 1.74, 105.55, 'f','2020-01-01','bbbbbbbbb');

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ( 'yyyyy', 0111000, 1, 1.0, 'f','2011-01-01','bbbbbaaaaaaaaa');

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ( 'hhhh', 0111010, 1.74, 105.55, 'f','2020-01-01','bbbbgffbb');

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ( 'mmmmm', 0111000, 1.8, 1.06, 'M','2011-01-01','bbbbbaa;aaaa');