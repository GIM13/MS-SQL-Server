
 --01. Records’ Count
 SELECT COUNT([ID]) AS [Count]
   FROM [WizzardDeposits]

 --02. Longest Magic Wand
 SELECT MAX([MagicWandSize]) AS [LongestMagicWand]
   FROM [WizzardDeposits]

 --03. Longest Magic Wand per Deposit Groups
  SELECT [DepositGroup]
        ,MAX([MagicWandSize]) AS [LongestMagicWand]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup]

 --04. Smallest Deposit Group per Magic Wand Size
  SELECT TOP(2) [DepositGroup]
    FROM (  SELECT [DepositGroup] 
                  ,AVG([MagicWandSize]) AS [Avg]
              FROM [WizzardDeposits]
          GROUP BY [DepositGroup]) AS AA
ORDER BY [Avg]

 --05. Deposits Sum
  SELECT [DepositGroup] 
        ,SUM([DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup]

 --06. Deposits Sum for Ollivander Family
  SELECT [DepositGroup] 
        ,SUM([DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup],[MagicWandCreator]
  HAVING [MagicWandCreator] = 'Ollivander family'

 --07. Deposits Filter
  SELECT [DepositGroup] 
        ,SUM([DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup],[MagicWandCreator]
  HAVING [MagicWandCreator] = 'Ollivander family'
     AND SUM([DepositAmount]) < 150000
ORDER BY [TotalSum]DESC

 --08. Deposit Charge
  SELECT [DepositGroup]
        ,[MagicWandCreator]
        ,MIN([DepositCharge]) AS [MinDepositCharge]
    FROM [WizzardDeposits]
GROUP BY [DepositGroup],[MagicWandCreator]
ORDER BY [MagicWandCreator]
        ,[DepositGroup]

 --09. Age Groups
  SELECT [AgeGroup]
        , COUNT([AgeGroup]) AS [WizardCount]
    FROM (SELECT (CASE
 					WHEN 0 <= [Age] AND [Age] <= 10 THEN '[0-10]'
 					WHEN 11 <= [Age] AND [Age] <= 20 THEN '[11-20]'
 					WHEN 21 <= [Age] AND [Age] <= 30 THEN '[21-30]'
 					WHEN 31 <= [Age] AND [Age] <= 40 THEN '[31-40]'
 					WHEN 41 <= [Age] AND [Age] <= 50 THEN '[41-50]'
 					WHEN 51 <= [Age] AND [Age] <= 60 THEN '[51-60]'
 					ELSE '[61+]'
                  END) AS [AgeGroup]
            FROM [WizzardDeposits]) AS AAAA
GROUP BY [AgeGroup]

 --10. First Letter
  SELECT SUBSTRING([FirstName], 1, 1) AS [FirstLetter]
    FROM [WizzardDeposits]
GROUP BY LEFT([FirstName],1),[DepositGroup]
  HAVING [DepositGroup] = 'Troll Chest'
ORDER BY [FirstLetter]

 --11. Average Interest
  SELECT [DepositGroup]
        ,[IsDepositExpired]
        ,AVG([DepositInterest]) AS [AverageInterest]
    FROM [WizzardDeposits]
   WHERE [DepositStartDate] > '1985- 01-01'
GROUP BY [DepositGroup],[IsDepositExpired]
ORDER BY [DepositGroup] DESC
        ,[IsDepositExpired]

 --12. Rich Wizard, Poor Wizard
  DECLARE @i INT = 1;
  DECLARE @number INT;
  DECLARE @sum DECIMAL(15,2) = 0;

  SELECT @number = COUNT([FirstName]) 
    FROM [WizzardDeposits];

   WHILE @i < @number
         BEGIN
              DECLARE @wizard1 DECIMAL(15,2) = (SELECT [DepositAmount]
                                                  FROM [WizzardDeposits]
									             WHERE [Id] = @i);
              DECLARE @wizard2 DECIMAL(15,2) = (SELECT [DepositAmount]
                                                  FROM [WizzardDeposits]
									             WHERE [Id] = @i + 1);
              SET @sum += @wizard1 - @wizard2;

              SET @i += 1;
         END;

 SELECT @sum AS [SumDifference];

 -- SELECT SUM(DIFF) 
 -- FROM (SELECT DepositAmount - (SELECT DepositAmount 
 --                                 FROM WizzardDeposits AS h
 --								 WHERE h.Id = g.Id + 1) AS DIFF 
 --        FROM WizzardDeposits AS g) AS XX;

 -- SELECT SUM(hw.DepositAmount - gw.DepositAmount) AS[SumDifference]
 -- FROM  WizzardDeposits AS hw,WizzardDeposits AS gw
 -- WHERE gw.id - hw.id = 1;