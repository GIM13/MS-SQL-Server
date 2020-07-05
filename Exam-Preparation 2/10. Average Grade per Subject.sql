
 --10. Average Grade per Subject

      SELECT [Name]
	         ,AVG([Grade]) AS [AverageGrade]
        FROM [Subjects]
        JOIN [StudentsSubjects] ON [SubjectId] = [Subjects].[Id]
    GROUP BY [Subjects].[Id],[Name]
    ORDER BY [Subjects].[Id]