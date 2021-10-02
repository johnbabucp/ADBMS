create table EMP_tbl(emp_id char(8) check(emp_id like 'E%') primary key,emp_name varchar(20),street_no int,city_name varchar(20));
	insert into EMP_tbl values('E-101','Adarsh',101,'MG Road');
	insert into EMP_tbl values('E-102','Bonny',101,'MG Road');
	insert into EMP_tbl values('E-103','Catherine', 102, 'Cochin');
	insert into EMP_tbl values('E-104','Glenn', 101, 'Ernakulam');
	insert into EMP_tbl values('E-105','Macc', 101, 'Ernakulam');
	insert into EMP_tbl values('E-110','Grylles', 101, 'Ernakulam');
	insert into EMP_tbl values('E-111','Glamp', 101, 'Ernakulam');
/*--------------------------------------------------------------------------------------------------------------------------------*/
create table COMPANY_tbl(company_name varchar(20) primary key,city varchar(20));
	insert into COMPANY_tbl values('SBI','MG Road');
	insert into COMPANY_tbl values('SBT','MG Road' );
	insert into COMPANY_tbl values('Federal','Broadway');
	insert into COMPANY_tbl values('Indian Bank','Cochin');
	insert into COMPANY_tbl values('SIB','Ernakulam');
/*--------------------------------------------------------------------------------------------------------------------------------*/
create table WORKS_tbl(emp_id char(8) references EMP_tbl(emp_id),company_name varchar(20) references COMPANY_tbl(company_name),salary float,primary key (emp_id,company_name));
	insert into WORKS_tbl values('E-101',   'SBI',    71000);
	insert into WORKS_tbl values('E-102',   'SBI',    90000);
	insert into WORKS_tbl values('E-103',   'SBT',    40000);
	insert into WORKS_tbl values('E-104', 'Federal',  37000);
	insert into WORKS_tbl values('E-105',   'SBT',    17000);
/*--------------------------------------------------------------------------------------------------------------------------------*/
create table MANAGES_tbl(emp_id char(8) references EMP_tbl(emp_id),manager_id char(8) references EMP_tbl(emp_id),unique(emp_id,manager_id));
	insert into MANAGES_tbl values('E-101', 'E-102');
	insert into MANAGES_tbl values('E-102',    Null);
	insert into MANAGES_tbl values('E-103', 'E-110');
	insert into MANAGES_tbl values('E-104', 'E-111');
	insert into MANAGES_tbl values('E-105', 'E-110');
/*--------------------------------------------------------------------------------------------------------------------------------*/
-- A
select emp_name from WORKS_tbl,EMP_tbl where company_name='SBI' and EMP_tbl.emp_id=WORKS_tbl.emp_id;

-- B
select EMP_tbl.emp_name from EMP_tbl, WORKS_tbl,COMPANY_tbl where EMP_tbl.emp_id = WORKS_tbl. emp_id and WORKS_tbl. company_name= COMPANY_tbl.company_name AND EMP_tbl.city_name = COMPANY_tbl.city;

-- C
select emp_id from WORKS_tbl w1,(select avg(salary) as avgsal,company_name from WORKS_tbl group by company_name)w2 where w1.company_name=w2.company_name and w1.salary>w2.avgsal;

-- D
update WORKS_tbl set salary=salary*1.1 where emp_id in(select manager_id from MANAGES_tbl)and  company_name='SBI';

-- E
select company_name from WORKS_tbl group by company_name having count(emp_id)>= all(select count (emp_id) from WORKS_tbl group by company_name);

-- F
select company_name from WORKS_tbl group by company_name having avg(salary)>(select avg(salary) from WORKS_tbl group by company_name having company_name = 'SBT');