
 --03. Update

 UPDATE [Reports]
    SET [CloseDate] = FORMAT(GETDATE(), 'yyyy-MM-dd')
  WHERE [CloseDate] IS NULL OR [CloseDate] = '';


