create table parkDB(parkNum varchar2(10) not null primary key,
carNum varchar2(10), outTime date);

select * from parkDB;

drop table parkDB;

create table calDB(parkNum varchar2(10) not null, carNum varchar2(10), 
inTime date, outTime date, pay number);

insert into parkDB (parkNum) VALUES ('A-1');
insert into parkDB (parkNum) VALUES ('A-2');
insert into parkDB (parkNum) VALUES ('A-3');
insert into parkDB (parkNum) VALUES ('A-4');
insert into parkDB (parkNum) VALUES ('A-5');

insert into parkDB (parkNum) VALUES ('B-1');
insert into parkDB (parkNum) VALUES ('B-2');
insert into parkDB (parkNum) VALUES ('B-3');
insert into parkDB (parkNum) VALUES ('B-4');
insert into parkDB (parkNum) VALUES ('B-5');

insert into parkDB (parkNum) VALUES ('C-1');
insert into parkDB (parkNum) VALUES ('C-2');
insert into parkDB (parkNum) VALUES ('C-3');
insert into parkDB (parkNum) VALUES ('C-4');
insert into parkDB (parkNum) VALUES ('C-5');

insert into parkDB (parkNum) VALUES ('D-1');
insert into parkDB (parkNum) VALUES ('D-2');
insert into parkDB (parkNum) VALUES ('D-3');
insert into parkDB (parkNum) VALUES ('D-4');
insert into parkDB (parkNum) VALUES ('D-5');