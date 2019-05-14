-- Add tuple to Logs table when a student is deleted from Students table

create or replace trigger "DELETE_STUDENT_ADD_LOGS"
after
delete on students
for each row
begin
insert into logs values (log#.nextval, USER, sysdate, 'students', 'delete', :old.b#);
end;​
/

-- Add tuple to Logs table when a tuple is inserted into the Enrollments table

create or replace trigger "INSERT_ENROLLMENTS_ADD_LOGS"
after
insert on enrollments 
for each row
begin
insert into logs values (log#.nextval, USER, sysdate, 'enrollments', 'insert', :new.b# || ',' || :new.classid);
end;​
/

-- Add tuple to Logs table when a tuple is deleted from the Enrollments table

create or replace trigger "DELETE_ENROLLMENTS_ADD_LOGS"
after
delete on enrollments
for each row
begin
insert into logs values (log#.nextval, USER, sysdate, 'enrollments', 'delete', :old.b# || ',' || :old.classid);
end;​
/

-- Delete all tuples in the Enrollments table involving the student when a student is deleted

create or replace trigger "DELETE_ENROLLMENTS_DELETE_STUDENTS"
before 
delete on students
for each row
begin
delete from enrollments where enrollments.sid = :old.sid;
end;
/

-- Update the values caused by successfully enrolling a student into a class

create or replace trigger UPDATE_LOGS_INSERT_STUDENTS
after 
insert on students
for each row
begin
insert into logs(log#, op_name, op_time, table_name, operation, key_value) values (log#.nextval, USER, sysdate, 'students', 'insert', :new.b#);
end;
/