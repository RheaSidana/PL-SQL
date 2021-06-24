Create table Project (
Id number(2) primary key,
Name varchar(20),
StartDate date,
TerminationDate date
);

drop table Project;

Create or replace trigger projectTrigger
before delete on Project 
For each row
When (old.id>0)
Declare 
    NoDays number(3);
Begin
	NoDays := :old.Terminationdate-:old.startDate;
	dbms_output.put_line('No. of days : '||NoDays);
	
End;

insert into Project(id,name,startDate,terminationdate)
values(1,'Share Market','3-oct-2019','31-jan-2020');

insert into Project(id,name,startDate,terminationdate)
values(2,'Room Reservation','29-sep-2019','23-feb-2020');

insert into Project(id,name,startDate,terminationdate)
values(3,'University','29-sep-2019','23-aug-2020');


select * from Project;

delete from Project where id =1;

