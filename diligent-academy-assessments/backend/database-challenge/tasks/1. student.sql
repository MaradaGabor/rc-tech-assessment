-- Create the `student` table with the following fields: `name` and `email`.
-- What fields would you create, and what would be their types?

-- MY ASNWER:
-- I would add a studentID also with type INT and auto increment,
-- because if I need to join tables later on, it's much faster compared to joining strings
-- for name column, 100 should be enough, but it can be extended later on if necessary. I also added NOT NULL constraint
-- for e-mail, there are historical standards, that allow providers to have a maximum of 254 characters.
-- My belief 2 students shouldn't share the same e-mail address

CREATE TABLE student (
  studentId SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE
);

-- Insert the following students with their emails:

INSERT INTO student(name, email) VALUES ('John', 'john@school.com');
INSERT INTO student(name, email) VALUES ('Adam', 'adam@school.com');
INSERT INTO student(name, email) VALUES ('Lucy', 'lucy@school.com');