create table memoDB(memoNum number primary key,
					subject varchar2(50), 
			 		content varchar2(2000),
					memoTime date,
					pass varchar2(20));

create SEQUENCE mNumbers  
       START WITH 1   
       INCREMENT BY 1;

alter table memoDB modify (pass varchar2(20))
       
insert into memoDB (memoNum, subject, content, memotime, pass) values (mNumbers.nextval, '�޸�', '�׽�Ʈ�մϴ�.', sysdate, 'oracle');

select * from memoDB;
delete from memoDB where memoNum=3
select * from memoDB where memonum between 1 and 5;