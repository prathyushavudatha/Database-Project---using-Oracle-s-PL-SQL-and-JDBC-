CREATE PACKAGE projtest4
AS
procedure show_tas(tas_recordset OUT SYS_REFCURSOR);

END projtest4;
/

CREATE OR REPLACE PACKAGE BODY projtest4
AS 	
procedure show_tas(tas_recordset OUT SYS_REFCURSOR)
is
begin
open tas_recordset for 
select * from tas;
end show_tas;
END;
/