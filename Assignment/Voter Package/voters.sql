CREATE TABLE voters(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   DOB date,
   AGE  INT     Check(age>=18),
   ADDRESS  CHAR (25) ,
   PRIMARY KEY (ID)
);

drop table voters;

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (1, 'Robin','14-feb-1984', 32, 'Houston');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (2, 'William','13-oct-1995', 25, 'New York');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (3, 'Conan','14-sep-1988', 35, 'New York');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (4, 'Jimmy','7-jan-1994', 25, 'Los Angeles');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (5, 'Harry','24-dec-1990', 27, 'Austin');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (6, 'Steve','3-aug-1998', 22, 'Seattle');

INSERT INTO voters (ID,NAME,DOB,AGE,ADDRESS)
VALUES (9, 'Justin','29-jun-1990', 28, 'Seattle');

Select * from voters order by id asc;

create or replace package VoterPackage As
    Procedure updateAge;
end VoterPackage;

create or replace package body VoterPackage As
    Procedure updateAge
    Is
    curr date:= current_date;
    actualAge voters.age%type;
    vid voters.id%type;
    vdob voters.dob%type;
    vage voters.age%type;
    Cursor c_voter is select id,dob,age from voters;
    begin
        Open c_voter;
        Loop
            Fetch c_voter into vid,vdob,vage;
            Exit when c_voter%notfound;
            actualAge:=floor(months_between(curr,vdob) /12);
            If(actualAge <> vage) then 
                Update voters
                set age=actualAge
                where id = vid;
            end if;
            END LOOP; 
        CLOSE c_voter;
    end updateAge;
end VoterPackage;

declare 
begin 
    VoterPackage.updateAge;
end;




declare 
    curr date:=current_date;
    yearbtw number;
begin
    dbms_output.Put_line(curr);
    yearbtw := floor(months_between(curr,'3-oct-1997') /12);
    dbms_output.Put_line(yearbtw);
end;

select floor(months_between(date '2012-10-9' , date '2011-10-10') /12) from dual;


