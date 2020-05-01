CREATE TABLE Users (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(30) NOT NULL,
    [Password]  VARCHAR(26) NOT NULL,
    ProfilePicture  VARBINARY(900),
    LastLoginTime TIME,
	IsDeleted BIT,
    CHECK (IsDeleted = 1 OR IsDeleted = 0)
);
INSERT INTO Users  (Username, [Password], ProfilePicture,  LastLoginTime, IsDeleted)
VALUES ( 'Tom','qwertyui', 0111000, '19:30:10',1);

INSERT INTO Users  (Username, [Password], ProfilePicture,  LastLoginTime, IsDeleted)
VALUES ( 'fom','qwertyui', 0111010, '19:30:10',1);

INSERT INTO Users  (Username, [Password], ProfilePicture,  LastLoginTime, IsDeleted)
VALUES ( 'yyyyy','qwertyui', 0111000, '19:30:10',0);

INSERT INTO Users ( Username, [Password], ProfilePicture,  LastLoginTime, IsDeleted)
VALUES ( 'hhhh','qwertyui', 0111010, '19:30:10',0);

INSERT INTO Users  (Username,[Password], ProfilePicture,  LastLoginTime, IsDeleted)
VALUES ( 'mmmmm','qwertyui', 0111000, '19:30:10',-0);