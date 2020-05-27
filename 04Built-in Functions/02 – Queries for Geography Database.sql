 
 --12. Countries Holding 'A'
   SELECT [CountryName], [IsoCode]
     FROM [Countries]
    WHERE [CountryName] LIKE '%A%A%A%'
 ORDER BY [IsoCode];

 --13. Mix of Peak and River Names
   SELECT [PeakName]
         ,[RiverName]
		 ,LOWER(STUFF([RiverName], 1, 1, [PeakName])) AS [Mix]
     FROM [Peaks]
	 JOIN [Rivers] ON RIGHT([PeakName], 1)
	                = LEFT([RiverName], 1)
 ORDER BY [Mix];
