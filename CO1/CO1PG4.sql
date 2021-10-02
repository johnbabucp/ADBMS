create table EMPLOYEE(name varchar2(10),da number(10),hr number(10),ta number(10),salary number(10));
    insert into EMPLOYEE values('Anil',1000,2000,1000,15000);
    insert into EMPLOYEE values('Arun',1000,3000,1500,20000);
    insert into EMPLOYEE values('Anu',500,2000,500,9000);
    insert into EMPLOYEE values('Beena',900,2500,1000,11000);
    insert into EMPLOYEE values('Remya',1500,1000,2000,10000);

-- A
create view empView as select Name,salary from EMPLOYEE where salary>10000;

--B
update EMPLOYEE set salary = 25000;

-- C
update empview set salary = 1000;