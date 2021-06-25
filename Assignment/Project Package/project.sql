Create table Project (
Id number(2) primary key,
Name varchar(20),
StartDate date,
TerminationDate date
);

insert into Project(id,name,startDate,terminationdate)
values(1,'Share Market','3-oct-2019','31-jan-2020');

insert into Project(id,name,startDate,terminationdate)
values(2,'Room Reservation','29-sep-2019','23-feb-2020');

insert into Project(id,name,startDate,terminationdate)
values(3,'University','29-sep-2019','23-aug-2020');

select * from Project;

create or replace package ProjectPackage As
    Procedure NoOfDays(dbegin Project.startDate%type,dend Project.terminationDate%type);
    Procedure viewTableContent;
end ProjectPackage;

create or replace package body ProjectPackage As
    Procedure NoOfDays(dbegin Project.startDate%type,dend Project.terminationDate%type)
    IS
    TotalDays number;
    begin 
        TotalDays:= dend-dbegin;
        dbms_output.put_Line('Number of days to Complete  : ' || TotalDays);
    end NoOfDays;
    
    
    Procedure viewTableContent 
    IS
    pid Project.id%type;
    pname Project.name%type;
    dstart Project.startDate%type;
    dend Project.terminationDate%type;
    Cursor c_Project Is select id,name,startDate,terminationDate from Project;
    begin
        Open c_Project;
        LOOP 
        FETCH c_Project into pid, pname, dstart, dend;
            EXIT WHEN c_Project%notfound; 
            dbms_Output.Put('Project Id : ' || pid || '   Project Name : ' || pname || '    ');
            NoOfDays(dstart,dend);
        END LOOP; 
        CLOSE c_Project;
    end viewTableContent;
end ProjectPackage;

DECLARE 
BEGIN 
   ProjectPackage.viewTableContent;
END;


