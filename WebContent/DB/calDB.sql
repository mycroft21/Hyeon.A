create table calDB(parkNum varchar2(20) not null, 
	carNum varchar2(20), inTime date, outTime date, pay number);

select * from parkDB;

select * from PARKDB where carnum like '%3456'

select * from calDB;
drop table calDB;

select to_date('2013-09-21 23:59:59','YYYY-MM-DD HH24:MI:SS') from dual;

select sysdate from dual;

select * from calDB where outTime between to_date('2016-09-21 00:00:01','YYYY-MM-DD HH24:MI:SS') and to_date('2016-09-21 23:59:59','YYYY-MM-DD HH24:MI:SS') 

insert into calDB(parkNum, carNum, inTime, outTime, pay) values('6','100','2016-09-21','2016-09-21',200);