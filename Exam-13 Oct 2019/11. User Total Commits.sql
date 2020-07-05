
 --11. User Total Commits

  CREATE FUNCTION udf_UserTotalCommits(@username NVARCHAR(30)) 
 RETURNS INT
      AS  
   BEGIN 
         RETURN (SELECT COUNT(*)
		           FROM [Commits]
				  WHERE [ContributorId] = (SELECT [Id]
				                              FROM [Users]
											 WHERE [Username] = @username));
     END;
