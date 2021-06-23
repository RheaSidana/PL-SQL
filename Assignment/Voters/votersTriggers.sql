CREATE TABLE voters(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT     Check(age>=18),
   ADDRESS  CHAR (25) ,
   PRIMARY KEY (ID)
);

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (1, 'Robin', 32, 'Houston');

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (2, 'William', 25, 'New York');

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (3, 'Conan', 23, 'Los Angeles' );

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (4, 'Jimmy', 25, 'Los Angeles');

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (5, 'Harry', 27, 'Austin');

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (6, 'Steve', 22, 'Seattle');

INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (9, 'Justin', 28, 'Seattle');

Select * from voters;

CREATE TABLE voters_backup(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT     Check(age>=18),
   ADDRESS  CHAR (25) ,
   PRIMARY KEY (ID)
);

Select * from voters_backup;


create or replace trigger votersTrigger 
after insert on voters
for each row 
when (new.id>0)
declare
begin
    delete from voters_backup
    where id = :new.id;

    INSERT INTO voters_backup (ID,NAME,AGE,ADDRESS)
    VALUES (:new.id, :new.name , :new.age, :new.address);
end;


INSERT INTO voters (ID,NAME,AGE,ADDRESS)
VALUES (7, 'Rocky', 22, 'Houston');

select * from voters where id<>7;


