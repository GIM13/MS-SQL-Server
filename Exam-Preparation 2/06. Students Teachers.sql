
 --06. Students Teachers
 
  SELECT [FirstName]
        ,[LastName]
        ,COUNT([TeacherId]) AS [TeachersCount]
    FROM [Students]
	JOIN [StudentsTeachers] ON [StudentId] = [Id]
GROUP BY [Id],[FirstName],[LastName]
ORDER BY [LastName]
        ,[FirstName]

