create table memoDB(memoNum number primary key,
					subject varchar2(50), 
			 		content varchar2(2000),
					memoTime date,
					pass varchar(20));

create SEQUENCE mNumbers  
       START WITH 1   
       INCREMENT BY 1;

insert into memoDB (memoNum, subject, content, memotime) values (mNumbers.nextval, '첫메모', '테스트합니다.', sysdate);

select * from memoDB;

select * from memoDB where memonum between 1 and 5;