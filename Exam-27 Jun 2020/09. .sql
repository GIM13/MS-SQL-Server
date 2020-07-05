
 --09.

  SELECT [Jobs].[JobId]
        ,SUM([Price]) AS [Total]
    FROM [Jobs]
	JOIN [Orders] ON [Orders].[JobId] = [Jobs].[JobId]
	JOIN [OrderParts] ON [OrderParts].[OrderId] = [Orders].[OrderId]
	JOIN [Parts] ON [Parts].[PartId] = [OrderParts].[PartId]
   WHERE [Status] = 'Finished'
GROUP BY [Jobs].[JobId]
ORDER BY [Total] DESC
        ,[Jobs].[JobId]