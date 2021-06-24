CREATE TABLE Student(
   id   number(5) constraint spk primary key,
   name VARCHAR (20)     NOT NULL,
   marks1 number(5,2),
   marks2 number(5,2),
   marks3 number(5,2),
   marks4 number(5,2),
   marks5 number(5,2)
);

CREATE TABLE Marks(
   id   number(5) constraint mfk references Student(id),
   total number(7,2),
   average number(5,2)
);

create or replace trigger studentTrigger 
after insert on Student
for each row 
when (new.id>0)
declare
    marksTotal number(7,2);
    marksAvg number(5,2);
begin
    marksTotal:= :new.marks1+:new.marks2+:new.marks3+:new.marks4+:new.marks5;
    marksAvg:= marksTotal/5;
    
    insert into Marks(id,total,average)
    values(:new.id,marksTotal,marksAvg);
    
end;

insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(1, 'Rose',89,99,70,83,96);

select * from Student;
select * from Marks;

drop table marks;
drop table Student;

