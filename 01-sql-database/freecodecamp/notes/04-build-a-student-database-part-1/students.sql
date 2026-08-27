DROP DATABASE IF EXISTS students;
CREATE DATABASE students;

\connect students

CREATE TABLE majors (
  major_id SERIAL PRIMARY KEY,
  major VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,
  course VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  major_id INT,
  gpa NUMERIC(2,1),
  FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE majors_courses (
  major_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (major_id, course_id),
  FOREIGN KEY (major_id) REFERENCES majors(major_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);