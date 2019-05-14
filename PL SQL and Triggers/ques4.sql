create or replace package proj2q4
AS
PROCEDURE show_prereq(deptcode_in in prerequisites.dept_code%type,course#_in in prerequisites.course#%type,results out varchar);

END proj2q4;
/

create or replace package body proj2q4
AS

PROCEDURE show_prereq(deptcode_in in prerequisites.dept_code%type,course#_in in prerequisites.course#%type,results out varchar)
as

deptcode varchar2(4);
course_num number(3);
temp varchar(8000);

cursor prereq_cursor is
(select pre_dept_code, pre_course# from prerequisites where dept_code = deptcode_in and course# = course#_in);
prereq_rec prereq_cursor%rowtype;

cursor course_cursor is
(select * from courses where dept_code = deptcode_in and course# = course#_in);

course_rec course_cursor%rowtype;

BEGIN

open course_cursor;
fetch course_cursor into course_rec;

if (course_cursor%notfound) then 
results := 'Course# does not exist';

else
open prereq_cursor;    
fetch prereq_cursor into prereq_rec;
    
while prereq_cursor%found loop
deptcode := prereq_rec.pre_dept_code;
course_num := prereq_rec.pre_course#;
if (prereq_rec.pre_dept_code IS NOT NULL) then

if (results IS NULL) then
results := deptcode || course_num;
end if;
show_prereq(deptcode, course_num, temp);	

if (results IS not NULL) then
results := results || chr(10) || deptcode || course_num;
end if;
if (temp IS not NULL) then
results := results || chr(10) || temp;
end if;
else
return;
end if;
        
fetch prereq_cursor into prereq_rec;
end loop;
end if;                        
end;

END proj2q4;
/