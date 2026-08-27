#!/bin/bash

# Script to insert data from courses.csv and students.csv
# into the students PostgreSQL database.

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo "Importing courses and majors..."

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    if [[ -z $MAJOR_ID ]]
    then
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      echo "Inserted major: $MAJOR"

      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    if [[ -z $COURSE_ID ]]
    then
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      echo "Inserted course: $COURSE"

      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    MAJOR_COURSE_ID=$($PSQL "
      SELECT major_id
      FROM majors_courses
      WHERE major_id=$MAJOR_ID
      AND course_id=$COURSE_ID
    ")

    if [[ -z $MAJOR_COURSE_ID ]]
    then
      INSERT_MAJOR_COURSE_RESULT=$($PSQL "
        INSERT INTO majors_courses(major_id, course_id)
        VALUES($MAJOR_ID, $COURSE_ID)
      ")
    fi
  fi
done


echo "Importing students..."

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    if [[ $MAJOR == "null" ]]
    then
      MAJOR_ID="NULL"
    fi

    if [[ $GPA == "null" ]]
    then
      GPA="NULL"
    fi

    INSERT_STUDENT_RESULT=$($PSQL "
      INSERT INTO students(first_name, last_name, major_id, gpa)
      VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)
    ")

    echo "Inserted student: $FIRST $LAST"
  fi
done

echo "Import complete."