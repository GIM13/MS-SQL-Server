
 --09. Not So In The Studying

   SELECT CONCAT([FirstName]
                ,' '
				,[MiddleName]
				,IIF([MiddleName] IS NULL,'',' ')
				,[LastName]) AS [Full Name]
     FROM [Students]
FULL JOIN [StudentsSubjects] ON [Students].[Id] = [StudentId]
    WHERE [SubjectId] IS NULL
 ORDER BY [Full Name]