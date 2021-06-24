CREATE TABLE Student(
   id   number(5) constraint spk primary key,
   name VARCHAR (20)     NOT NULL,
   marks1 number(5,2),
   marks2 number(5,2),
   marks3 number(5,2),
   marks4 number(5,2),
   marks5 number(5,2),
   total number(7,2),
   average number(5,2)
);

create or replace package StudentPackage As
    function calculateTotal(sid Student.id%type,
            m1 Student.marks1%type,
            m2 Student.marks2%type,
            m3 Student.marks3%type,
            m4 Student.marks4%type,
            m5 Student.marks5%type) return Student.total%type;
    Procedure calculateAverage(sid Student.id%type,
            tot Student.total%type);
end StudentPackage;


create or replace package body StudentPackage As
    function calculateTotal(sid Student.id%type,
            m1 Student.marks1%type,
            m2 Student.marks2%type,
            m3 Student.marks3%type,
            m4 Student.marks4%type,
            m5 Student.marks5%type) 
        Return Student.total%type
        IS
        tot Student.total%type;
        begin 
            tot:= m1+m2+m3+m4+m5;
            Update Student 
            set total = tot
            where id= sid;
            return tot;
    end ;
    Procedure calculateAverage(sid Student.id%type,
            tot Student.total%type) IS 
        avrg Student.average%type;
        begin 
            avrg:= tot/5;
            /*dbms_output.put_Line(avrg);*/
            Update Student 
            set average = avrg
            where id= sid;
    end calculateAverage;
end StudentPackage;


insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(1,'Sam',99,98,97,99,96);

insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(2,'Sunny',99,88,97,79,96);

insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(3,'Jimin',79,98,77,99,86);

insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(4,'Hope',89,98,97,93,95);

insert into Student(id,name,marks1,marks2,marks3,marks4,marks5)
values(5,'Mickey',89,98,87,99,66);

select * from Student;

delete from Student where id=1;

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
      /*dbms_output.put_Line(tot);*/
      StudentPackage.calculateAverage(sid,tot);
   END LOOP; 
   CLOSE c_student;
end;



