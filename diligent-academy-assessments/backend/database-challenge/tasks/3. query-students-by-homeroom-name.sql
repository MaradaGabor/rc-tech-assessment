SELECT student.name
FROM student
JOIN homeroom ON student.homeroom_id = homeroom.id
WHERE homeroom.name = '9A'