create table memoDB(memoNum number primary key,
					subject varchar2(50), 
			 		content varchar2(2000),
					memoTime date,
					pass varchar2(20));

create SEQUENCE mNumbers  
       START WITH 1   
       INCREMENT BY 1;

alter table memoDB modify (subject varchar2(100));
       
insert into memoDB (memoNum, subject, content, memotime, pass) values (mNumbers.nextval, '메모', '테스트합니다.', sysdate, 'oracle');

select * from memoDB;

drop table memoDB;

drop sequence mNumbers;

delete from memoDB where memoNum=2;

select * from memoDB where memonum between 1 and 5;