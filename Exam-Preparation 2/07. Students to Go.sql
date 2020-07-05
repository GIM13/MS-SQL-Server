
 --07. Students to Go
 
   SELECT CONCAT([FirstName],' ',[LastName]) AS [Full Name]
     FROM [Students]
FULL JOIN [StudentsExams] ON [Id] = [StudentId]
    WHERE [ExamId] IS NULL
 ORDER BY [Full Name]
