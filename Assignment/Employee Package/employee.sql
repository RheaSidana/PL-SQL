CREATE TABLE EMPLOYEE(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              CHECK( AGE >= 18),
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'SAM', 32, 'Ahmedabad', 2000.00 );

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'JOHN', 25, 'Delhi', 1500.00 );

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'ARIANA', 23, 'Kota', 2000.00 );

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'TOM', 25, 'Mumbai', 6500.00 );

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'TONY', 27, 'Bhopal', 8500.00 );

INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'ROSE', 22, 'MP', 4500.00 );

SELECT * FROM EMPLOYEE;

create or replace package EmployeePackage As
    Procedure insertEmployee(eID EMPLOYEE.ID%type,
    eNAME EMPLOYEE.NAME%type,
    eAGE EMPLOYEE.AGE%type,
    eADDRESS EMPLOYEE.ADDRESS%type,
    eSALARY EMPLOYEE.SALARY%type);
end EmployeePackage;

create or replace package body EmployeePackage As
    Procedure insertEmployee(eID EMPLOYEE.ID%type,
    eNAME EMPLOYEE.NAME%type,
    eAGE EMPLOYEE.AGE%type,
    eADDRESS EMPLOYEE.ADDRESS%type,
    eSALARY EMPLOYEE.SALARY%type)
    IS
    begin
        INSERT INTO EMPLOYEE (ID,NAME,AGE,ADDRESS,SALARY)
        VALUES (eID,eNAME,eAGE,eADDRESS,eSALARY);
    end insertEmployee;
end EmployeePackage;

declare 
begin
    EmployeePackage.insertEmployee(7, 'JASMINE', 42, 'Delhi', 4800.00 );
    EmployeePackage.insertEmployee(8, 'JAMES', 29, 'Delhi', 2500.00 );
    EmployeePackage.insertEmployee(9, 'RHEA', 23, 'MUMBAI', 28500.00);
    EmployeePackage.insertEmployee(10, 'ALEX', 40, 'Kota', 22000.00);
end;

SELECT * FROM EMPLOYEE order by id asc;


