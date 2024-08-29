-- Create the `subject` table. Each subject has a name

CREATE TABLE subject (
subjectId SERIAL PRIMARY KEY,
name varchar(50) UNIQUE NOT NULL
);

-- Each subject has a name. Every student can attend multiple subjects. Where would you store the grades of the students?

-- MY ANSWER:
-- this is a many-many relation between 2 tables. In such case it is a best practice to create a seperate table
-- the name is advised to have table1Name_table2Name
-- in such table, each studentId will be visible once for each subjectId (this line makes it possible PRIMARY KEY (studentId, subjectId) ),
-- so it seems logical to store the grade here

CREATE TABLE student_subject (
    studentId INT,
    subjectId INT,
    grade VARCHAR(10),
    PRIMARY KEY (studentId, subjectId),
    FOREIGN KEY (studentId) REFERENCES student(studentId),
    FOREIGN KEY (subjectId) REFERENCES subject(id)
);

-- Insert the following subjects:

INSERT INTO subject(name) VALUES ('Algebra');
INSERT INTO subject(name) VALUES ('Biology');
INSERT INTO subject(name) VALUES ('World History');
