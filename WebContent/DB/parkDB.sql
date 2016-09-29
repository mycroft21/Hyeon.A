create table parkDB(parkNum varchar2(20) not null primary key,
					carNum varchar2(20),
					inTime date);

select * from parkDB;

drop table parkDB;

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

select parkNum from parkDB where carNum = '1111';

update parkDB set carNum = null, inTime = null where parkNum = '1F-A-1';

update parkDB set carNum=?, inTime=?, outTime=? where parkNum=?;

update parkDB set carNum='1111' where parkNum='1F-A-1';

update parkDB set inTime='20160921' where parkNum='1F-A-1';

select count(*) from parkDB where parkNum like '1F-A%';

select count(*) from parkDB where parkNum like '1F-A%' and carNum is null;