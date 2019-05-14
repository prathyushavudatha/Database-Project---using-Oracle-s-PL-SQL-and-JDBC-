create or replace package proj2q7 AS

PROCEDURE delete_student(b_num in students.b#%type, results OUT varchar);
END proj2q7;
/

create or replace package body proj2q7 
AS
PROCEDURE delete_student(b_num in students.b#%type, results OUT varchar) 
IS
cursor student_cur is
select * from students where b#=b_num;
student_rc student_cur%rowtype;
begin
open student_cur;
fetch student_cur into student_rc;
if (student_cur%notfound) then
results:= 'The B# is invalid';
else 
delete from students where b#=b_num;
results:= 'Deleted';
end if;
end;

END proj2q7;
/