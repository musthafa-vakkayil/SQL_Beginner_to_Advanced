-- CREATE TABLE

/* CREATE TABLE <name> (
        <col1> TYPE [CONSTRAINT],
        table_constraint [CONSTRAINT]
        
    ) [INHERITS <existing_table>];
*/

-- Add an extension
create extension if not exists "uuid-ossp";

-- CREATE Student table
CREATE TABLE student(
    student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- \d student -> to definition of table

-- DROP tables
DROP table student;

-- alter Tbale
ALTER TABLE student
ADD COLUMN email TEXT;

-- Examples

CREATE DOMAIN RATING SMALLINT CHECK(VALUE > 0 AND VALUE <= 5);

CREATE TYPE Feedback AS (
	student_id UUID,
	rating RATING,
	feedback TEXT
);

CREATE TABLE subject(
	subject_id UUID,
	subject TEXT NOT NULL,
	description TEXT,
	CONSTRAINT pk_subject PRIMARY KEY(subject_id)
);

CREATE TABLE teacher(
	teacher_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	email TEXT,
	date_of_birth DATE NOT NULL
)


CREATE TABLE course(
	course_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name TEXT NOT NULL,
	description TEXT,
	subject_id UUID REFERENCES subject(subject_id),
	teacher_id UUID REFERENCES teacher(teacher_id),
	feedback Feedback[]
);


CREATE TABLE enrollment(
	course_id UUID REFERENCES course(course_id),
	student_id UUID REFERENCES student(student_id),
	enrollment_date DATE NOT NULL,
	CONSTrAINT pk_enrollment PRIMARY KEY(course_id, student_id)
)


INSERT INTO student(
	first_name,
	last_name,
	email,
	date_of_birth
) VALUES (
	'Musthafa',
	'Vakkayil',
	'test@gmail.com',
	'2000-11-12' :: DATE
);

UPDATE course
SET feedback = array_append(
	feedback, 
	ROW(
		'ce885917-1856-4d9b-8e83-531d588e5326',
		5,
		'Good'
	) :: Feedback
)
WHERE course_id = '16cb2ba5-9ae9-46d1-8f42-f6cc7e6612ec';

https://pgbackrest.org/
https://www.postgresql.org/docs/12/backup.html