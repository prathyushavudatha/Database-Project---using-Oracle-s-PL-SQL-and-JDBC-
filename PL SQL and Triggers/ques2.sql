CREATE PACKAGE dbproject2
AS

procedure show_students(students_recordset OUT SYS_REFCURSOR);
procedure show_tas(tas_recordset OUT SYS_REFCURSOR);
procedure show_courses(courses_recordset OUT SYS_REFCURSOR);
procedure show_classes(classes_recordset OUT SYS_REFCURSOR);
procedure show_enrollments(enrollments_recordset OUT SYS_REFCURSOR);
procedure show_prerequisites(prerequisites_recordset OUT SYS_REFCURSOR);
procedure show_logs(logs_recordset OUT SYS_REFCURSOR);

END dbproject2;
/

CREATE OR REPLACE PACKAGE BODY dbproject2
AS 	

procedure show_students(students_recordset OUT SYS_REFCURSOR)
is
begin
open students_recordset for 
select * from students;
end show_students;

procedure show_tas(tas_recordset OUT SYS_REFCURSOR)
is
begin
open tas_recordset for 
select * from tas;
end show_tas;

procedure show_courses(courses_recordset OUT SYS_REFCURSOR)
is
begin
open courses_recordset for 
select * from courses;
end show_courses;

procedure show_classes(classes_recordset OUT SYS_REFCURSOR)
is 
begin
open classes_recordset for 
select * from classes;
end show_classes;

procedure show_enrollments(enrollments_recordset OUT SYS_REFCURSOR)
is 
begin
open enrollments_recordset for 
select * from enrollments;
end show_enrollments;

procedure show_prerequisites(prerequisites_recordset OUT SYS_REFCURSOR)
is
begin
open prerequisites_recordset for 
select * from prerequisites;
end show_prerequisites;

procedure show_logs(logs_recordset OUT SYS_REFCURSOR)
is
begin
open logs_recordset for 
select * from logs;
end show_logs;

END;
/