create table parkDB(parkNum varchar2(10) not null primary key,
carNum varchar2(10), inTime date);

select * from parkDB;
select * from calDB;
to_date('2013-09-21 00:00:00','YYYY-MM-DD HH24:MI:SS') 
select to_date('2013-09-21 23:59:59','YYYY-MM-DD HH24:MI:SS') from dual 
select sysdate from dual
select * from caldb where outtime between to_date('2016-09-21 00:00:01','YYYY-MM-DD HH24:MI:SS') and to_date('2016-09-21 23:59:59','YYYY-MM-DD HH24:MI:SS') 

drop table parkDB;

create table calDB(parkNum varchar2(10) not null, carNum varchar2(10), 
inTime date, outTime date, pay number);

insert into parkDB (parkNum) VALUES ('1F-A-1');
insert into parkDB (parkNum) VALUES ('1F-A-2');
insert into parkDB (parkNum) VALUES ('1F-A-3');
insert into parkDB (parkNum) VALUES ('1F-A-4');
insert into parkDB (parkNum) VALUES ('1F-A-5');
insert into parkDB (parkNum) VALUES ('1F-B-1');
insert into parkDB (parkNum) VALUES ('1F-B-2');
insert into parkDB (parkNum) VALUES ('1F-B-3');
insert into parkDB (parkNum) VALUES ('1F-B-4');
insert into parkDB (parkNum) VALUES ('1F-B-5');
insert into parkDB (parkNum) VALUES ('1F-C-1');
insert into parkDB (parkNum) VALUES ('1F-C-2');
insert into parkDB (parkNum) VALUES ('1F-C-3');
insert into parkDB (parkNum) VALUES ('1F-C-4');
insert into parkDB (parkNum) VALUES ('1F-C-5');
insert into parkDB (parkNum) VALUES ('1F-D-1');
insert into parkDB (parkNum) VALUES ('1F-D-2');
insert into parkDB (parkNum) VALUES ('1F-D-3');
insert into parkDB (parkNum) VALUES ('1F-D-4');
insert into parkDB (parkNum) VALUES ('1F-D-5');

update parkdb set carnum='1111'
where parknum='1F-A-1';

update parkdb set intime='20160921'
where parknum='1F-A-1';

SELECT parknum FROM PARKDB where carnum = '1111' 
update parkdb set carNum = null, inTime =null where parkNum = '1F-A-1';