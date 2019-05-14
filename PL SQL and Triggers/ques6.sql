create or replace package proj2q6
AS
procedure drop_class(b_num in students.b#%type, class_id in classes.classid%type, show_message OUT varchar);

END proj2q6;
/

create or replace package body proj2q6
AS
procedure drop_class( b_num in students.b#%type, class_id in classes.classid%type, show_message OUT varchar)
IS
cid_count number := 0;
b#_count number := 0;
enrolled_count number := 0;
total_classes number := 0;
students_left number := 0;
BEGIN

select count(*) into b#_count from students where b# = b_num;
select count(*) into cid_count from classes where classid = class_id;

IF cid_count = 0 then
show_message := 'The classid is invalid';
      
ELSIF b#_count = 0 then
show_message := 'The B# is invalid';

ELSE
select count(*) into enrolled_count from enrollments
where enrollments.b# = b_num and enrollments.classid = class_id;

select count(*) into total_classes from enrollments
where enrollments.b# = b_num;

select classes.class_size into students_left from classes
where classes.classid = class_id;

IF enrolled_count = 0 then
show_message := 'The student is not enrolled in the class';
ELSE

IF total_classes = 1 then
show_message := 'This student is not enrolled in any classes';
END IF;

IF students_left = 1 then
show_message := 'The class now has no students';
END IF;

delete from enrollments where b# = b_num and classid = class_id;

END IF;
END IF;
END IF;

END drop_class;

END proj2q6;
/