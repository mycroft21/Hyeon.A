create table adminslog (id varchar2(20) primary key,
                  		pwd varchar2(20) not null);
                  
insert into adminslog (id, pwd) values ('admin', 'oracle');

select * from adminslog;

drop table adminslog;

select * from adminslog where id='admin' and pwd='oracle';

drop table adminslog;