 
 --09. Find Full Name
CREATE PROC usp_GetHoldersFullName 
    AS
     SELECT [FirstName] + ' ' + [LastName] AS [Full Name] 
	   FROM [AccountHolders];

 --10. People with Balance Higher Than
  CREATE PROC usp_GetHoldersWithBalanceHigherThan   
            @num DECIMAL(15,2)
      AS
  SELECT [First Name]
        ,[Last Name]
    FROM (   SELECT [FirstName] AS [First Name]
        		   ,[LastName] AS [Last Name] 
        		   ,SUM([Balance]) AS [SumBalance]
          	   FROM [AccountHolders]
          	   JOIN [Accounts] ON [Accounts].[AccountHolderId] = [AccountHolders].[Id]
           GROUP BY [FirstName], [LastName]) AS AA
   WHERE [SumBalance] > @num
ORDER BY [First Name], [Last Name];

 --11. Future Value Function
 CREATE FUNCTION ufn_CalculateFutureValue  
                 (@SUM DECIMAL(17,4)
                 ,@yearlyInterestRate FLOAT
			     ,@years INT)
 RETURNS DECIMAL(17,4) 
      AS  
   BEGIN
         RETURN (@SUM * POWER((1+@yearlyInterestRate),@years)) 
     END;

 --12. Calculating Interest
   CREATE PROC usp_CalculateFutureValueForAccount    
               @accountId INT
			  ,@yearlyInterestRate FLOAT
      AS
          SELECT [Accounts].[Id] AS [Account Id]
        	    ,[FirstName] AS [First Name]
                ,[LastName] AS [Last Name] 
                ,[Balance] AS [Current Balance]
        		,[dbo].[ufn_CalculateFutureValue]([Balance],@yearlyInterestRate,5)
        		 AS [Balance in 5 years]
           FROM [AccountHolders]
           JOIN [Accounts] ON [Accounts].[AccountHolderId] = [AccountHolders].[Id]
          WHERE [Accounts].[Id] = @accountId;

 --14. Create Table Logs
-- CREATE TABLE [Logs] ([LogId] INT IDENTITY
--                     ,[AccountId] INT
--				       ,[OldSum] DECIMAL(15,2)
--				       ,[NewSum] DECIMAL(15,2));

 CREATE TRIGGER tr_NewEntryIntoTheLogs
     ON [Accounts] 
    FOR INSERT, UPDATE 
     AS INSERT INTO [Logs] 
             VALUES ((SELECT [Id]
			            FROM deleted) 
			        ,(SELECT [Balance]
			            FROM deleted) 
			        ,(SELECT [Balance]
			            FROM inserted));

 --15. Create Table Emails
-- CREATE TABLE [NotificationEmails] ([Id] INT IDENTITY
--                                   ,[Recipient] INT
--				                   ,[Subject] NVARCHAR(700)
--				                   ,[Body] NVARCHAR(MAX));

 CREATE TRIGGER tr_CreateNewEmail 
     ON [Logs] 
    FOR INSERT
     AS INSERT INTO [NotificationEmails] 
             VALUES ((SELECT [AccountId]
			            FROM [Logs])
					,CONCAT('Balance change for account: '
					        ,(SELECT [AccountId]
			                    FROM inserted))
					,CONCAT('On '
					        ,(FORMAT(GETDATE(),'MMM dd yyyy hh:mmtt'))
					        ,' your balance was changed from '
							,(SELECT [OldSum]
			                    FROM inserted)
							,' to '
							,(SELECT [NewSum]
			                     FROM inserted)
						    ,'.'));

 --16. Deposit Money
  CREATE PROC usp_DepositMoney 
              @accountId INT
			 ,@moneyAmount DECIMAL(17,4) 
      AS IF @moneyAmount > 0 
	          UPDATE [Accounts]
                 SET [Balance] += @moneyAmount
               WHERE [Accounts].[Id] = @accountId;

 --17. Withdraw Money Procedure
  CREATE PROC usp_WithdrawMoney  
              @accountId INT
			 ,@moneyAmount DECIMAL(17,4) 
      AS IF @moneyAmount > 0 
	          UPDATE [Accounts]
                 SET [Balance] -= @moneyAmount
               WHERE [Accounts].[Id] = @accountId;

 --18. Money Transfer
  CREATE PROC usp_TransferMoney  
              @senderId INT
			 ,@receiverId INT
			 ,@moneyAmount DECIMAL(17,4) 
      AS BEGIN TRANSACTION
                  EXEC usp_WithdrawMoney  @senderId, @moneyAmount ;
                 
                  -- IF @@ROWCOUNT != 1
                  --    BEGIN
                  --         ROLLBACK
                  --         RAISERROR('Invalid withdraw transfer!', 16, 1)
                  --         RETURN
                  --     END;
		         
		          EXEC usp_DepositMoney  @receiverId, @moneyAmount ;
                 
                  -- IF @@ROWCOUNT != 1
                  --    BEGIN
                  --         ROLLBACK
                  --         RAISERROR('Invalid deposit transfer!', 16, 1)
                  --         RETURN
                  --     END;
          COMMIT;

