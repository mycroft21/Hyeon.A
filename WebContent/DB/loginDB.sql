create table adminslog (id varchar2(20) primary key,
						pwd varchar2(20) not null)
insert into adminslog (id, pwd) values ('admin', 'oracle')
update ADMINSLOG set id='admin' where pwd='oracle'
select * from memodb
select * from adminslog where id='administrator' and pwd='oracle'
drop table adminslog