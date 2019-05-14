create or replace package proj2q5 AS

procedure enroll_student( B_num in students.B#%type, class_id in classes.classid%type,
show_message OUT varchar);

END proj2q5;
/

create or replace package body proj2q5 AS procedure enroll_student( B_num in students.B#%type, class_id in classes.classid%type, show_message OUT varchar) 
IS

classid_count number := 0;
B#_count number := 0;
already_in number := 0;
num_classes number := 0;
deptcode varchar2(4);
course_num number;
num_prereq number := 0;
class_size number := 0;
class_semester varchar2(6);
class_limit number := 0;
class_year number;

BEGIN
select count(*) into B#_count from students where B# = B_num;
select count(*) into classid_count from classes where classid = class_id;

IF B#_count = 0 then
show_message := 'The B# is invalid';
      
ELSIF classid_count = 0 then
show_message := 'The classid is invalid';

ELSE

select classes.dept_code into deptcode from classes where classes.classid = class_id;
select classes.class_size into class_size from classes where classes.classid = class_id;
select classes.semester into class_semester from classes where classes.classid = class_id;
select classes.year into class_year from classes where classes.classid = class_id;
select classes.limit into class_limit from classes where classes.classid = class_id;
select classes.course# into course_num from classes where classes.classid = class_id;
select count(B_num) into already_in from enrollments
join classes on enrollments.classid = classes.classid
where classes.classid = class_id and enrollments.B# = B_num; 

select count(*) into num_classes from enrollments
join classes on enrollments.classid = classes.classid
where classes.year = class_year and classes.semester = class_semester
and enrollments.B# = B_num;

select count(*) into num_prereq from
(select prerequisites.pre_dept_code, prerequisites.pre_course# from prerequisites
connect by prior pre_dept_code = dept_code AND PRIOR pre_course# = course#
START WITH dept_code = deptcode AND course# = course_num
minus
select classes.dept_code, classes.course# from classes
join enrollments on classes.classid = enrollments.classid
where enrollments.B# = B_num and enrollments.lgrade < 'D' 
and enrollments.lgrade is not null);

IF class_size >= class_limit then
show_message := 'The class is already full';

ELSIF already_in > 0 then
show_message := 'The student is already in the class';

ELSIF num_prereq > 0 then
show_message := 'Prerequisite not satisfied';

ELSIF num_classes >= 5 then
show_message := 'Students cannot be enrolled in more than five classes in the same semester';

ELSE
IF num_classes = 4 then
show_message := 'The student will be overloaded with the new enrollment';
END IF;

insert into enrollments values (B_num, class_id, null);
END IF;
END IF;

END enroll_student;

END proj2q5;
/