-- Create the `homeroom` table. Each homeroom has a name, and it has to be **unique**.

CREATE TABLE homeroom (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Every student can be in only one class.

ALTER TABLE student
ADD COLUMN homeroom_id INT,
ADD CONSTRAINT foreignkey_homeroom
FOREIGN KEY (homeroom_id) REFERENCES homeroom(id);

-- How would you modify the table if we had a lot of read operations by searching on the class name?

-- MY ANSWER:
-- I would create an index, which basically acts like a bookmark.
-- The question was not 100% clear for me, but I would expect freqvent read operations on the student table.
-- Eg: SELECT name WHERE homeroom_id = 1
-- With indexing the values of of the homeroom_id 1 will be predefined for the SQL call (eg.: line _003, _007, _008)
-- The SQL query will be more performant as it doesn't need to loop thru the whole DB

CREATE INDEX idx_student_homeroom ON student (homeroom_id);

-- Insert the following homerooms:

INSERT INTO homeroom(name) VALUES ('9A');
INSERT INTO homeroom(name) VALUES ('9B');



