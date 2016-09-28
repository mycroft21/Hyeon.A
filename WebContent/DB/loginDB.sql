create table adminslog (id varchar2(20) primary key,
						pwd varchar2(20) not null)
insert into adminslog (id, pwd) values ('administrator', 'oracle')

select * from ADMINSLOG
select * from adminslog where id='administrator' and pwd='oracle'
drop table adminslog