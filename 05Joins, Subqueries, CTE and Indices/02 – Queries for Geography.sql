
 --12. Highest Peaks in Bulgaria
  SELECT [Countries].[CountryCode]
        ,[MountainRange]
		,[PeakName]
		,[Elevation]
    FROM [Countries]
    JOIN [MountainsCountries]
	  ON [Countries].[CountryCode] = [MountainsCountries].[CountryCode]
    JOIN [Mountains]
	  ON [MountainsCountries].[MountainId] = [Mountains].[Id]
    JOIN [Peaks]
	  ON [Mountains].[Id] = [Peaks].[MountainId]
   WHERE [Elevation] > 2835 AND [Countries].[CountryCode] = 'BG'
ORDER BY [Elevation] DESC;

 --13. Count Mountain Ranges
  SELECT [Countries].[CountryCode]
        ,COUNT([MountainRange]) AS [MountainRanges]
    FROM [Countries]
    JOIN [MountainsCountries]
	  ON [Countries].[CountryCode] = [MountainsCountries].[CountryCode]
    JOIN [Mountains]
	  ON [MountainsCountries].[MountainId] = [Mountains].[Id]
   WHERE [Countries].[CountryCode] IN ('BG', 'RU', 'US')
GROUP BY [Countries].[CountryCode];

 --14. Countries With or Without Rivers
   SELECT TOP(5) [CountryName]
                ,[RiverName]
     FROM [Countries]
FULL JOIN [CountriesRivers]
	   ON [Countries].[CountryCode] = [CountriesRivers].[CountryCode]
FULL JOIN [Rivers]
	   ON [CountriesRivers].[RiverId] = [Rivers].[Id]
    WHERE [ContinentCode] = 'AF'
 ORDER BY [CountryName];

 --15. Continents and Currencies
  SELECT [ContinentCode] 
        ,[CurrencyCode]
		,[Count] AS [CurrencyUsage]
    FROM (   SELECT [ContinentCode] 
                   ,[CurrencyCode]
                   ,COUNT([CurrencyCode]) AS [Count]
        	       ,RANK() OVER   
                          (PARTITION BY [ContinentCode] 
        	                   ORDER BY COUNT([CurrencyCode]) DESC) AS [Rank]
              FROM [Countries]
          GROUP BY [CurrencyCode],[ContinentCode]
            HAVING COUNT([CurrencyCode]) > 1) AS AA
  WHERE [Rank] = 1;

 --16. Countries Without any Mountains
   SELECT COUNT([Countries].[CountryCode]) AS [Count]
     FROM [Countries]
LEFT JOIN [MountainsCountries]
	   ON [Countries].[CountryCode] = [MountainsCountries].[CountryCode]
    WHERE [MountainsCountries].[CountryCode] IS NULL; 
	
 --17. Highest Peak and Longest River by Country
   SELECT TOP(5)[CountryName] 
               ,MAX([Elevation]) AS [HighestPeakElevation]
		       ,MAX([Length]) AS [LongestRiverLength]
     FROM (   SELECT [CountryName] 
                    ,[Elevation] 
             	    ,[Length]
                FROM [Countries]
           FULL JOIN [MountainsCountries]
             	  ON [Countries].[CountryCode] = [MountainsCountries].[CountryCode]
           FULL JOIN [Mountains]
             	  ON [MountainsCountries].[MountainId] = [Mountains].[Id]
           FULL JOIN [Peaks]
             	  ON [Mountains].[Id] = [Peaks].[MountainId]
           FULL JOIN [CountriesRivers]
           	      ON [Countries].[CountryCode] = [CountriesRivers].[CountryCode]
           FULL JOIN [Rivers]
           	      ON [CountriesRivers].[RiverId] = [Rivers].[Id]) AS AA
 GROUP BY [CountryName]
 ORDER BY [HighestPeakElevation] DESC
         ,[LongestRiverLength] DESC
		 ,[CountryName];

 --18. Highest Peak Name and Elevation by Country
   SELECT TOP(5)[CountryName] AS [Country]
               ,IIF([PeakName] IS NULL,'(no highest peak)',[PeakName]) AS [Highest Peak Name]
		       ,IIF([Elevation] IS NULL,0,MAX([Elevation])) AS [Highest Peak Elevation]
			   ,IIF([MountainRange] IS NULL,'(no mountain)',[MountainRange]) AS [Mountain]
     FROM [Countries]
LEFT JOIN [MountainsCountries]
  	   ON [Countries].[CountryCode] = [MountainsCountries].[CountryCode]
LEFT JOIN [Mountains]
  	   ON [MountainsCountries].[MountainId] = [Mountains].[Id]
LEFT JOIN [Peaks]
  	   ON [Mountains].[Id] = [Peaks].[MountainId]
 GROUP BY [CountryName],[PeakName],[Elevation],[MountainRange]
 ORDER BY [CountryName]
         ,[PeakName];