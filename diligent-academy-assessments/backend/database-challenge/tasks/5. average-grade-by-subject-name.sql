SELECT AVG(grade) AS average_grade
FROM student_subject
JOIN subject ON student_subject.subjectId = subject.id
WHERE subject.name = 'Algebra';

SELECT AVG(grade) AS average_grade
FROM student_subject
JOIN subject ON student_subject.subjectId = subject.id
WHERE subject.name = 'Biology';

SELECT AVG(grade) AS average_grade
FROM student_subject
JOIN subject ON student_subject.subjectId = subject.id
WHERE subject.name = 'World History';