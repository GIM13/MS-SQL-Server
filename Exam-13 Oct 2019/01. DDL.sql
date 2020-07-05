 --00
 -- CREATE DATABASE [Bitbucket];

 --01DDL
    --1
 CREATE TABLE [Users]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[Username] NVARCHAR(30) NOT NULL
					 ,[Password] NVARCHAR(30) NOT NULL
					 ,[Email] NVARCHAR(50) NOT NULL);

	--2 
CREATE TABLE [Repositories]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                           ,[Name] NVARCHAR(50) NOT NULL);


	--3
CREATE TABLE [RepositoriesContributors]([RepositoryId] INT NOT NULL FOREIGN KEY REFERENCES [Repositories](Id)
			                           ,[ContributorId] INT NOT NULL FOREIGN KEY REFERENCES [Users](Id)
									   ,CONSTRAINT PK_Repositories_Users PRIMARY KEY ([RepositoryId]
									                                                 ,[ContributorId]));
																		  
	--4
CREATE TABLE [Issues]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                     ,[Title] NVARCHAR(225) NOT NULL
					 ,[IssueStatus] NCHAR(6) NOT NULL
				     ,[RepositoryId]  INT NOT NULL FOREIGN KEY REFERENCES [Repositories](Id)
			         ,[AssigneeId] INT NOT NULL FOREIGN KEY REFERENCES [Users](Id));

	--5
CREATE TABLE [Commits]([Id] INT NOT NULL IDENTITY PRIMARY KEY
                      ,[Message] NVARCHAR(225) NOT NULL
					  ,[IssueId] INT FOREIGN KEY REFERENCES [Issues](Id)
			          ,[RepositoryId]  INT NOT NULL FOREIGN KEY REFERENCES [Repositories](Id)
			          ,[ContributorId] INT NOT NULL FOREIGN KEY REFERENCES [Users](Id));

	--6
CREATE TABLE [Files]([Id] INT NOT NULL IDENTITY PRIMARY KEY
			        ,[Name] NVARCHAR(100) NOT NULL
				    ,[Size] DECIMAL(15,2) NOT NULL  
			        ,[ParentId] INT  FOREIGN KEY REFERENCES [Files](Id)
			        ,[CommitId] INT NOT NULL FOREIGN KEY REFERENCES [Commits](Id));