CREATE OR REPLACE PACKAGE proj2_package AS

procedure show_students(students_rc OUT sys_cursor);
procedure show_tas(tas_rc OUT sys_cursor);
procedure show_courses(courses_rc OUT sys_cursor);
procedure show_classes(classes_rc OUT sys_cursor);
procedure show_enrollments(enrollments_rc OUT sys_cursor);
procedure show_prerequisites(prerequisite_rc OUT sys_cursor);
procedure show_logs(logs_rc OUT sys_cursor);

procedure show_students(student_rc OUT sys_cursor)
is
begin
open student_rc for select * from students;
end show_students;

procedure show_tas(tas_rc OUT sys_cursor)
is
begin
open tas_rc for select * from tas;
end show_tas;

procedure show_courses(courses_rc OUT sys_cursor)
is
begin
open courses_rc for select * from courses;
end show_courses;

procedure show_classes(classes_rc OUT sys_cursor)
is 
begin
open classes_rc for select * from classes;
end show_classes;

procedure show_enrollments(enrollments_rc OUT sys_cursor)
is 
begin
open enrollments_rc for select * from enrollments;
end show_enrollments;

procedure show_prerequisites(prerequisite_rc OUT sys_cursor)
is
begin
open prerequisites_rc for select * from prerequisites;
end show_prerequisites;

procedure show_logs(logs_rc OUT sys_cursor)
is
begin
open logs_rc for select * from logs;
end show_logs;

END proj2_package;
/