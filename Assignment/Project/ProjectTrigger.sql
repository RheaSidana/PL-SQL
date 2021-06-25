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

Declare 
    sid Student.id%type;
    m1 Student.marks1%type;
    m2 Student.marks2%type;
    m3 Student.marks3%type;
    m4 Student.marks4%type;
    m5 Student.marks5%type;
    tot student.total%type;
    Cursor c_student is Select id,marks1,marks2,marks3,marks4,marks5 from Student;
Begin 
    OPEN c_student; 
   LOOP 
   FETCH c_student into sid, m1,m2,m3,m4,m5; 
      EXIT WHEN c_student%notfound; 
      tot:= StudentPackage.calculateTotal(sid,m1,m2,m3,m4,m5);
      StudentPackage.calculateAverage(sid,tot);
   END LOOP; 
   CLOSE c_student;
end;



