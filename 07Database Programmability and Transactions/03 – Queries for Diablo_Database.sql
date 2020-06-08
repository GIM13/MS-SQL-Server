   
 --13. *Cash in User Games Odd Rows
  CREATE FUNCTION ufn_CashInUsersGames  
                 (@gameName  NVARCHAR(70))
 RETURNS TABLE 
      AS  
  RETURN ( SELECT SUM([Cash]) AS [SumCash]
             FROM ( SELECT ROW_NUMBER() OVER (ORDER BY [Cash] DESC) 
                                 AS [Row#]
                          ,[Cash]
                      FROM [Games] 
                      JOIN [UsersGames] ON [GameId] = [Games].[Id]
                     WHERE [Games].[Name] = @gameName) AS AA
            WHERE [Row#] % 2 != 0);

 --