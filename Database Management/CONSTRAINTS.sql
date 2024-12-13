-- CONSTRAINTS
-- Constraints are tool to apply validation method against data that will be inserted

-- COLUMN CONSTRAINT
-- A Column contraint is defined as part of a column definition.
-- 1. NOT NULL -> cannot be Null
-- 2. PRIMARY KEY -> column will be the primary key
-- 3. UNIQUE -> unique values (NULL is Unique)
-- 4. CHECK -> apply a special condition
-- 5. REFERENCES -> contraints the values of the column to only values that 
-- exist in the column of another table (Foreign Key)
CREATE TABLE student(
    student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
)

-- TABLE CONSTRAINTS
-- A table constraint definition can encompass more than one column
-- 1. UNIQUE(column_list) -> Can only contain unique
-- 2. PRIMARY KEY(column_list) -> Columns that will be PK
-- 3. CHECK(condition) -> condition to check while inserting or updating
-- 4. REFERENCES -> Foreign Key relationship to a column 
CREATE TABLE student(
    student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT pk_student_id PRIMARY KEY(student_id)
)